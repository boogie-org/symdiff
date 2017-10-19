function {:inline true} MS$_v1.foo$_v2.foo(_v1.x_old: int, 
    _v1.n_old: int, 
    _v1.cf_old: int, 
    _v1.OK_old: bool, 
    _v1.cf_: int, 
    _v1.x_: int, 
    _v1.n_: int, 
    _v1.r: int, 
    _v2.x_old: int, 
    _v2.n_old: int, 
    _v2.cf_old: int, 
    _v2.OK_old: bool, 
    _v2.cf_: int, 
    _v2.x_: int, 
    _v2.n_: int, 
    _v2.r: int)
   : bool
{
  (_v1.cf_ == _v2.cf_) //manual
}


function {:inline true} MS_pre_$_v1.foo_loop_anon4_LoopHead$_v2.foo_loop_anon4_LoopHead(_v1.in_r: int, 
    _v1.x_old: int, 
    _v1.n_old: int, 
    _v1.cf_old: int, 
    _v1.OK_old: bool, 
    _v2.in_r: int, 
    _v2.x_old: int, 
    _v2.n_old: int, 
    _v2.cf_old: int, 
    _v2.OK_old: bool) 
   : bool
{
 (_v1.x_old > 0) <==> (_v2.x_old > 0) //manual
}
