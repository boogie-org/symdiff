using Microsoft.Boogie;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SymDiffUtils
{
    public class BoogieUtils
    {
        public static bool InitializeBoogie(string clo)
        {
            CommandLineOptions.Install(new CommandLineOptions());
            CommandLineOptions.Clo.RunningBoogieFromCommandLine = true;

            var args = "/doModSetAnalysis".Split(' ');
            CommandLineOptions.Clo.Parse(args);

            return false;
        }
        //call with null filename to print to console
        public static void PrintProgram(Program p, string filename)
        {
            TokenTextWriter outFile;
            if (filename != null)
                outFile = new TokenTextWriter(filename, true);
            else
                outFile = new TokenTextWriter(Console.Out, true);
            p.Emit(outFile);
            outFile.Close();
        }

        public static bool ResolveProgram(Program p, string filename)
        {
            //After p.Resolve, the AST is in p.topLevelDeclarations  
            int errorCount = p.Resolve();
            if (errorCount != 0)
                Console.WriteLine(errorCount + " name resolution errors in " + filename);
            return errorCount != 0;
        }

        public static bool TypecheckProgram(Program p, string filename)
        {
            //One of the sideeffect of p.Typecheck, it inlines 
            int errorCount = p.Typecheck();
            if (errorCount != 0)
                Console.WriteLine(errorCount + " type checking errors in " + filename);
            return errorCount != 0;
        }

        private static bool ResolveAndTypeCheck(Program p, string filename)
        {
            if (ResolveProgram(p, ""))
            {
                Log.Out(Log.Error, "Failed to resolve  program");
                return true;
            }
            if (TypecheckProgram(p, ""))
            {
                Log.Out(Log.Error, "Failed to typecheck program");
                //Log.LogEmit(Log.Normal, p.Emit);
                // PrintProgram(p, "");
                return true;
            }
            return false;
        }

        public static bool ResolveAndTypeCheckThrow(Program p, string filename)
        {
            if (ResolveAndTypeCheck(p, filename))
                throw new Exception("Program " + filename + " does not resolve/typecheck");
            return false;
        }


        public static Program ParseProgram(string f)
        {
            Program p = new Program();
            try
            {
                //        if (Microsoft.Boogie.Parser.Parse(f, out p) != 0)
                //Boogie API has changed
                List<string> defs = new List<string>();
                if (Parser.Parse(f, defs, out p) != 0)
                {
                    Console.WriteLine("Failed to read " + f);
                    return null;
                }
            }
            catch (Exception e)
            {
                Console.WriteLine(e.ToString());
                return null;
            }
            return p;
        }
    }
}
