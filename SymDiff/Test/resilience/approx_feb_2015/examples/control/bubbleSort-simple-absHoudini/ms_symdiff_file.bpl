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


//No non-trivial predicates needed as the havoc was done for an redundant parameter j to BubbleSort_Outer_loop(.., j, ..)