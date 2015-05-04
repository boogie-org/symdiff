@echo off

REM set INLINEDEPTH=1
set INLINEDEPTH=0  

set INFERENCE=PredicateAbsFull
REM set INFERENCE=PredicateAbs

pushd examples

echo ---------- control\arr1-absHoudini -----------
pushd .
cd control\arr1-absHoudini
CALL run_symdiff_bpl.cmd v1 v2 /rvt /opts:" -usemutual -asserts -freeContracts -useAbstractHoudiniInference " /inferContracts:"/inlineDepth:%INLINEDEPTH% /abstractHoudini:%INFERENCE% "
popd
echo ---------- control\selSort-absHoudini (needs PredicateAbsFull) -----------
pushd .
cd control\selSort-absHoudini
CALL run_symdiff_bpl.cmd v1 v2 /rvt /opts:" -usemutual -asserts -freeContracts -useAbstractHoudiniInference " /inferContracts:"/inlineDepth:%INLINEDEPTH% /abstractHoudini:%INFERENCE% "
popd
echo ---------- carbin-12\water-absHoudini -----------
pushd .
cd carbin-12\water-absHoudini
CALL run_symdiff_bpl.cmd v1 v2 /rvt /opts:" -usemutual -asserts -freeContracts -useAbstractHoudiniInference " /inferContracts:"/inlineDepth:%INLINEDEPTH% /abstractHoudini:%INFERENCE% "
popd
echo ---------- carbin-12\lu-absHoudini -----------
pushd .
cd carbin-12\lu-absHoudini
CALL run_symdiff_bpl.cmd v1 v2 /rvt /opts:" -usemutual -asserts -freeContracts -useAbstractHoudiniInference " /inferContracts:"/inlineDepth:%INLINEDEPTH% /abstractHoudini:%INFERENCE% "
popd
echo ---------- carbin-12\swish-absHoudini -----------
pushd .
cd carbin-12\swish-absHoudini
CALL run_symdiff_bpl.cmd v1 v2 /rvt /opts:" -usemutual -asserts -freeContracts -useAbstractHoudiniInference " /inferContracts:"/inlineDepth:%INLINEDEPTH% /abstractHoudini:%INFERENCE% "
popd
echo ------
popd