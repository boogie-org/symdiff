function {:inline true} MS_pre_$_v1.gradient_descent$_v2.gradient_descent(_v1.x: int, 
    _v1.gamma: int, 
    _v1.precision_old: int, 
    _v2.x: int, 
    _v2.gamma: int, 
    _v2.precision_old: int)
   : bool
{
  _v1.x == _v2.x && _v1.precision_old <= _v2.precision_old && _v1.gamma == _v2.gamma 
}

function {:inline true} MS_pre_$_v1.gradient_descent_loop_anon2_LoopHead$_v2.gradient_descent_loop_anon2_LoopHead(_v1.in_gamma: int, 
    _v1.in_x_new: int, 
    _v1.in_x_old: int, 
    _v1.precision_old: int, 
    _v2.in_gamma: int, 
    _v2.in_x_new: int, 
    _v2.in_x_old: int, 
    _v2.precision_old: int)
   : bool
{
   _v1.in_x_new == _v2.in_x_new && _v1.in_x_old == _v2.in_x_old && _v1.precision_old <= _v2.precision_old && _v1.in_gamma == _v2.in_gamma 
}
