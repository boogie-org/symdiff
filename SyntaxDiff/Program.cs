using Microsoft.VisualStudio.Text;
using Microsoft.VisualStudio.Text.Differencing;
using Microsoft.VisualStudio.Utilities;
using SourceAnalyzer;
using System;
using System.Collections.Generic;
using System.ComponentModel.Composition;
using System.ComponentModel.Composition.Hosting;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;
using Microsoft.TeamFoundation.VersionControl.Client;
using Microsoft.TeamFoundation.VersionControl.Common;



namespace SyntaxDiff
{
    /// <summary>
    /// Generate the syntax diff information
    /// </summary>
    class Program
    {
        const bool useVisualStudioMEFDiff = false; 

        static void Main(string[] args)
        {
            if (!useVisualStudioMEFDiff)
                new Diff2(args);
            else
                VisualStudioTextDiff(args); 
        }

        /// <summary>
        /// MEF based diffing of strings
        /// Doesn't work due to CFEditor dependency
        /// </summary>
        /// <param name="args"></param>
        private static void VisualStudioTextDiff(string[] args)
        {
            var diffInfo = new DiffAnalyzerUsingMEFAndVisualStudio();
            Debug.Assert(args.Count() >= 2);
            var diffOut = diffInfo.PerformDiffString(args[0], args[1]);
        }

    }

    class Diff2
    {
        public Diff2(string[] args)
        {
            Debug.Assert(args.Count() >= 2, "Usage: SyntaxDiff.exe file1 file2");
            string file1 = args[0], file2 = args[1];
            DiffOptions diffOptions = new DiffOptions();
            diffOptions.UseThirdPartyTool = false;
            diffOptions.OutputType = DiffOutputType.Unified;

            // Wherever we want to send our text-based diff output 
            diffOptions.StreamWriter = new System.IO.StreamWriter(Console.OpenStandardOutput());

            Console.WriteLine("Difference.DiffFiles - output to console");
            DiffSegment diffs = Microsoft.TeamFoundation.VersionControl.Client.Difference.DiffFiles(
                file1, FileType.Detect(file1, null), file2, FileType.Detect(file2, null),  diffOptions);

            var diff = diffs;
            while (diff != null)
            {
                Console.WriteLine("Diff ==> {0} {1}:{2}:{3} {4}:{5}:{6}", 
                    diff.Type, diff.OriginalStart, diff.OriginalLength, diff.OriginalStartOffset, diff.ModifiedStart, diff.ModifiedLength, diff.ModifiedStartOffset);
                diff = diff.Next;
            }
        }
    }

    class DiffAnalyzerUsingMEFAndVisualStudio
    {
  
        public DiffAnalyzerUsingMEFAndVisualStudio() 
        {
            LoadMEFComponents();

            //var a = contentTypeRegistryService.ContentTypes;
            //IContentType b;

            differenceService = differencingServiceSelector.GetTextDifferencingService(null);
        }
        public void LoadMEFComponents()
        {
            string[] ComponentDllFilters = new string[] { "Microsoft.VisualStudio.CoreUtility.dll", /*"CFEditor.dll",*/ "Delta.dll", "Microsoft.VisualStudio.Text*dll" /*, "Microsoft.VisualStudio.Diagram*dll"*/ };
            /* this is lame and needs to be set for the machine that it is running on
             * There is probably a way to autodetect this, but I don't know it */

            //string componentsDir = "./";// ConfigurationManager.AppSettings["ComponentsDIR"];
            string executionDirectory = Path.GetDirectoryName(Assembly.GetEntryAssembly() == null ? Assembly.GetExecutingAssembly().Location : Assembly.GetEntryAssembly().Location);
            string componentsDir = executionDirectory;

            AggregateCatalog catalog = new AggregateCatalog();
            foreach (string filter in ComponentDllFilters)
            {
                catalog.Catalogs.Add(new DirectoryCatalog(componentsDir, filter));
            }

            try
            {
                CompositionBatch batch = new CompositionBatch();
                batch.AddPart(this);

                CompositionContainer container = new CompositionContainer(catalog, isThreadSafe: true);
                container.Compose(batch);
            }
            catch (ReflectionTypeLoadException ex)
            {
                foreach (Exception loaderException in ex.LoaderExceptions)
                {
                    Debug.WriteLine(loaderException.ToString());
                }
                throw;
            }
        }

        [Import]
        public ITextDifferencingSelectorService differencingServiceSelector = null;
        [Import]
        public IContentTypeRegistryService contentTypeRegistryService = null;
        
        ITextDifferencingService differenceService = null;


        //[Import]
        //ITextBufferFactoryService textBufferFactoryService = null;

        //[Import]
        //IDifferenceBufferFactoryService differenceBufferFactoryService = null;

        public HashSet<Tuple<int, int>> PerformDiffFiles(string file1, string file2)
        {
            HashSet<Tuple<int, int>> diffRanges = new HashSet<Tuple<int, int>>();
            StringDifferenceOptions sdo = new StringDifferenceOptions()
            {
                DifferenceType = StringDifferenceTypes.Line | StringDifferenceTypes.Word,
                IgnoreTrimWhiteSpace = false
            };

            var origContent = (new StreamReader(file1)).ReadToEnd();
            var modifiedContent = (new StreamReader(file2)).ReadToEnd();
            var diffs = differenceService.DiffStrings(origContent, modifiedContent, sdo);
            var diffList = new List<CCDifference>();
            foreach (var d in diffs)
            {
                diffList.Add(new CCDifference(d.Left, d.Right, d.Before, d.After));
                diffRanges.Add(Tuple.Create<int, int>(d.Left.Start, d.Left.End));
            }
            return diffRanges;
        }
        public HashSet<Tuple<int, int>> PerformDiffString(string origContent, string modifiedContent)
        {
            HashSet<Tuple<int, int>> diffRanges = new HashSet<Tuple<int, int>>();
            StringDifferenceOptions sdo = new StringDifferenceOptions()
            {
                DifferenceType = StringDifferenceTypes.Line | StringDifferenceTypes.Word,
                IgnoreTrimWhiteSpace = false
            };

            var diffs = differenceService.DiffStrings(origContent, modifiedContent, sdo);
            var diffList = new List<CCDifference>();
            foreach (var d in diffs)
            {
                diffList.Add(new CCDifference(d.Left, d.Right, d.Before, d.After));
                diffRanges.Add(Tuple.Create<int, int>(d.Left.Start, d.Left.End));
            }
            return diffRanges;
        }
    }
}
