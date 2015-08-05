//Run without /inlineDepth:1 to see the effect of order of MS_f_f'
//run_symdiff_bpl.cmd v1 v2 /rvt /opts:" -usemutual -asserts -freeContracts -useAbstractHoudiniInference " /inferContracts:" /abstractHoudini:PredicateAbsFull "

//The following fact canno tbe inferred by the DAC translation
function {:inline true} MS_pre_$_v1.Baz$_v2.Baz(_v1.x: int, _v2.x: int) : bool
{
   _v1.x == _v2.x //spec
}
