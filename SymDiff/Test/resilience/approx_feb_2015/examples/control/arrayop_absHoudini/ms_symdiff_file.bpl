function {:inline true} MS$_v1.modify_each_element$_v2.modify_each_element(_v1.value: int, 
    _v1.array_old: [int]int, 
    _v1.cf_old: int, 
    _v1.OK_old: bool, 
    _v1.cf_: int, 
    _v1.array_: [int]int, 
    _v2.value: int, 
    _v2.array_old: [int]int, 
    _v2.cf_old: int, 
    _v2.OK_old: bool, 
    _v2.cf_: int, 
    _v2.array_: [int]int)
   : bool
{
  _v1.cf_ == _v2.cf_
}

function {:inline true} 
{:predicates_ms _v2.ArrEqAfter(_v1.array_old, _v2.array_old, _v1.in_i)
}
MS_pre_$_v1.modify_each_element_loop_anon3_LoopHead$_v2.modify_each_element_loop_anon3_LoopHead(_v1.in_value: int, 
    _v1.in_i: int, 
    _v1.in_tmp: int, 
    _v1.array_old: [int]int, 
    _v1.cf_old: int, 
    _v1.OK_old: bool, 
    _v2.in_value: int, 
    _v2.in_i: int, 
    _v2.in_tmp: int, 
    _v2.array_old: [int]int, 
    _v2.cf_old: int, 
    _v2.OK_old: bool)
   : bool
{
  true
}
