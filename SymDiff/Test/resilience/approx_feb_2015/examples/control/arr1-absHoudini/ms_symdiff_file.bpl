
function {:inline true} 
    MS$_v1.ReplaceChar$_v2.ReplaceChar(_v1.array_old: [int]int, 
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



function {:existential true} __cand_pre_0(a:bool, b:bool):bool; 


function {:inline true} 
{:predicates_ms
   _v2.ArrEqAfter(_v1.array_old, _v2.array_old, _v1.i), 
   _v1.i == _v2.i /*extra predicate, just for fun */
}
    MS_pre_$_v1.Helper$_v2.Helper(_v1.i: int, 
    _v1.array_old: [int]int, 
    _v1.cf_old: int, 
    _v1.OK_old: bool, 
    _v2.i: int, 
    _v2.array_old: [int]int, 
    _v2.cf_old: int, 
    _v2.OK_old: bool)
   : bool
{
  true //(forall j:int:: {_v1.array_old[j],_v2.array_old[j]} __cand_pre_0(j >= _v1.i, _v1.array_old[j] == _v2.array_old[j]))
}

