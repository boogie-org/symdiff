using Microsoft.Boogie;
using System;
using ProgTransformation;
using System.Diagnostics;
using System.Linq;
using System.IO;
using SymDiffUtils;


namespace SymdiffPreprocess
{
    /// <summary>
    /// Put any transformations that need to be done to prepare a BPL file for SymDiff
    /// (e.g. specific to some front end perhaps guarded by flags)
    /// </summary>
    class Preprocess
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
            Debug.Assert(programFileName.Contains(".bpl"), string.Format("File name is expected to have the .bpl extension: {0}.", programFileName));
            string outFileName = programFileName.Substring(0, programFileName.LastIndexOf(".bpl")) + "_unsmacked.bpl";
            PersistentProgram persistentProgram;

            try
            {
                persistentProgram = ParseAndTypeCheckProgram(programFileName);
                File.Copy(programFileName, outFileName, true);
            }
            catch
            {
                //Sort of a hack.
                using (Stream prelude = File.OpenRead(Path.Combine(AppDomain.CurrentDomain.BaseDirectory, @"..\..\resources", "prelude.bpl")))
                {
                    using (Stream bpl = File.OpenRead(programFileName))
                    {
                        using (Stream outBpl = new FileStream(outFileName, FileMode.Create))
                        {
                            bpl.CopyTo(outBpl);
                            prelude.CopyTo(outBpl);
                        }
                    }
                }

                
            }
            finally
            {
                persistentProgram = ParseAndTypeCheckProgram(outFileName);
            }

            
            

            var pass = new SmackPreprocessorTransform(relativeDir);
            SmackPreprocessorTransform.writeAllFiles = true;
            persistentProgram = pass.run(persistentProgram);            
            persistentProgram.writeToFile(outFileName);

            return 0;
        }

        private static PersistentProgram ParseAndTypeCheckProgram(string programFileName)
        {
            Program program;
            program = BoogieUtils.ParseProgram(programFileName);
            int errors = program.Resolve();
            if (errors > 0)
                throw new ArgumentException("Unable to resolve " + programFileName);
            ModSetCollector c = new ModSetCollector();
            c.DoModSetAnalysis(program);
            errors = program.Typecheck();
            if (errors > 0)
                throw new ArgumentException("Unable to typecheck " + programFileName);
            PersistentProgram persistentProgram = new PersistentProgram(program);
            return persistentProgram;
        }
    }
}
