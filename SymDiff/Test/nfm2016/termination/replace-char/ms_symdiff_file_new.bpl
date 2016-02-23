function {:inline true} MS_pre_$_v1.ReplaceChar$_v2.ReplaceChar(_v1.array_old: [int]int, _v2.array_old: [int]int) : bool
{
 _v1.array_old == _v2.array_old 
}

function {:inline true} MS_pre_$_v1.Helper$_v2.Helper(_v1.i: int, _v1.array_old: [int]int, _v2.i: int, _v2.array_old: [int]int) : bool
{
 _v1.i == _v2.i && _v2.ArrEqAfter(_v1.array_old, _v2.array_old, _v1.i)
}
