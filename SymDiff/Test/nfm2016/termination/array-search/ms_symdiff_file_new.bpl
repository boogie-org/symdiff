function {:inline} MS_pre_$_v1.Array_search$_v2.Array_search(_v1.s: int, _v1.e: int, _v1.v: int, _v2.s: int, _v2.e: int, _v2.v: int) : bool
{
  true
   && _v1.s <= _v2.s
   && _v2.s <= _v1.s
   && _v1.e <= _v2.e
   && _v2.e <= _v1.e
   && _v1.v <= _v2.v
   && _v2.v <= _v1.v
}

function {:inline} MS_pre_$_v1.Array_search_loop_anon4_LoopHead$_v2.Array_search_loop_anon4_LoopHead(_v1.in_v: int, 
    _v1.in_r: int, 
    _v1.in_k1: int, 
    _v1.in_i: int, 
    _v2.in_v: int, 
    _v2.in_r: int, 
    _v2.in_k1: int, 
    _v2.in_i: int)
   : bool
{
  true
   && _v1.in_v <= _v2.in_v
   && _v2.in_v <= _v1.in_v
   && _v1.in_r <= _v2.in_r
   && _v2.in_r <= _v1.in_r
   && _v1.in_k1 <= _v2.in_k1
   && _v2.in_k1 <= _v1.in_k1
   && _v1.in_i <= _v2.in_i
}

function {:inline} MS_pre_$_v1.Main$_v2.Main(_v1.i: int, _v1.j: int, _v1.k: int, _v2.i: int, _v2.j: int, _v2.k: int) : bool
{
  true
}
