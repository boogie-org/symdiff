using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Experimental
{
    class RepositoryInfo
    {
        public string Name { get; set; }
        public string Owner { get; set; }
        public string GitUrl { get; set; }

        public List<Tuple<string, string>> InterestingShas { get; private set; }

        public RepositoryInfo(string name, string owner, string gitUrl)
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
            return InterestingShas.Select(tuple => this.Name + "," + this.Owner + "," + GitUrl + "," + tuple.Item1 + "\n").Aggregate((x, y) => x + y);
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

        internal static List<RepositoryInfo> ReadReposFromFile(string fileName)
        {
            Dictionary<string, RepositoryInfo> result = new Dictionary<string, RepositoryInfo>();

            var lines = File.ReadAllLines(fileName);
            foreach (var repo in lines)
            {
                var r = repo.Split(',');
                if (!result.ContainsKey(r[2]))
                {
                    result.Add(r[2], new RepositoryInfo(r[0], r[1], r[2]));
                }
                result[r[2]].InterestingShas.Add(new Tuple<string, string>("", r[3]));
            }

            return result.Values.ToList();
        }
    }
}
