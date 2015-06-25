'''
Assumptions
-----------
0. diff.exe is in path in case you want to perform diffs
1. py.exe version > 3.0 downloaded from http://python.org/download/.

Steps
-----
0. Edit "rootCauseProgram" variable below to match your local settings
1. Edit regression.cmdopt to add/remove benchmarks or their options
2. Use the script in one of the following ways

Sample Usage
------------
0. py regression.py --files "f1.bpl,f2.bpl,..." 
Runs regression for select BPL files in current directory.

1. py regression.py
Runs regression for all BPL files listed in regression.cmdopt.

2. py regression.py --checkpoint
Generates golden regression output. Use this whenever you want to checkpoint current results.

3. py regression --diff
Runs regression and displays diff between golden and current results.
'''

rootCauseProgram = '..\\..\\bin\\debug\\rootcause.exe'
diffProgram = 'diff.exe'
cmdOptFile = 'regression.cmdopt'

import os
import subprocess
import sys
import getopt

import re
import optparse

def enum(**enums):
    return type('Enum', (), enums)
    
def debug(file,str):
    if False:
        file.write(str)

def getProcOptions(BoogieProgram):
    if os.path.exists(cmdOptFile):
        file = open(cmdOptFile, 'r')
        lines = file.readlines()
        for line in lines:
            l = line.rstrip()
            (benchmark,options) = (l.split('$')[0], l.split('$')[1].split(' '))
            if benchmark == BoogieProgram:
                return options
        exit("Unexpected Error")
    else:
        print("Unable to read", cmdOptFile, "in the current working directory")
        exit()

def collectBenchmarksFromCmdOptFile():
    BoogiePrograms = []
    if os.path.exists(cmdOptFile):
        file = open(cmdOptFile, 'r')
        lines = file.readlines()
        for line in lines:
            l = line.lstrip().rstrip()
            if l[0] == '#': #Commented out
                continue
            (benchmark,options) = (l.split('$')[0], l.split('$')[1].split(' '))
            BoogiePrograms += [benchmark]
        return BoogiePrograms
    else:
        print("Unable to read", cmdOptFile, "in the current working directory")
        exit()

        
def fileListParser(option, opt_str, value, parser):
    setattr(parser.values, option.dest, value.split(','))
        
#parse command line arguments
first_re = re.compile(r'^\d{3}$')

parser = optparse.OptionParser()
parser.set_defaults(checkpoint=False, diff=False)
parser.add_option('-f', '--files', type='string', action='callback', callback=fileListParser, dest='files')
parser.add_option('-c', '--checkpoint', action='store_true', dest='checkpoint')
parser.add_option('-d','--diff', action='store_true', dest='diff')

(options, args) = parser.parse_args()

outFileExtension = ''
if options.checkpoint:
    outFileExtension = '.golden'
else:
    outFileExtension = '.current'

#Identify which benchmarks we are running regression on
if options.files is None:
    print("Files unspecified. Using all Boogie programs in", cmdOptFile)
    BoogiePrograms = collectBenchmarksFromCmdOptFile()
else:
    if len(options.files) > 0:
        BoogiePrograms = options.files
    else:
        exit("Error: No files to regress on")

    
RegressionData = {} 

ParsingState = enum(InitialState = 0, BeginImplementation = 1, BeginCause = 2, EndCause = 3, EndImplementation = 4, FinalState = 5)

for BoogieProgram in BoogiePrograms:
    resultFile = open(BoogieProgram + outFileExtension, 'w')
    print("Regressing:", BoogieProgram)
    procOptions = [rootCauseProgram] + getProcOptions(BoogieProgram) + [BoogieProgram]
    # print("Command:", procOptions)
    proc = subprocess.Popen(procOptions, stdout=subprocess.PIPE)
    
    Causes = [] #List of causes for this benchmark
    
    #implement parsing as a state machine
    
    #set initial state
    currentState = ParsingState.InitialState
    ErrorHappened = False
    TimeoutHappened = False
    for line in iter(proc.stdout.readline, b''):
        if "Prover" in str(line):
           continue
        else:
          Causes += [str(line.lstrip().rstrip().decode(encoding='UTF-8')) + '\n']
        
    currentState = ParsingState.FinalState
    RegressionData[BoogieProgram] = Causes
    
    if ErrorHappened:
        resultFile.write("BENCHMARK:" + BoogieProgram + "(ERROR)\n")
    elif TimeoutHappened:
        resultFile.write("BENCHMARK:" + BoogieProgram + "(TIMEOUT)\n")
    else:
        resultFile.write("BENCHMARK:" + BoogieProgram + "(ERRORFREE)\n")
    
    #write results out to file
    resultFile.writelines(RegressionData[BoogieProgram])
    resultFile.close()
    
    if options.checkpoint:
        continue #Do not perform diff during checkpoint
    
    #Perform a diff with golden results
    if os.path.exists(BoogieProgram + '.golden'):
        #print("Performing diff between", BoogieProgram + '.golden', "and", BoogieProgram + '.current')
        if options.diff:
            subprocess.call([diffProgram, BoogieProgram + '.golden', BoogieProgram + '.current'])
        else:
            #just run diff but don't show any output
            diffProcess = subprocess.Popen([diffProgram, BoogieProgram + '.golden', BoogieProgram + '.current'], stdout=subprocess.PIPE)
            lines = diffProcess.stdout.readlines()
            if len(lines) > 0:
                print("\t########## failed ##########")
            else:
                print("\tsucceeded")
    else:
        print("Cannot produce diff. Have you created golden results yet?")
    
        
if options.checkpoint:
    print("Done generating golden regression output in .golden files.")
else:
    print("Done generating regression output in .current files.")
