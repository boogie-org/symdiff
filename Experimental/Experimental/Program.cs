using CommandLine;
using CommandLine.Text;
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
    class CommandLineOptions
    {
        [Option('i',"interestingRepos", DefaultValue="repos.txt", HelpText="File with repositories and shas to clone.")]
        public string RepositoriesToInitialize { get; set; }
        
        [Option('r', "repos", DefaultValue = @".\setupRepo", HelpText = "Directory to clone repositories.")]
        public string RootToRepo { get; set; }
        
        [Option('s', "setup", DefaultValue = false, HelpText = "Crawl Github for Repos")]
        public bool SetupRepo { get; set; }

        [Option('c', "crawl", DefaultValue=false, HelpText="Crawl Github for Repos")]
        public bool Crawl { get; set; }

        [ParserState]
        public IParserState LastParserState { get; set; }

        [HelpOption]
        public string GetUsage()
        {
            return HelpText.AutoBuild(this,
              (HelpText current) => HelpText.DefaultParsingErrorsHandler(this, current));
        }
    }
    class Program
    {
        public static GitHubClient GitHubClient { get; set; }
        private static CommandLineOptions options;
        
        static void Main(string[] args)
        {
            options = new CommandLineOptions();
            if (CommandLine.Parser.Default.ParseArguments(args, options))
            {
                List<RepositoryInfo> repos = null;
                if (options.Crawl)
                {
                    repos = CrawlGithub();
                }
                if (options.SetupRepo)
                {
                    if (repos == null)
                    {
                        repos= RepositoryInfo.ReadReposFromFile(options.RepositoriesToInitialize);
                    }
                    SetupRepositories(repos);
                }
            }
            
        }

        private static void SetupRepositories(List<RepositoryInfo> repos)
        {
            foreach (var repo in repos)
            {
                foreach (var sha in repo.InterestingShas)
                {
                    new RepositorySetup(options.RootToRepo, repo.GitUrl, repo.Name, sha.Item2).DoWork();
                }
            }

        }

        private static List<RepositoryInfo> CrawlGithub()
        {
            Program.GitHubClient = new GitHubClient(new ProductHeaderValue("experiments_t-algy"));
            InstallCredentials();

            var sc = new SearchRepositoriesRequest();
            sc.Language = Language.C;
            sc.Size = Range.LessThan(200);




            var result = Program.GitHubClient.Search.SearchRepo(sc);
            result.Wait();


            List<RepositoryInfo> repos = new List<RepositoryInfo>();

            foreach (var repo in result.Result.Items)
            {
                try
                {
                    var r = new RepositoryInfo(repo.Name, repo.Owner.Login, repo.GitUrl);
                    repos.Add(r);
                    new RepositoryProcessor(r).Process();
                }
                catch (Exception ex)
                {
                    Console.WriteLine("Exception");
                    Console.WriteLine(ex.Message);
                }
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
            return repos;
        }

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
            if (lines.Length != 1)
            {
                Console.WriteLine("[WARNING] key.txt appears not to conform to the format. We expect a single line containing the key.");
                Console.WriteLine("[WARNING] We will make unauthenticated API requests! Note that this is subject to stricter rate limiting.");
                return;
            }
            var creds = new Credentials(lines[0]);
            Program.GitHubClient.Credentials = creds;
        }
    }
}
