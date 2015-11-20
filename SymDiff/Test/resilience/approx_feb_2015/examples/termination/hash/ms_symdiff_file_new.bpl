function {:inline true} MS_pre_$_v1.hash_loop_anon3_LoopHead$_v2.hash_loop_anon4_LoopHead(_v1.in_i: int, 
    _v1.in_hash: int, 
    _v1.str_old: [int]int, 
    _v2.in_i: int, 
    _v2.in_hash: int, 
    _v2.str_old: [int]int)
   : bool
{
 _v1.in_i == _v2.in_i && _v1.str_old == _v2.str_old 
}

function {:inline true} MS_pre_$_v1.hash$_v2.hash(_v1.str_old: [int]int, _v2.str_old: [int]int) : bool
{
 _v1.str_old == _v2.str_old 
}
