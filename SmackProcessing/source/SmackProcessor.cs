using Microsoft.Boogie;
using System;
using SmackProcessing.source;
using ProgTransformation;
using System.Diagnostics;

namespace SmackProcessing
{
    class SmackProcessor
    {
        private static int PrintUsage()
        {
            Console.WriteLine("SmackProcessor takes as input a bpl file.");
            return -1;
        }

        static int Main(string[] args)
        {
            if (args.Length != 1)
            {
                return PrintUsage();
            }

            Debugger.Launch();


            CommandLineOptions.Install(new CommandLineOptions());


            string programFileName = args[0];
            Program program = SDiff.Boogie.Process.ParseProgram(programFileName);
            program.Resolve(); program.Typecheck();

            PersistentProgram persistentProgram = new PersistentProgram(program);

            TransformationPass pass = new SmackPreprocessorTransform();
            persistentProgram = pass.run(persistentProgram);                
            Debug.Assert(programFileName.Contains(".bpl"));
            string processedFileName = programFileName.Substring(0, programFileName.LastIndexOf(".bpl")) + "_unsmacked.bpl";
            persistentProgram.writeToFile(processedFileName);

            return 0;
        }
    }
}
