import sys
import time
import shutil

from subprocess import Popen, PIPE, STDOUT
from contextlib import contextmanager
import os
import argparse
import subprocess
import fnmatch
import ntpath


def setupArgs():
    parser = argparse.ArgumentParser(description='Harness to run experiments.')
    parser.add_argument('configFile', help='config file with versions. see examples_with_versions.config for an example.')
    parser.add_argument('--bplRepo', '-b', type=str, help='path to root of bpl repository.')
    parser.add_argument('--timeout', '-t', type=int, default=1200, help='timeout per executed command. default is 20 minutes.')
    parser.add_argument('--smack', '-s', default=False, action='store_true', help='use script to only run smack')
    return parser.parse_args()


def cToBplByHavoc(v1, v2):
   return  ['run_symdiff_c.cmd', v1, v2, '/nocpp', '/rvt', '/nohtml', '/genBplsOnly', '/analyzeChangedCallersOnly', '/stripAbsolutePathsInBpl']

def runSymdiffBpl(v1,v2):
    return ['run_symdiff_bpl.cmd', v1, v2, '/rvt:n', '/opts: -usemutual -asserts -checkEquivWithDependencies -freeContracts ', '/changedLines']

def dependency_dac(v):
    return ['Dependency.exe', '_v2.bpl', '/taint:' + v + '.bpl_changed_lines.txt', '/dacMerged:mergedProgSingle_inferred.bpl']

def dependency(v):
    return ['Dependency.exe', '_v2.bpl', '/taint:' + v + '.bpl_changed_lines.txt']

def smackPreprocess(fn ,v):
    return ['SymDiffPreProcess.exe', fn, '-relativeSourceDir:' + v + '\\']


def smack():
    return 'make -f smackMakefile clean all'

class Project:
    smackImportedDirs = set()
    
    def __init__(self, rootDir, proj, versions, commandLog, resultsSummary, bplRepo, timeout):
        self.rootDir  = rootDir
        self.projectDir = proj        
        self.versions = versions
        self.commandLog = commandLog
        self.resultsSummary = resultsSummary
        self.bplRepo = bplRepo
        self.timeout = timeout
        
        if len(self.versions) < 2:
            print("[ERROR:] Missing versions for " + self.projectDir)

    @staticmethod
    def readConfig(rootDir, configFile, commandLog, resultsSummary, bplRepo, timeout):
        projects = list()
        with open(configFile) as fin:
            for line in fin:
                if line.startswith("//"):
                    continue
                components = line.split()
                if components:
                    projects.append(Project(rootDir, components[0], components[1:], commandLog, resultsSummary, bplRepo, timeout))
        return projects

    def runSmack(self):
        with cd(self.projectDir.replace('\\', '/')):
            for v in self.versions:
                with cd(v):
                    with open('smackMakefileLog', 'w') as fout:                
                        self.runStage(smack(), fout)

    def process(self):
        print("Processing " + self.projectDir)
        if not os.path.exists(self.projectDir):
                os.makedirs(self.projectDir)
        with cd(self.projectDir):
            referenceVersion = self.versions[0]
            for version in self.versions[1:]:
                self.processVersionPair(referenceVersion, version)

    def processVersionPair(self, v1, v2):
        print('\t -' + v1 + '  ' + v2);
        with open('LOG_' + v1 + '_' + v2 + '_outlog', 'w') as outStream:
            try:
                timeCToBpl, output = 'n/a', ''

                #if a bplRepo is passed in then just import the bpls from the repo
                if self.bplRepo:
                    self.importSmackFiles(v1)
                    self.importSmackFiles(v2)
                    self.runStage(smackPreprocess(v1 + '_smacked.bpl', v1), outStream)
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
            except Exception as ex:
                print('[Error] Processing versions ' + v1 + ' ' +v2)
                print('[Error] Processing versions ' + v1 + ' ' +v2, file=outStream)
                print('Exception:' + str(ex), file=outStream)
            else:
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
        #print(" ".join(cmd))
        self.commandLog.append('cd ' + os.getcwd())
        print('cd ' + os.getcwd(), file=outStream)
        self.commandLog.append(' '.join(cmd))
        print(' '.join(cmd), file=outStream)
        timeToRun, out, retCode = executeCommand(cmd, self.timeout)
        if retCode:
            print('[Warning]: Error code returned: ' + str(retCode), file=outStream)
        print(str(timeToRun), file=outStream)
        print(out, file=outStream)
        return timeToRun, out


    def importSmackFiles(self, v1):
        v1_fp = os.path.abspath(v1)
        if os.path.isdir(v1_fp):
            if not v1_fp in Project.smackImportedDirs:
                print("[Warning]: could not copy " + v1_fp + " because the directory already exists")
        else:

            v1Loc = os.path.join(self.bplRepo, self.projectDir, v1)
            os.mkdir(v1_fp)
            filesToCopy = getRelevantFilesInDir(v1Loc)
            filesToCopy.extend(getRelevantFilesInDir(os.path.join(self.rootDir, 'smackShare', 'smack')))
            
            #print('\n'.join(filesToCopy))
            for f in filesToCopy:                
                fdest = ntpath.basename(f)
                fdest = os.path.join(v1,fdest)
                if os.path.exists(fdest):
                    print('[WARNING] overwriting files in flattenning: ' + fdest)
                shutil.copy(f, fdest)
            #shutil.copytree(v1Loc, v1)
        shutil.copy(os.path.join(v1, 'smacked.bpl'), v1 + '_smacked.bpl')
        Project.smackImportedDirs.add(v1_fp)


def getRelevantFilesInDir(d):
    matches = list()
    for root, dirnames, filenames in os.walk(d):
        matches.extend(map(lambda x: os.path.join(root,x), fnmatch.filter(filenames, '*.c')))
        matches.extend(map(lambda x: os.path.join(root,x), fnmatch.filter(filenames, '*.h')))
        matches.extend(map(lambda x: os.path.join(root,x), fnmatch.filter(filenames, '*.bpl')))
    return matches

        
def executeCommand(cmd, tout):
    start = time.time()
    p = Popen(cmd, shell=True, stdout=PIPE, stderr=STDOUT)
    output, err = p.communicate(timeout=tout)
    end = time.time()
    timeToRun = end-start
    out = output.decode("ascii")
    if p.returncode:
        print('[Warning]: error executing command(' + str(p.returncode) + '): ' + str(cmd) + " in " + os.getcwd())
    return timeToRun, out, p.returncode




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

    projects = Project.readConfig(os.path.abspath('.'), args.configFile, commandLog, resultsSummary, args.bplRepo, args.timeout)

    if args.smack:
        for project in projects:
            project.runSmack()
        exit()
    
    #copy the smack share over so that it is visible for syntaxdiff and others in the toolchain
    if args.bplRepo:
        if not os.path.isdir('smackShare'):
            shutil.copytree(os.path.join(args.bplRepo, 'smackShare'), 'smackShare')

    for project in projects:
        project.process()

    print('##LOGging current run')    
    with open('LOG_run_experiments', 'w') as fout:
        print('\n'.join(commandLog), file=fout)

if __name__ == "__main__":
    main()
