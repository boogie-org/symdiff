function {:inline true} MS$_v1.SelectionSort$_v2.SelectionSort(_v1.array_old: [int]int, 
    _v1.cf_old: int, 
    _v1.OK_old: bool, 
    _v1.cf_: int, 
    _v1.array_: [int]int, 
    _v2.array_old: [int]int, 
    _v2.cf_old: int, 
    _v2.OK_old: bool, 
    _v2.cf_: int, 
    _v2.array_: [int]int)
   : bool
{
  _v1.cf_ == _v2.cf_ //manual spec
}

function {:inline true} MS$_v1.SelectionSort_loop_anon5_LoopHead$_v2.SelectionSort_loop_anon5_LoopHead(_v1.in_c: int, 
    _v1.in_position: int, 
    _v1.in_temp: int, 
    _v1.array_old: [int]int, 
    _v1.cf_old: int, 
    _v1.OK_old: bool, 
    _v1.cf_: int, 
    _v1.array_: [int]int, 
    _v1.out_c: int, 
    _v1.out_position: int, 
    _v1.out_temp: int, 
    _v2.in_c: int, 
    _v2.in_position: int, 
    _v2.in_temp: int, 
    _v2.array_old: [int]int, 
    _v2.cf_old: int, 
    _v2.OK_old: bool, 
    _v2.cf_: int, 
    _v2.array_: [int]int, 
    _v2.out_c: int, 
    _v2.out_position: int, 
    _v2.out_temp: int)
   : bool
{
   (_v2.ArrEqAfter(_v1.array_old, _v2.array_old, _v1.in_c) && _v1.in_position == _v2.in_position && _v1.in_c == _v2.in_c && _v1.cf_old == _v2.cf_old) ==> _v1.cf_ == _v2.cf_ //manual
}


function {:inline true} MS$_v1.Find$_v2.Find(_v1.c: int, 
    _v1.array_old: [int]int, 
    _v1.cf_old: int, 
    _v1.OK_old: bool, 
    _v1.cf_: int, 
    _v1.position: int, 
    _v2.c: int, 
    _v2.array_old: [int]int, 
    _v2.cf_old: int, 
    _v2.OK_old: bool, 
    _v2.cf_: int, 
    _v2.position: int)
   : bool
{
  (_v2.ArrEqAfter(_v1.array_old, _v2.array_old, _v1.c) && _v1.c == _v2.c && _v1.cf_old == _v2.cf_old) ==> (_v1.position == _v2.position && _v1.cf_ == _v2.cf_)  //manual
}

function {:inline true} MS$_v1.Find_loop_anon5_LoopHead$_v2.Find_loop_anon5_LoopHead(_v1.in_position: int, 
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
  (_v2.ArrEqAfter(_v1.array_old, _v2.array_old, _v1.in_d) && 
   _v1.array_old[_v1.in_position] == _v2.array_old[_v1.in_position] && 
   _v1.in_position == _v2.in_position && 
   _v1.cf_old == _v2.cf_old) ==> 
   (_v1.out_position == _v2.out_position && _v1.out_d == _v2.out_d && _v1.cf_ == _v2.cf_)  //manual
}