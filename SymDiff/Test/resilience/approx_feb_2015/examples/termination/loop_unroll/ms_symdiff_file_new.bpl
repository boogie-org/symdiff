function {:inline true} MS_pre_$_v1.Iterator$_v2.Iterator(_v1.s: int, _v1.a_old: [int]int, _v2.s: int, _v2.a_old: [int]int) : bool
{
 _v1.s == _v2.s && _v1.a_old == _v2.a_old 
}

function {:inline true} MS$_v1.Iterator_loop_anon2_LoopHead$_v2.Iterator_loop_anon4_LoopHead(_v1.in_i: int, 
    _v1.in_tmp: int, 
    _v1.a_old: [int]int, 
    _v1.a_: [int]int, 
    _v1.out_i: int, 
    _v1.out_tmp: int, 
    _v2.in_i: int, 
    _v2.in_tmp: int, 
    _v2.a_old: [int]int, 
    _v2.a_: [int]int, 
    _v2.out_i: int, 
    _v2.out_tmp: int)
   : bool
{
   _v1.in_i == _v2.in_i && ArrEqAfter(_v1.a_old, _v2.a_old, _v1.in_i)
   ==> _v1.out_i == _v2.out_i && ArrEqAfter(_v1.a_, _v2.a_, _v1.out_i) 
}

function {:inline true} MS_pre_$_v1.Iterator_loop_anon2_LoopHead$_v2.Iterator_loop_anon4_LoopHead(_v1.in_i: int, 
    _v1.in_tmp: int, 
    _v1.a_old: [int]int, 
    _v2.in_i: int, 
    _v2.in_tmp: int, 
    _v2.a_old: [int]int)
   : bool
{
 _v1.in_i == _v2.in_i && ArrEqAfter(_v1.a_old, _v2.a_old, _v1.in_i) 
}

function {:inline true} ArrEqAfter(a: [int]int, b: [int]int, i: int) : bool
{
  (forall j: int :: { a[j] } { b[j] } j >= i ==> a[j] == b[j])
}
