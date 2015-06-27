using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Experimental
{
    class Repository
    {
        public string Name { get; set; }
        public string Owner { get; set; }
        public string GitUrl { get; set; }

        public List<Tuple<string, string>> InterestingShas { get; private set; }

        public Repository(string name, string owner, string gitUrl)
        {
            this.Name = name;
            this.Owner = owner;
            this.GitUrl = gitUrl;
            this.InterestingShas = new List<Tuple<string, string>>();
        }

        public override string ToString()
        {
            if (InterestingShas.Count == 0)
            {
                return "";
            }
            return InterestingShas.Select(tuple => GitUrl + "," + tuple.Item1 + "\n").Aggregate((x, y) => x + y);
        }

        public string VerboseInterestingShas()
        {
            if (InterestingShas.Count == 0)
            {
                return "";
            }
            return InterestingShas.Select(tuple => new Tuple<string, string>("##@@## " + GitUrl + "," + tuple.Item1 + " ##@@##\n", tuple.Item2))
                    .Select(tuple => tuple.Item1 + "\n" + tuple.Item2 + "\n" + tuple.Item1)
                    .Aggregate((x, y) => x + y);
        }
    }
}
