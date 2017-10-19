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
        [Option('i', "interestingRepos", DefaultValue = Program.Commits, HelpText = "File with repositories and shas to clone.")]
        public string RepositoriesToInitialize { get; set; }

        [Option('r', "repos", DefaultValue = @".\setupRepo", HelpText = "Directory to clone repositories.")]
        public string RootToRepo { get; set; }

        [Option('s', "setup", DefaultValue = false, HelpText = "Setup repos")]
        public bool SetupRepo { get; set; }

        [Option('c', "crawl", DefaultValue = false, HelpText = "Crawl Github for Repos")]
        public bool Crawl { get; set; }

        [Option('f', "findCommits", DefaultValue = false, HelpText = "Filter Github Commits for Repos")]
        public bool FilterCommits { get; set; }

        [Option('g', "gitRepos", DefaultValue = false, HelpText = "File with git repos to process")]
        public bool GitRepositoriesFile { get; set; }

        [Option('n', "numberToCrawl", DefaultValue = 100, HelpText = "Crawl Github for n Repos")]
        public int NumberOfRepos { get; set; }

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
        public const string Repositories = @"repositories.txt";
        public const string Commits = @"commits_repositories.txt";
        public const string VerboseCommits = @"verbose_commits_repositories.txt";
        public const string Config = @"projects.config";

        public const int ProgramSize = 4000;

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
                    Program.GitHubClient = new GitHubClient(new ProductHeaderValue("experiments_t-algy"));
                    InstallCredentials();
                    repos = CrawlGithub();
                }
                if (options.FilterCommits)
                {
                    Program.GitHubClient = new GitHubClient(new ProductHeaderValue("experiments_t-algy"));
                    GitHubClient.Search.SearchRepo(new SearchRepositoriesRequest());
                    InstallCredentials();
                    
                    repos = RepositoryInfo.ReadReposFromScrappedFile(Program.Repositories);                    

                    ProcessRepos(repos);
                }
                if (options.SetupRepo)
                {
                    if (repos == null)
                    {
                        repos = RepositoryInfo.ReadReposFromCommitsFile(options.RepositoriesToInitialize);
                    }
                    SetupRepositories(repos);
                }
            }

        }

        private static void SetupRepositories(List<RepositoryInfo> repos)
        {
            Directory.CreateDirectory(options.RootToRepo);
            using (var stream = new StreamWriter(Path.Combine(options.RootToRepo, Program.Config)))
            {
                foreach (var repo in repos)
                {
                    foreach (var sha in repo.InterestingShas)
                    {
                        new RepositorySetup(options.RootToRepo, repo.GitUrl, repo.Name, sha.Item1, stream).DoWork();
                    }
                }

            }
        }

        private static List<RepositoryInfo> CrawlGithub()
        {
            File.Delete(Program.VerboseCommits);
            File.Delete(Program.Commits);

            int numOfPages = Convert.ToInt32(Math.Ceiling(options.NumberOfRepos / 100.0));
            int reposLeft = options.NumberOfRepos;
            List<RepositoryInfo> repos = new List<RepositoryInfo>();

            for (int pi = 0; pi < numOfPages; pi++)
            {
                var sc = new SearchRepositoriesRequest();
                sc.Language = Language.C;
                sc.Size = Range.LessThan(Program.ProgramSize);
                sc.Page = pi;

                var result = Program.GitHubClient.Search.SearchRepo(sc);
                result.Wait();

                foreach (var repo in result.Result.Items.Take(reposLeft))
                {
                    var r = new RepositoryInfo(repo.Name, repo.Owner.Login, repo.GitUrl, repo.HtmlUrl);
                    repos.Add(r);                    
                }
                reposLeft -= result.Result.Items.Count;
            }

            PrintRepositories(repos);

            return repos;
        }

        private static void PrintRepositories(List<RepositoryInfo> repos)
        {
            using (System.IO.StreamWriter repositoriesFile = new System.IO.StreamWriter(Program.Repositories, false))
            {
                foreach (var repo in repos)
                {
                    repositoriesFile.Write(repo.ToString());
                }
            }
        }

        public static void ProcessRepos(List<RepositoryInfo> repos)
        {

            foreach (var r in repos)
            {
                try
                {
                    new RepositoryProcessor(r).Process();
                }
                catch (Exception ex)
                {
                    Console.WriteLine("Exception");
                    Console.WriteLine(ex.ToString());
                    Console.WriteLine("Retrying after waiting 60 seconds - mitigating rate limiting.");
                    try
                    {
                        System.Threading.Thread.Sleep(3600000);
                        new RepositoryProcessor(r).Process();
                    }
                    catch (Exception)
                    {
                        Console.WriteLine("Retry failed!");
                        return;
                    }
                }
                finally
                {
                    LogRepositoryInfo(r);
                }
            }
        }


        private static void LogRepositoryInfo(RepositoryInfo repo)
        {
            using (System.IO.StreamWriter summary = new System.IO.StreamWriter(Program.Commits, true))
            {
                using (System.IO.StreamWriter details = new System.IO.StreamWriter(Program.VerboseCommits, true))
                {   
                        summary.Write(repo.PrintShas());
                        details.Write(repo.VerboseInterestingShas());
                }
            }
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
