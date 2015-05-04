// Spec
function {:inline true} MS$_v1.BubbleSort$_v2.BubbleSort(_v1.array_old: [int]int, 
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
  _v1.cf_ == _v2.cf_ //manual
}


//The example is artificial as we don't inject fault into a statement, but explicitly into a memory location

function {:inline true} 
{:predicates_ms
    _v2.ArrEqBefore(_v1.array_old, _v2.array_old, _v1.i),
    _v2.ArrEqBefore(_v1.array_, _v2.array_, _v1.out_i)
}
MS$_v1.BubbleSort_Outer_Loop$_v2.BubbleSort_Outer_Loop(_v1.i: int, 
    _v1.j: int, 
    _v1.t: int, 
    _v1.array_old: [int]int, 
    _v1.cf_old: int, 
    _v1.OK_old: bool, 
    _v1.cf_: int, 
    _v1.array_: [int]int, 
    _v1.out_i: int, 
    _v1.out_j: int, 
    _v1.out_t: int, 
    _v2.i: int, 
    _v2.j: int, 
    _v2.t: int, 
    _v2.array_old: [int]int, 
    _v2.cf_old: int, 
    _v2.OK_old: bool, 
    _v2.cf_: int, 
    _v2.array_: [int]int, 
    _v2.out_i: int, 
    _v2.out_j: int, 
    _v2.out_t: int)
   : bool
{
 true
}

function {:inline true}
{:predicates_ms
    _v2.ArrEqBefore(_v1.array_old, _v2.array_old, _v1.i),
    _v2.ArrEqBefore(_v1.array_, _v2.array_, _v1.i)
}
MS$_v1.BubbleSort_Inner_Loop$_v2.BubbleSort_Inner_Loop(_v1.i: int, 
    _v1.j: int, 
    _v1.t: int, 
    _v1.array_old: [int]int, 
    _v1.cf_old: int, 
    _v1.OK_old: bool, 
    _v1.cf_: int, 
    _v1.array_: [int]int, 
    _v1.out_j: int, 
    _v1.out_t: int, 
    _v2.i: int, 
    _v2.j: int, 
    _v2.t: int, 
    _v2.array_old: [int]int, 
    _v2.cf_old: int, 
    _v2.OK_old: bool, 
    _v2.cf_: int, 
    _v2.array_: [int]int, 
    _v2.out_j: int, 
    _v2.out_t: int)
   : bool
{
  true
}

