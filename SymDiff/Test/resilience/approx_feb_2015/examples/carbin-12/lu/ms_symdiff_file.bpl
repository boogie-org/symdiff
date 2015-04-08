

function {:inline true} MS$_v1.lu_loop_anon5_LoopHead$_v2.lu_loop_anon5_LoopHead(_v1.in_column: int, 
    _v1.in_N: int, 
    _v1.in_max: int, 
    _v1.in_i: int, 
    _v1.in_a: int, 
    _v1.OK_old: bool, 
    _v1.out_max: int, 
    _v1.out_i: int, 
    _v1.out_a: int, 
    _v2.in_column: int, 
    _v2.in_N: int, 
    _v2.in_max: int, 
    _v2.in_i: int, 
    _v2.in_a: int, 
    _v2.in_old_a: int, 
    _v2.OK_old: bool, 
    _v2.out_max: int, 
    _v2.out_i: int, 
    _v2.out_a: int, 
    _v2.out_old_a: int)
   : bool
{
   _v2.RelaxedEq(_v2.out_max, _v1.out_max) //manual
}

function {:inline true} MS_pre_$_v1.lu_loop_anon5_LoopHead$_v2.lu_loop_anon5_LoopHead(_v1.in_column: int, 
    _v1.in_N: int, 
    _v1.in_max: int, 
    _v1.in_i: int, 
    _v1.in_a: int, 
    _v1.OK_old: bool, 
    _v2.in_column: int, 
    _v2.in_N: int, 
    _v2.in_max: int, 
    _v2.in_i: int, 
    _v2.in_a: int, 
    _v2.in_old_a: int, 
    _v2.OK_old: bool)
   : bool
{
   _v2.RelaxedEq(_v2.in_max, _v1.in_max) //manual
}

function {:inline true} MS$_v1.lu$_v2.lu(_v1.column: int, 
    _v1.N: int, 
    _v1.max_1: int, 
    _v1.OK_old: bool, 
    _v1.max: int, 
    _v2.column: int, 
    _v2.N: int, 
    _v2.max_1: int, 
    _v2.OK_old: bool, 
    _v2.max: int)
   : bool
{
  _v2.RelaxedEq(_v2.max, _v1.max) //manual
}
