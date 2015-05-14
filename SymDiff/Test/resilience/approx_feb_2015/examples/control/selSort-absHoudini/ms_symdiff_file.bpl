// Spec
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

//providing only predicates_ms blows up PredicateAbsFull, so we use predicates_ms_only to say which predicates to combine using Boolean connectives

function {:inline true} 
/*{:predicates_ms     _v2.ArrEqAfter(_v1.array_old, _v2.array_old, _v1.in_c)}
{:predicates_ms_only
    _v2.ArrEqAfter(_v1.array_old, _v2.array_old, _v1.in_c),
    _v1.in_position == _v2.in_position,
    _v1.in_c == _v2.in_c,
    _v1.cf_old == _v2.cf_old,
    _v1.cf_ == _v2.cf_
}
*/
MS$_v1.SelectionSort_loop_anon5_LoopHead$_v2.SelectionSort_loop_anon5_LoopHead(_v1.in_c: int, 
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
   true
}

function {:inline true} 
/*{:predicates_ms _v2.ArrEqAfter(_v1.array_old, _v2.array_old, _v1.c)}

{:predicates_ms_only
    _v2.ArrEqAfter(_v1.array_old, _v2.array_old, _v1.c),
    _v1.c == _v2.c,
    _v1.cf_old == _v2.cf_old,
    _v1.position == _v2.position,
    _v1.cf_ == _v2.cf_
}
*/
MS$_v1.Find$_v2.Find(_v1.c: int, 
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
   true
}

function {:inline true} 
/*
{:predicates_ms     _v2.ArrEqAfter(_v1.array_old, _v2.array_old, _v1.in_d),
    _v1.array_old[_v1.in_position] == _v2.array_old[_v1.in_position]}
{:predicates_ms_only
    _v2.ArrEqAfter(_v1.array_old, _v2.array_old, _v1.in_d),
    _v1.array_old[_v1.in_position] == _v2.array_old[_v1.in_position], 
    _v1.in_position == _v2.in_position,
    _v1.cf_old == _v2.cf_old,
    _v1.out_position == _v2.out_position,
    _v1.out_d == _v2.out_d,
    _v1.cf_ == _v2.cf_
}
*/
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


/****************************


// Older annotations 
function {:existential true} __cand_post_0(x1:bool, x2:bool, x3:bool, x4:bool, x5:bool):bool; 
function {:existential true} __cand_post_1(x1:bool, x2:bool, x3:bool, x4:bool, x5:bool):bool; 
function {:existential true} __cand_post_2(x1:bool, x2:bool, x3:bool, x4:bool, x5:bool, x6:bool, x7:bool):bool; 

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
  __cand_post_0(
    _v2.ArrEqAfter(_v1.array_old, _v2.array_old, _v1.in_c),
    _v1.in_position == _v2.in_position,
    _v1.in_c == _v2.in_c,
    _v1.cf_old == _v2.cf_old,
    _v1.cf_ == _v2.cf_
  )
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
  __cand_post_1(
    _v2.ArrEqAfter(_v1.array_old, _v2.array_old, _v1.c),
    _v1.c == _v2.c,
    _v1.cf_old == _v2.cf_old,
    _v1.position == _v2.position,
    _v1.cf_ == _v2.cf_
  )
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
  // could not get rid of the two conjunctions
  __cand_post_2(
    //true,  //Needs PredicateAbs::Disjuncts = 8 in Boogie.exe (instead of 3)
    //true, 
    _v2.ArrEqAfter(_v1.array_old, _v2.array_old, _v1.in_d),
    _v1.array_old[_v1.in_position] == _v2.array_old[_v1.in_position], 
    _v1.in_position == _v2.in_position,
    _v1.cf_old == _v2.cf_old,
    _v1.out_position == _v2.out_position,
    _v1.out_d == _v2.out_d,
    _v1.cf_ == _v2.cf_
  )
}
 
*/