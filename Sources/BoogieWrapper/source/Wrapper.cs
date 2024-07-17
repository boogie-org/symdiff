using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Microsoft.Boogie;
using Microsoft.BaseTypes; //For BigNum
using SDiff.Boogie;
using System.IO;
using System.Runtime.InteropServices;
using System.Text.RegularExpressions;
using SDiff;
using SymDiffUtils;
using Util = SymDiffUtils.Util;

namespace BoogieWrapper
{
    class Wrapper
    {
        static int Main(string[] args)
        {
            BoogieUtils.InitializeBoogie("");
            int argc = args.Length;
            if (argc < 4)
            {
                var boogieWrapper = "BoogieWrapper" + (RuntimeInformation.IsOSPlatform(OSPlatform.Windows) ? ".exe" : ""); 
                System.Console.WriteLine(boogieWrapper + " a.bpl EQ LEFT RIGHT [v1name] [v2name] [bvdfriendly]");
                System.Console.WriteLine("\t   EQ: name of the combined procedure to be verified");
                System.Console.WriteLine("\t   RIGHT: name of the right procedure");
                System.Console.WriteLine("\t   RIGHT: name of the right procedure");
                System.Console.WriteLine("\t   viname: optional prefix of the left/right procedure (when not checking EQ_v1.foo__xx__v2.foo)");
                System.Console.WriteLine("\t   bvdfriendly: optional instrument the input file to add some captureStates for bvd to display (no checking)");
                return -1;
            }
            string fileName = args[0];
            string funcName = args[1];

            //TODO: Make it aware of the other Boogie options
            var boogieOptions = " -doModSetAnalysis -printInstrumented -typeEncoding:m -timeLimit:" + Options.Timeout + " -removeEmptyBlocks:0 -printModel:1 -printModelToFile:model.dmp " + Options.BoogieUserOpts;
            SDiff.Boogie.Process.InitializeBoogie(boogieOptions);

            Program prog = BoogieUtils.ParseProgram(args[0]);

            if (prog == null)
            {
                Log.Out(Log.Verifier, "Parse Error!!! in   " + args[1]);
                return -1;
            }
            if (BoogieUtils.ResolveAndTypeCheckThrow(prog, args[0]))
                return -1;
            //code duplication

            //Not having "-printInstrumented" just prints the old version of hte program!!!!
            if (args.Length == 7 && args[6] == "/bvdfriendly")
            {
                //System.Diagnostics.Debugger.Break();
                var bvdI = new BvdInstrument();
                Program prog1 = bvdI.VisitProgram(prog);
                if (BoogieUtils.ResolveAndTypeCheckThrow(prog, fileName)) return -1;
                Util.DumpBplAST(prog, "merged_bvd.bpl");
                return -1;
            }

            var newProg = prog;

            VC.ConditionGeneration vcgen = BoogieVerify.InitializeVC(newProg);
            var newDict = SDiff.Boogie.Process.BuildProgramDictionary(newProg.TopLevelDeclarations.ToList());

            //RS: Uncomment this
            var newEq = (Implementation)newDict.Get(funcName + "$IMPL");
            SDiffCounterexamples SErrors;
            List<Model> errModelList;

            var Result = BoogieVerify.VerifyImplementation(vcgen, newEq, newProg, out SErrors);

            switch (Result)
            {
                case VerificationResult.Error:
                    Log.Out(Log.Verifier, "Result: Error");
                    break;
                case VerificationResult.Verified:
                    Log.Out(Log.Verifier, "Result: Verified");
                    break;
                case VerificationResult.OutOfMemory:
                    Log.Out(Log.Verifier, "Result: OutOfMemory");
                    return -2;
                    //break;
                case VerificationResult.TimeOut:
                    Log.Out(Log.Verifier, "Result: TimeOut");
                    return -3;
                   // break;
                default:
                    Log.Out(Log.Verifier, "Result: Unhandled");
                    return -4;
            }
            Implementation n1, n2;
            GetImplementations(newDict, funcName, out n1, out n2, args[2], args[3]);

            var outputVars = new List<Variable>();
            foreach (Variable v in n1.OutParams)
                outputVars.Add(newDict.Get(v.Name + "$VAR") as Variable);
            foreach (Variable v in n2.OutParams)
                outputVars.Add(newDict.Get(v.Name + "$VAR") as Variable);


            var globals = new List<Variable>();
            foreach (IdentifierExpr ie in newEq.Proc.Modifies)
                globals.Add(ie.Decl);


            if (SErrors != null)
            {
                //somewhat misnamed...
                if (Options.DumpBeforeVerifying)
                {
                    Log.Out(Log.SymEx, "Dumping procedure under verification");
                    newEq.Emit(Log.LogWriter, 0);
                }
                if (Options.DoSymEx)
                {
 
                    if (Options.PreciseDifferentialInline)
                    {
                        IEnumerable <Declaration> consts = prog.TopLevelDeclarations.Where(x => x is Constant);
                        if (args.Length < 6)
                            BoogieVerify.ProcessCounterexamplesWOSymbolicOut(SErrors, globals, newEq.LocVars, null, null, consts.ToList(), [SErrors[0].fst.Model]);
                        else
                            BoogieVerify.ProcessCounterexamplesWOSymbolicOut(SErrors, globals, newEq.LocVars, null, null, consts.ToList(), [SErrors[0].fst.Model], args[4], args[5]);
                    }
                    else
                    {
                        BoogieVerify.ProcessCounterexamples(SErrors, globals, outputVars, newProg, null, null);
                    }
                }
            }
            
            return (SErrors == null ? 0 : SErrors.Count);

        }
        private static void GetImplementations(Dictionary<string, Declaration> newDict, string funcName, out Implementation n1, out Implementation n2,string n1name, string n2name)
        {
            n1 = (Implementation)newDict.Get(n1name + "$IMPL");
            n2 = (Implementation)newDict.Get(n1name + "$IMPL");        
        }

        public class BvdInstrument : FixedVisitor
        {
            public BvdInstrument() { }
            public override Block VisitBlock(Block b)
            {
                List<Cmd> cmds = new List<Cmd>();
                foreach (Cmd c in b.Cmds)
                {
                    cmds.Add(c);
                    if ((c is CallCmd) || (c is AssignCmd) || (c is HavocCmd) || 
                        (c is AssumeCmd && ((AssumeCmd)c).Attributes == null) ||
                        (c is AssertCmd && ((AssertCmd)c).Attributes == null))
                    {   //some asserts/assumes have string attributes
                        var d = new AssumeCmd(Token.NoToken, Expr.True);
                        d.Attributes = new QKeyValue(Token.NoToken, "captureState", new List<object>() { c.ToString().Trim() }, d.Attributes);
                        cmds.Add(d);
                    }
                }
                b.Cmds = cmds;
                return base.VisitBlock(b);
            }
        }

    }


}
