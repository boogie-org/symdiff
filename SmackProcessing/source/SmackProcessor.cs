using Microsoft.Boogie;
using System;
using SmackProcessing.source;
using ProgTransformation;
using System.Diagnostics;
using System.Linq;


namespace SmackProcessing
{
    class SmackProcessor
    {
        private static int PrintUsage()
        {
            Console.WriteLine("SmackProcessor.exe a.bpl [-break]");
            return -1;
        }

        private static string relativeDir = "";

        static int Main(string[] args)
        {
            if (args.Length < 1)
            {
                return PrintUsage();
            }

            if (args.ToList().Any(x => x == "-break")) Debugger.Launch();
            args.Where(x => x.StartsWith("-relativeSourceDir:"))
                .Iter(s => relativeDir = s.Split(':')[1]);
           

            CommandLineOptions.Install(new CommandLineOptions());


            string programFileName = args[0];
            Program program = SDiff.Boogie.Process.ParseProgram(programFileName);
            program.Resolve(); 
            ModSetCollector c = new ModSetCollector();
            c.DoModSetAnalysis(program);
            program.Typecheck();

            PersistentProgram persistentProgram = new PersistentProgram(program);

            var pass = new SmackPreprocessorTransform(relativeDir);
            SmackPreprocessorTransform.writeAllFiles = true;
            persistentProgram = pass.run(persistentProgram);
            Debug.Assert(programFileName.Contains(".bpl"));
            string processedFileName = programFileName.Substring(0, programFileName.LastIndexOf(".bpl")) + "_unsmacked.bpl";
            persistentProgram.writeToFile(processedFileName);

            return 0;
        }
    }
}
