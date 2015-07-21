using LibGit2Sharp;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Experimental
{
    class RepositorySetup
    {
        private string setupRoot;
        private string gitUrl;
        private string sha;
        private string projectName;
        private StreamWriter stream;
        public RepositorySetup(string pathToSetup, string gitUrl, string projectName, string sha, StreamWriter stream)
        {
            this.setupRoot = pathToSetup;
            this.gitUrl = gitUrl;
            this.projectName = projectName;
            this.sha = sha;
            this.stream = stream;
        }

        public void DoWork()
        {
            try
            {
                var res = this.projectName + "_" + this.sha.Substring(0, 6);
                string pathToCurrentVersion = Path.Combine(this.setupRoot, res);
                Directory.CreateDirectory(pathToCurrentVersion);
                var v0Dir = Path.Combine(pathToCurrentVersion, "v0");
                var v1Dir = Path.Combine(pathToCurrentVersion, "v1");
                Directory.CreateDirectory(v0Dir);
                Directory.CreateDirectory(v1Dir);
                Repository.Clone(this.gitUrl, v0Dir);
                var repo = new Repository(v0Dir);
                repo.Checkout(this.sha);
                repo.Checkout("HEAD~1");
                Repository.Clone(this.gitUrl, v1Dir);
                repo = new Repository(v1Dir);
                repo.Checkout(this.sha);
                this.stream.WriteLine(res + " v0 v1");
            }
            catch (LibGit2Sharp.NameConflictException ex)
            {
                Console.WriteLine("Could not clone {1} # {2} due to {2}", this.projectName, this.sha, ex.GetType().ToString());
            }
        }
    }
}
