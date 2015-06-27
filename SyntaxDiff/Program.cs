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



namespace SyntaxDiff
{
    /// <summary>
    /// Generate the syntax diff information
    /// </summary>
    class Program
    {
        static void Main(string[] args)
        {
            var diffInfo = new DiffInfo();
            Debug.Assert(args.Count() >= 2);
            var diffOut = diffInfo.PerformDiffString(args[0], args[1]);
        }

    }
    class DiffInfo
    {
        //MEF compoennts dir
        public const string componentsDir = @"D:\vmv-analysis\VMV\";

        [Import]
        IHierarchicalStringDifferenceService differenceService = null;
        public DiffInfo() { LoadMEFComponents(); }
        public void LoadMEFComponents()
        {
            string[] ComponentDllFilters = new string[] { /*"CodeFlow*.exe", "Microsoft.CodeFlow.*.dll", */ "Delta.dll", "Microsoft.VisualStudio*.dll" };
            /* this is lame and needs to be set for the machine that it is running on
             * There is probably a way to autodetect this, but I don't know it */

            //string componentsDir = "./";// ConfigurationManager.AppSettings["ComponentsDIR"];
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
                    Console.WriteLine(loaderException.ToString());
                }
                throw;
            }
        }
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
