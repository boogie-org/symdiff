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
        public string HttpUrl { get; set; }

        public List<Tuple<string, string, string>> InterestingShas { get; private set; }

        public RepositoryInfo(string name, string owner, string gitUrl, string HttpUrl)
        {
            this.Name = name;
            this.Owner = owner;
            this.GitUrl = gitUrl;
            this.HttpUrl = HttpUrl;
            this.InterestingShas = new List<Tuple<string, string, string>>();
        }

        public string PrintShas()
        {
            if (InterestingShas.Count == 0)
            {
                return "";
            }
            return InterestingShas.Select(tuple => this.Name + ", " + this.Owner + ", " + GitUrl + ", " + tuple.Item1 + ", " + tuple.Item3 + ", " + this.HttpUrl + "\n").Aggregate((x, y) => x + y);
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

        internal static List<RepositoryInfo> ReadReposFromCommitsFile(string fileName)
        {
            Dictionary<string, RepositoryInfo> result = new Dictionary<string, RepositoryInfo>();

            var lines = File.ReadAllLines(fileName);
            foreach (var repo in lines)
            {
                var r = repo.Split(',');
                if (!result.ContainsKey(r[2].Trim()))
                {
                    result.Add(r[2].Trim(), new RepositoryInfo(r[0].Trim(), r[1].Trim(), r[2].Trim(), r[5].Trim()));
                }
                result[r[2].Trim()].InterestingShas.Add(new Tuple<string, string, string>(r[3].Trim(), "", r[4].Trim()));
            }

            return result.Values.ToList();
        }

        internal static List<RepositoryInfo> ReadReposFromScrappedFile(string fileName)
        {
            List<RepositoryInfo> result = new List<RepositoryInfo>();

            var lines = File.ReadAllLines(fileName);
            foreach (var repo in lines)
            {
                var r = repo.Split(',');                
                result.Add(new RepositoryInfo(r[0].Trim(), r[1].Trim(), r[2].Trim(), r[3].Trim()));                                
            }

            return result;
        }

        public override string ToString()
        {            
            return  this.Name + ", " + this.Owner + ", " + GitUrl + ", " + this.HttpUrl + "\n";
        }

        public override bool Equals(object obj)
        {
            if(obj is RepositoryInfo){
                var r = obj as RepositoryInfo;
                return r.GitUrl.Equals(this.GitUrl) && r.Name.Equals(this.Name) && r.Owner.Equals(this.Owner);
            }
            return false;
        }
    }
}
