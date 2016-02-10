/*
function {:inline true} MS$_v1.string_copy_loop_anon5_LoopHead$_v2.string_copy_loop_anon5_LoopHead(_v1.in_i: int, 
    _v1.src_old: [int]int, 
    _v1.dest_old: [int]int, 
    _v1.OK_old: bool, 
    _v1.OK_: bool, 
    _v1.dest_: [int]int, 
    _v1.out_i: int, 
    _v2.in_i: int, 
    _v2.in_j: int, 
    _v2.src_old: [int]int, 
    _v2.dest_old: [int]int, 
    _v2.OK_old: bool, 
    _v2.OK_: bool, 
    _v2.dest_: [int]int, 
    _v2.out_i: int, 
    _v2.out_j: int)
   : bool
{
  _v2.out_j <= _v2.out_i 
  //true
}

function {:inline true} MS_pre_$_v1.string_copy_loop_anon5_LoopHead$_v2.string_copy_loop_anon5_LoopHead(_v1.in_i: int, 
    _v1.src_old: [int]int, 
    _v1.dest_old: [int]int, 
    _v1.OK_old: bool, 
    _v2.in_i: int, 
    _v2.in_j: int, 
    _v2.src_old: [int]int, 
    _v2.dest_old: [int]int, 
    _v2.OK_old: bool)
   : bool
{
  //true
  //ArrEqAfter(_v1.src_old, _v2.src_old, _v1.in_i) && _v2.in_j <= _v2.in_i
   _v2.in_j <= _v2.in_i
}
*/

function {:inline true} MS_pre_$_v1.string_copy_loop_anon3_LoopHead#2$_v2.string_copy_loop_anon5_LoopHead(_v1.in_i: int, 
    _v1.src_old: [int]int, 
    _v1.dest_old: [int]int, 
    _v1.OK_old: bool, 
    _v2.in_i: int, 
    _v2.in_j: int, 
    _v2.src_old: [int]int, 
    _v2.dest_old: [int]int, 
    _v2.OK_old: bool)
   : bool
{
  //true
   _v2.in_j <= _v2.in_i
}

function {:inline true} MS$_v1.string_copy_loop_anon3_LoopHead#2$_v2.string_copy_loop_anon5_LoopHead(_v1.in_i: int, 
    _v1.src_old: [int]int, 
    _v1.dest_old: [int]int, 
    _v1.OK_old: bool, 
    _v1.OK_: bool, 
    _v1.dest_: [int]int, 
    _v1.out_i: int, 
    _v2.in_i: int, 
    _v2.in_j: int, 
    _v2.src_old: [int]int, 
    _v2.dest_old: [int]int, 
    _v2.OK_old: bool, 
    _v2.OK_: bool, 
    _v2.dest_: [int]int, 
    _v2.out_i: int, 
    _v2.out_j: int)
   : bool
{
  //true
  _v2.out_j <= _v2.out_i 
}

