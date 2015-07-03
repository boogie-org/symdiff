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
        public RepositorySetup(string pathToSetup, string gitUrl, string projectName, string sha)
        {
            this.setupRoot = pathToSetup;
            this.gitUrl = gitUrl;
            this.projectName = projectName;
            this.sha = sha;
        }

        public void DoWork()
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
        }
    }
}
