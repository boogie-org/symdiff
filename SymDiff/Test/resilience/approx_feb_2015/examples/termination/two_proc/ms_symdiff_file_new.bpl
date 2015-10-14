function {:inline true} MS_pre_$_v1.Foo$_v2.Foo(_v1.x: int, _v2.x: int) : bool
{
 _v1.x <= _v2.x && _v1.x >= _v2.x 
}

function {:inline true} MS$_v1.Foo$_v2.Foo(_v1.x: int, _v1.r: int, _v2.x: int, _v2.r: int) : bool
{
  _v1.r >= _v2.r
}

function {:inline true} MS_pre_$_v1.Main$_v2.Main(_v1.x: int, _v2.x: int) : bool
{
 _v1.x == _v2.x 
}

function {:inline true} MS_pre_$_v1.Main_loop_anon2_LoopHead$_v2.Main_loop_anon2_LoopHead(_v1.in_x_in: int, _v1.in_i: int, _v2.in_x_in: int, _v2.in_i: int) : bool
{
  
  _v2.in_x_in <= _v1.in_x_in && _v1.in_i <= _v2.in_i
}


function {:inline true} MS$_v1.Main_loop_anon2_LoopHead$_v2.Main_loop_anon2_LoopHead(_v1.in_x_in: int, 
    _v1.in_i: int, 
    _v1.out_i: int, 
    _v2.in_x_in: int, 
    _v2.in_i: int, 
    _v2.out_i: int)
   : bool
{
 true 
}

function {:inline true} MS$_v1.Main$_v2.Main(_v1.x: int, _v1.r: int, _v2.x: int, _v2.r: int) : bool
{
 true 
}
