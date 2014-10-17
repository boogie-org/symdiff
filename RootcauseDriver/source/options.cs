using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace RootcauseDriver
{
    public static class Options
    {
        public static int maxParallel = 8; //may reduce OOMs on shockwave ??
        public static int timeoutPerProcess = 1000;

        public static List<Tuple<Tuple<string, string, string>, Tuple<string, string>>> CollectX86Opt2Benchmarks()
        {

            var bplFile = @"EQ__x.p___y.p_out.bpl";
            var htmlFile = @"EQ__x.p___y.p_cex_1_out.analyze";

            //commening out > 50% of each set to get a primary run
            var dirs = new List<string>()  {
                @"benchmarks\clr_benchmarks\test-x86opt2/ijpeg.exe-x86-2011-09-24-x86-2011-09-24/000002/"
                ,@"benchmarks\clr_benchmarks\test-x86opt2/ijpeg.exe-x86-2011-09-24-x86-2011-09-24/000003/"
                ,@"benchmarks\clr_benchmarks\test-x86opt2/ijpeg.exe-x86-2011-09-24-x86-2011-09-24/000004/"
                ,@"benchmarks\clr_benchmarks\test-x86opt2/ijpeg.exe-x86-2011-09-24-x86-2011-09-24/000005/"
                ,@"benchmarks\clr_benchmarks\test-x86opt2/ijpeg.exe-x86-2011-09-24-x86-2011-09-24/000009/"
                ,@"benchmarks\clr_benchmarks\test-x86opt2/ijpeg.exe-x86-2011-09-24-x86-2011-09-24/000012/"
                ,@"benchmarks\clr_benchmarks\test-x86opt2/ijpeg.exe-x86-2011-09-24-x86-2011-09-24/000025/"
                ,@"benchmarks\clr_benchmarks\test-x86opt2/ijpeg.exe-x86-2011-09-24-x86-2011-09-24/000027/"
                ,@"benchmarks\clr_benchmarks\test-x86opt2/ijpeg.exe-x86-2011-09-24-x86-2011-09-24/000032/"
                ,@"benchmarks\clr_benchmarks\test-x86opt2/ijpeg.exe-x86-2011-09-24-x86-2011-09-24/000055/"
                ,@"benchmarks\clr_benchmarks\test-x86opt2/ijpeg.exe-x86-2011-09-24-x86-2011-09-24/000057/"
                ,@"benchmarks\clr_benchmarks\test-x86opt2/ijpeg.exe-x86-2011-09-24-x86-2011-09-24/000065/"
                ,@"benchmarks\clr_benchmarks\test-x86opt2/ijpeg.exe-x86-2011-09-24-x86-2011-09-24/000066/"
                ,@"benchmarks\clr_benchmarks\test-x86opt2/ijpeg.exe-x86-2011-09-24-x86-2011-09-24/000075/"
                ,@"benchmarks\clr_benchmarks\test-x86opt2/ijpeg.exe-x86-2011-09-24-x86-2011-09-24/000097/"
                ,@"benchmarks\clr_benchmarks\test-x86opt2/ijpeg.exe-x86-2011-09-24-x86-2011-09-24/000108/"
                ,@"benchmarks\clr_benchmarks\test-x86opt2/ijpeg.exe-x86-2011-09-24-x86-2011-09-24/000130/"
                ,@"benchmarks\clr_benchmarks\test-x86opt2/ijpeg.exe-x86-2011-09-24-x86-2011-09-24/000147/"
                ,@"benchmarks\clr_benchmarks\test-x86opt2/ijpeg.exe-x86-2011-09-24-x86-2011-09-24/000151/"
                ,@"benchmarks\clr_benchmarks\test-x86opt2/ijpeg.exe-x86-2011-09-24-x86-2011-09-24/000165/"
                ,@"benchmarks\clr_benchmarks\test-x86opt2/ijpeg.exe-x86-2011-09-24-x86-2011-09-24/000166/"
                ,@"benchmarks\clr_benchmarks\test-x86opt2/ijpeg.exe-x86-2011-09-24-x86-2011-09-24/000169/"
                ,@"benchmarks\clr_benchmarks\test-x86opt2/ijpeg.exe-x86-2011-09-24-x86-2011-09-24/000178/"
                ,@"benchmarks\clr_benchmarks\test-x86opt2/ijpeg.exe-x86-2011-09-24-x86-2011-09-24/000218/"
                ,@"benchmarks\clr_benchmarks\test-x86opt2/ijpeg.exe-x86-2011-09-24-x86-2011-09-24/000222/"
                ,@"benchmarks\clr_benchmarks\test-x86opt2/ijpeg.exe-x86-2011-09-24-x86-2011-09-24/000226/"
                ,@"benchmarks\clr_benchmarks\test-x86opt2/sat_solver.exe-x86-2011-09-24-x86-2011-09-24/000008/"
                ,@"benchmarks\clr_benchmarks\test-x86opt2/sat_solver.exe-x86-2011-09-24-x86-2011-09-24/000022/"
                ,@"benchmarks\clr_benchmarks\test-x86opt2/sat_solver.exe-x86-2011-09-24-x86-2011-09-24/000045/"
                ,@"benchmarks\clr_benchmarks\test-x86opt2/sat_solver.exe-x86-2011-09-24-x86-2011-09-24/000047/"
                ,@"benchmarks\clr_benchmarks\test-x86opt2/sat_solver.exe-x86-2011-09-24-x86-2011-09-24/000109/"
                ,@"benchmarks\clr_benchmarks\test-x86opt2/sat_solver.exe-x86-2011-09-24-x86-2011-09-24/000143/"
                ,@"benchmarks\clr_benchmarks\test-x86opt2/sat_solver.exe-x86-2011-09-24-x86-2011-09-24/000155/"
                ,@"benchmarks\clr_benchmarks\test-x86opt2/sat_solver.exe-x86-2011-09-24-x86-2011-09-24/000168/"
                ,@"benchmarks\clr_benchmarks\test-x86opt2/sat_solver.exe-x86-2011-09-24-x86-2011-09-24/000192/"
                ,@"benchmarks\clr_benchmarks\test-x86opt2/sat_solver.exe-x86-2011-09-24-x86-2011-09-24/000197/"
                ,@"benchmarks\clr_benchmarks\test-x86opt2/System.Core.dll-x86-2011-09-24-x86-2011-09-24/000628/"
                ,@"benchmarks\clr_benchmarks\test-x86opt2/System.Core.dll-x86-2011-09-24-x86-2011-09-24/000635/"
                ,@"benchmarks\clr_benchmarks\test-x86opt2/System.Core.dll-x86-2011-09-24-x86-2011-09-24/000673/"
                ,@"benchmarks\clr_benchmarks\test-x86opt2/System.Core.dll-x86-2011-09-24-x86-2011-09-24/000734/"
                ,@"benchmarks\clr_benchmarks\test-x86opt2/System.Core.dll-x86-2011-09-24-x86-2011-09-24/001117/"
                ,@"benchmarks\clr_benchmarks\test-x86opt2/System.Core.dll-x86-2011-09-24-x86-2011-09-24/001301/"
                ,@"benchmarks\clr_benchmarks\test-x86opt2/System.Core.dll-x86-2011-09-24-x86-2011-09-24/001638/"
                ,@"benchmarks\clr_benchmarks\test-x86opt2/System.Core.dll-x86-2011-09-24-x86-2011-09-24/001641/"
                ,@"benchmarks\clr_benchmarks\test-x86opt2/System.Core.dll-x86-2011-09-24-x86-2011-09-24/001645/"
                ,@"benchmarks\clr_benchmarks\test-x86opt2/System.Core.dll-x86-2011-09-24-x86-2011-09-24/002109/"
                ,@"benchmarks\clr_benchmarks\test-x86opt2/System.Core.dll-x86-2011-09-24-x86-2011-09-24/002228/"
                ,@"benchmarks\clr_benchmarks\test-x86opt2/System.Core.dll-x86-2011-09-24-x86-2011-09-24/002585/"
                ,@"benchmarks\clr_benchmarks\test-x86opt2/System.Core.dll-x86-2011-09-24-x86-2011-09-24/002652/"
                ,@"benchmarks\clr_benchmarks\test-x86opt2/System.Core.dll-x86-2011-09-24-x86-2011-09-24/002903/"
                ,@"benchmarks\clr_benchmarks\test-x86opt2/System.Core.dll-x86-2011-09-24-x86-2011-09-24/002922/"
                ,@"benchmarks\clr_benchmarks\test-x86opt2/System.Core.dll-x86-2011-09-24-x86-2011-09-24/003012/"
                ,@"benchmarks\clr_benchmarks\test-x86opt2/System.Core.dll-x86-2011-09-24-x86-2011-09-24/003029/"
                ,@"benchmarks\clr_benchmarks\test-x86opt2/System.Net.dll-x86-2011-09-24-x86-2011-09-24/000076/"
                ,@"benchmarks\clr_benchmarks\test-x86opt2/System.Net.dll-x86-2011-09-24-x86-2011-09-24/000331/"
                ,@"benchmarks\clr_benchmarks\test-x86opt2/System.Net.dll-x86-2011-09-24-x86-2011-09-24/000384/"
                ,@"benchmarks\clr_benchmarks\test-x86opt2/System.Net.dll-x86-2011-09-24-x86-2011-09-24/000483/"
                ,@"benchmarks\clr_benchmarks\test-x86opt2/System.Net.dll-x86-2011-09-24-x86-2011-09-24/000649/"
                ,@"benchmarks\clr_benchmarks\test-x86opt2/System.Net.dll-x86-2011-09-24-x86-2011-09-24/000843/"
                ,@"benchmarks\clr_benchmarks\test-x86opt2/System.Net.dll-x86-2011-09-24-x86-2011-09-24/000906/"
                ,@"benchmarks\clr_benchmarks\test-x86opt2/System.Net.dll-x86-2011-09-24-x86-2011-09-24/000946/"
                ,@"benchmarks\clr_benchmarks\test-x86opt2/System.Runtime.Serialization.dll-x86-2011-09-24-x86-2011-09-24/000081/"
                ,@"benchmarks\clr_benchmarks\test-x86opt2/System.Runtime.Serialization.dll-x86-2011-09-24-x86-2011-09-24/000152/"
                ,@"benchmarks\clr_benchmarks\test-x86opt2/System.Runtime.Serialization.dll-x86-2011-09-24-x86-2011-09-24/000286/"
                ,@"benchmarks\clr_benchmarks\test-x86opt2/System.Runtime.Serialization.dll-x86-2011-09-24-x86-2011-09-24/000823/"
                ,@"benchmarks\clr_benchmarks\test-x86opt2/System.Runtime.Serialization.dll-x86-2011-09-24-x86-2011-09-24/000926/"
                ,@"benchmarks\clr_benchmarks\test-x86opt2/System.Runtime.Serialization.dll-x86-2011-09-24-x86-2011-09-24/001017/"
                ,@"benchmarks\clr_benchmarks\test-x86opt2/System.Runtime.Serialization.dll-x86-2011-09-24-x86-2011-09-24/001041/"
                ,@"benchmarks\clr_benchmarks\test-x86opt2/System.Runtime.Serialization.dll-x86-2011-09-24-x86-2011-09-24/001043/"
                ,@"benchmarks\clr_benchmarks\test-x86opt2/System.Runtime.Serialization.dll-x86-2011-09-24-x86-2011-09-24/001050/"
                ,@"benchmarks\clr_benchmarks\test-x86opt2/System.Runtime.Serialization.dll-x86-2011-09-24-x86-2011-09-24/001143/"
                ,@"benchmarks\clr_benchmarks\test-x86opt2/System.Runtime.Serialization.dll-x86-2011-09-24-x86-2011-09-24/001149/"
                ,@"benchmarks\clr_benchmarks\test-x86opt2/System.Runtime.Serialization.dll-x86-2011-09-24-x86-2011-09-24/001213/"
                ,@"benchmarks\clr_benchmarks\test-x86opt2/System.Runtime.Serialization.dll-x86-2011-09-24-x86-2011-09-24/001810/"
                ,@"benchmarks\clr_benchmarks\test-x86opt2/System.Runtime.Serialization.dll-x86-2011-09-24-x86-2011-09-24/002165/"
                ,@"benchmarks\clr_benchmarks\test-x86opt2/System.Runtime.Serialization.dll-x86-2011-09-24-x86-2011-09-24/002333/"
                ,@"benchmarks\clr_benchmarks\test-x86opt2/System.Runtime.Serialization.dll-x86-2011-09-24-x86-2011-09-24/002431/"
                ,@"benchmarks\clr_benchmarks\test-x86opt2/System.Runtime.Serialization.dll-x86-2011-09-24-x86-2011-09-24/002487/"
                ,@"benchmarks\clr_benchmarks\test-x86opt2/System.Runtime.Serialization.dll-x86-2011-09-24-x86-2011-09-24/002491/"
                ,@"benchmarks\clr_benchmarks\test-x86opt2/System.Runtime.Serialization.dll-x86-2011-09-24-x86-2011-09-24/002498/"
                ,@"benchmarks\clr_benchmarks\test-x86opt2/System.Runtime.Serialization.dll-x86-2011-09-24-x86-2011-09-24/002504/"
                ,@"benchmarks\clr_benchmarks\test-x86opt2/System.Runtime.Serialization.dll-x86-2011-09-24-x86-2011-09-24/002730/"
                ,@"benchmarks\clr_benchmarks\test-x86opt2/System.ServiceModel.Web.dll-x86-2011-09-24-x86-2011-09-24/000005/"
                ,@"benchmarks\clr_benchmarks\test-x86opt2/System.ServiceModel.Web.dll-x86-2011-09-24-x86-2011-09-24/000006/"
                ,@"benchmarks\clr_benchmarks\test-x86opt2/System.ServiceModel.Web.dll-x86-2011-09-24-x86-2011-09-24/000009/"
                ,@"benchmarks\clr_benchmarks\test-x86opt2/System.ServiceModel.Web.dll-x86-2011-09-24-x86-2011-09-24/000014/"
                ,@"benchmarks\clr_benchmarks\test-x86opt2/System.ServiceModel.Web.dll-x86-2011-09-24-x86-2011-09-24/000024/"
                ,@"benchmarks\clr_benchmarks\test-x86opt2/System.ServiceModel.Web.dll-x86-2011-09-24-x86-2011-09-24/000025/"
                ,@"benchmarks\clr_benchmarks\test-x86opt2/System.ServiceModel.Web.dll-x86-2011-09-24-x86-2011-09-24/000033/"
                ,@"benchmarks\clr_benchmarks\test-x86opt2/System.ServiceModel.Web.dll-x86-2011-09-24-x86-2011-09-24/000035/"
                ,@"benchmarks\clr_benchmarks\test-x86opt2/System.ServiceModel.Web.dll-x86-2011-09-24-x86-2011-09-24/000037/"
                ,@"benchmarks\clr_benchmarks\test-x86opt2/System.ServiceModel.Web.dll-x86-2011-09-24-x86-2011-09-24/000038/"
                ,@"benchmarks\clr_benchmarks\test-x86opt2/System.ServiceModel.Web.dll-x86-2011-09-24-x86-2011-09-24/000045/"
                ,@"benchmarks\clr_benchmarks\test-x86opt2/System.ServiceModel.Web.dll-x86-2011-09-24-x86-2011-09-24/000052/"
                ,@"benchmarks\clr_benchmarks\test-x86opt2/System.ServiceModel.Web.dll-x86-2011-09-24-x86-2011-09-24/000064/"
                ,@"benchmarks\clr_benchmarks\test-x86opt2/System.ServiceModel.Web.dll-x86-2011-09-24-x86-2011-09-24/000070/"
                ,@"benchmarks\clr_benchmarks\test-x86opt2/System.ServiceModel.Web.dll-x86-2011-09-24-x86-2011-09-24/000071/"
                ,@"benchmarks\clr_benchmarks\test-x86opt2/System.ServiceModel.Web.dll-x86-2011-09-24-x86-2011-09-24/000078/"
                ,@"benchmarks\clr_benchmarks\test-x86opt2/System.ServiceModel.Web.dll-x86-2011-09-24-x86-2011-09-24/000091/"
                ,@"benchmarks\clr_benchmarks\test-x86opt2/System.ServiceModel.Web.dll-x86-2011-09-24-x86-2011-09-24/000096/"
                ,@"benchmarks\clr_benchmarks\test-x86opt2/System.ServiceModel.Web.dll-x86-2011-09-24-x86-2011-09-24/000100/"
                ,@"benchmarks\clr_benchmarks\test-x86opt2/System.ServiceModel.Web.dll-x86-2011-09-24-x86-2011-09-24/000102/"
                ,@"benchmarks\clr_benchmarks\test-x86opt2/System.ServiceModel.Web.dll-x86-2011-09-24-x86-2011-09-24/000104/"
                ,@"benchmarks\clr_benchmarks\test-x86opt2/System.ServiceModel.Web.dll-x86-2011-09-24-x86-2011-09-24/000108/"
                ,@"benchmarks\clr_benchmarks\test-x86opt2/System.ServiceModel.Web.dll-x86-2011-09-24-x86-2011-09-24/000120/"
                ,@"benchmarks\clr_benchmarks\test-x86opt2/System.ServiceModel.Web.dll-x86-2011-09-24-x86-2011-09-24/000124/"
                ,@"benchmarks\clr_benchmarks\test-x86opt2/System.ServiceModel.Web.dll-x86-2011-09-24-x86-2011-09-24/000132/"
                ,@"benchmarks\clr_benchmarks\test-x86opt2/System.ServiceModel.Web.dll-x86-2011-09-24-x86-2011-09-24/000146/"
                ,@"benchmarks\clr_benchmarks\test-x86opt2/System.ServiceModel.Web.dll-x86-2011-09-24-x86-2011-09-24/000151/"
                ,@"benchmarks\clr_benchmarks\test-x86opt2/System.ServiceModel.Web.dll-x86-2011-09-24-x86-2011-09-24/000152/"
                ,@"benchmarks\clr_benchmarks\test-x86opt2/System.Windows.Browser.dll-x86-2011-09-24-x86-2011-09-24/000006/"
                ,@"benchmarks\clr_benchmarks\test-x86opt2/System.Windows.Browser.dll-x86-2011-09-24-x86-2011-09-24/000009/"
                ,@"benchmarks\clr_benchmarks\test-x86opt2/System.Windows.Browser.dll-x86-2011-09-24-x86-2011-09-24/000065/"
                ,@"benchmarks\clr_benchmarks\test-x86opt2/System.Windows.Browser.dll-x86-2011-09-24-x86-2011-09-24/000096/"
                ,@"benchmarks\clr_benchmarks\test-x86opt2/System.Windows.Browser.dll-x86-2011-09-24-x86-2011-09-24/000099/"
                ,@"benchmarks\clr_benchmarks\test-x86opt2/System.Windows.Browser.dll-x86-2011-09-24-x86-2011-09-24/000110/"
                ,@"benchmarks\clr_benchmarks\test-x86opt2/System.Windows.Browser.dll-x86-2011-09-24-x86-2011-09-24/000111/"
                ,@"benchmarks\clr_benchmarks\test-x86opt2/System.Windows.Browser.dll-x86-2011-09-24-x86-2011-09-24/000143/"
                ,@"benchmarks\clr_benchmarks\test-x86opt2/System.Windows.Browser.dll-x86-2011-09-24-x86-2011-09-24/000145/"
                ,@"benchmarks\clr_benchmarks\test-x86opt2/System.Windows.Browser.dll-x86-2011-09-24-x86-2011-09-24/000191/"
                ,@"benchmarks\clr_benchmarks\test-x86opt2/System.Windows.Browser.dll-x86-2011-09-24-x86-2011-09-24/000201/"
                ,@"benchmarks\clr_benchmarks\test-x86opt2/System.Windows.Browser.dll-x86-2011-09-24-x86-2011-09-24/000202/"
                ,@"benchmarks\clr_benchmarks\test-x86opt2/System.Windows.Browser.dll-x86-2011-09-24-x86-2011-09-24/000229/"
                ,@"benchmarks\clr_benchmarks\test-x86opt2/System.Windows.Browser.dll-x86-2011-09-24-x86-2011-09-24/000243/"
                ,@"benchmarks\clr_benchmarks\test-x86opt2/System.Windows.Browser.dll-x86-2011-09-24-x86-2011-09-24/000306/"
                ,@"benchmarks\clr_benchmarks\test-x86opt2/System.Windows.Browser.dll-x86-2011-09-24-x86-2011-09-24/000317/"
                ,@"benchmarks\clr_benchmarks\test-x86opt2/System.Windows.Browser.dll-x86-2011-09-24-x86-2011-09-24/000323/"
                ,@"benchmarks\clr_benchmarks\test-x86opt2/System.Windows.Browser.dll-x86-2011-09-24-x86-2011-09-24/000334/"
                ,@"benchmarks\clr_benchmarks\test-x86opt2/System.Windows.Browser.dll-x86-2011-09-24-x86-2011-09-24/000336/"
                ,@"benchmarks\clr_benchmarks\test-x86opt2/System.Windows.Browser.dll-x86-2011-09-24-x86-2011-09-24/000340/"
                ,@"benchmarks\clr_benchmarks\test-x86opt2/System.Windows.Browser.dll-x86-2011-09-24-x86-2011-09-24/000372/"
                ,@"benchmarks\clr_benchmarks\test-x86opt2/System.Windows.Browser.dll-x86-2011-09-24-x86-2011-09-24/000389/"
                ,@"benchmarks\clr_benchmarks\test-x86opt2/System.Windows.Browser.dll-x86-2011-09-24-x86-2011-09-24/000390/"
                ,@"benchmarks\clr_benchmarks\test-x86opt2/System.Windows.Browser.dll-x86-2011-09-24-x86-2011-09-24/000393/"
                ,@"benchmarks\clr_benchmarks\test-x86opt2/System.Windows.Browser.dll-x86-2011-09-24-x86-2011-09-24/000395/"
                ,@"benchmarks\clr_benchmarks\test-x86opt2/System.Windows.Browser.dll-x86-2011-09-24-x86-2011-09-24/000397/"
                ,@"benchmarks\clr_benchmarks\test-x86opt2/System.Xml.dll-x86-2011-09-24-x86-2011-09-24/000071/"
                ,@"benchmarks\clr_benchmarks\test-x86opt2/System.Xml.dll-x86-2011-09-24-x86-2011-09-24/000099/"
                ,@"benchmarks\clr_benchmarks\test-x86opt2/System.Xml.dll-x86-2011-09-24-x86-2011-09-24/000143/"
                ,@"benchmarks\clr_benchmarks\test-x86opt2/System.Xml.dll-x86-2011-09-24-x86-2011-09-24/000201/"
                ,@"benchmarks\clr_benchmarks\test-x86opt2/System.Xml.dll-x86-2011-09-24-x86-2011-09-24/000205/"
                ,@"benchmarks\clr_benchmarks\test-x86opt2/System.Xml.dll-x86-2011-09-24-x86-2011-09-24/000296/"
                ,@"benchmarks\clr_benchmarks\test-x86opt2/System.Xml.dll-x86-2011-09-24-x86-2011-09-24/000311/"
                ,@"benchmarks\clr_benchmarks\test-x86opt2/System.Xml.dll-x86-2011-09-24-x86-2011-09-24/000342/"
                ,@"benchmarks\clr_benchmarks\test-x86opt2/System.Xml.dll-x86-2011-09-24-x86-2011-09-24/000372/"
                ,@"benchmarks\clr_benchmarks\test-x86opt2/System.Xml.dll-x86-2011-09-24-x86-2011-09-24/000519/"
                ,@"benchmarks\clr_benchmarks\test-x86opt2/System.Xml.dll-x86-2011-09-24-x86-2011-09-24/000602/"
                ,@"benchmarks\clr_benchmarks\test-x86opt2/System.Xml.dll-x86-2011-09-24-x86-2011-09-24/000643/"
                ,@"benchmarks\clr_benchmarks\test-x86opt2/System.Xml.dll-x86-2011-09-24-x86-2011-09-24/000755/"
                ,@"benchmarks\clr_benchmarks\test-x86opt2/System.Xml.dll-x86-2011-09-24-x86-2011-09-24/000979/"
                ,@"benchmarks\clr_benchmarks\test-x86opt2/System.Xml.dll-x86-2011-09-24-x86-2011-09-24/001001/"
                ,@"benchmarks\clr_benchmarks\test-x86opt2/System.Xml.dll-x86-2011-09-24-x86-2011-09-24/001024/"
                ,@"benchmarks\clr_benchmarks\test-x86opt2/System.Xml.dll-x86-2011-09-24-x86-2011-09-24/001142/"
                ,@"benchmarks\clr_benchmarks\test-x86opt2/System.Xml.dll-x86-2011-09-24-x86-2011-09-24/001262/"
                ,@"benchmarks\clr_benchmarks\test-x86opt2/System.Xml.dll-x86-2011-09-24-x86-2011-09-24/001478/"
                ,@"benchmarks\clr_benchmarks\test-x86opt2/System.Xml.dll-x86-2011-09-24-x86-2011-09-24/001482/"
                ,@"benchmarks\clr_benchmarks\test-x86opt2/System.Xml.dll-x86-2011-09-24-x86-2011-09-24/001486/"
                ,@"benchmarks\clr_benchmarks\test-x86opt2/System.Xml.dll-x86-2011-09-24-x86-2011-09-24/001717/"
                ,@"benchmarks\clr_benchmarks\test-x86opt2/xlisp.exe-x86-2011-09-24-x86-2011-09-24/000009/"
                ,@"benchmarks\clr_benchmarks\test-x86opt2/xlisp.exe-x86-2011-09-24-x86-2011-09-24/000012/"
                ,@"benchmarks\clr_benchmarks\test-x86opt2/xlisp.exe-x86-2011-09-24-x86-2011-09-24/000036/"
                ,@"benchmarks\clr_benchmarks\test-x86opt2/xlisp.exe-x86-2011-09-24-x86-2011-09-24/000049/"
                ,@"benchmarks\clr_benchmarks\test-x86opt2/xlisp.exe-x86-2011-09-24-x86-2011-09-24/000078/"
                ,@"benchmarks\clr_benchmarks\test-x86opt2/xlisp.exe-x86-2011-09-24-x86-2011-09-24/000107/"
                ,@"benchmarks\clr_benchmarks\test-x86opt2/xlisp.exe-x86-2011-09-24-x86-2011-09-24/000120/"
                ,@"benchmarks\clr_benchmarks\test-x86opt2/xlisp.exe-x86-2011-09-24-x86-2011-09-24/000139/"
                ,@"benchmarks\clr_benchmarks\test-x86opt2/xlisp.exe-x86-2011-09-24-x86-2011-09-24/000145/"
                ,@"benchmarks\clr_benchmarks\test-x86opt2/xlisp.exe-x86-2011-09-24-x86-2011-09-24/000154/"
                ,@"benchmarks\clr_benchmarks\test-x86opt2/xlisp.exe-x86-2011-09-24-x86-2011-09-24/000155/"
                ,@"benchmarks\clr_benchmarks\test-x86opt2/xlisp.exe-x86-2011-09-24-x86-2011-09-24/000170/"
                ,@"benchmarks\clr_benchmarks\test-x86opt2/xlisp.exe-x86-2011-09-24-x86-2011-09-24/000195/"
                ,@"benchmarks\clr_benchmarks\test-x86opt2/xlisp.exe-x86-2011-09-24-x86-2011-09-24/000201/"
                ,@"benchmarks\clr_benchmarks\test-x86opt2/xlisp.exe-x86-2011-09-24-x86-2011-09-24/000213/"
                ,@"benchmarks\clr_benchmarks\test-x86opt2/xlisp.exe-x86-2011-09-24-x86-2011-09-24/000219/"
                ,@"benchmarks\clr_benchmarks\test-x86opt2/xlisp.exe-x86-2011-09-24-x86-2011-09-24/000335/"
                ,@"benchmarks\clr_benchmarks\test-x86opt2/xlisp.exe-x86-2011-09-24-x86-2011-09-24/000419/"
                ,@"benchmarks\clr_benchmarks\test-x86opt2/xlisp.exe-x86-2011-09-24-x86-2011-09-24/000539/"

            };

            var options = new List<Tuple<string, string>>()
            {
                //Tuple.Create(@" /equalityFixes+ /trivialFilter- /parallelFilter- /literalFilter- /arithmeticFilter- /applyLeftFilter+ /applyRightFilter+ /loadFilter+ /demonizeUninterpreted+ /constrainLeftPath+ /findEarliestMapUpdateMismatch /binarySearch /verbose:1", "filter1")
                //,Tuple.Create(@" /equalityFixes+ /trivialFilter- /singleFilter- /literalFilter- /arithmeticFilter- /applyLeftFilter+ /applyRightFilter+ /storeFilter+ /passingTestFilter- /demonizeUninterpreted+ /constrainLeftPath+ /findEarliestMapUpdateMismatch /binarySearch /verbose:1", "filter2")
                //,Tuple.Create(@" /equalityFixes+ /trivialFilter- /parallelFilter- /literalFilter- /arithmeticFilter- /applyLeftFilter+ /applyRightFilter+ /calleeFilter+ /demonizeUninterpreted+ /constrainLeftPath+ /findEarliestMapUpdateMismatch /binarySearch /verbose:1", "filter3")
                //,Tuple.Create(@" /equalityFixes+ /trivialFilter- /singleFilter- /literalFilter- /arithmeticFilter- /applyLeftFilter+ /applyRightFilter+ /passingTestFilter- /demonizeUninterpreted+ /constrainLeftPath+ /findEarliestMapUpdateMismatch /binarySearch /verbose:1 /test /stats", "filter4")
                //,Tuple.Create(@" /equalityFixes+ /trivialFilter- /literalFilter- /arithmeticFilter- /applyLeftFilter+ /applyRightFilter+ /passingTestFilter- /demonizeUninterpreted+ /constrainLeftPath+ /findEarliestMapUpdateMismatch /binarySearch /verbose:1 /stats", "filter4")
                Tuple.Create(@" /? /equalityFixes+ /trivialFilter- /literalFilter- /arithmeticFilter- /applyLeftFilter+ /applyRightFilter+ /passingTestFilter- /demonizeUninterpreted+ /constrainLeftPath+ /findEarliestMapUpdateMismatch /binarySearch /verbose:1 /stats", "symdiffOnly")
            };

            //cross product
            return dirs.SelectMany(x => options, (x, y) => Tuple.Create(Tuple.Create(x, bplFile, htmlFile), y)).ToList();
        }
        public static List<Tuple<Tuple<string, string, string>, Tuple<string, string>>> CollectX86Arm3Benchmarks()
        {

            var bplFile = @"EQ__x.p___y.p_out.bpl";
            var htmlFile = @"EQ__x.p___y.p_cex_1_out.analyze";

            var dirs = new List<string>()  {
                @"benchmarks\clr_benchmarks\test-x86-arm3\ByteMark.exe-x86-2011-08-24-arm-2011-08-24\000004\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\ByteMark.exe-x86-2011-08-24-arm-2011-08-24\000028\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\ByteMark.exe-x86-2011-08-24-arm-2011-08-24\000029\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\ByteMark.exe-x86-2011-08-24-arm-2011-08-24\000030\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\ByteMark.exe-x86-2011-08-24-arm-2011-08-24\000053\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\ByteMark.exe-x86-2011-08-24-arm-2011-08-24\000055\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\ByteMark.exe-x86-2011-08-24-arm-2011-08-24\000059\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\ByteMark.exe-x86-2011-08-24-arm-2011-08-24\000062\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\ByteMark.exe-x86-2011-08-24-arm-2011-08-24\000080\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\ByteMark.exe-x86-2011-08-24-arm-2011-08-24\000082\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\ByteMark.exe-x86-2011-08-24-arm-2011-08-24\000085\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\ByteMark.exe-x86-2011-08-24-arm-2011-08-24\000096\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\ByteMark.exe-x86-2011-08-24-arm-2011-08-24\000105\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\ByteMark.exe-x86-2011-08-24-arm-2011-08-24\000107\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\ByteMark.exe-x86-2011-08-24-arm-2011-08-24\000110\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\ByteMark.exe-x86-2011-08-24-arm-2011-08-24\000120\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\ByteMark.exe-x86-2011-08-24-arm-2011-08-24\000121\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\ByteMark.exe-x86-2011-08-24-arm-2011-08-24\000127\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\ByteMark.exe-x86-2011-08-24-arm-2011-08-24\000130\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\ByteMark.exe-x86-2011-08-24-arm-2011-08-24\000136\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\ByteMark.exe-x86-2011-08-24-arm-2011-08-24\000139\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\ByteMark.exe-x86-2011-08-24-arm-2011-08-24\000144\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\ByteMark.exe-x86-2011-08-24-arm-2011-08-24\000146\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\ByteMark.exe-x86-2011-08-24-arm-2011-08-24\000147\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\ByteMark.exe-x86-2011-08-24-arm-2011-08-24\000154\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\ByteMark.exe-x86-2011-08-24-arm-2011-08-24\000157\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\ByteMark.exe-x86-2011-08-24-arm-2011-08-24\000159\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\ByteMark.exe-x86-2011-08-24-arm-2011-08-24\000161\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\ByteMark.exe-x86-2011-08-24-arm-2011-08-24\000168\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\ByteMark.exe-x86-2011-08-24-arm-2011-08-24\000171\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\ByteMark.exe-x86-2011-08-24-arm-2011-08-24\000173\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\ByteMark.exe-x86-2011-08-24-arm-2011-08-24\000179\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\ByteMark.exe-x86-2011-08-24-arm-2011-08-24\000182\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\ByteMark.exe-x86-2011-08-24-arm-2011-08-24\000183\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\ByteMark.exe-x86-2011-08-24-arm-2011-08-24\000184\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\ByteMark.exe-x86-2011-08-24-arm-2011-08-24\000194\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\ByteMark.exe-x86-2011-08-24-arm-2011-08-24\000210\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\Crafty.exe-x86-2011-08-24-arm-2011-08-24\000018\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\Crafty.exe-x86-2011-08-24-arm-2011-08-24\000021\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\Crafty.exe-x86-2011-08-24-arm-2011-08-24\000036\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\Crafty.exe-x86-2011-08-24-arm-2011-08-24\000136\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\Crafty.exe-x86-2011-08-24-arm-2011-08-24\000154\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\Crafty.exe-x86-2011-08-24-arm-2011-08-24\000160\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\Crafty.exe-x86-2011-08-24-arm-2011-08-24\000161\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\Crafty.exe-x86-2011-08-24-arm-2011-08-24\000170\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\Crafty.exe-x86-2011-08-24-arm-2011-08-24\000222\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\Crafty.exe-x86-2011-08-24-arm-2011-08-24\000228\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\Crafty.exe-x86-2011-08-24-arm-2011-08-24\000241\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\Crafty.exe-x86-2011-08-24-arm-2011-08-24\000243\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\Crafty.exe-x86-2011-08-24-arm-2011-08-24\000279\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\go.exe-x86-2011-08-24-arm-2011-08-24\000003\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\go.exe-x86-2011-08-24-arm-2011-08-24\000006\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\go.exe-x86-2011-08-24-arm-2011-08-24\000057\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\go.exe-x86-2011-08-24-arm-2011-08-24\000065\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\go.exe-x86-2011-08-24-arm-2011-08-24\000067\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\go.exe-x86-2011-08-24-arm-2011-08-24\000072\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\go.exe-x86-2011-08-24-arm-2011-08-24\000074\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\go.exe-x86-2011-08-24-arm-2011-08-24\000089\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\go.exe-x86-2011-08-24-arm-2011-08-24\000091\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\go.exe-x86-2011-08-24-arm-2011-08-24\000094\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\go.exe-x86-2011-08-24-arm-2011-08-24\000096\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\go.exe-x86-2011-08-24-arm-2011-08-24\000098\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\go.exe-x86-2011-08-24-arm-2011-08-24\000120\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\go.exe-x86-2011-08-24-arm-2011-08-24\000178\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\go.exe-x86-2011-08-24-arm-2011-08-24\000190\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\go.exe-x86-2011-08-24-arm-2011-08-24\000194\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\go.exe-x86-2011-08-24-arm-2011-08-24\000209\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\go.exe-x86-2011-08-24-arm-2011-08-24\000217\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\go.exe-x86-2011-08-24-arm-2011-08-24\000260\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\go.exe-x86-2011-08-24-arm-2011-08-24\000296\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\go.exe-x86-2011-08-24-arm-2011-08-24\000319\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\go.exe-x86-2011-08-24-arm-2011-08-24\000402\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\go.exe-x86-2011-08-24-arm-2011-08-24\000405\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\go.exe-x86-2011-08-24-arm-2011-08-24\000417\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\go.exe-x86-2011-08-24-arm-2011-08-24\000422\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\go.exe-x86-2011-08-24-arm-2011-08-24\000430\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\go.exe-x86-2011-08-24-arm-2011-08-24\000434\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\ijpeg.exe-x86-2011-08-24-arm-2011-08-24\000001\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\ijpeg.exe-x86-2011-08-24-arm-2011-08-24\000018\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\ijpeg.exe-x86-2011-08-24-arm-2011-08-24\000025\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\ijpeg.exe-x86-2011-08-24-arm-2011-08-24\000027\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\ijpeg.exe-x86-2011-08-24-arm-2011-08-24\000032\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\ijpeg.exe-x86-2011-08-24-arm-2011-08-24\000075\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\ijpeg.exe-x86-2011-08-24-arm-2011-08-24\000079\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\ijpeg.exe-x86-2011-08-24-arm-2011-08-24\000080\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\ijpeg.exe-x86-2011-08-24-arm-2011-08-24\000092\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\ijpeg.exe-x86-2011-08-24-arm-2011-08-24\000094\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\ijpeg.exe-x86-2011-08-24-arm-2011-08-24\000097\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\ijpeg.exe-x86-2011-08-24-arm-2011-08-24\000108\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\ijpeg.exe-x86-2011-08-24-arm-2011-08-24\000111\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\ijpeg.exe-x86-2011-08-24-arm-2011-08-24\000130\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\ijpeg.exe-x86-2011-08-24-arm-2011-08-24\000143\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\ijpeg.exe-x86-2011-08-24-arm-2011-08-24\000147\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\ijpeg.exe-x86-2011-08-24-arm-2011-08-24\000151\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\ijpeg.exe-x86-2011-08-24-arm-2011-08-24\000165\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\ijpeg.exe-x86-2011-08-24-arm-2011-08-24\000166\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\ijpeg.exe-x86-2011-08-24-arm-2011-08-24\000169\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\ijpeg.exe-x86-2011-08-24-arm-2011-08-24\000170\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\ijpeg.exe-x86-2011-08-24-arm-2011-08-24\000178\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\ijpeg.exe-x86-2011-08-24-arm-2011-08-24\000183\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\ijpeg.exe-x86-2011-08-24-arm-2011-08-24\000209\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\ijpeg.exe-x86-2011-08-24-arm-2011-08-24\000210\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\ijpeg.exe-x86-2011-08-24-arm-2011-08-24\000218\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\ijpeg.exe-x86-2011-08-24-arm-2011-08-24\000219\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\ijpeg.exe-x86-2011-08-24-arm-2011-08-24\000222\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\ijpeg.exe-x86-2011-08-24-arm-2011-08-24\000226\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\ijpeg.exe-x86-2011-08-24-arm-2011-08-24\000227\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\ijpeg.exe-x86-2011-08-24-arm-2011-08-24\000228\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\ijpeg.exe-x86-2011-08-24-arm-2011-08-24\000237\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\ijpeg.exe-x86-2011-08-24-arm-2011-08-24\000238\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\ijpeg.exe-x86-2011-08-24-arm-2011-08-24\000239\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\ijpeg.exe-x86-2011-08-24-arm-2011-08-24\000248\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\ijpeg.exe-x86-2011-08-24-arm-2011-08-24\000261\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\ijpeg.exe-x86-2011-08-24-arm-2011-08-24\000262\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\Microsoft.VisualBasic.dll-x86-2011-08-24-arm-2011-08-24\000005\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\Microsoft.VisualBasic.dll-x86-2011-08-24-arm-2011-08-24\000034\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\Microsoft.VisualBasic.dll-x86-2011-08-24-arm-2011-08-24\000035\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\Microsoft.VisualBasic.dll-x86-2011-08-24-arm-2011-08-24\000044\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\Microsoft.VisualBasic.dll-x86-2011-08-24-arm-2011-08-24\000066\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\Microsoft.VisualBasic.dll-x86-2011-08-24-arm-2011-08-24\000075\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\Microsoft.VisualBasic.dll-x86-2011-08-24-arm-2011-08-24\000108\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\Microsoft.VisualBasic.dll-x86-2011-08-24-arm-2011-08-24\000109\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\Microsoft.VisualBasic.dll-x86-2011-08-24-arm-2011-08-24\000115\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\Microsoft.VisualBasic.dll-x86-2011-08-24-arm-2011-08-24\000127\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\Microsoft.VisualBasic.dll-x86-2011-08-24-arm-2011-08-24\000141\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\Microsoft.VisualBasic.dll-x86-2011-08-24-arm-2011-08-24\000142\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\Microsoft.VisualBasic.dll-x86-2011-08-24-arm-2011-08-24\000205\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\Microsoft.VisualBasic.dll-x86-2011-08-24-arm-2011-08-24\000218\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\Microsoft.VisualBasic.dll-x86-2011-08-24-arm-2011-08-24\000220\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\Microsoft.VisualBasic.dll-x86-2011-08-24-arm-2011-08-24\000229\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\Microsoft.VisualBasic.dll-x86-2011-08-24-arm-2011-08-24\000237\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\Microsoft.VisualBasic.dll-x86-2011-08-24-arm-2011-08-24\000238\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\Microsoft.VisualBasic.dll-x86-2011-08-24-arm-2011-08-24\000242\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\Microsoft.VisualBasic.dll-x86-2011-08-24-arm-2011-08-24\000294\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\Microsoft.VisualBasic.dll-x86-2011-08-24-arm-2011-08-24\000343\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\Microsoft.VisualBasic.dll-x86-2011-08-24-arm-2011-08-24\000401\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\Microsoft.VisualBasic.dll-x86-2011-08-24-arm-2011-08-24\000409\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\Microsoft.VisualBasic.dll-x86-2011-08-24-arm-2011-08-24\000434\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\Microsoft.VisualBasic.dll-x86-2011-08-24-arm-2011-08-24\000443\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\Microsoft.VisualBasic.dll-x86-2011-08-24-arm-2011-08-24\000469\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\Microsoft.VisualBasic.dll-x86-2011-08-24-arm-2011-08-24\000559\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\Microsoft.VisualBasic.dll-x86-2011-08-24-arm-2011-08-24\000579\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\Microsoft.VisualBasic.dll-x86-2011-08-24-arm-2011-08-24\000593\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\Microsoft.VisualBasic.dll-x86-2011-08-24-arm-2011-08-24\000602\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\Microsoft.VisualBasic.dll-x86-2011-08-24-arm-2011-08-24\000614\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\Microsoft.VisualBasic.dll-x86-2011-08-24-arm-2011-08-24\000615\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\Microsoft.VisualBasic.dll-x86-2011-08-24-arm-2011-08-24\000625\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\Microsoft.VisualBasic.dll-x86-2011-08-24-arm-2011-08-24\000655\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\Microsoft.VisualBasic.dll-x86-2011-08-24-arm-2011-08-24\000668\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\Microsoft.VisualBasic.dll-x86-2011-08-24-arm-2011-08-24\000715\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\Microsoft.VisualBasic.dll-x86-2011-08-24-arm-2011-08-24\000753\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\Microsoft.VisualBasic.dll-x86-2011-08-24-arm-2011-08-24\000779\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\Microsoft.VisualBasic.dll-x86-2011-08-24-arm-2011-08-24\000783\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\Microsoft.VisualBasic.dll-x86-2011-08-24-arm-2011-08-24\000842\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\Microsoft.VisualBasic.dll-x86-2011-08-24-arm-2011-08-24\000873\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\sat_solver.exe-x86-2011-08-24-arm-2011-08-24\000002\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\sat_solver.exe-x86-2011-08-24-arm-2011-08-24\000008\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\sat_solver.exe-x86-2011-08-24-arm-2011-08-24\000022\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\sat_solver.exe-x86-2011-08-24-arm-2011-08-24\000038\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\sat_solver.exe-x86-2011-08-24-arm-2011-08-24\000042\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\sat_solver.exe-x86-2011-08-24-arm-2011-08-24\000044\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\sat_solver.exe-x86-2011-08-24-arm-2011-08-24\000047\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\sat_solver.exe-x86-2011-08-24-arm-2011-08-24\000051\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\sat_solver.exe-x86-2011-08-24-arm-2011-08-24\000052\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\sat_solver.exe-x86-2011-08-24-arm-2011-08-24\000054\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\sat_solver.exe-x86-2011-08-24-arm-2011-08-24\000059\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\sat_solver.exe-x86-2011-08-24-arm-2011-08-24\000068\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\sat_solver.exe-x86-2011-08-24-arm-2011-08-24\000078\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\sat_solver.exe-x86-2011-08-24-arm-2011-08-24\000083\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\sat_solver.exe-x86-2011-08-24-arm-2011-08-24\000112\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\sat_solver.exe-x86-2011-08-24-arm-2011-08-24\000113\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\sat_solver.exe-x86-2011-08-24-arm-2011-08-24\000121\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\sat_solver.exe-x86-2011-08-24-arm-2011-08-24\000141\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\sat_solver.exe-x86-2011-08-24-arm-2011-08-24\000145\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\sat_solver.exe-x86-2011-08-24-arm-2011-08-24\000149\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\sat_solver.exe-x86-2011-08-24-arm-2011-08-24\000153\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\sat_solver.exe-x86-2011-08-24-arm-2011-08-24\000163\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\sat_solver.exe-x86-2011-08-24-arm-2011-08-24\000177\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\sat_solver.exe-x86-2011-08-24-arm-2011-08-24\000180\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\sat_solver.exe-x86-2011-08-24-arm-2011-08-24\000182\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\sat_solver.exe-x86-2011-08-24-arm-2011-08-24\000183\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\sat_solver.exe-x86-2011-08-24-arm-2011-08-24\000186\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\sat_solver.exe-x86-2011-08-24-arm-2011-08-24\000190\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\sat_solver.exe-x86-2011-08-24-arm-2011-08-24\000240\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\sat_solver.exe-x86-2011-08-24-arm-2011-08-24\000244\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\sat_solver.exe-x86-2011-08-24-arm-2011-08-24\000245\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\System.Core.dll-x86-2011-08-24-arm-2011-08-24\000480\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\System.Core.dll-x86-2011-08-24-arm-2011-08-24\000714\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\System.Core.dll-x86-2011-08-24-arm-2011-08-24\000733\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\System.Core.dll-x86-2011-08-24-arm-2011-08-24\000844\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\System.Core.dll-x86-2011-08-24-arm-2011-08-24\000965\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\System.Core.dll-x86-2011-08-24-arm-2011-08-24\001477\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\System.Core.dll-x86-2011-08-24-arm-2011-08-24\002084\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\System.Core.dll-x86-2011-08-24-arm-2011-08-24\002099\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\System.Core.dll-x86-2011-08-24-arm-2011-08-24\002102\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\System.Core.dll-x86-2011-08-24-arm-2011-08-24\002113\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\System.Core.dll-x86-2011-08-24-arm-2011-08-24\002588\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\System.Core.dll-x86-2011-08-24-arm-2011-08-24\002907\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\System.Core.dll-x86-2011-08-24-arm-2011-08-24\003141\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\System.Core.dll-x86-2011-08-24-arm-2011-08-24\003270\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\System.Core.dll-x86-2011-08-24-arm-2011-08-24\003316\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\System.Core.dll-x86-2011-08-24-arm-2011-08-24\003372\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\System.Core.dll-x86-2011-08-24-arm-2011-08-24\003517\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\System.Core.dll-x86-2011-08-24-arm-2011-08-24\003799\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\System.Core.dll-x86-2011-08-24-arm-2011-08-24\003813\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\System.Core.dll-x86-2011-08-24-arm-2011-08-24\003959\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\System.Core.dll-x86-2011-08-24-arm-2011-08-24\004452\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\System.Core.dll-x86-2011-08-24-arm-2011-08-24\004843\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\system.dll-x86-2011-08-24-arm-2011-08-24\000012\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\system.dll-x86-2011-08-24-arm-2011-08-24\000016\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\system.dll-x86-2011-08-24-arm-2011-08-24\000019\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\system.dll-x86-2011-08-24-arm-2011-08-24\000034\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\system.dll-x86-2011-08-24-arm-2011-08-24\000107\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\system.dll-x86-2011-08-24-arm-2011-08-24\000144\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\system.dll-x86-2011-08-24-arm-2011-08-24\000175\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\system.dll-x86-2011-08-24-arm-2011-08-24\000183\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\system.dll-x86-2011-08-24-arm-2011-08-24\000218\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\system.dll-x86-2011-08-24-arm-2011-08-24\000227\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\system.dll-x86-2011-08-24-arm-2011-08-24\000247\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\system.dll-x86-2011-08-24-arm-2011-08-24\000290\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\system.dll-x86-2011-08-24-arm-2011-08-24\000349\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\system.dll-x86-2011-08-24-arm-2011-08-24\000372\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\system.dll-x86-2011-08-24-arm-2011-08-24\000401\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\system.dll-x86-2011-08-24-arm-2011-08-24\000402\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\system.dll-x86-2011-08-24-arm-2011-08-24\000492\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\system.dll-x86-2011-08-24-arm-2011-08-24\000556\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\system.dll-x86-2011-08-24-arm-2011-08-24\000566\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\system.dll-x86-2011-08-24-arm-2011-08-24\000568\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\system.dll-x86-2011-08-24-arm-2011-08-24\000626\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\system.dll-x86-2011-08-24-arm-2011-08-24\000627\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\system.dll-x86-2011-08-24-arm-2011-08-24\000633\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\system.dll-x86-2011-08-24-arm-2011-08-24\000639\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\system.dll-x86-2011-08-24-arm-2011-08-24\000731\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\system.dll-x86-2011-08-24-arm-2011-08-24\000739\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\system.dll-x86-2011-08-24-arm-2011-08-24\000741\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\system.dll-x86-2011-08-24-arm-2011-08-24\000792\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\system.dll-x86-2011-08-24-arm-2011-08-24\000866\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\system.dll-x86-2011-08-24-arm-2011-08-24\000962\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\System.Net.dll-x86-2011-08-24-arm-2011-08-24\000059\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\System.Net.dll-x86-2011-08-24-arm-2011-08-24\000076\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\System.Net.dll-x86-2011-08-24-arm-2011-08-24\000094\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\System.Net.dll-x86-2011-08-24-arm-2011-08-24\000104\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\System.Net.dll-x86-2011-08-24-arm-2011-08-24\000132\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\System.Net.dll-x86-2011-08-24-arm-2011-08-24\000215\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\System.Net.dll-x86-2011-08-24-arm-2011-08-24\000240\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\System.Net.dll-x86-2011-08-24-arm-2011-08-24\000331\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\System.Net.dll-x86-2011-08-24-arm-2011-08-24\000384\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\System.Net.dll-x86-2011-08-24-arm-2011-08-24\000414\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\System.Net.dll-x86-2011-08-24-arm-2011-08-24\000423\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\System.Net.dll-x86-2011-08-24-arm-2011-08-24\000463\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\System.Net.dll-x86-2011-08-24-arm-2011-08-24\000518\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\System.Net.dll-x86-2011-08-24-arm-2011-08-24\000529\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\System.Net.dll-x86-2011-08-24-arm-2011-08-24\000534\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\System.Net.dll-x86-2011-08-24-arm-2011-08-24\000572\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\System.Net.dll-x86-2011-08-24-arm-2011-08-24\000707\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\System.Net.dll-x86-2011-08-24-arm-2011-08-24\000729\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\System.Net.dll-x86-2011-08-24-arm-2011-08-24\000802\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\System.Net.dll-x86-2011-08-24-arm-2011-08-24\000843\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\System.Net.dll-x86-2011-08-24-arm-2011-08-24\000950\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\System.Net.dll-x86-2011-08-24-arm-2011-08-24\000951\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\System.Runtime.Serialization.dll-x86-2011-08-24-arm-2011-08-24\000319\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\System.Runtime.Serialization.dll-x86-2011-08-24-arm-2011-08-24\000332\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\System.Runtime.Serialization.dll-x86-2011-08-24-arm-2011-08-24\000421\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\System.Runtime.Serialization.dll-x86-2011-08-24-arm-2011-08-24\000431\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\System.Runtime.Serialization.dll-x86-2011-08-24-arm-2011-08-24\000528\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\System.Runtime.Serialization.dll-x86-2011-08-24-arm-2011-08-24\000567\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\System.Runtime.Serialization.dll-x86-2011-08-24-arm-2011-08-24\000629\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\System.Runtime.Serialization.dll-x86-2011-08-24-arm-2011-08-24\000631\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\System.Runtime.Serialization.dll-x86-2011-08-24-arm-2011-08-24\000717\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\System.Runtime.Serialization.dll-x86-2011-08-24-arm-2011-08-24\000734\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\System.Runtime.Serialization.dll-x86-2011-08-24-arm-2011-08-24\000793\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\System.Runtime.Serialization.dll-x86-2011-08-24-arm-2011-08-24\000881\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\System.Runtime.Serialization.dll-x86-2011-08-24-arm-2011-08-24\001043\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\System.Runtime.Serialization.dll-x86-2011-08-24-arm-2011-08-24\001044\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\System.Runtime.Serialization.dll-x86-2011-08-24-arm-2011-08-24\001087\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\System.Runtime.Serialization.dll-x86-2011-08-24-arm-2011-08-24\001088\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\System.Runtime.Serialization.dll-x86-2011-08-24-arm-2011-08-24\001510\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\System.Runtime.Serialization.dll-x86-2011-08-24-arm-2011-08-24\002334\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\System.Runtime.Serialization.dll-x86-2011-08-24-arm-2011-08-24\002479\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\System.Runtime.Serialization.dll-x86-2011-08-24-arm-2011-08-24\002608\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\System.Runtime.Serialization.dll-x86-2011-08-24-arm-2011-08-24\002611\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\System.Runtime.Serialization.dll-x86-2011-08-24-arm-2011-08-24\002632\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\System.Runtime.Serialization.dll-x86-2011-08-24-arm-2011-08-24\002653\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\System.Runtime.Serialization.dll-x86-2011-08-24-arm-2011-08-24\002713\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\System.ServiceModel.dll-x86-2011-08-24-arm-2011-08-24\000122\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\System.ServiceModel.dll-x86-2011-08-24-arm-2011-08-24\000130\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\System.ServiceModel.dll-x86-2011-08-24-arm-2011-08-24\000143\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\System.ServiceModel.dll-x86-2011-08-24-arm-2011-08-24\000577\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\System.ServiceModel.dll-x86-2011-08-24-arm-2011-08-24\000578\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\System.ServiceModel.dll-x86-2011-08-24-arm-2011-08-24\000601\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\System.ServiceModel.dll-x86-2011-08-24-arm-2011-08-24\000614\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\System.ServiceModel.dll-x86-2011-08-24-arm-2011-08-24\000618\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\System.ServiceModel.dll-x86-2011-08-24-arm-2011-08-24\000622\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\System.ServiceModel.dll-x86-2011-08-24-arm-2011-08-24\000743\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\System.ServiceModel.dll-x86-2011-08-24-arm-2011-08-24\001095\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\System.ServiceModel.dll-x86-2011-08-24-arm-2011-08-24\001097\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\System.ServiceModel.dll-x86-2011-08-24-arm-2011-08-24\001108\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\System.ServiceModel.dll-x86-2011-08-24-arm-2011-08-24\001117\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\System.ServiceModel.dll-x86-2011-08-24-arm-2011-08-24\001189\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\System.ServiceModel.dll-x86-2011-08-24-arm-2011-08-24\001200\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\System.ServiceModel.dll-x86-2011-08-24-arm-2011-08-24\001503\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\System.ServiceModel.dll-x86-2011-08-24-arm-2011-08-24\001519\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\System.ServiceModel.dll-x86-2011-08-24-arm-2011-08-24\001636\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\System.ServiceModel.dll-x86-2011-08-24-arm-2011-08-24\001637\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\System.ServiceModel.dll-x86-2011-08-24-arm-2011-08-24\001759\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\System.ServiceModel.dll-x86-2011-08-24-arm-2011-08-24\001863\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\System.ServiceModel.dll-x86-2011-08-24-arm-2011-08-24\002199\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\System.ServiceModel.dll-x86-2011-08-24-arm-2011-08-24\002237\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\System.ServiceModel.dll-x86-2011-08-24-arm-2011-08-24\002262\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\System.ServiceModel.dll-x86-2011-08-24-arm-2011-08-24\002397\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\System.ServiceModel.dll-x86-2011-08-24-arm-2011-08-24\002465\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\System.ServiceModel.dll-x86-2011-08-24-arm-2011-08-24\002615\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\System.ServiceModel.dll-x86-2011-08-24-arm-2011-08-24\002874\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\System.ServiceModel.dll-x86-2011-08-24-arm-2011-08-24\002976\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\System.ServiceModel.dll-x86-2011-08-24-arm-2011-08-24\003014\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\System.ServiceModel.Web.dll-x86-2011-08-24-arm-2011-08-24\000005\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\System.ServiceModel.Web.dll-x86-2011-08-24-arm-2011-08-24\000006\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\System.ServiceModel.Web.dll-x86-2011-08-24-arm-2011-08-24\000021\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\System.ServiceModel.Web.dll-x86-2011-08-24-arm-2011-08-24\000022\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\System.ServiceModel.Web.dll-x86-2011-08-24-arm-2011-08-24\000025\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\System.ServiceModel.Web.dll-x86-2011-08-24-arm-2011-08-24\000028\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\System.ServiceModel.Web.dll-x86-2011-08-24-arm-2011-08-24\000031\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\System.ServiceModel.Web.dll-x86-2011-08-24-arm-2011-08-24\000032\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\System.ServiceModel.Web.dll-x86-2011-08-24-arm-2011-08-24\000033\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\System.ServiceModel.Web.dll-x86-2011-08-24-arm-2011-08-24\000034\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\System.ServiceModel.Web.dll-x86-2011-08-24-arm-2011-08-24\000037\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\System.ServiceModel.Web.dll-x86-2011-08-24-arm-2011-08-24\000038\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\System.ServiceModel.Web.dll-x86-2011-08-24-arm-2011-08-24\000045\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\System.ServiceModel.Web.dll-x86-2011-08-24-arm-2011-08-24\000046\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\System.ServiceModel.Web.dll-x86-2011-08-24-arm-2011-08-24\000047\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\System.ServiceModel.Web.dll-x86-2011-08-24-arm-2011-08-24\000059\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\System.ServiceModel.Web.dll-x86-2011-08-24-arm-2011-08-24\000070\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\System.ServiceModel.Web.dll-x86-2011-08-24-arm-2011-08-24\000071\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\System.ServiceModel.Web.dll-x86-2011-08-24-arm-2011-08-24\000081\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\System.ServiceModel.Web.dll-x86-2011-08-24-arm-2011-08-24\000088\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\System.ServiceModel.Web.dll-x86-2011-08-24-arm-2011-08-24\000091\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\System.ServiceModel.Web.dll-x86-2011-08-24-arm-2011-08-24\000098\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\System.ServiceModel.Web.dll-x86-2011-08-24-arm-2011-08-24\000103\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\System.ServiceModel.Web.dll-x86-2011-08-24-arm-2011-08-24\000108\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\System.ServiceModel.Web.dll-x86-2011-08-24-arm-2011-08-24\000113\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\System.ServiceModel.Web.dll-x86-2011-08-24-arm-2011-08-24\000114\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\System.ServiceModel.Web.dll-x86-2011-08-24-arm-2011-08-24\000120\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\System.ServiceModel.Web.dll-x86-2011-08-24-arm-2011-08-24\000124\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\System.ServiceModel.Web.dll-x86-2011-08-24-arm-2011-08-24\000131\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\System.ServiceModel.Web.dll-x86-2011-08-24-arm-2011-08-24\000135\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\System.ServiceModel.Web.dll-x86-2011-08-24-arm-2011-08-24\000146\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\System.ServiceModel.Web.dll-x86-2011-08-24-arm-2011-08-24\000151\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\System.Windows.Browser.dll-x86-2011-08-24-arm-2011-08-24\000006\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\System.Windows.Browser.dll-x86-2011-08-24-arm-2011-08-24\000037\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\System.Windows.Browser.dll-x86-2011-08-24-arm-2011-08-24\000040\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\System.Windows.Browser.dll-x86-2011-08-24-arm-2011-08-24\000065\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\System.Windows.Browser.dll-x86-2011-08-24-arm-2011-08-24\000093\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\System.Windows.Browser.dll-x86-2011-08-24-arm-2011-08-24\000094\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\System.Windows.Browser.dll-x86-2011-08-24-arm-2011-08-24\000143\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\System.Windows.Browser.dll-x86-2011-08-24-arm-2011-08-24\000145\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\System.Windows.Browser.dll-x86-2011-08-24-arm-2011-08-24\000191\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\System.Windows.Browser.dll-x86-2011-08-24-arm-2011-08-24\000200\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\System.Windows.Browser.dll-x86-2011-08-24-arm-2011-08-24\000213\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\System.Windows.Browser.dll-x86-2011-08-24-arm-2011-08-24\000229\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\System.Windows.Browser.dll-x86-2011-08-24-arm-2011-08-24\000243\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\System.Windows.Browser.dll-x86-2011-08-24-arm-2011-08-24\000287\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\System.Windows.Browser.dll-x86-2011-08-24-arm-2011-08-24\000299\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\System.Windows.Browser.dll-x86-2011-08-24-arm-2011-08-24\000323\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\System.Windows.Browser.dll-x86-2011-08-24-arm-2011-08-24\000326\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\System.Windows.Browser.dll-x86-2011-08-24-arm-2011-08-24\000340\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\System.Windows.Browser.dll-x86-2011-08-24-arm-2011-08-24\000356\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\System.Windows.Browser.dll-x86-2011-08-24-arm-2011-08-24\000365\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\System.Windows.Browser.dll-x86-2011-08-24-arm-2011-08-24\000389\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\System.Windows.Browser.dll-x86-2011-08-24-arm-2011-08-24\000393\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\System.Windows.Browser.dll-x86-2011-08-24-arm-2011-08-24\000397\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\System.Windows.dll-x86-2011-08-24-arm-2011-08-24\000213\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\System.Windows.dll-x86-2011-08-24-arm-2011-08-24\000354\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\System.Windows.dll-x86-2011-08-24-arm-2011-08-24\000408\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\System.Windows.dll-x86-2011-08-24-arm-2011-08-24\000553\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\System.Windows.dll-x86-2011-08-24-arm-2011-08-24\000939\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\System.Windows.dll-x86-2011-08-24-arm-2011-08-24\001052\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\System.Windows.dll-x86-2011-08-24-arm-2011-08-24\001273\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\System.Windows.dll-x86-2011-08-24-arm-2011-08-24\001745\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\System.Windows.dll-x86-2011-08-24-arm-2011-08-24\002330\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\System.Windows.dll-x86-2011-08-24-arm-2011-08-24\002377\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\System.Windows.dll-x86-2011-08-24-arm-2011-08-24\002864\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\System.Windows.dll-x86-2011-08-24-arm-2011-08-24\003035\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\System.Windows.dll-x86-2011-08-24-arm-2011-08-24\003356\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\System.Windows.dll-x86-2011-08-24-arm-2011-08-24\003624\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\System.Windows.dll-x86-2011-08-24-arm-2011-08-24\003673\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\System.Windows.dll-x86-2011-08-24-arm-2011-08-24\004481\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\System.Windows.dll-x86-2011-08-24-arm-2011-08-24\004689\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\System.Windows.dll-x86-2011-08-24-arm-2011-08-24\004809\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\System.Windows.dll-x86-2011-08-24-arm-2011-08-24\005363\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\System.Windows.dll-x86-2011-08-24-arm-2011-08-24\005458\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\System.Windows.dll-x86-2011-08-24-arm-2011-08-24\005904\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\System.Windows.dll-x86-2011-08-24-arm-2011-08-24\005936\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\System.Windows.dll-x86-2011-08-24-arm-2011-08-24\006546\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\System.Windows.dll-x86-2011-08-24-arm-2011-08-24\006779\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\System.Windows.dll-x86-2011-08-24-arm-2011-08-24\006815\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\System.Windows.dll-x86-2011-08-24-arm-2011-08-24\006944\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\System.Windows.dll-x86-2011-08-24-arm-2011-08-24\006959\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\System.Windows.dll-x86-2011-08-24-arm-2011-08-24\007028\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\System.Windows.dll-x86-2011-08-24-arm-2011-08-24\007139\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\System.Windows.dll-x86-2011-08-24-arm-2011-08-24\007193\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\System.Windows.dll-x86-2011-08-24-arm-2011-08-24\007483\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\System.Windows.dll-x86-2011-08-24-arm-2011-08-24\009715\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\System.Windows.dll-x86-2011-08-24-arm-2011-08-24\009927\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\System.Xml.dll-x86-2011-08-24-arm-2011-08-24\000030\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\System.Xml.dll-x86-2011-08-24-arm-2011-08-24\000099\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\System.Xml.dll-x86-2011-08-24-arm-2011-08-24\000296\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\System.Xml.dll-x86-2011-08-24-arm-2011-08-24\000434\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\System.Xml.dll-x86-2011-08-24-arm-2011-08-24\000612\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\System.Xml.dll-x86-2011-08-24-arm-2011-08-24\000770\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\System.Xml.dll-x86-2011-08-24-arm-2011-08-24\000979\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\System.Xml.dll-x86-2011-08-24-arm-2011-08-24\001001\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\System.Xml.dll-x86-2011-08-24-arm-2011-08-24\001059\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\System.Xml.dll-x86-2011-08-24-arm-2011-08-24\001074\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\System.Xml.dll-x86-2011-08-24-arm-2011-08-24\001142\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\System.Xml.dll-x86-2011-08-24-arm-2011-08-24\001280\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\System.Xml.dll-x86-2011-08-24-arm-2011-08-24\001348\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\System.Xml.dll-x86-2011-08-24-arm-2011-08-24\001410\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\System.Xml.dll-x86-2011-08-24-arm-2011-08-24\001432\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\System.Xml.dll-x86-2011-08-24-arm-2011-08-24\001448\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\System.Xml.dll-x86-2011-08-24-arm-2011-08-24\001486\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\System.Xml.dll-x86-2011-08-24-arm-2011-08-24\001569\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\System.Xml.dll-x86-2011-08-24-arm-2011-08-24\001614\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\System.Xml.dll-x86-2011-08-24-arm-2011-08-24\001652\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\System.Xml.dll-x86-2011-08-24-arm-2011-08-24\001654\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\xlisp.exe-x86-2011-08-24-arm-2011-08-24\000009\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\xlisp.exe-x86-2011-08-24-arm-2011-08-24\000033\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\xlisp.exe-x86-2011-08-24-arm-2011-08-24\000036\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\xlisp.exe-x86-2011-08-24-arm-2011-08-24\000039\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\xlisp.exe-x86-2011-08-24-arm-2011-08-24\000077\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\xlisp.exe-x86-2011-08-24-arm-2011-08-24\000078\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\xlisp.exe-x86-2011-08-24-arm-2011-08-24\000107\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\xlisp.exe-x86-2011-08-24-arm-2011-08-24\000110\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\xlisp.exe-x86-2011-08-24-arm-2011-08-24\000120\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\xlisp.exe-x86-2011-08-24-arm-2011-08-24\000138\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\xlisp.exe-x86-2011-08-24-arm-2011-08-24\000139\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\xlisp.exe-x86-2011-08-24-arm-2011-08-24\000145\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\xlisp.exe-x86-2011-08-24-arm-2011-08-24\000170\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\xlisp.exe-x86-2011-08-24-arm-2011-08-24\000175\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\xlisp.exe-x86-2011-08-24-arm-2011-08-24\000195\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\xlisp.exe-x86-2011-08-24-arm-2011-08-24\000201\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\xlisp.exe-x86-2011-08-24-arm-2011-08-24\000213\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\xlisp.exe-x86-2011-08-24-arm-2011-08-24\000219\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\xlisp.exe-x86-2011-08-24-arm-2011-08-24\000235\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\xlisp.exe-x86-2011-08-24-arm-2011-08-24\000243\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\xlisp.exe-x86-2011-08-24-arm-2011-08-24\000319\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\xlisp.exe-x86-2011-08-24-arm-2011-08-24\000335\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\xlisp.exe-x86-2011-08-24-arm-2011-08-24\000419\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\xlisp.exe-x86-2011-08-24-arm-2011-08-24\000537\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\xlisp.exe-x86-2011-08-24-arm-2011-08-24\000539\"
                ,@"benchmarks\clr_benchmarks\test-x86-arm3\xlisp.exe-x86-2011-08-24-arm-2011-08-24\000543\"
            };

            var options = new List<Tuple<string, string>>()
            {
                //Tuple.Create(@" /equalityFixes+ /trivialFilter- /parallelFilter- /literalFilter- /arithmeticFilter- /applyLeftFilter+ /applyRightFilter+ /loadFilter+ /demonizeUninterpreted+ /constrainLeftPath+ /findEarliestMapUpdateMismatch /binarySearch /verbose:1", "filter1")
                //,Tuple.Create(@" /equalityFixes+ /trivialFilter- /singleFilter- /literalFilter- /arithmeticFilter- /applyLeftFilter+ /applyRightFilter+ /storeFilter+ /passingTestFilter- /demonizeUninterpreted+ /constrainLeftPath+ /findEarliestMapUpdateMismatch /binarySearch /verbose:1", "filter2")
                //,Tuple.Create(@" /equalityFixes+ /trivialFilter- /parallelFilter- /literalFilter- /arithmeticFilter- /applyLeftFilter+ /applyRightFilter+ /calleeFilter+ /demonizeUninterpreted+ /constrainLeftPath+ /findEarliestMapUpdateMismatch /binarySearch /verbose:1", "filter3")
                //,Tuple.Create(@" /equalityFixes+ /trivialFilter- /parallelFilter- /literalFilter- /arithmeticFilter- /applyLeftFilter+ /applyRightFilter+ /movFilter+ /demonizeUninterpreted+ /constrainLeftPath+ /findEarliestMapUpdateMismatch /binarySearch /verbose:1", "filter3")
                //,Tuple.Create(@" /equalityFixes+ /trivialFilter- /singleFilter- /literalFilter- /arithmeticFilter- /applyLeftFilter+ /applyRightFilter+ /passingTestFilter- /demonizeUninterpreted+ /constrainLeftPath+ /findEarliestMapUpdateMismatch /binarySearch /verbose:1 /test /stats", "filter4")
                //,Tuple.Create(@" /equalityFixes+ /trivialFilter- /literalFilter- /arithmeticFilter- /applyLeftFilter+ /applyRightFilter+ /passingTestFilter- /demonizeUninterpreted+ /constrainLeftPath+ /findEarliestMapUpdateMismatch /binarySearch /verbose:1 /stats", "filter4")
                //,Tuple.Create(@" /equalityFixes+ /trivialFilter- /demonizeUninterpreted+ /constrainLeftPath+ /findEarliestMapUpdateMismatch /binarySearch /verbose:1", "filter5")
                Tuple.Create(@" /? /equalityFixes+ /trivialFilter- /demonizeUninterpreted+ /constrainLeftPath+ /findEarliestMapUpdateMismatch /binarySearch /verbose:1", "SymdiffOnly")

            };

            //cross product
            return dirs.SelectMany(x => options, (x, y) => Tuple.Create(Tuple.Create(x, bplFile, htmlFile), y)).ToList();
        }
        public static List<Tuple<Tuple<string, string, string>, Tuple<string, string>>> CollectARMOpt3Benchmarks()
        {

            var bplFile = @"EQ__x.p___y.p_out.bpl";
            var htmlFile = @"EQ__x.p___y.p_cex_1_out.analyze";

            var dirs = new List<string>()  {
                 @"benchmarks\clr_benchmarks\test-armopt3\ijpeg.exe-arm-2011-09-24-arm-2011-09-24\000002\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\ijpeg.exe-arm-2011-09-24-arm-2011-09-24\000003\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\ijpeg.exe-arm-2011-09-24-arm-2011-09-24\000004\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\ijpeg.exe-arm-2011-09-24-arm-2011-09-24\000005\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\ijpeg.exe-arm-2011-09-24-arm-2011-09-24\000009\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\ijpeg.exe-arm-2011-09-24-arm-2011-09-24\000012\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\ijpeg.exe-arm-2011-09-24-arm-2011-09-24\000025\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\ijpeg.exe-arm-2011-09-24-arm-2011-09-24\000027\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\ijpeg.exe-arm-2011-09-24-arm-2011-09-24\000032\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\ijpeg.exe-arm-2011-09-24-arm-2011-09-24\000055\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\ijpeg.exe-arm-2011-09-24-arm-2011-09-24\000057\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\ijpeg.exe-arm-2011-09-24-arm-2011-09-24\000065\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\ijpeg.exe-arm-2011-09-24-arm-2011-09-24\000066\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\ijpeg.exe-arm-2011-09-24-arm-2011-09-24\000075\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\ijpeg.exe-arm-2011-09-24-arm-2011-09-24\000097\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\ijpeg.exe-arm-2011-09-24-arm-2011-09-24\000108\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\ijpeg.exe-arm-2011-09-24-arm-2011-09-24\000147\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\ijpeg.exe-arm-2011-09-24-arm-2011-09-24\000151\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\ijpeg.exe-arm-2011-09-24-arm-2011-09-24\000165\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\ijpeg.exe-arm-2011-09-24-arm-2011-09-24\000166\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\ijpeg.exe-arm-2011-09-24-arm-2011-09-24\000169\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\ijpeg.exe-arm-2011-09-24-arm-2011-09-24\000218\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\ijpeg.exe-arm-2011-09-24-arm-2011-09-24\000222\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\ijpeg.exe-arm-2011-09-24-arm-2011-09-24\000239\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\Microsoft.VisualBasic.dll-arm-2011-09-24-arm-2011-09-24\000005\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\Microsoft.VisualBasic.dll-arm-2011-09-24-arm-2011-09-24\000034\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\Microsoft.VisualBasic.dll-arm-2011-09-24-arm-2011-09-24\000035\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\Microsoft.VisualBasic.dll-arm-2011-09-24-arm-2011-09-24\000109\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\Microsoft.VisualBasic.dll-arm-2011-09-24-arm-2011-09-24\000127\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\Microsoft.VisualBasic.dll-arm-2011-09-24-arm-2011-09-24\000141\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\Microsoft.VisualBasic.dll-arm-2011-09-24-arm-2011-09-24\000205\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\Microsoft.VisualBasic.dll-arm-2011-09-24-arm-2011-09-24\000218\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\Microsoft.VisualBasic.dll-arm-2011-09-24-arm-2011-09-24\000220\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\Microsoft.VisualBasic.dll-arm-2011-09-24-arm-2011-09-24\000229\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\Microsoft.VisualBasic.dll-arm-2011-09-24-arm-2011-09-24\000237\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\Microsoft.VisualBasic.dll-arm-2011-09-24-arm-2011-09-24\000238\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\Microsoft.VisualBasic.dll-arm-2011-09-24-arm-2011-09-24\000242\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\Microsoft.VisualBasic.dll-arm-2011-09-24-arm-2011-09-24\000261\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\Microsoft.VisualBasic.dll-arm-2011-09-24-arm-2011-09-24\000343\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\Microsoft.VisualBasic.dll-arm-2011-09-24-arm-2011-09-24\000387\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\Microsoft.VisualBasic.dll-arm-2011-09-24-arm-2011-09-24\000401\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\Microsoft.VisualBasic.dll-arm-2011-09-24-arm-2011-09-24\000421\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\Microsoft.VisualBasic.dll-arm-2011-09-24-arm-2011-09-24\000434\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\Microsoft.VisualBasic.dll-arm-2011-09-24-arm-2011-09-24\000443\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\Microsoft.VisualBasic.dll-arm-2011-09-24-arm-2011-09-24\000464\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\Microsoft.VisualBasic.dll-arm-2011-09-24-arm-2011-09-24\000469\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\Microsoft.VisualBasic.dll-arm-2011-09-24-arm-2011-09-24\000474\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\Microsoft.VisualBasic.dll-arm-2011-09-24-arm-2011-09-24\000478\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\Microsoft.VisualBasic.dll-arm-2011-09-24-arm-2011-09-24\000488\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\Microsoft.VisualBasic.dll-arm-2011-09-24-arm-2011-09-24\000593\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\Microsoft.VisualBasic.dll-arm-2011-09-24-arm-2011-09-24\000668\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\Microsoft.VisualBasic.dll-arm-2011-09-24-arm-2011-09-24\000715\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\Microsoft.VisualBasic.dll-arm-2011-09-24-arm-2011-09-24\000722\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\Microsoft.VisualBasic.dll-arm-2011-09-24-arm-2011-09-24\000753\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\Microsoft.VisualBasic.dll-arm-2011-09-24-arm-2011-09-24\000779\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\Microsoft.VisualBasic.dll-arm-2011-09-24-arm-2011-09-24\000834\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\Microsoft.VisualBasic.dll-arm-2011-09-24-arm-2011-09-24\000842\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\Microsoft.VisualBasic.dll-arm-2011-09-24-arm-2011-09-24\000850\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\Microsoft.VisualBasic.dll-arm-2011-09-24-arm-2011-09-24\000864\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\Microsoft.VisualBasic.dll-arm-2011-09-24-arm-2011-09-24\000873\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\sat_solver.exe-arm-2011-09-24-arm-2011-09-24\000008\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\sat_solver.exe-arm-2011-09-24-arm-2011-09-24\000022\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\sat_solver.exe-arm-2011-09-24-arm-2011-09-24\000036\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\sat_solver.exe-arm-2011-09-24-arm-2011-09-24\000053\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\sat_solver.exe-arm-2011-09-24-arm-2011-09-24\000080\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\sat_solver.exe-arm-2011-09-24-arm-2011-09-24\000085\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\sat_solver.exe-arm-2011-09-24-arm-2011-09-24\000167\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\sat_solver.exe-arm-2011-09-24-arm-2011-09-24\000181\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\sat_solver.exe-arm-2011-09-24-arm-2011-09-24\000184\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\sat_solver.exe-arm-2011-09-24-arm-2011-09-24\000186\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\sat_solver.exe-arm-2011-09-24-arm-2011-09-24\000207\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\sat_solver.exe-arm-2011-09-24-arm-2011-09-24\000219\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\sat_solver.exe-arm-2011-09-24-arm-2011-09-24\000223\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\sat_solver.exe-arm-2011-09-24-arm-2011-09-24\000224\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\sat_solver.exe-arm-2011-09-24-arm-2011-09-24\000233\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\System.Core.dll-arm-2011-09-24-arm-2011-09-24\000484\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\System.Core.dll-arm-2011-09-24-arm-2011-09-24\000657\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\System.Core.dll-arm-2011-09-24-arm-2011-09-24\000715\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\System.Core.dll-arm-2011-09-24-arm-2011-09-24\001057\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\System.Core.dll-arm-2011-09-24-arm-2011-09-24\001216\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\System.Core.dll-arm-2011-09-24-arm-2011-09-24\001218\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\System.Core.dll-arm-2011-09-24-arm-2011-09-24\001244\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\System.Core.dll-arm-2011-09-24-arm-2011-09-24\001345\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\System.Core.dll-arm-2011-09-24-arm-2011-09-24\001495\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\System.Core.dll-arm-2011-09-24-arm-2011-09-24\001704\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\System.Core.dll-arm-2011-09-24-arm-2011-09-24\001736\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\System.Core.dll-arm-2011-09-24-arm-2011-09-24\002649\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\System.Core.dll-arm-2011-09-24-arm-2011-09-24\002898\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\system.dll-arm-2011-09-24-arm-2011-09-24\000012\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\system.dll-arm-2011-09-24-arm-2011-09-24\000016\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\system.dll-arm-2011-09-24-arm-2011-09-24\000019\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\system.dll-arm-2011-09-24-arm-2011-09-24\000034\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\system.dll-arm-2011-09-24-arm-2011-09-24\000059\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\system.dll-arm-2011-09-24-arm-2011-09-24\000069\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\system.dll-arm-2011-09-24-arm-2011-09-24\000082\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\system.dll-arm-2011-09-24-arm-2011-09-24\000088\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\system.dll-arm-2011-09-24-arm-2011-09-24\000106\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\system.dll-arm-2011-09-24-arm-2011-09-24\000107\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\system.dll-arm-2011-09-24-arm-2011-09-24\000144\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\system.dll-arm-2011-09-24-arm-2011-09-24\000148\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\system.dll-arm-2011-09-24-arm-2011-09-24\000152\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\system.dll-arm-2011-09-24-arm-2011-09-24\000159\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\system.dll-arm-2011-09-24-arm-2011-09-24\000218\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\system.dll-arm-2011-09-24-arm-2011-09-24\000258\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\system.dll-arm-2011-09-24-arm-2011-09-24\000286\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\system.dll-arm-2011-09-24-arm-2011-09-24\000290\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\system.dll-arm-2011-09-24-arm-2011-09-24\000351\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\system.dll-arm-2011-09-24-arm-2011-09-24\000366\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\system.dll-arm-2011-09-24-arm-2011-09-24\000427\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\system.dll-arm-2011-09-24-arm-2011-09-24\000439\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\system.dll-arm-2011-09-24-arm-2011-09-24\000683\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\system.dll-arm-2011-09-24-arm-2011-09-24\000739\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\system.dll-arm-2011-09-24-arm-2011-09-24\000741\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\system.dll-arm-2011-09-24-arm-2011-09-24\000792\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\System.Net.dll-arm-2011-09-24-arm-2011-09-24\000076\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\System.Net.dll-arm-2011-09-24-arm-2011-09-24\000101\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\System.Net.dll-arm-2011-09-24-arm-2011-09-24\000247\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\System.Net.dll-arm-2011-09-24-arm-2011-09-24\000307\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\System.Net.dll-arm-2011-09-24-arm-2011-09-24\000614\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\System.Net.dll-arm-2011-09-24-arm-2011-09-24\000619\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\System.Net.dll-arm-2011-09-24-arm-2011-09-24\000650\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\System.Net.dll-arm-2011-09-24-arm-2011-09-24\000708\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\System.Net.dll-arm-2011-09-24-arm-2011-09-24\000881\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\System.Net.dll-arm-2011-09-24-arm-2011-09-24\000930\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\System.Net.dll-arm-2011-09-24-arm-2011-09-24\000943\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\System.Net.dll-arm-2011-09-24-arm-2011-09-24\001011\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\System.Runtime.Serialization.dll-arm-2011-09-24-arm-2011-09-24\000081\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\System.Runtime.Serialization.dll-arm-2011-09-24-arm-2011-09-24\000091\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\System.Runtime.Serialization.dll-arm-2011-09-24-arm-2011-09-24\000152\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\System.Runtime.Serialization.dll-arm-2011-09-24-arm-2011-09-24\000286\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\System.Runtime.Serialization.dll-arm-2011-09-24-arm-2011-09-24\000823\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\System.Runtime.Serialization.dll-arm-2011-09-24-arm-2011-09-24\000926\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\System.Runtime.Serialization.dll-arm-2011-09-24-arm-2011-09-24\001017\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\System.Runtime.Serialization.dll-arm-2011-09-24-arm-2011-09-24\001041\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\System.Runtime.Serialization.dll-arm-2011-09-24-arm-2011-09-24\001043\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\System.Runtime.Serialization.dll-arm-2011-09-24-arm-2011-09-24\001050\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\System.Runtime.Serialization.dll-arm-2011-09-24-arm-2011-09-24\001143\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\System.Runtime.Serialization.dll-arm-2011-09-24-arm-2011-09-24\001213\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\System.Runtime.Serialization.dll-arm-2011-09-24-arm-2011-09-24\002165\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\System.Runtime.Serialization.dll-arm-2011-09-24-arm-2011-09-24\002333\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\System.Runtime.Serialization.dll-arm-2011-09-24-arm-2011-09-24\002431\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\System.Runtime.Serialization.dll-arm-2011-09-24-arm-2011-09-24\002487\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\System.Runtime.Serialization.dll-arm-2011-09-24-arm-2011-09-24\002498\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\System.Runtime.Serialization.dll-arm-2011-09-24-arm-2011-09-24\002730\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\System.ServiceModel.dll-arm-2011-09-24-arm-2011-09-24\000130\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\System.ServiceModel.dll-arm-2011-09-24-arm-2011-09-24\000743\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\System.ServiceModel.dll-arm-2011-09-24-arm-2011-09-24\001200\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\System.ServiceModel.dll-arm-2011-09-24-arm-2011-09-24\002145\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\System.ServiceModel.dll-arm-2011-09-24-arm-2011-09-24\002199\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\System.ServiceModel.dll-arm-2011-09-24-arm-2011-09-24\002397\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\System.ServiceModel.dll-arm-2011-09-24-arm-2011-09-24\002465\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\System.ServiceModel.dll-arm-2011-09-24-arm-2011-09-24\002726\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\System.ServiceModel.dll-arm-2011-09-24-arm-2011-09-24\002811\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\System.ServiceModel.Web.dll-arm-2011-09-24-arm-2011-09-24\000005\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\System.ServiceModel.Web.dll-arm-2011-09-24-arm-2011-09-24\000006\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\System.ServiceModel.Web.dll-arm-2011-09-24-arm-2011-09-24\000009\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\System.ServiceModel.Web.dll-arm-2011-09-24-arm-2011-09-24\000014\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\System.ServiceModel.Web.dll-arm-2011-09-24-arm-2011-09-24\000024\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\System.ServiceModel.Web.dll-arm-2011-09-24-arm-2011-09-24\000025\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\System.ServiceModel.Web.dll-arm-2011-09-24-arm-2011-09-24\000033\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\System.ServiceModel.Web.dll-arm-2011-09-24-arm-2011-09-24\000035\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\System.ServiceModel.Web.dll-arm-2011-09-24-arm-2011-09-24\000037\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\System.ServiceModel.Web.dll-arm-2011-09-24-arm-2011-09-24\000045\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\System.ServiceModel.Web.dll-arm-2011-09-24-arm-2011-09-24\000052\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\System.ServiceModel.Web.dll-arm-2011-09-24-arm-2011-09-24\000064\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\System.ServiceModel.Web.dll-arm-2011-09-24-arm-2011-09-24\000078\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\System.ServiceModel.Web.dll-arm-2011-09-24-arm-2011-09-24\000088\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\System.ServiceModel.Web.dll-arm-2011-09-24-arm-2011-09-24\000091\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\System.ServiceModel.Web.dll-arm-2011-09-24-arm-2011-09-24\000096\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\System.ServiceModel.Web.dll-arm-2011-09-24-arm-2011-09-24\000102\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\System.ServiceModel.Web.dll-arm-2011-09-24-arm-2011-09-24\000103\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\System.ServiceModel.Web.dll-arm-2011-09-24-arm-2011-09-24\000104\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\System.ServiceModel.Web.dll-arm-2011-09-24-arm-2011-09-24\000105\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\System.ServiceModel.Web.dll-arm-2011-09-24-arm-2011-09-24\000108\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\System.ServiceModel.Web.dll-arm-2011-09-24-arm-2011-09-24\000113\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\System.ServiceModel.Web.dll-arm-2011-09-24-arm-2011-09-24\000118\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\System.ServiceModel.Web.dll-arm-2011-09-24-arm-2011-09-24\000120\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\System.ServiceModel.Web.dll-arm-2011-09-24-arm-2011-09-24\000132\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\System.ServiceModel.Web.dll-arm-2011-09-24-arm-2011-09-24\000146\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\System.ServiceModel.Web.dll-arm-2011-09-24-arm-2011-09-24\000151\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\System.ServiceModel.Web.dll-arm-2011-09-24-arm-2011-09-24\000152\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\System.Windows.Browser.dll-arm-2011-09-24-arm-2011-09-24\000006\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\System.Windows.Browser.dll-arm-2011-09-24-arm-2011-09-24\000009\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\System.Windows.Browser.dll-arm-2011-09-24-arm-2011-09-24\000065\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\System.Windows.Browser.dll-arm-2011-09-24-arm-2011-09-24\000096\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\System.Windows.Browser.dll-arm-2011-09-24-arm-2011-09-24\000099\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\System.Windows.Browser.dll-arm-2011-09-24-arm-2011-09-24\000110\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\System.Windows.Browser.dll-arm-2011-09-24-arm-2011-09-24\000111\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\System.Windows.Browser.dll-arm-2011-09-24-arm-2011-09-24\000143\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\System.Windows.Browser.dll-arm-2011-09-24-arm-2011-09-24\000145\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\System.Windows.Browser.dll-arm-2011-09-24-arm-2011-09-24\000191\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\System.Windows.Browser.dll-arm-2011-09-24-arm-2011-09-24\000201\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\System.Windows.Browser.dll-arm-2011-09-24-arm-2011-09-24\000227\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\System.Windows.Browser.dll-arm-2011-09-24-arm-2011-09-24\000229\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\System.Windows.Browser.dll-arm-2011-09-24-arm-2011-09-24\000243\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\System.Windows.Browser.dll-arm-2011-09-24-arm-2011-09-24\000317\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\System.Windows.Browser.dll-arm-2011-09-24-arm-2011-09-24\000323\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\System.Windows.Browser.dll-arm-2011-09-24-arm-2011-09-24\000336\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\System.Windows.Browser.dll-arm-2011-09-24-arm-2011-09-24\000340\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\System.Windows.Browser.dll-arm-2011-09-24-arm-2011-09-24\000372\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\System.Windows.Browser.dll-arm-2011-09-24-arm-2011-09-24\000389\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\System.Windows.Browser.dll-arm-2011-09-24-arm-2011-09-24\000393\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\System.Windows.Browser.dll-arm-2011-09-24-arm-2011-09-24\000397\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\System.Windows.dll-arm-2011-09-24-arm-2011-09-24\000364\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\System.Windows.dll-arm-2011-09-24-arm-2011-09-24\000785\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\System.Windows.dll-arm-2011-09-24-arm-2011-09-24\002713\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\System.Windows.dll-arm-2011-09-24-arm-2011-09-24\003304\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\System.Windows.dll-arm-2011-09-24-arm-2011-09-24\003480\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\System.Windows.dll-arm-2011-09-24-arm-2011-09-24\003680\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\System.Windows.dll-arm-2011-09-24-arm-2011-09-24\003729\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\System.Windows.dll-arm-2011-09-24-arm-2011-09-24\004447\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\System.Windows.dll-arm-2011-09-24-arm-2011-09-24\004937\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\System.Windows.dll-arm-2011-09-24-arm-2011-09-24\005190\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\System.Windows.dll-arm-2011-09-24-arm-2011-09-24\006783\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\System.Windows.dll-arm-2011-09-24-arm-2011-09-24\006885\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\System.Windows.dll-arm-2011-09-24-arm-2011-09-24\007577\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\System.Windows.dll-arm-2011-09-24-arm-2011-09-24\007674\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\System.Xml.dll-arm-2011-09-24-arm-2011-09-24\000099\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\System.Xml.dll-arm-2011-09-24-arm-2011-09-24\000143\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\System.Xml.dll-arm-2011-09-24-arm-2011-09-24\000205\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\System.Xml.dll-arm-2011-09-24-arm-2011-09-24\000296\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\System.Xml.dll-arm-2011-09-24-arm-2011-09-24\000311\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\System.Xml.dll-arm-2011-09-24-arm-2011-09-24\000372\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\System.Xml.dll-arm-2011-09-24-arm-2011-09-24\000519\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\System.Xml.dll-arm-2011-09-24-arm-2011-09-24\000602\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\System.Xml.dll-arm-2011-09-24-arm-2011-09-24\000643\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\System.Xml.dll-arm-2011-09-24-arm-2011-09-24\000755\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\System.Xml.dll-arm-2011-09-24-arm-2011-09-24\000979\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\System.Xml.dll-arm-2011-09-24-arm-2011-09-24\001024\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\System.Xml.dll-arm-2011-09-24-arm-2011-09-24\001142\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\System.Xml.dll-arm-2011-09-24-arm-2011-09-24\001262\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\System.Xml.dll-arm-2011-09-24-arm-2011-09-24\001478\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\System.Xml.dll-arm-2011-09-24-arm-2011-09-24\001482\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\System.Xml.dll-arm-2011-09-24-arm-2011-09-24\001486\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\System.Xml.dll-arm-2011-09-24-arm-2011-09-24\001717\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\xlisp.exe-arm-2011-09-24-arm-2011-09-24\000009\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\xlisp.exe-arm-2011-09-24-arm-2011-09-24\000012\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\xlisp.exe-arm-2011-09-24-arm-2011-09-24\000036\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\xlisp.exe-arm-2011-09-24-arm-2011-09-24\000049\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\xlisp.exe-arm-2011-09-24-arm-2011-09-24\000078\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\xlisp.exe-arm-2011-09-24-arm-2011-09-24\000107\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\xlisp.exe-arm-2011-09-24-arm-2011-09-24\000120\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\xlisp.exe-arm-2011-09-24-arm-2011-09-24\000139\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\xlisp.exe-arm-2011-09-24-arm-2011-09-24\000145\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\xlisp.exe-arm-2011-09-24-arm-2011-09-24\000154\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\xlisp.exe-arm-2011-09-24-arm-2011-09-24\000155\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\xlisp.exe-arm-2011-09-24-arm-2011-09-24\000170\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\xlisp.exe-arm-2011-09-24-arm-2011-09-24\000195\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\xlisp.exe-arm-2011-09-24-arm-2011-09-24\000201\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\xlisp.exe-arm-2011-09-24-arm-2011-09-24\000213\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\xlisp.exe-arm-2011-09-24-arm-2011-09-24\000219\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\xlisp.exe-arm-2011-09-24-arm-2011-09-24\000335\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\xlisp.exe-arm-2011-09-24-arm-2011-09-24\000419\"
                ,@"benchmarks\clr_benchmarks\test-armopt3\xlisp.exe-arm-2011-09-24-arm-2011-09-24\000539\"
            };

            var options = new List<Tuple<string, string>>()
            {
                Tuple.Create(@" /equalityFixes+ /trivialFilter- /parallelFilter- /literalFilter- /arithmeticFilter- /applyLeftFilter+ /applyRightFilter+ /loadFilter+ /demonizeUninterpreted+ /constrainLeftPath+ /findEarliestMapUpdateMismatch /binarySearch /verbose:1", "filter1")
                ,Tuple.Create(@" /equalityFixes+ /trivialFilter- /singleFilter- /literalFilter- /arithmeticFilter- /applyLeftFilter+ /applyRightFilter+ /storeFilter+ /passingTestFilter- /demonizeUninterpreted+ /constrainLeftPath+ /findEarliestMapUpdateMismatch /binarySearch /verbose:1", "filter2")
                ,Tuple.Create(@" /equalityFixes+ /trivialFilter- /parallelFilter- /literalFilter- /arithmeticFilter- /applyLeftFilter+ /applyRightFilter+ /calleeFilter+ /demonizeUninterpreted+ /constrainLeftPath+ /findEarliestMapUpdateMismatch /binarySearch /verbose:1", "filter3")
                //,Tuple.Create(@" /equalityFixes+ /trivialFilter- /singleFilter- /literalFilter- /arithmeticFilter- /applyLeftFilter+ /applyRightFilter+ /passingTestFilter- /demonizeUninterpreted+ /constrainLeftPath+ /findEarliestMapUpdateMismatch /binarySearch /verbose:1 /test /stats", "filter4")
                //,Tuple.Create(@" /equalityFixes+ /trivialFilter- /literalFilter- /arithmeticFilter- /applyLeftFilter+ /applyRightFilter+ /passingTestFilter- /demonizeUninterpreted+ /constrainLeftPath+ /findEarliestMapUpdateMismatch /binarySearch /verbose:1 /stats", "filter4")
            };

            //cross product
            return dirs.SelectMany(x => options, (x, y) => Tuple.Create(Tuple.Create(x, bplFile, htmlFile), y)).ToList();
        }
        public static List<Tuple<Tuple<string, string, string>, Tuple<string, string>>> CollectMDILBenchmarks()
        {

            var bplFile = @"EQ__x.p___y.p_out.bpl";
            var htmlFile = @"EQ__x.p___y.p_cex_1_out.analyze";

            var dirs = new List<string>()  {
                 @"benchmarks\clr_benchmarks\bin-mdil-tree\AngryBirds\001326\"
                ,@"benchmarks\clr_benchmarks\bin-mdil-tree\AngryBirds\001440\"
                ,@"benchmarks\clr_benchmarks\bin-mdil-tree\AngryBirds\001441\"
                ,@"benchmarks\clr_benchmarks\bin-mdil-tree\AngryBirds\001923\"
                ,@"benchmarks\clr_benchmarks\bin-mdil-tree\audiotools\000076\"
                ,@"benchmarks\clr_benchmarks\bin-mdil-tree\audiotools\000274\"
                ,@"benchmarks\clr_benchmarks\bin-mdil-tree\BasicSpanishForDummies\000015\"
                ,@"benchmarks\clr_benchmarks\bin-mdil-tree\BasicSpanishForDummies\000043\"
                ,@"benchmarks\clr_benchmarks\bin-mdil-tree\BasicSpanishForDummies\000045\"
                ,@"benchmarks\clr_benchmarks\bin-mdil-tree\BasicSpanishForDummies\000130\"
                ,@"benchmarks\clr_benchmarks\bin-mdil-tree\BasicSpanishForDummies\000133\"
                ,@"benchmarks\clr_benchmarks\bin-mdil-tree\BasicSpanishForDummies\000161\"
                ,@"benchmarks\clr_benchmarks\bin-mdil-tree\BasicSpanishForDummies\000248\"
                ,@"benchmarks\clr_benchmarks\bin-mdil-tree\FlipKart\001194\"
                ,@"benchmarks\clr_benchmarks\bin-mdil-tree\FlipKart\001430\"
                ,@"benchmarks\clr_benchmarks\bin-mdil-tree\FlipKart\001563\"
                ,@"benchmarks\clr_benchmarks\bin-mdil-tree\FML\000001\"
                ,@"benchmarks\clr_benchmarks\bin-mdil-tree\FML\000002\"
                ,@"benchmarks\clr_benchmarks\bin-mdil-tree\FML\000003\"
                ,@"benchmarks\clr_benchmarks\bin-mdil-tree\FML\000005\"
                ,@"benchmarks\clr_benchmarks\bin-mdil-tree\FML\000014\"
                ,@"benchmarks\clr_benchmarks\bin-mdil-tree\FML\000034\"
                ,@"benchmarks\clr_benchmarks\bin-mdil-tree\FML\000035\"
                ,@"benchmarks\clr_benchmarks\bin-mdil-tree\Jaina\000026\"
                ,@"benchmarks\clr_benchmarks\bin-mdil-tree\Jaina\000027\"
                ,@"benchmarks\clr_benchmarks\bin-mdil-tree\Jaina\000045\"
                ,@"benchmarks\clr_benchmarks\bin-mdil-tree\Jaina\000046\"
                ,@"benchmarks\clr_benchmarks\bin-mdil-tree\Jaina\000068\"
                ,@"benchmarks\clr_benchmarks\bin-mdil-tree\PP7\000420\"
                ,@"benchmarks\clr_benchmarks\bin-mdil-tree\PP7\000972\"
                ,@"benchmarks\clr_benchmarks\bin-mdil-tree\PP7\001446\"
                ,@"benchmarks\clr_benchmarks\bin-mdil-tree\PP7\001619\"
                ,@"benchmarks\clr_benchmarks\bin-mdil-tree\PP7\001965\"
                ,@"benchmarks\clr_benchmarks\bin-mdil-tree\Tetris\001069\"
                ,@"benchmarks\clr_benchmarks\bin-mdil-tree\Tetris\003532\"
                ,@"benchmarks\clr_benchmarks\bin-mdil-tree\Tetris\006089\"
                ,@"benchmarks\clr_benchmarks\bin-mdil-tree\UGTabs\000046\"
                ,@"benchmarks\clr_benchmarks\bin-mdil-tree\UGTabs\000171\"
                ,@"benchmarks\clr_benchmarks\bin-mdil-tree\UGTabs\000180\"
                ,@"benchmarks\clr_benchmarks\bin-mdil-tree\UGTabs\000262\"
                ,@"benchmarks\clr_benchmarks\bin-mdil-tree\UGTabs\000270\"
                ,@"benchmarks\clr_benchmarks\bin-mdil-tree\UGTabs\000426\"
                ,@"benchmarks\clr_benchmarks\bin-mdil-tree\UGTabs\000637\"
                ,@"benchmarks\clr_benchmarks\bin-mdil-tree\UGTabs\000808\"
                ,@"benchmarks\clr_benchmarks\bin-mdil-tree\UGTabs\000903\"
                ,@"benchmarks\clr_benchmarks\bin-mdil-tree\UGTabs\000924\"
                ,@"benchmarks\clr_benchmarks\bin-mdil-tree\UGTabs\000954\"
            };
            //Don't use /passingFilter, we don't know how to get good passing runs at the moment for compilers
            var options = new List<Tuple<string, string>>()
            {
                //////////////////////////
                //Options
                //////////////////////////
                  //---- stats 
                Tuple.Create(@" /stats /equalityFixes+ /trivialFilter- /parallelFilter- /literalFilter- /arithmeticFilter- /applyLeftFilter+ /applyRightFilter+ /verbose:1", "stats") 

                //---- callee filters   
                ,Tuple.Create(@" /equalityFixes+ /trivialFilter- /parallelFilter- /literalFilter- /arithmeticFilter- /applyLeftFilter+ /applyRightFilter+ /calleeFilter+ /constrainLeftPath+ /binarySearch  /findEarliestAssertionByMapMismatch /verbose:2", "calleeLeftPathEarliestAssert")  
                ,Tuple.Create(@" /equalityFixes+ /trivialFilter- /parallelFilter- /literalFilter- /arithmeticFilter- /applyLeftFilter+ /applyRightFilter+ /calleeFilter+ /constrainLeftPath+ /binarySearch  /findEarliestAssertionByMapMismatch /verbose:2 /disableMaxsat", "calleeLeftPathEarliestAssertNoMaxsatNoPassingTests")  
                ,Tuple.Create(@" /equalityFixes+ /trivialFilter- /parallelFilter- /literalFilter- /arithmeticFilter- /applyLeftFilter+ /applyRightFilter+ /calleeFilter+ /constrainLeftPath+  /findEarliestAssertionByMapMismatch /verbose:2", "calleeLeftPathEarliestAssertNoBinarySearch")  

                //---- load filter              
                ,Tuple.Create(@" /equalityFixes+ /trivialFilter- /parallelFilter- /literalFilter- /arithmeticFilter- /applyLeftFilter+ /applyRightFilter+ /loadFilter+ /constrainLeftPath+ /binarySearch  /findEarliestAssertionByMapMismatch /verbose:2", "loadLeftPathEarliestAssert")  
                ,Tuple.Create(@" /equalityFixes+ /trivialFilter- /parallelFilter- /literalFilter- /arithmeticFilter- /applyLeftFilter+ /applyRightFilter+ /loadFilter+ /constrainLeftPath+ /binarySearch  /findEarliestAssertionByMapMismatch /verbose:2 /disableMaxsat", "loadLeftPathEarliestAssertNoMaxsatNoPassingTests")  
                ,Tuple.Create(@" /equalityFixes+ /trivialFilter- /parallelFilter- /literalFilter- /arithmeticFilter- /applyLeftFilter+ /applyRightFilter+ /loadFilter+ /constrainLeftPath+ /findEarliestAssertionByMapMismatch /verbose:2", "loadLeftPathEarliestAssertNoBinarySearch")  

                //---- immediate filter  
                ,Tuple.Create(@" /equalityFixes+ /trivialFilter- /parallelFilter- /literalFilter- /arithmeticFilter- /applyLeftFilter+ /applyRightFilter+ /immediateFilter+ /constrainLeftPath+ /binarySearch  /findEarliestAssertionByMapMismatch /verbose:2", "immediateLeftPathEarliestAssert")  
                ,Tuple.Create(@" /equalityFixes+ /trivialFilter- /parallelFilter- /literalFilter- /arithmeticFilter- /applyLeftFilter+ /applyRightFilter+ /immediateFilter+ /constrainLeftPath+ /binarySearch  /findEarliestAssertionByMapMismatch /verbose:2 /disableMaxsat", "immediateLeftPathEarliestAssertNoMaxsatNoPassingTests")  
                ,Tuple.Create(@" /equalityFixes+ /trivialFilter- /parallelFilter- /literalFilter- /arithmeticFilter- /applyLeftFilter+ /applyRightFilter+ /immediateFilter+ /constrainLeftPath+ /findEarliestAssertionByMapMismatch /verbose:2", "immediateLeftPathEarliestAssertNoBinarySearch")  


                //---- function-align-window filter  
                ,Tuple.Create(@" /equalityFixes+ /trivialFilter- /parallelFilter- /literalFilter- /arithmeticFilter- /applyLeftFilter+ /applyRightFilter+ /callAlignWindow:1 /constrainLeftPath+ /binarySearch  /findEarliestAssertionByMapMismatch /verbose:2", "callAlign1LeftPathEarliestAssert")  
                ,Tuple.Create(@" /equalityFixes+ /trivialFilter- /parallelFilter- /literalFilter- /arithmeticFilter- /applyLeftFilter+ /applyRightFilter+ /callAlignWindow:1 /constrainLeftPath+ /binarySearch  /findEarliestAssertionByMapMismatch /verbose:2 /disableMaxsat", "callAlign1LeftPathEarliestAssertNoMaxsatNoPassingTests")  
                ,Tuple.Create(@" /equalityFixes+ /trivialFilter- /parallelFilter- /literalFilter- /arithmeticFilter- /applyLeftFilter+ /applyRightFilter+ /callAlignWindow:1 /constrainLeftPath+ /findEarliestAssertionByMapMismatch /verbose:2", "callAlign1LeftPathEarliestAssertNoBinarySearch")  

                //---- function-align2-window filter  
                ,Tuple.Create(@" /equalityFixes+ /trivialFilter- /parallelFilter- /literalFilter- /arithmeticFilter- /applyLeftFilter+ /applyRightFilter+ /callAlignWindow:2 /constrainLeftPath+ /binarySearch  /findEarliestAssertionByMapMismatch /verbose:2", "callAlign2LeftPathEarliestAssert")  
                ,Tuple.Create(@" /equalityFixes+ /trivialFilter- /parallelFilter- /literalFilter- /arithmeticFilter- /applyLeftFilter+ /applyRightFilter+ /callAlignWindow:2 /constrainLeftPath+ /binarySearch  /findEarliestAssertionByMapMismatch /verbose:2 /disableMaxsat", "callAlign2LeftPathEarliestAssertNoMaxsatNoPassingTests")  
                ,Tuple.Create(@" /equalityFixes+ /trivialFilter- /parallelFilter- /literalFilter- /arithmeticFilter- /applyLeftFilter+ /applyRightFilter+ /callAlignWindow:2 /constrainLeftPath+ /findEarliestAssertionByMapMismatch /verbose:2", "callAlign2LeftPathEarliestAssertNoBinarySearch")  

                //Earlier filters
                //                //Tuple.Create(@" /equalityFixes+ /trivialFilter- /parallelFilter- /literalFilter- /arithmeticFilter- /applyLeftFilter+ /applyRightFilter+ /loadFilter+ /demonizeUninterpreted+ /constrainLeftPath+ /findEarliestMapUpdateMismatch /binarySearch /verbose:1", "loadFilterLeftPath")                
                //,Tuple.Create(@" /equalityFixes+ /trivialFilter- /parallelFilter- /literalFilter- /arithmeticFilter- /applyLeftFilter+ /applyRightFilter+ /calleeFilter+ /constrainLeftPath+ /binarySearch /verbose:1", "calleeFilterLeftPath")
                //,Tuple.Create(@" /equalityFixes+ /trivialFilter- /parallelFilter- /literalFilter- /arithmeticFilter- /applyLeftFilter+ /applyRightFilter+ /calleeFilter+ /binarySearch /verbose:1", "calleeFilterAll")
                ////,Tuple.Create(@" /equalityFixes+ /trivialFilter- /singleFilter- /literalFilter- /arithmeticFilter- /applyLeftFilter+ /applyRightFilter+ /storeFilter+ /demonizeUninterpreted+ /constrainLeftPath+ /findEarliestMapUpdateMismatch /binarySearch /verbose:1", "storeFilterLeftPath")
                ////,Tuple.Create(@" /equalityFixes+ /trivialFilter- /parallelFilter- /literalFilter- /arithmeticFilter- /applyLeftFilter+ /applyRightFilter+ /calleeFilter+ /demonizeUninterpreted+ /constrainLeftPath+ /findEarliestMapUpdateMismatch /binarySearch /verbose:1", "calleeFilterLeftPath")
                ////---- load filter
                //,Tuple.Create(@" /equalityFixes+ /trivialFilter- /parallelFilter- /literalFilter- /arithmeticFilter- /applyLeftFilter+ /applyRightFilter+ /loadFilter+ /constrainLeftPath+ /binarySearch /verbose:1", "loadFilterLeftPath")
                //,Tuple.Create(@" /equalityFixes+ /trivialFilter- /parallelFilter- /literalFilter- /arithmeticFilter- /applyLeftFilter+ /applyRightFilter+ /loadFilter+ /binarySearch /verbose:1", "loadFilterAll")
                ////,Tuple.Create(@" /equalityFixes+ /trivialFilter- /singleFilter- /literalFilter- /arithmeticFilter- /applyLeftFilter+ /applyRightFilter+ /storeFilter+ /demonizeUninterpreted+ /constrainLeftPath+ /findEarliestMapUpdateMismatch /binarySearch /verbose:1", "storeFilterAll")
                ////,Tuple.Create(@" /equalityFixes+ /trivialFilter- /singleFilter- /literalFilter- /arithmeticFilter- /applyLeftFilter+ /applyRightFilter+ /passingTestFilter- /demonizeUninterpreted+ /constrainLeftPath+ /findEarliestMapUpdateMismatch /binarySearch /verbose:1 /stats", "filter4")
                ////,Tuple.Create(@" /equalityFixes+ /trivialFilter- /literalFilter- /arithmeticFilter- /applyLeftFilter+ /applyRightFilter+ /passingTestFilter- /demonizeUninterpreted+ /constrainLeftPath+ /findEarliestMapUpdateMismatch /binarySearch /verbose:1 /stats", "filter5")
                ////---- immediate filter
                //,Tuple.Create(@"  /equalityFixes+ /trivialFilter- /literalFilter- /arithmeticFilter- /applyLeftFilter+ /applyRightFilter+ /immediateFilter+ /constrainLeftPath+ /binarySearch /verbose:1", "immFilterLeftPath")
                //,Tuple.Create(@"  /equalityFixes+ /trivialFilter- /literalFilter- /arithmeticFilter- /applyLeftFilter+ /applyRightFilter+ /immediateFilter+ /binarySearch /verbose:1", "immFilterAll")
                ////----- store filter
                //,Tuple.Create(@"  /equalityFixes+ /trivialFilter- /literalFilter- /arithmeticFilter- /applyLeftFilter+ /applyRightFilter+ /storeFilter+ /constrainLeftPath+ /binarySearch /verbose:1", "immFilterLeftPath")
                //,Tuple.Create(@"  /equalityFixes+ /trivialFilter- /literalFilter- /arithmeticFilter- /applyLeftFilter+ /applyRightFilter+ /storeFilter+ /binarySearch /verbose:1", "immFilterAll")
                ////---- function-align-window filter

            };

            //cross product
            return dirs.SelectMany(x => options, (x, y) => Tuple.Create(Tuple.Create(x, bplFile, htmlFile), y)).ToList();
        }

        public static List<Tuple<Tuple<string, string, string>, Tuple<string, string>>> CollectSampleBenchmarks()
        {
            var bplFile = @"EQ__x.p___y.p_out.bpl";
            var htmlFile = @"EQ__x.p___y.p_cex_1_out.analyze";
            var s = @"\";

            var dirs = new List<string>()  {
                 @"benchmarks"+s+"clr_benchmarks"+s+"test-x86opt2"+s+"System.Runtime.Serialization.dll-x86-2011-09-24-x86-2011-09-24"+s+"000926"
                ,@"benchmarks"+s+"clr_benchmarks"+s+"test-x86opt2"+s+"System.Runtime.Serialization.dll-x86-2011-09-24-x86-2011-09-24"+s+"002504"
                ,@"benchmarks"+s+"clr_benchmarks"+s+"test-x86opt2"+s+"System.Runtime.Serialization.dll-x86-2011-09-24-x86-2011-09-24"+s+"002491"
                ,@"benchmarks"+s+"clr_benchmarks"+s+"test-x86opt2"+s+"System.Runtime.Serialization.dll-x86-2011-09-24-x86-2011-09-24"+s+"002487"
                ,@"benchmarks"+s+"clr_benchmarks"+s+"test-x86opt2"+s+"System.Core.dll-x86-2011-09-24-x86-2011-09-24"+s+"000635"
                ,@"benchmarks"+s+"clr_benchmarks"+s+"test-x86opt2"+s+"System.Core.dll-x86-2011-09-24-x86-2011-09-24"+s+"000628"
                ,@"benchmarks"+s+"clr_benchmarks"+s+"test-x86opt2"+s+"System.Core.dll-x86-2011-09-24-x86-2011-09-24"+s+"001638"
                ,@"benchmarks"+s+"clr_benchmarks"+s+"test-x86opt2"+s+"System.Core.dll-x86-2011-09-24-x86-2011-09-24"+s+"002652"
                ,@"benchmarks"+s+"clr_benchmarks"+s+"test-x86opt2"+s+"System.Xml.dll-x86-2011-09-24-x86-2011-09-24"+s+"000311"
                ,@"benchmarks"+s+"clr_benchmarks"+s+"test-x86opt2"+s+"System.Xml.dll-x86-2011-09-24-x86-2011-09-24"+s+"000643"
                ,@"benchmarks"+s+"clr_benchmarks"+s+"test-x86opt2"+s+"System.Xml.dll-x86-2011-09-24-x86-2011-09-24"+s+"000372"
                ,@"benchmarks"+s+"clr_benchmarks"+s+"test-x86opt2"+s+"System.Xml.dll-x86-2011-09-24-x86-2011-09-24"+s+"000755"
            };

            var options = new List<Tuple<string, string>>()
            {
                Tuple.Create(@" /stats /equalityFixes+ /trivialFilter- /parallelFilter- /literalFilter- /arithmeticFilter- /applyLeftFilter+ /applyRightFilter+ /verbose:1", "stats")
               ,Tuple.Create(@" /equalityFixes+ /trivialFilter- /parallelFilter- /literalFilter- /arithmeticFilter- /applyLeftFilter+ /applyRightFilter+ /calleeFilter+ /constrainLeftPath+ /findEarliestAssertionByMapMismatch /binarySearch+ /verbose:1", "calleeBM")
               ,Tuple.Create(@" /equalityFixes+ /trivialFilter- /parallelFilter- /literalFilter- /arithmeticFilter- /applyLeftFilter+ /applyRightFilter+ /calleeFilter+ /constrainLeftPath+ /findEarliestAssertionByMapMismatch /verbose:1", "calleeM")
               //,Tuple.Create(@" /equalityFixes+ /trivialFilter- /parallelFilter- /literalFilter- /arithmeticFilter- /applyLeftFilter+ /applyRightFilter+ /calleeFilter+ /constrainLeftPath+ /findEarliestAssertionByMapMismatch /binarySearch /disableMaxsat /verbose:1", "calleeB")
               //,Tuple.Create(@" /equalityFixes+ /trivialFilter- /parallelFilter- /literalFilter- /arithmeticFilter- /applyLeftFilter+ /applyRightFilter+ /callAlignWindow:1 /constrainLeftPath+ /findEarliestAssertionByMapMismatch /binarySearch /verbose:1", "calleeBM")
               //,Tuple.Create(@" /equalityFixes+ /trivialFilter- /parallelFilter- /literalFilter- /arithmeticFilter- /applyLeftFilter+ /applyRightFilter+ /callAlignWindow:1 /constrainLeftPath+ /findEarliestAssertionByMapMismatch /verbose:1", "calleeM")
               //,Tuple.Create(@" /equalityFixes+ /trivialFilter- /parallelFilter- /literalFilter- /arithmeticFilter- /applyLeftFilter+ /applyRightFilter+ /callAlignWindow:1 /constrainLeftPath+ /findEarliestAssertionByMapMismatch /binarySearch /disableMaxsat /verbose:1", "calleeB")
            };

            //cross product
            return dirs.SelectMany(x => options, (x, y) => Tuple.Create(Tuple.Create(x, bplFile, htmlFile), y)).ToList();
        }

        public static List<Tuple<Tuple<string, string, string>, Tuple<string, string>>> CollectTCASBenchmarks()
        {
            //when creating a C directory, its the users job to move the EQ_*.bpl as EQ__x.p___y.p_out.bpl
            //and the html as EQ__x.p___y.p_cex_1_out
            var bplFile = @"EQ__x.p___y.p_out.bpl";
            var htmlFile = @"EQ__x.p___y.p_cex_1_out"; //!!DONT suffix with analyze, its a hint to Rootcause that its not a clr-diff generated html

            var dirs = new List<string>()  {
                           //tcas
                             @"benchmarks\c_benchmarks\siemens\tcas\v1\" //easier to comment if the "," is at start of the line
                           , @"benchmarks\c_benchmarks\siemens\tcas\v2\" //easier to comment if the "," is at start of the line
                           , @"benchmarks\c_benchmarks\siemens\tcas\v3\" //easier to comment if the "," is at start of the line
                           , @"benchmarks\c_benchmarks\siemens\tcas\v4\" //easier to comment if the "," is at start of the line
                           , @"benchmarks\c_benchmarks\siemens\tcas\v5\" //easier to comment if the "," is at start of the line
                           , @"benchmarks\c_benchmarks\siemens\tcas\v6\" //easier to comment if the "," is at start of the line
                           //, @"benchmarks\c_benchmarks\siemens\tcas\v7\" //easier to comment if the "," is at start of the line
                           //, @"benchmarks\c_benchmarks\siemens\tcas\v8\" //easier to comment if the "," is at start of the line
                           //, @"benchmarks\c_benchmarks\siemens\tcas\v9\" //easier to comment if the "," is at start of the line
                           //, @"benchmarks\c_benchmarks\siemens\tcas\v10\" //easier to comment if the "," is at start of the line
                           //, @"benchmarks\c_benchmarks\siemens\tcas\v11\" //easier to comment if the "," is at start of the line
                           , @"benchmarks\c_benchmarks\siemens\tcas\v12\" //easier to comment if the "," is at start of the line
                           , @"benchmarks\c_benchmarks\siemens\tcas\v15\" //easier to comment if the "," is at start of the line
                           , @"benchmarks\c_benchmarks\siemens\tcas\v16\" //easier to comment if the "," is at start of the line
                           , @"benchmarks\c_benchmarks\siemens\tcas\v17\" //easier to comment if the "," is at start of the line
                           , @"benchmarks\c_benchmarks\siemens\tcas\v18\" //easier to comment if the "," is at start of the line
                           , @"benchmarks\c_benchmarks\siemens\tcas\v19\" //easier to comment if the "," is at start of the line
                          // , @"benchmarks\c_benchmarks\siemens\tcas\v20\" //easier to comment if the "," is at start of the line
                           //, @"benchmarks\c_benchmarks\siemens\tcas\v21\" //easier to comment if the "," is at start of the line
                           //, @"benchmarks\c_benchmarks\siemens\tcas\v22\" //easier to comment if the "," is at start of the line
                           //, @"benchmarks\c_benchmarks\siemens\tcas\v23\" //easier to comment if the "," is at start of the line
                           //, @"benchmarks\c_benchmarks\siemens\tcas\v24\" //easier to comment if the "," is at start of the line
                           //, @"benchmarks\c_benchmarks\siemens\tcas\v25\" //easier to comment if the "," is at start of the line
                           //, @"benchmarks\c_benchmarks\siemens\tcas\v26\" //easier to comment if the "," is at start of the line
                           //, @"benchmarks\c_benchmarks\siemens\tcas\v27\" //easier to comment if the "," is at start of the line
                           //, @"benchmarks\c_benchmarks\siemens\tcas\v28\" //easier to comment if the "," is at start of the line
                           //, @"benchmarks\c_benchmarks\siemens\tcas\v29\" //easier to comment if the "," is at start of the line
                           //, @"benchmarks\c_benchmarks\siemens\tcas\v30\" //easier to comment if the "," is at start of the line
                           //, @"benchmarks\c_benchmarks\siemens\tcas\v31\" //easier to comment if the "," is at start of the line
                           //, @"benchmarks\c_benchmarks\siemens\tcas\v32\" //easier to comment if the "," is at start of the line
                           //, @"benchmarks\c_benchmarks\siemens\tcas\v33\" //easier to comment if the "," is at start of the line
                           //, @"benchmarks\c_benchmarks\siemens\tcas\v34\" //easier to comment if the "," is at start of the line
                           //, @"benchmarks\c_benchmarks\siemens\tcas\v35\" //easier to comment if the "," is at start of the line
                           //, @"benchmarks\c_benchmarks\siemens\tcas\v37\" //easier to comment if the "," is at start of the line
                           //, @"benchmarks\c_benchmarks\siemens\tcas\v39\" //easier to comment if the "," is at start of the line
                           //, @"benchmarks\c_benchmarks\siemens\tcas\v40\" //easier to comment if the "," is at start of the line
                           //, @"benchmarks\c_benchmarks\siemens\tcas\v41\" //easier to comment if the "," is at start of the line
                          };

            var options = new List<Tuple<string, string>>()  {
                            //Tuple.Create(@" /equalityFixes+ /liftConditionals /arithmeticFilter- /literalFilter- /trivialFilter- /applyLeftFilter /applyRightFilter /independantFilter- /verbose:1 /maxsatLimit:20 /pruneFailingEqualities", "filter1"),
                            //Tuple.Create(@" /equalityFixes+ /liftConditionals /arithmeticFilter- /literalFilter- /trivialFilter- /applyLeftFilter /applyRightFilter /independantFilter- /verbose:1 /maxsatLimit:20 /constrainLeftPath /pruneFailingEqualities", "filter2"),
                            Tuple.Create(@" /equalityFixes+ /liftConditionals /arithmeticFilter- /literalFilter- /trivialFilter- /applyLeftFilter /applyRightFilter /independantFilter- /verbose:1 /maxsatLimit:20 /constrainLeftPath /pruneFailingEqualities /findEarliestAssertionByMapMismatch", "filter3")
                          };
            //cross product
            return dirs.SelectMany(x => options, (x, y) => Tuple.Create(Tuple.Create(x, bplFile, htmlFile), y)).ToList();
        }
        public static List<Tuple<Tuple<string, string, string>, Tuple<string, string>>> CollectCBenchmarks()
        {
            //when creating a C directory, its the users job to move the EQ_*.bpl as EQ__x.p___y.p_out.bpl
            //and the html as EQ__x.p___y.p_cex_1_out
            var bplFile = @"EQ__x.p___y.p_out.bpl";
            var htmlFile = @"EQ__x.p___y.p_cex_1_out"; //!!DONT suffix with analyze, its a hint to Rootcause that its not a clr-diff generated html

            var dirs = new List<string>()  {
                           //ex3
                            @"benchmarks\c_benchmarks\ex3\"
                           ////tcas
                           //, @"benchmarks\c_benchmarks\siemens\tcas\v1\" //easier to comment if the "," is at start of the line
                           //, @"benchmarks\c_benchmarks\siemens\tcas\v12\" //easier to comment if the "," is at start of the line
                           //, @"benchmarks\c_benchmarks\siemens\tcas\v19\" //easier to comment if the "," is at start of the line
                           ////schedule
                           //, @"benchmarks\c_benchmarks\siemens\schedule\v2\" //easier to comment if the "," is at start of the line
                           //, @"benchmarks\c_benchmarks\siemens\schedule\v5\" //easier to comment if the "," is at start of the line
                           //, @"benchmarks\c_benchmarks\siemens\schedule\v8\" //easier to comment if the "," is at start of the line
                           ////schedule2
                           //, @"benchmarks\c_benchmarks\siemens\schedule2\v1\" //easier to comment if the "," is at start of the line
                           //, @"benchmarks\c_benchmarks\siemens\schedule2\v4\" //easier to comment if the "," is at start of the line
                           //, @"benchmarks\c_benchmarks\siemens\schedule2\v9\" //easier to comment if the "," is at start of the line
                           ////print_tokens
                           //, @"benchmarks\c_benchmarks\siemens\print_tokens\v3\" //easier to comment if the "," is at start of the line
                           //, @"benchmarks\c_benchmarks\siemens\print_tokens\v5\" //easier to comment if the "," is at start of the line
                           ////print_tokens2
                           //, @"benchmarks\c_benchmarks\siemens\print_tokens2\v6\" //easier to comment if the "," is at start of the line
                           //, @"benchmarks\c_benchmarks\siemens\print_tokens2\v9\" //easier to comment if the "," is at start of the line
                           ////replace
                           //, @"benchmarks\c_benchmarks\siemens\replace\v11\" //easier to comment if the "," is at start of the line
                           //, @"benchmarks\c_benchmarks\siemens\replace\v32\" //easier to comment if the "," is at start of the line
                           ////tot_info
                           //, @"benchmarks\c_benchmarks\siemens\tot_info\v18\" //easier to comment if the "," is at start of the line
                           //, @"benchmarks\c_benchmarks\siemens\tot_info\v20\" //easier to comment if the "," is at start of the line
                          };

            var options = new List<Tuple<string, string>>()  {
                            Tuple.Create(@" /equalityFixes+ /conditionalFilter- /liftConditionals /arithmeticFilter- /literalFilter- /trivialFilter- /passingTestFilter- /demonizeUninterpreted /applyLeftFilter /applyRightFilter /independantFilter- /verbose:1 /maxsatLimit:20", "filter2")
                            //,Tuple.Create(@" /equalityFixes+ /conditionalFilter+ /liftConditionals /arithmeticFilter- /literalFilter- /trivialFilter- /passingTestFilter- /demonizeUninterpreted /applyLeftFilter /applyRightFilter /independantFilter- /verbose:1", "filter3")
                            //,Tuple.Create(@" /equalityFixes+ /conditionalFilter+ /liftConditionals /arithmeticFilter- /literalFilter- /trivialFilter- /passingTestFilter- /demonizeUninterpreted /applyLeftFilter /applyRightFilter /independantFilter- /verbose:1 /maxsatLimit:20", "filter4")
                            ,Tuple.Create(@" /equalityFixes+ /conditionalFilter+ /liftConditionals /arithmeticFilter- /literalFilter- /trivialFilter- /passingTestFilter- /demonizeUninterpreted /applyLeftFilter /applyRightFilter /independantFilter- /verbose:1 /maxsatLimit:20", "filter5")
                          };
            //cross product
            return dirs.SelectMany(x => options, (x, y) => Tuple.Create(Tuple.Create(x, bplFile, htmlFile), y)).ToList();
        }

        internal static void CollectBenchmarks(ref List<Tuple<Tuple<string, string, string>, Tuple<string, string>>> inputs)
        {
            inputs.AddRange(Options.CollectSampleBenchmarks());
            //inputs.AddRange(Options.CollectCBenchmarks());
            //inputs.AddRange(Options.CollectX86Opt2Benchmarks());
            //inputs.AddRange(Options.CollectX86Arm3Benchmarks());
            //inputs.AddRange(Options.CollectMDILBenchmarks());
            //inputs.AddRange(Options.CollectTCASBenchmarks());
        }
    }
}
