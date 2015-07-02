using Octokit;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;

namespace Experimental
{
    class Program
    {
        public static GitHubClient GitHubClient { get; set; }

        static void InstallCredentials()
        {
            string path = Path.Combine(Path.GetDirectoryName(Assembly.GetExecutingAssembly().Location), @"..\..\key.txt");
            if (!File.Exists(path))
            {
                Console.WriteLine("[WARNING] key.txt is missing!");
                Console.WriteLine("[WARNING] We will make unauthenticate API requests! Note that this is subject to stricter rate limiting.");
                return;
            }
            string[] lines = File.ReadAllLines(path);
            if(lines.Length != 1) {
                Console.WriteLine("[WARNING] key.txt appears not to conform to the format. We expect a single line containing the key.");
                Console.WriteLine("[WARNING] We will make unauthenticated API requests! Note that this is subject to stricter rate limiting.");
                return;
            }
            var creds = new Credentials(lines[0]);
            Program.GitHubClient.Credentials = creds;            
        }
        static void Main(string[] args)
        {
            Program.GitHubClient = new GitHubClient(new ProductHeaderValue("experiments_t-algy"));
            InstallCredentials();

            var sc = new SearchRepositoriesRequest();
            sc.Language = Language.C;
            sc.Size = Range.LessThan(100);

            
            
            
            var result = Program.GitHubClient.Search.SearchRepo(sc);
            result.Wait();


            List<Repository> repos = new List<Repository>();
            try
            {
                foreach (var repo in result.Result.Items.Take(20))
                {
                    var r = new Repository(repo.Name, repo.Owner.Login, repo.GitUrl);
                    new RepositoryProcessor(r).Process();
                    repos.Add(r);
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine("Exception");
                Console.WriteLine(ex.Message);
            }
            using (System.IO.StreamWriter summary = new System.IO.StreamWriter(@"repos.txt"))
            {
                using (System.IO.StreamWriter details = new System.IO.StreamWriter(@"verbose.txt"))
                {
                    using (System.IO.StreamWriter log = new System.IO.StreamWriter(@"log.txt"))
                    {
                        foreach (var repo in repos)
                        {
                            log.WriteLine(repo.GitUrl);
                            summary.Write(repo.ToString());
                            details.Write(repo.VerboseInterestingShas());
                        }
                    }
                }
            }
        }   
    }
}
