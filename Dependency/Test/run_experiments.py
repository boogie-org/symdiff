import sys
import time
import shutil

from subprocess import Popen, PIPE, STDOUT
from contextlib import contextmanager
import os
import argparse


def setupArgs():
    parser = argparse.ArgumentParser(description='Harness to run experiments.')
    parser.add_argument('configFile', help='config file with versions. see examples_with_versions.config for an example.')
    parser.add_argument('--bplRepo', '-b', type=str, help='path to root of bpl repository.')
    return parser.parse_args()


def cToBplByHavoc(v1, v2):
   return  ['run_symdiff_c.cmd', v1, v2, '/nocpp', '/rvt', '/nohtml', '/genBplsOnly', '/analyzeChangedCallersOnly', '/stripAbsolutePathsInBpl']

def runSymdiffBpl(v1,v2):
    return ['run_symdiff_bpl.cmd', v1, v2, '/rvt:n', '/opts: -usemutual -asserts -checkEquivWithDependencies -freeContracts ']

def dependency_dac(v):
    return ['Dependency.exe', '_v2.bpl', '/taint:' + v + '\changed_lines.txt', '/dacMerged:mergedProgSingle_inferred.bpl']

def dependency(v):
    return ['Dependency.exe', '_v2.bpl', '/taint:' + v + '\changed_lines.txt']

def smackPreprocess(fn ,v):
    return ['SmackProcessing.exe', fn, '-relativeSourceDir:' + v + '\\']


class Project:
    def __init__(self, proj, versions, commandLog, resultsSummary, bplRepo):
        self.projectDir = proj        
        self.versions = versions
        self.commandLog = commandLog
        self.resultsSummary = resultsSummary
        self.bplRepo = bplRepo
        
        if len(self.versions) < 2:
            print("[ERROR:] Missing versions for " + self.projectDir)

    @staticmethod
    def readConfig(configFile, commandLog, resultsSummary, bplRepo):
        projects = list()
        with open(configFile) as fin:
            for line in fin:
                if line.startswith("//"):
                    continue
                components = line.split()
                if components:
                    projects.append(Project(components[0], components[1:], commandLog, resultsSummary, bplRepo))
        return projects


    def process(self):
        print("Processing " + self.projectDir)
        with cd(self.projectDir):
            referenceVersion = self.versions[0]
            for version in self.versions[1:]:
                self.processVersionPair(referenceVersion, version)

    def processVersionPair(self, v1, v2):
        print('\t -' + v1 + '  ' + v2);
        with open('LOG_' + v1 + '_' + v2 + '_outlog', 'w') as outStream:

            timeCToBpl, output = 'n/a', ''

            #if a bplRepo is passed in then just import the bpls from the repo
            if self.bplRepo:
                self.importSmackFiles(v1, v2)
                self.runStage(smackPreprocess(v1 + '_smacked.bpl', v1), outStream)
                print(v1)
                print(os.getcwd())
                shutil.copy(v1 + '_smacked_unsmacked.bpl', v1 + '.bpl')
                self.runStage(smackPreprocess(v2 + '_smacked.bpl', v2), outStream)
                shutil.copy(v2 + '_smacked_unsmacked.bpl', v2 + '.bpl')                
            else:
                timeCToBpl, output = self.runStage(cToBplByHavoc(v1,v2), outStream)
            
            timeRunSymdiffBpl, output = self.runStage(runSymdiffBpl(v1,v2), outStream)

            timeDependencyDac, output = self.runStage(dependency_dac(v2), outStream)
            lines, dacTainted = self.processDependencyOutput(output)

            timeDependencySimple, output = self.runStage(dependency(v2), outStream)
            lines, depTainted = self.processDependencyOutput(output)

        with open(self.resultsSummary, 'a') as summary:
            print(','.join(str(x) for x in [self.projectDir, v1, v2, timeCToBpl, timeRunSymdiffBpl, timeDependencySimple, timeDependencyDac, lines, depTainted, dacTainted]), file=summary)


    def processDependencyOutput(self, output):
        output = output.split('\n')
        output = [x for x in output if x.startswith("#Orig lines, #Tainted lines, #Lines after abstractNonTainted:")]
        if len(output) > 0:        
            summary = output[0]
            summary = summary[len("#Orig lines, #Tainted lines, #Lines after abstractNonTainted:"):]
            summary = summary.split(',')
            summary = [int(x.strip()) for x in summary]
            return summary[0], summary[1]


    def runStage(self, cmd, outStream):
        print(" ".join(cmd))
        self.commandLog.append('cd ' + os.getcwd())
        print('cd ' + os.getcwd(), file=outStream)
        self.commandLog.append(' '.join(cmd))
        print(' '.join(cmd), file=outStream)
        timeToRun, out = executeCommand(cmd)
        print(str(timeToRun), file=outStream)
        print(out, file=outStream)
        return timeToRun, out


    def importSmackFiles(self, v1, v2):
        v1Loc = os.path.join(self.bplRepo, self.projectDir, v1, 'smacked.bpl')
        v2Loc = os.path.join(self.bplRepo, self.projectDir, v2, 'smacked.bpl')
        print(v1Loc)
        print(v2Loc)        
        shutil.copy(v1Loc, v1 + '_smacked.bpl')
        shutil.copy(v2Loc, v2 + '_smacked.bpl')


def executeCommand(cmd):
    start = time.time()
    p = Popen(cmd, shell=True, stdout=PIPE, stderr=STDOUT)
    output, err = p.communicate()
    end = time.time()
    timeToRun = end-start
    out = output.decode("ascii")
    return timeToRun, out




@contextmanager
def cd(newdir):
    prevdir = os.getcwd()
    os.chdir(os.path.expanduser(newdir))
    try:
        yield
    finally:
        os.chdir(prevdir)



def main():
    args = setupArgs()

    commandLog = list()

    resultsSummary = os.path.join(os.getcwd().rstrip(os.pathsep), 'LOG_results_summary.csv')
    with open(resultsSummary, 'w') as results:
        print(','.join(['Project', 'v1', 'v2', 'timeCToBpl', 'timeRunSymdiffBpl', 'timeDependencySimple', 'timeDependencyDac', 'lines', 'depTainted', 'dacTainted']), file=results)

    projects = Project.readConfig(args.configFile, commandLog, resultsSummary, args.bplRepo)

    for project in projects:
        project.process()

    print('##LOGging current run')    
    with open('LOG_run_experiments', 'w') as fout:
        print('\n'.join(commandLog), file=fout)

if __name__ == "__main__":
    main()
