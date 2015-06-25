using Microsoft.Boogie;
using ProgTransformation;
using System;
using System.Collections.Generic;
using System.Diagnostics;

namespace SmackProcessing.source
{
    class SmackPreprocessorTransform : TransformationPass
    {
        protected override Program runPass(Program inp)
        {
            new BoogieCallsVisitor().VisitProgram(inp);
            new SourceInfoProcessor().VisitProgram(inp);
            return inp;
        }
    }

    class BoogieCallsVisitor : FixedVisitor
    {
        public override List<Cmd> VisitCmdSeq(List<Cmd> cmdSeq)
        {
            List<Cmd> newSeq = new List<Cmd>();
            foreach (var cmd in cmdSeq)
            {
                if (cmd is CallCmd)
                {
                    var call = cmd as CallCmd;
                    if (call.Attributes != null && call.Attributes.Key.Equals("cexpr"))
                    {
                        Debug.Assert(call.callee.StartsWith("boogie"));
                        continue;
                    }
                }
                newSeq.Add(cmd);
            }
            cmdSeq.RemoveAll(x => true);
            newSeq.ForEach(item => cmdSeq.Add(item));
            return base.VisitCmdSeq(cmdSeq);
        }
    }    

    class SourceInfoProcessor : FixedVisitor
    {
        public override List<Cmd> VisitCmdSeq(List<Cmd> cmdSeq)
        {
            List<Cmd> newSeq = new List<Cmd>();
            foreach (var cmd in cmdSeq)
            {
                if (cmd is AssumeCmd)
                {
                    var assume = cmd as AssumeCmd;
                    if (assume.Attributes != null && assume.Attributes.Key.Equals("sourceloc"))
                    {
                        newSeq.Add(makeHavocStyleSourceInfo(assume.Attributes.Params));
                        continue;
                    }
                }
                newSeq.Add(cmd);
            }
            cmdSeq.RemoveAll(x => true);
            newSeq.ForEach(item => cmdSeq.Add(item));
            return base.VisitCmdSeq(cmdSeq);
        }

        private AssertCmd makeHavocStyleSourceInfo(IList<object> list)
        {
            var fn = new List<object>();
            fn.Add(list[0]);
            var lineno = new List<object>();
            lineno.Add(list[1]);
            var assert = new AssertCmd(Token.NoToken, Expr.True,
                new QKeyValue(Token.NoToken, "sourcefile", fn,
                new QKeyValue(Token.NoToken, "sourceline", lineno, null)));
            return assert;
        }
    }

}  
