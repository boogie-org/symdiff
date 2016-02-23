function {:inline true} RelaxedBefore(x:[int]int, y: [int]int, e:int, i: int) : bool
{
  (forall j: int:: j <= 63 && j >= 0 ==> _v2.RelaxedEq(x[j], y[j], e))
}

function {:inline true} RelaxedAfter(x:[int]int, y: [int]int, e:int, i: int) : bool
{
  (forall j: int:: j > i && j <= 63 ==> _v2.RelaxedEq(x[j], y[j], e))
}

function {:inline true} MS$_v1.quantization$_v2.quantization(_v1.data: [int]int, 
    _v1.Temp_old: [int]int, 
    _v1.Temp_: [int]int, 
    _v2.data: [int]int, 
    _v2.Temp_old: [int]int, 
    _v2.Temp_: [int]int)
   : bool
{
  
  (forall i:int :: (i>=0 && i<=63) ==> _v2.RelaxedEq(_v1.Temp_[i], _v2.Temp_[i], 2)) 
}

function {:inline true} MS$_v1.quantization_loop_anon2_LoopHead$_v2.quantization_loop_anon2_LoopHead(_v1.in_data: [int]int, 
    _v1.in_i: int, 
    _v1.in_value: int, 
    _v1.Temp_old: [int]int, 
    _v1.Temp_: [int]int, 
    _v1.out_i: int, 
    _v1.out_value: int, 
    _v2.in_i: int, 
    _v2.in_value: int, 
    _v2.in_data_approx: [int]int, 
    _v2.Temp_old: [int]int, 
    _v2.Temp_: [int]int, 
    _v2.out_i: int, 
    _v2.out_value: int)
   : bool
{
  RelaxedAfter(_v2.Temp_, _v1.Temp_, 2, _v1.out_i) 
}

function {:inline true} MS_pre_$_v1.quantization_loop_anon2_LoopHead$_v2.quantization_loop_anon2_LoopHead(_v1.in_data: [int]int, 
    _v1.in_i: int, 
    _v1.in_value: int, 
    _v1.Temp_old: [int]int, 
    _v2.in_i: int, 
    _v2.in_value: int, 
    _v2.in_data_approx: [int]int, 
    _v2.Temp_old: [int]int)
   : bool
{
  RelaxedBefore(_v2.in_data_approx, _v1.in_data, 16, _v1.in_i) && RelaxedAfter(_v2.Temp_old, _v1.Temp_old, 2, _v1.in_i) 
}
