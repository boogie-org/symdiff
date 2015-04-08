@echo off

echo ---------- paper\ex1 -----------
pushd .
cd paper\ex1
CALL run_symdiff_bpl.cmd v1 v2 /rvt /opts:" -usemutual -asserts -freeContracts" /inferContracts:"/inlineDepth:1"
popd
echo ---------- control\zvon -----------
pushd .
cd control\zvon
CALL run_symdiff_bpl.cmd v1 v2 /rvt /opts:" -usemutual -asserts -freeContracts" /inferContracts:"/inlineDepth:1"
popd
echo ---------- control\arr1 -----------
pushd .
cd control\arr1
CALL run_symdiff_bpl.cmd v1 v2 /rvt /opts:" -usemutual -asserts -freeContracts" /inferContracts:"/inlineDepth:1"
popd
echo ---------- control\selSort -----------
pushd .
cd control\selSort
CALL run_symdiff_bpl.cmd v1 v2 /rvt /opts:" -usemutual -asserts -freeContracts" /inferContracts:"/inlineDepth:1"
popd
echo ---------- carbin-12\water -----------
pushd .
cd carbin-12\water
CALL run_symdiff_bpl.cmd v1 v2 /rvt /opts:" -usemutual -asserts -freeContracts" /inferContracts:"/inlineDepth:1"
popd
echo ---------- carbin-12\lu -----------
pushd .
cd carbin-12\lu
CALL run_symdiff_bpl.cmd v1 v2 /rvt /opts:" -usemutual -asserts -freeContracts" /inferContracts:"/inlineDepth:1"
popd
echo ---------- carbin-12\swish -----------
pushd .
cd carbin-12\swish
CALL run_symdiff_bpl.cmd v1 v2 /rvt /opts:" -usemutual -asserts -freeContracts" /inferContracts:"/inlineDepth:1"
popd
