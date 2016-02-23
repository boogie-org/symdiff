// Spec
function {:inline true} MS$_v1.SelectionSort$_v2.SelectionSort(_v1.array_old: [int]int, 
    _v1.cf_old: int, 
    _v1.cf_: int, 
    _v1.array_: [int]int, 
    _v2.array_old: [int]int, 
    _v2.cf_old: int, 
    _v2.cf_: int, 
    _v2.array_: [int]int)
   : bool
{
  _v1.cf_ == _v2.cf_ //manual spec
}

/*
function {:inline true} 
{:predicates_ms 
    _v1.array_old[_v1.in_position] == _v2.array_old[_v1.in_position]}
MS$_v1.Find_loop_anon5_LoopHead$_v2.Find_loop_anon5_LoopHead(_v1.in_position: int, 
    _v1.in_d: int, 
    _v1.array_old: [int]int, 
    _v1.cf_old: int, 
    _v1.OK_old: bool, 
    _v1.cf_: int, 
    _v1.out_position: int, 
    _v1.out_d: int, 
    _v2.in_position: int, 
    _v2.in_d: int, 
    _v2.array_old: [int]int, 
    _v2.cf_old: int, 
    _v2.OK_old: bool, 
    _v2.cf_: int, 
    _v2.out_position: int, 
    _v2.out_d: int)
   : bool
{
  true
}
*/
