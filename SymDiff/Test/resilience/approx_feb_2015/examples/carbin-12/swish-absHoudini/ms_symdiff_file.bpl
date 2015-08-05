//Spec
function {:inline true} MS$_v1.swish$_v2.swish(_v1.max_r: int, 
    _v1.N: int, 
    _v1.num_r: int, 
    _v2.max_r: int, 
    _v2.N: int, 
    _v2.num_r: int)
   : bool
{
   _v2.RelaxedEq(_v1.num_r, _v2.num_r) //manual

}

function {:existential true} __cand_pre_0(a:bool, b:bool, c:bool):bool; 
function {:existential true} __cand_post_0(a:bool, b:bool, c:bool):bool; 


//const {:existential true} _houdini_10:bool; //correctly detects multiple decl

function {:inline true} 
{:predicates_ms 
  _v1.in_max_r <= 10,
  _v2.in_max_r >= 10
}
MS_pre_$_v1.swish_loop_anon3_LoopHead$_v2.swish_loop_anon3_LoopHead(_v1.in_N: int, 
    _v1.in_num_r: int, 
    _v1.in_max_r: int, 
    _v2.in_N: int, 
    _v2.in_num_r: int, 
    _v2.in_max_r: int 
    )
   : bool
{
   true //__cand_pre_0(_v1.in_max_r == _v2.in_max_r, _v1.in_max_r <= 10, _v2.in_max_r >= 10)
}


function {:inline true} 
{:predicates_ms 
 _v1.out_num_r <= 10, 
 _v2.out_num_r >= 10
}
MS$_v1.swish_loop_anon3_LoopHead$_v2.swish_loop_anon3_LoopHead(_v1.in_N: int, 
    _v1.in_num_r: int, 
    _v1.in_max_r: int, 
    _v1.out_num_r: int, 
    _v2.in_N: int, 
    _v2.in_num_r: int, 
    _v2.in_max_r: int, 
    _v2.out_num_r: int)
   : bool
{
    true //__cand_post_0(_v1.out_num_r == _v2.out_num_r, _v1.out_num_r <= 10, _v2.out_num_r >= 10) //manual
}
  
 