//Spec
function {:inline true} MS$_v1.swish$_v2.swish(_v1.max_r: int, 
    _v1.N: int, 
    _v1.OK_old: bool, 
    _v1.num_r: int, 
    _v2.max_r: int, 
    _v2.N: int, 
    _v2.OK_old: bool, 
    _v2.num_r: int)
   : bool
{
   _v2.RelaxedEq(_v1.num_r, _v2.num_r) //manual

}


function {:inline true} MS_pre_$_v1.swish_loop_anon3_LoopHead$_v2.swish_loop_anon3_LoopHead(_v1.in_N: int, 
    _v1.in_num_r: int, 
    _v1.in_max_r: int, 
    _v1.OK_old: bool, 
    _v2.in_N: int, 
    _v2.in_num_r: int, 
    _v2.in_max_r: int, 
    _v2.OK_old: bool)
   : bool
{
    _v2.RelaxedEq(_v1.in_max_r, _v2.in_max_r) //manual
}


function {:inline true} MS$_v1.swish_loop_anon3_LoopHead$_v2.swish_loop_anon3_LoopHead(_v1.in_N: int, 
    _v1.in_num_r: int, 
    _v1.in_max_r: int, 
    _v1.OK_old: bool, 
    _v1.out_num_r: int, 
    _v2.in_N: int, 
    _v2.in_num_r: int, 
    _v2.in_max_r: int, 
    _v2.OK_old: bool, 
    _v2.out_num_r: int)
   : bool
{
    _v2.RelaxedEq(_v1.out_num_r, _v2.out_num_r) //manual
}
  
 