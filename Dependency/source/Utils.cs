using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.Boogie;
using System.IO;

namespace Dependency
{
    class Utils
    {
        public static bool ParseProgram(string fname, out Program prog)
        {
            prog = null;
            int errCount;
            try
            {
                errCount = Parser.Parse(fname, new List<string>(), out prog);
                if (errCount != 0 || prog == null)
                {
                    Console.WriteLine("WARNING: {0} parse errors detected in {1}", errCount, fname);
                    return false;
                }
            }
            catch (IOException e)
            {
                Console.WriteLine("WARNING: Error opening file \"{0}\": {1}", fname, e.Message);
                return false;
            }
            errCount = prog.Resolve();
            if (errCount > 0)
            {
                Console.WriteLine("WARNING: {0} name resolution errors in {1}", errCount, fname);
                return false;
            }
            errCount = prog.Typecheck();
            if (errCount > 0)
            {
                Console.WriteLine("WARNING: {0} type checking errors in {1}", errCount, fname);
                return false;
            }
            return true;
        }

        static public HashSet<Variable> ImplInputsToProcInputs(Implementation impl, HashSet<Variable> vars)
        {
            var result = new HashSet<Variable>();
            foreach (var v in vars)
            {
                if (impl.InParams.Contains(v)) // replace Implemetation inputs with Procedure inputs
                    result.Add(impl.Proc.InParams[impl.InParams.IndexOf(v)]);
                else if (v is GlobalVariable)
                    result.Add(v);
            }
            return result;
        }
        static public Variable ImplOutputToProcOutput(Implementation node, Variable v)
        {
            var index = node.OutParams.IndexOf(v);
            if (index >= 0) // replace Implemetation outputs with Procedure outputs
                return node.Proc.OutParams[index];
            else
                return v; // leave non-outputs as is
        }

        static public void DisplayHTML()
        {

        }

        public class VariableExtractor : StandardVisitor
        {
            public HashSet<Variable> vars = new HashSet<Variable>();
            public override Variable VisitVariable(Variable node)
            {
                vars.Add(node);
                return node;
            }
        }
    }

}
