import os
import subprocess
import sys
import getopt

import re
import optparse

inputFile = 'log'

def enum(**enums):
    return type('Enum', (), enums)
    
def debug(file,str):
    if False:
        file.write(str)

data = {} 
#Looking for states
ParsingState = enum(InitialState= 0, Phase1 = 1, Phase2 = 2, Phase3 = 3, BeginMaxsat = 4, EndMaxsat = 5, Phase4 = 6, BeginCause = 7, EndCause = 8, FinalState = 9)
Result = enum(totalTime = 1, phase1Time = 2, phase2Time = 3, phase3Time = 4, phase4Time = 5, foundRootcause = 6,
                rootcauseDepth = 7, maxsat = 8, leftAssignment = 9, rightAssignment = 10, leftConstant = 11, rightConstant = 12)

lines = open(inputFile, 'r').readlines()

currentState = ParsingState.InitialState
for line in lines:
    if currentState == ParsingState.InitialState:
        if "BENCHMARK" in line:
            benchmarkName = line.split('BENCHMARK:')[1].split('.bpl')[0].lstrip().rstrip()
            print("Parsing result of", benchmarkName)
            data[benchmarkName] = {}
            data[benchmarkName][Result.foundRootcause] = 0 #default
            currentState = ParsingState.Phase1
    elif currentState == ParsingState.Phase1:
        if "Time elapsed" in line:
            print("ParsingState.Phase1")
            phase1Time = line.split('Time elapsed:')[1].lstrip().rstrip()
            data[benchmarkName][Result.phase1Time] = phase1Time
            currentState = ParsingState.Phase2
    elif currentState == ParsingState.Phase2:
        if "Time elapsed" in line:
            print("ParsingState.Phase2")
            phase2Time = line.split('Time elapsed:')[1].lstrip().rstrip()
            data[benchmarkName][Result.phase2Time] = phase2Time
            currentState = ParsingState.Phase3
    elif currentState == ParsingState.Phase3:
        if "Time elapsed" in line:
            print("ParsingState.Phase3")
            phase3Time = line.split('Time elapsed:')[1].lstrip().rstrip()
            data[benchmarkName][Result.phase3Time] = phase3Time
            data[benchmarkName][Result.maxsat] = []
            currentState = ParsingState.EndMaxsat            
    elif currentState == ParsingState.EndMaxsat:
        print("ParsingState.EndMaxsat")
        if "Invoking MAXSAT" in line:
            currentState = ParsingState.BeginMaxsat
        elif "Found rootcause" in line:
            blocksBeforeRootcause = line.split('Found rootcause after ')[1].split('blocks')[0].lstrip().rstrip()
            assignsBeforeRootcause = line.split('blocks and ')[1].split('assigns')[0].lstrip().rstrip()
            data[benchmarkName][Result.rootcauseDepth] = (blocksBeforeRootcause, assignsBeforeRootcause)
            data[benchmarkName][Result.foundRootcause] = 1
            currentState = ParsingState.Phase4
        elif "-------" in line:
            currentState = ParsingState.Phase4
    elif currentState == ParsingState.BeginMaxsat:
        print("ParsingState.BeginMaxsat")
        if "MAXSAT found" :
            maxsatUseless = line.split('MAXSAT found ')[1].split('useless')[0].lstrip().rstrip()
            maxsatUseful = line.split('useful candidates')[0].split('and')[1].lstrip().rstrip()
            data[benchmarkName][Result.maxsat] += (maxsatUseless, maxsatUseful)
            currentState = ParsingState.EndMaxsat          
    elif currentState == ParsingState.Phase4:
        if "Time elapsed" in line:
            print("ParsingState.Phase4")
            phase4Time = line.split('Time elapsed:')[1].lstrip().rstrip()
            data[benchmarkName][Result.phase4Time] = phase4Time
            currentState = ParsingState.EndCause
    elif currentState == ParsingState.EndCause:
        print("ParsingState.EndCause")
        if "Cause ==>" in line:
            currentState = ParsingState.BeginCause
        elif "Unable to find" in line:
            data[benchmarkName][Result.foundRootcause] = 0
            currentState = ParsingState.InitialState
        else:
            currentState = ParsingState.InitialState
    elif currentState == ParsingState.BeginCause:
        print("ParsingState.BeginCause")
        if "leftAssignment" in line:
            data[benchmarkName][Result.leftAssignment] = line.split('leftAssignment: ')[1].lstrip().rstrip()
            state = Result.leftAssignment
        elif "rightAssignment" in line:
            data[benchmarkName][Result.rightAssignment] = line.split('rightAssignment: ')[1].lstrip().rstrip()
            state = Result.rightAssignment
        elif "left" in line:
            data[benchmarkName][Result.leftConstant] = line.split('left: ')[1].lstrip().rstrip()
            state = Result.leftConstant
        elif "right: " in line:
            data[benchmarkName][Result.rightConstant] = line.split('right: ')[1].lstrip().rstrip()
            currentState = ParsingState.InitialState
            state = Result.rightConstant
            
csv = open('regression.csv', 'w')
for benchmark in data:
    csv.write(benchmark +",")
    csv.write(data[benchmark][Result.phase1Time] + ",")
    csv.write(data[benchmark][Result.phase2Time] + ",")
    csv.write(data[benchmark][Result.phase3Time] + ",")
    csv.write(data[benchmark][Result.phase4Time] + ",")
    csv.write(str(data[benchmark][Result.foundRootcause]) + ",")
    if (data[benchmark][Result.foundRootcause] == 1):
        csv.write(data[benchmark][Result.rootcauseDepth][1] + ",")
        csv.write(data[benchmark][Result.leftAssignment] + ",")
        csv.write(data[benchmark][Result.rightAssignment] + ",")
        csv.write(data[benchmark][Result.leftConstant] + ",")
        csv.write(data[benchmark][Result.rightConstant] + ",")
    else:
        csv.write("-,")
        csv.write("-,")
        csv.write("-,")
        csv.write("-,")
        csv.write("-,")
    csv.write("\n")
