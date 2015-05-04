var _v2.x: int;

var _v2.n: int;

var _v2.cf: int;

function _v2.trackCF(a: int, b: int) : int;

procedure _v2.foo() returns (r: int);
  modifies _v2.cf, _v2.x, _v2.n;
  free ensures {:io_dependency "cf", "cf", "n", "x"} true;
  free ensures {:io_dependency "x", "x"} true;
  free ensures {:io_dependency "n", "n", "x"} true;
  free ensures {:io_dependency "r", "n", "x"} true;
  free ensures {:io_dependency "cf", "cf", "n", "x"} true;
  free ensures {:io_dependency "x", "x"} true;
  free ensures {:io_dependency "n", "n", "x"} true;
  free ensures {:io_dependency "r", "n", "x"} true;
  free ensures _v2.OK ==> old(_v2.OK);



procedure _v2.foo_loop_anon4_LoopHead(in_r: int) returns (out_r: int);
  modifies _v2.cf, _v2.n;
  free ensures {:io_dependency "cf", "cf", "n", "x"} true;
  free ensures {:io_dependency "n", "n", "x"} true;
  free ensures {:io_dependency "out_r", "in_r", "n", "x"} true;
  free ensures {:io_dependency "cf", "cf", "n", "x"} true;
  free ensures {:io_dependency "n", "n", "x"} true;
  free ensures {:io_dependency "out_r", "in_r", "n", "x"} true;
  free ensures _v2.OK ==> old(_v2.OK);
  ensures _houdini_18 ==> in_r <= out_r;
  ensures _houdini_19 ==> out_r <= in_r;



implementation _v2.foo() returns (r: int)
{
  var y: int;

  L0:
    _v2.cf := _v2.trackCF(_v2.cf, 1);
    y := _v2.x + 3;
    havoc y;
    assume y != 0;
    y := y * y;
    _v2.x := _v2.x * y;
    r := 0;
    goto anon4_LoopHead;

  anon4_LoopHead:
    call r := _v2.foo_loop_anon4_LoopHead(r);
    goto anon4_LoopHead_last;

  anon4_LoopHead_last:
    goto anon4_LoopDone, anon4_LoopBody;

  anon4_LoopBody:
    assume {:partition} 0 < _v2.n && _v2.n < 1000;
    _v2.cf := _v2.trackCF(_v2.cf, 2);
    goto anon5_Then, anon5_Else;

  anon5_Else:
    assume {:partition} 0 >= _v2.x;
    _v2.cf := _v2.trackCF(_v2.cf, 4);
    _v2.n := _v2.n - 1;
    r := r - _v2.n;
    goto anon5_Else_dummy;

  anon5_Else_dummy:
    assume false;
    return;

  anon5_Then:
    assume {:partition} _v2.x > 0;
    _v2.cf := _v2.trackCF(_v2.cf, 3);
    _v2.n := _v2.n + 1;
    r := r + _v2.n;
    goto anon5_Then_dummy;

  anon5_Then_dummy:
    assume false;
    return;

  anon4_LoopDone:
    assume {:partition} !(0 < _v2.n && _v2.n < 1000);
    goto anon3;

  anon3:
    _v2.cf := _v2.trackCF(_v2.cf, 5);
    return;
}



implementation _v2.foo_loop_anon4_LoopHead(in_r: int) returns (out_r: int)
{

  entry:
    out_r := in_r;
    goto anon4_LoopHead;

  anon4_LoopHead:
    goto anon4_LoopDone, anon4_LoopBody;

  anon4_LoopBody:
    assume {:partition} 0 < _v2.n && _v2.n < 1000;
    _v2.cf := _v2.trackCF(_v2.cf, 2);
    goto anon5_Then, anon5_Else;

  anon5_Else:
    assume {:partition} 0 >= _v2.x;
    _v2.cf := _v2.trackCF(_v2.cf, 4);
    _v2.n := _v2.n - 1;
    out_r := out_r - _v2.n;
    goto anon5_Else_dummy;

  anon5_Else_dummy:
    call out_r := _v2.foo_loop_anon4_LoopHead(out_r);
    return;

  anon5_Then:
    assume {:partition} _v2.x > 0;
    _v2.cf := _v2.trackCF(_v2.cf, 3);
    _v2.n := _v2.n + 1;
    out_r := out_r + _v2.n;
    out_r := in_r;
    _v2.cf, _v2.n := old(_v2.cf), old(_v2.n);
    goto anon5_Then_dummy;

  anon5_Then_dummy:
    call out_r := _v2.foo_loop_anon4_LoopHead(out_r);
    return;

  anon4_LoopDone:
    assume {:partition} !(0 < _v2.n && _v2.n < 1000);
    out_r := in_r;
    _v2.cf, _v2.n := old(_v2.cf), old(_v2.n);
    return;
}



var _v2.OK: bool;

var _v1.x: int;

var _v1.n: int;

var _v1.cf: int;

procedure _v1.foo() returns (r: int);
  modifies _v1.cf, _v1.x, _v1.n;
  free ensures {:io_dependency "cf", "cf", "n", "x"} true;
  free ensures {:io_dependency "x", "x"} true;
  free ensures {:io_dependency "n", "n", "x"} true;
  free ensures {:io_dependency "r", "n", "x"} true;
  free ensures {:io_dependency "cf", "cf", "n", "x"} true;
  free ensures {:io_dependency "x", "x"} true;
  free ensures {:io_dependency "n", "n", "x"} true;
  free ensures {:io_dependency "r", "n", "x"} true;
  free ensures _v1.OK ==> old(_v1.OK);



procedure _v1.foo_loop_anon4_LoopHead(in_r: int) returns (out_r: int);
  modifies _v1.cf, _v1.n;
  free ensures {:io_dependency "cf", "cf", "n", "x"} true;
  free ensures {:io_dependency "n", "n", "x"} true;
  free ensures {:io_dependency "out_r", "in_r", "n", "x"} true;
  free ensures {:io_dependency "cf", "cf", "n", "x"} true;
  free ensures {:io_dependency "n", "n", "x"} true;
  free ensures {:io_dependency "out_r", "in_r", "n", "x"} true;
  free ensures _v1.OK ==> old(_v1.OK);
  ensures _houdini_16 ==> in_r <= out_r;
  ensures _houdini_17 ==> out_r <= in_r;



implementation _v1.foo() returns (r: int)
{
  var y: int;

  L0:
    _v1.cf := _v2.trackCF(_v1.cf, 1);
    y := _v1.x + 3;
    y := y * y;
    _v1.x := _v1.x * y;
    r := 0;
    goto anon4_LoopHead;

  anon4_LoopHead:
    call r := _v1.foo_loop_anon4_LoopHead(r);
    goto anon4_LoopHead_last;

  anon4_LoopHead_last:
    goto anon4_LoopDone, anon4_LoopBody;

  anon4_LoopBody:
    assume {:partition} 0 < _v1.n && _v1.n < 1000;
    _v1.cf := _v2.trackCF(_v1.cf, 2);
    goto anon5_Then, anon5_Else;

  anon5_Else:
    assume {:partition} 0 >= _v1.x;
    _v1.cf := _v2.trackCF(_v1.cf, 4);
    _v1.n := _v1.n - 1;
    r := r - _v1.n;
    goto anon5_Else_dummy;

  anon5_Else_dummy:
    assume false;
    return;

  anon5_Then:
    assume {:partition} _v1.x > 0;
    _v1.cf := _v2.trackCF(_v1.cf, 3);
    _v1.n := _v1.n + 1;
    r := r + _v1.n;
    goto anon5_Then_dummy;

  anon5_Then_dummy:
    assume false;
    return;

  anon4_LoopDone:
    assume {:partition} !(0 < _v1.n && _v1.n < 1000);
    goto anon3;

  anon3:
    _v1.cf := _v2.trackCF(_v1.cf, 5);
    return;
}



implementation _v1.foo_loop_anon4_LoopHead(in_r: int) returns (out_r: int)
{

  entry:
    out_r := in_r;
    goto anon4_LoopHead;

  anon4_LoopHead:
    goto anon4_LoopDone, anon4_LoopBody;

  anon4_LoopBody:
    assume {:partition} 0 < _v1.n && _v1.n < 1000;
    _v1.cf := _v2.trackCF(_v1.cf, 2);
    goto anon5_Then, anon5_Else;

  anon5_Else:
    assume {:partition} 0 >= _v1.x;
    _v1.cf := _v2.trackCF(_v1.cf, 4);
    _v1.n := _v1.n - 1;
    out_r := out_r - _v1.n;
    goto anon5_Else_dummy;

  anon5_Else_dummy:
    call out_r := _v1.foo_loop_anon4_LoopHead(out_r);
    return;

  anon5_Then:
    assume {:partition} _v1.x > 0;
    _v1.cf := _v2.trackCF(_v1.cf, 3);
    _v1.n := _v1.n + 1;
    out_r := out_r + _v1.n;
    out_r := in_r;
    _v1.cf, _v1.n := old(_v1.cf), old(_v1.n);
    goto anon5_Then_dummy;

  anon5_Then_dummy:
    call out_r := _v1.foo_loop_anon4_LoopHead(out_r);
    return;

  anon4_LoopDone:
    assume {:partition} !(0 < _v1.n && _v1.n < 1000);
    out_r := in_r;
    _v1.cf, _v1.n := old(_v1.cf), old(_v1.n);
    return;
}



var _v1.OK: bool;

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
  _v1.cf_ == _v2.cf_
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
  _v1.x_old > 0 <==> _v2.x_old > 0
}

function {:inline true} MS_pre_$_v1.foo$_v2.foo(_v1.x_old: int, 
    _v1.n_old: int, 
    _v1.cf_old: int, 
    _v1.OK_old: bool, 
    _v2.x_old: int, 
    _v2.n_old: int, 
    _v2.cf_old: int, 
    _v2.OK_old: bool)
   : bool
{
  true
}

procedure MS_Check__v1.foo___v2.foo() returns (_v1.r: int, _v2.r: int);
  requires MS_pre_$_v1.foo$_v2.foo(_v1.x, _v1.n, _v1.cf, _v1.OK, _v2.x, _v2.n, _v2.cf, _v2.OK);
  requires _v1.x == _v2.x && _v1.n == _v2.n && _v1.cf == _v2.cf && (_v1.OK <==> _v2.OK);
  modifies _v1.cf, _v1.x, _v1.n, _v2.cf, _v2.x, _v2.n;
  ensures MS$_v1.foo$_v2.foo(old(_v1.x), 
  old(_v1.n), 
  old(_v1.cf), 
  old(_v1.OK), 
  _v1.cf, 
  _v1.x, 
  _v1.n, 
  _v1.r, 
  old(_v2.x), 
  old(_v2.n), 
  old(_v2.cf), 
  old(_v2.OK), 
  _v2.cf, 
  _v2.x, 
  _v2.n, 
  _v2.r);
  ensures _v1.OK ==> _v2.OK;



implementation MS_Check__v1.foo___v2.foo() returns (_v1.r: int, _v2.r: int)
{
  var inline$_v1.foo$0$y: int;
  var inline$_v1.foo$0$r: int;
  var inline$_v1.foo$0$_v1.cf: int;
  var inline$_v1.foo$0$_v1.x: int;
  var inline$_v1.foo$0$_v1.n: int;
  var inline$_v2.foo$0$y: int;
  var inline$_v2.foo$0$r: int;
  var inline$_v2.foo$0$_v2.cf: int;
  var inline$_v2.foo$0$_v2.x: int;
  var inline$_v2.foo$0$_v2.n: int;
  var _v1.foo_loop_anon4_LoopHead_1_done: bool;
  var _v1.foo_loop_anon4_LoopHead_in_1_0: int;
  var _v1.foo_loop_anon4_LoopHead_in_1_1: int;
  var _v1.foo_loop_anon4_LoopHead_in_1_2: int;
  var _v1.foo_loop_anon4_LoopHead_in_1_3: int;
  var _v1.foo_loop_anon4_LoopHead_out_1_0: int;
  var _v1.foo_loop_anon4_LoopHead_out_1_1: int;
  var _v1.foo_loop_anon4_LoopHead_out_1_2: int;
  var _v2.foo_loop_anon4_LoopHead_2_done: bool;
  var _v2.foo_loop_anon4_LoopHead_in_2_0: int;
  var _v2.foo_loop_anon4_LoopHead_in_2_1: int;
  var _v2.foo_loop_anon4_LoopHead_in_2_2: int;
  var _v2.foo_loop_anon4_LoopHead_in_2_3: int;
  var _v2.foo_loop_anon4_LoopHead_out_2_0: int;
  var _v2.foo_loop_anon4_LoopHead_out_2_1: int;
  var _v2.foo_loop_anon4_LoopHead_out_2_2: int;
  var store__0__v1.cf: int;
  var store__0__v1.x: int;
  var store__0__v1.n: int;
  var store__0__v2.cf: int;
  var store__0__v2.x: int;
  var store__0__v2.n: int;
  var out__v1.foo_loop_anon4_LoopHead_out_1_0_0: int;
  var out__v2.foo_loop_anon4_LoopHead_out_2_0_0: int;

  START:
    _v1.foo_loop_anon4_LoopHead_1_done, _v2.foo_loop_anon4_LoopHead_2_done := false, false;
    goto inline$_v1.foo$0$Entry;

  inline$_v1.foo$0$Entry:
    havoc inline$_v1.foo$0$y, inline$_v1.foo$0$r;
    inline$_v1.foo$0$_v1.cf := _v1.cf;
    inline$_v1.foo$0$_v1.x := _v1.x;
    inline$_v1.foo$0$_v1.n := _v1.n;
    goto inline$_v1.foo$0$L0;

  inline$_v1.foo$0$L0:
    _v1.cf := _v2.trackCF(_v1.cf, 1);
    inline$_v1.foo$0$y := _v1.x + 3;
    inline$_v1.foo$0$y := inline$_v1.foo$0$y * inline$_v1.foo$0$y;
    _v1.x := _v1.x * inline$_v1.foo$0$y;
    inline$_v1.foo$0$r := 0;
    goto inline$_v1.foo$0$anon4_LoopHead;

  inline$_v1.foo$0$anon4_LoopHead:
    _v1.foo_loop_anon4_LoopHead_in_1_0, _v1.foo_loop_anon4_LoopHead_in_1_1, _v1.foo_loop_anon4_LoopHead_in_1_2, _v1.foo_loop_anon4_LoopHead_in_1_3 := inline$_v1.foo$0$r, _v1.cf, _v1.x, _v1.n;
    call inline$_v1.foo$0$r := _v1.foo_loop_anon4_LoopHead(inline$_v1.foo$0$r);
    _v1.foo_loop_anon4_LoopHead_1_done := true;
    _v1.foo_loop_anon4_LoopHead_out_1_0, _v1.foo_loop_anon4_LoopHead_out_1_1, _v1.foo_loop_anon4_LoopHead_out_1_2 := inline$_v1.foo$0$r, _v1.cf, _v1.n;
    goto inline$_v1.foo$0$anon4_LoopHead_last;

  inline$_v1.foo$0$anon4_LoopHead_last:
    goto inline$_v1.foo$0$anon4_LoopDone, inline$_v1.foo$0$anon4_LoopBody;

  inline$_v1.foo$0$anon4_LoopBody:
    assume {:partition} 0 < _v1.n && _v1.n < 1000;
    _v1.cf := _v2.trackCF(_v1.cf, 2);
    goto inline$_v1.foo$0$anon5_Then, inline$_v1.foo$0$anon5_Else;

  inline$_v1.foo$0$anon5_Else:
    assume {:partition} 0 >= _v1.x;
    _v1.cf := _v2.trackCF(_v1.cf, 4);
    _v1.n := _v1.n - 1;
    inline$_v1.foo$0$r := inline$_v1.foo$0$r - _v1.n;
    goto inline$_v1.foo$0$anon5_Else_dummy;

  inline$_v1.foo$0$anon5_Else_dummy:
    assume false;
    goto inline$_v1.foo$0$Return;

  inline$_v1.foo$0$anon5_Then:
    assume {:partition} _v1.x > 0;
    _v1.cf := _v2.trackCF(_v1.cf, 3);
    _v1.n := _v1.n + 1;
    inline$_v1.foo$0$r := inline$_v1.foo$0$r + _v1.n;
    goto inline$_v1.foo$0$anon5_Then_dummy;

  inline$_v1.foo$0$anon5_Then_dummy:
    assume false;
    goto inline$_v1.foo$0$Return;

  inline$_v1.foo$0$anon4_LoopDone:
    assume {:partition} !(0 < _v1.n && _v1.n < 1000);
    goto inline$_v1.foo$0$anon3;

  inline$_v1.foo$0$anon3:
    _v1.cf := _v2.trackCF(_v1.cf, 5);
    goto inline$_v1.foo$0$Return;

  inline$_v1.foo$0$Return:
    assume true;
    assume true;
    assume true;
    assume true;
    assume true;
    assume true;
    assume true;
    assume true;
    assume true;
    _v1.r := inline$_v1.foo$0$r;
    goto START$1;

  START$1:
    goto inline$_v2.foo$0$Entry;

  inline$_v2.foo$0$Entry:
    havoc inline$_v2.foo$0$y, inline$_v2.foo$0$r;
    inline$_v2.foo$0$_v2.cf := _v2.cf;
    inline$_v2.foo$0$_v2.x := _v2.x;
    inline$_v2.foo$0$_v2.n := _v2.n;
    goto inline$_v2.foo$0$L0;

  inline$_v2.foo$0$L0:
    _v2.cf := _v2.trackCF(_v2.cf, 1);
    inline$_v2.foo$0$y := _v2.x + 3;
    havoc inline$_v2.foo$0$y;
    assume inline$_v2.foo$0$y != 0;
    inline$_v2.foo$0$y := inline$_v2.foo$0$y * inline$_v2.foo$0$y;
    _v2.x := _v2.x * inline$_v2.foo$0$y;
    inline$_v2.foo$0$r := 0;
    goto inline$_v2.foo$0$anon4_LoopHead;

  inline$_v2.foo$0$anon4_LoopHead:
    _v2.foo_loop_anon4_LoopHead_in_2_0, _v2.foo_loop_anon4_LoopHead_in_2_1, _v2.foo_loop_anon4_LoopHead_in_2_2, _v2.foo_loop_anon4_LoopHead_in_2_3 := inline$_v2.foo$0$r, _v2.cf, _v2.x, _v2.n;
    call inline$_v2.foo$0$r := _v2.foo_loop_anon4_LoopHead(inline$_v2.foo$0$r);
    _v2.foo_loop_anon4_LoopHead_2_done := true;
    _v2.foo_loop_anon4_LoopHead_out_2_0, _v2.foo_loop_anon4_LoopHead_out_2_1, _v2.foo_loop_anon4_LoopHead_out_2_2 := inline$_v2.foo$0$r, _v2.cf, _v2.n;
    goto inline$_v2.foo$0$anon4_LoopHead_last;

  inline$_v2.foo$0$anon4_LoopHead_last:
    goto inline$_v2.foo$0$anon4_LoopDone, inline$_v2.foo$0$anon4_LoopBody;

  inline$_v2.foo$0$anon4_LoopBody:
    assume {:partition} 0 < _v2.n && _v2.n < 1000;
    _v2.cf := _v2.trackCF(_v2.cf, 2);
    goto inline$_v2.foo$0$anon5_Then, inline$_v2.foo$0$anon5_Else;

  inline$_v2.foo$0$anon5_Else:
    assume {:partition} 0 >= _v2.x;
    _v2.cf := _v2.trackCF(_v2.cf, 4);
    _v2.n := _v2.n - 1;
    inline$_v2.foo$0$r := inline$_v2.foo$0$r - _v2.n;
    goto inline$_v2.foo$0$anon5_Else_dummy;

  inline$_v2.foo$0$anon5_Else_dummy:
    assume false;
    goto inline$_v2.foo$0$Return;

  inline$_v2.foo$0$anon5_Then:
    assume {:partition} _v2.x > 0;
    _v2.cf := _v2.trackCF(_v2.cf, 3);
    _v2.n := _v2.n + 1;
    inline$_v2.foo$0$r := inline$_v2.foo$0$r + _v2.n;
    goto inline$_v2.foo$0$anon5_Then_dummy;

  inline$_v2.foo$0$anon5_Then_dummy:
    assume false;
    goto inline$_v2.foo$0$Return;

  inline$_v2.foo$0$anon4_LoopDone:
    assume {:partition} !(0 < _v2.n && _v2.n < 1000);
    goto inline$_v2.foo$0$anon3;

  inline$_v2.foo$0$anon3:
    _v2.cf := _v2.trackCF(_v2.cf, 5);
    goto inline$_v2.foo$0$Return;

  inline$_v2.foo$0$Return:
    assume true;
    assume true;
    assume true;
    assume true;
    assume true;
    assume true;
    assume true;
    assume true;
    assume true;
    _v2.r := inline$_v2.foo$0$r;
    goto START$2;

  START$2:
    goto MS_L_0_0;

  MS_L_0_0:
    goto MS_L_taken_0, MS_L_not_taken_0;

  MS_L_taken_0:
    assume _v1.foo_loop_anon4_LoopHead_1_done && _v2.foo_loop_anon4_LoopHead_2_done;
    store__0__v1.cf, store__0__v1.x, store__0__v1.n := _v1.cf, _v1.x, _v1.n;
    store__0__v2.cf, store__0__v2.x, store__0__v2.n := _v2.cf, _v2.x, _v2.n;
    _v1.cf, _v1.x, _v1.n := _v1.foo_loop_anon4_LoopHead_in_1_1, _v1.foo_loop_anon4_LoopHead_in_1_2, _v1.foo_loop_anon4_LoopHead_in_1_3;
    _v2.cf, _v2.x, _v2.n := _v2.foo_loop_anon4_LoopHead_in_2_1, _v2.foo_loop_anon4_LoopHead_in_2_2, _v2.foo_loop_anon4_LoopHead_in_2_3;
    call out__v1.foo_loop_anon4_LoopHead_out_1_0_0, out__v2.foo_loop_anon4_LoopHead_out_2_0_0 := MS_Check__v1.foo_loop_anon4_LoopHead___v2.foo_loop_anon4_LoopHead(_v1.foo_loop_anon4_LoopHead_in_1_0, _v2.foo_loop_anon4_LoopHead_in_2_0);
    assume _v1.cf == _v1.foo_loop_anon4_LoopHead_out_1_1
   && _v1.n == _v1.foo_loop_anon4_LoopHead_out_1_2;
    assume _v2.cf == _v2.foo_loop_anon4_LoopHead_out_2_1
   && _v2.n == _v2.foo_loop_anon4_LoopHead_out_2_2;
    assume _v1.foo_loop_anon4_LoopHead_out_1_0 == out__v1.foo_loop_anon4_LoopHead_out_1_0_0
   && _v2.foo_loop_anon4_LoopHead_out_2_0 == out__v2.foo_loop_anon4_LoopHead_out_2_0_0;
    _v1.cf, _v1.x, _v1.n := store__0__v1.cf, store__0__v1.x, store__0__v1.n;
    _v2.cf, _v2.x, _v2.n := store__0__v2.cf, store__0__v2.x, store__0__v2.n;
    goto MS_L_meet_0;

  MS_L_not_taken_0:
    assume !(_v1.foo_loop_anon4_LoopHead_1_done && _v2.foo_loop_anon4_LoopHead_2_done);
    goto MS_L_meet_0;

  MS_L_meet_0:
    return;
}



function {:inline true, true, true} {:inline} MS$_v1.foo_loop_anon4_LoopHead$_v2.foo_loop_anon4_LoopHead(_v1.in_r: int, 
    _v1.x_old: int, 
    _v1.n_old: int, 
    _v1.cf_old: int, 
    _v1.OK_old: bool, 
    _v1.cf_: int, 
    _v1.n_: int, 
    _v1.out_r: int, 
    _v2.in_r: int, 
    _v2.x_old: int, 
    _v2.n_old: int, 
    _v2.cf_old: int, 
    _v2.OK_old: bool, 
    _v2.cf_: int, 
    _v2.n_: int, 
    _v2.out_r: int)
   : bool
{
  true
}

const {:existential true} _houdini_0: bool;

const {:existential true} _houdini_1: bool;

const {:existential true} _houdini_2: bool;

const {:existential true} _houdini_3: bool;

const {:existential true} _houdini_4: bool;

const {:existential true} _houdini_5: bool;

const {:existential true} _houdini_6: bool;

const {:existential true} _houdini_7: bool;

const {:existential true} _houdini_8: bool;

const {:existential true} _houdini_9: bool;

const {:existential true} _houdini_10: bool;

const {:existential true} _houdini_11: bool;

const {:existential true} _houdini_12: bool;

const {:existential true} _houdini_13: bool;

const {:existential true} _houdini_14: bool;

const {:existential true} _houdini_15: bool;

const {:existential true} _houdini_16: bool;

const {:existential true} _houdini_17: bool;

const {:existential true} _houdini_18: bool;

const {:existential true} _houdini_19: bool;

procedure MS_Check__v1.foo_loop_anon4_LoopHead___v2.foo_loop_anon4_LoopHead(_v1.in_r: int, _v2.in_r: int) returns (_v1.out_r: int, _v2.out_r: int);
  requires MS_pre_$_v1.foo_loop_anon4_LoopHead$_v2.foo_loop_anon4_LoopHead(_v1.in_r, _v1.x, _v1.n, _v1.cf, _v1.OK, _v2.in_r, _v2.x, _v2.n, _v2.cf, _v2.OK);
  requires _houdini_6 ==> _v1.in_r <= _v2.in_r;
  requires _houdini_7 ==> _v2.in_r <= _v1.in_r;
  requires _houdini_8 ==> _v1.x <= _v2.x;
  requires _houdini_9 ==> _v2.x <= _v1.x;
  requires _houdini_10 ==> _v1.n <= _v2.n;
  requires _houdini_11 ==> _v2.n <= _v1.n;
  requires _houdini_12 ==> _v1.cf <= _v2.cf;
  requires _houdini_13 ==> _v2.cf <= _v1.cf;
  requires _houdini_14 ==> _v1.OK ==> _v2.OK;
  requires _houdini_15 ==> _v2.OK ==> _v1.OK;
  modifies _v1.cf, _v1.n, _v2.cf, _v2.n;
  ensures MS$_v1.foo_loop_anon4_LoopHead$_v2.foo_loop_anon4_LoopHead(_v1.in_r, 
  old(_v1.x), 
  old(_v1.n), 
  old(_v1.cf), 
  old(_v1.OK), 
  _v1.cf, 
  _v1.n, 
  _v1.out_r, 
  _v2.in_r, 
  old(_v2.x), 
  old(_v2.n), 
  old(_v2.cf), 
  old(_v2.OK), 
  _v2.cf, 
  _v2.n, 
  _v2.out_r);
  ensures _houdini_0 ==> _v1.out_r <= _v2.out_r;
  ensures _houdini_1 ==> _v2.out_r <= _v1.out_r;
  ensures _houdini_2 ==> _v1.cf <= _v2.cf;
  ensures _houdini_3 ==> _v2.cf <= _v1.cf;
  ensures _houdini_4 ==> _v1.n <= _v2.n;
  ensures _houdini_5 ==> _v2.n <= _v1.n;



implementation MS_Check__v1.foo_loop_anon4_LoopHead___v2.foo_loop_anon4_LoopHead(_v1.in_r: int, _v2.in_r: int) returns (_v1.out_r: int, _v2.out_r: int)
{
  var inline$_v1.foo_loop_anon4_LoopHead$0$in_r: int;
  var inline$_v1.foo_loop_anon4_LoopHead$0$out_r: int;
  var inline$_v1.foo_loop_anon4_LoopHead$0$_v1.cf: int;
  var inline$_v1.foo_loop_anon4_LoopHead$0$_v1.n: int;
  var inline$_v2.foo_loop_anon4_LoopHead$0$in_r: int;
  var inline$_v2.foo_loop_anon4_LoopHead$0$out_r: int;
  var inline$_v2.foo_loop_anon4_LoopHead$0$_v2.cf: int;
  var inline$_v2.foo_loop_anon4_LoopHead$0$_v2.n: int;
  var _v1.foo_loop_anon4_LoopHead_1_done: bool;
  var _v1.foo_loop_anon4_LoopHead_in_1_0: int;
  var _v1.foo_loop_anon4_LoopHead_in_1_1: int;
  var _v1.foo_loop_anon4_LoopHead_in_1_2: int;
  var _v1.foo_loop_anon4_LoopHead_out_1_0: int;
  var _v1.foo_loop_anon4_LoopHead_out_1_1: int;
  var _v1.foo_loop_anon4_LoopHead_out_1_2: int;
  var _v1.foo_loop_anon4_LoopHead_2_done: bool;
  var _v1.foo_loop_anon4_LoopHead_in_2_0: int;
  var _v1.foo_loop_anon4_LoopHead_in_2_1: int;
  var _v1.foo_loop_anon4_LoopHead_in_2_2: int;
  var _v1.foo_loop_anon4_LoopHead_out_2_0: int;
  var _v1.foo_loop_anon4_LoopHead_out_2_1: int;
  var _v1.foo_loop_anon4_LoopHead_out_2_2: int;
  var _v2.foo_loop_anon4_LoopHead_3_done: bool;
  var _v2.foo_loop_anon4_LoopHead_in_3_0: int;
  var _v2.foo_loop_anon4_LoopHead_in_3_1: int;
  var _v2.foo_loop_anon4_LoopHead_in_3_2: int;
  var _v2.foo_loop_anon4_LoopHead_out_3_0: int;
  var _v2.foo_loop_anon4_LoopHead_out_3_1: int;
  var _v2.foo_loop_anon4_LoopHead_out_3_2: int;
  var _v2.foo_loop_anon4_LoopHead_4_done: bool;
  var _v2.foo_loop_anon4_LoopHead_in_4_0: int;
  var _v2.foo_loop_anon4_LoopHead_in_4_1: int;
  var _v2.foo_loop_anon4_LoopHead_in_4_2: int;
  var _v2.foo_loop_anon4_LoopHead_out_4_0: int;
  var _v2.foo_loop_anon4_LoopHead_out_4_1: int;
  var _v2.foo_loop_anon4_LoopHead_out_4_2: int;
  var store__0__v1.cf: int;
  var store__0__v1.n: int;
  var store__0__v2.cf: int;
  var store__0__v2.n: int;
  var out__v1.foo_loop_anon4_LoopHead_out_1_0_0: int;
  var out__v2.foo_loop_anon4_LoopHead_out_3_0_0: int;
  var store__1__v1.cf: int;
  var store__1__v1.n: int;
  var store__1__v2.cf: int;
  var store__1__v2.n: int;
  var out__v1.foo_loop_anon4_LoopHead_out_1_0_1: int;
  var out__v2.foo_loop_anon4_LoopHead_out_4_0_1: int;
  var store__2__v1.cf: int;
  var store__2__v1.n: int;
  var store__2__v2.cf: int;
  var store__2__v2.n: int;
  var out__v1.foo_loop_anon4_LoopHead_out_2_0_2: int;
  var out__v2.foo_loop_anon4_LoopHead_out_3_0_2: int;
  var store__3__v1.cf: int;
  var store__3__v1.n: int;
  var store__3__v2.cf: int;
  var store__3__v2.n: int;
  var out__v1.foo_loop_anon4_LoopHead_out_2_0_3: int;
  var out__v2.foo_loop_anon4_LoopHead_out_4_0_3: int;

  START:
    _v1.foo_loop_anon4_LoopHead_1_done, _v1.foo_loop_anon4_LoopHead_2_done, _v2.foo_loop_anon4_LoopHead_3_done, _v2.foo_loop_anon4_LoopHead_4_done := false, false, false, false;
    goto inline$_v1.foo_loop_anon4_LoopHead$0$Entry;

  inline$_v1.foo_loop_anon4_LoopHead$0$Entry:
    inline$_v1.foo_loop_anon4_LoopHead$0$in_r := _v1.in_r;
    havoc inline$_v1.foo_loop_anon4_LoopHead$0$out_r;
    inline$_v1.foo_loop_anon4_LoopHead$0$_v1.cf := _v1.cf;
    inline$_v1.foo_loop_anon4_LoopHead$0$_v1.n := _v1.n;
    goto inline$_v1.foo_loop_anon4_LoopHead$0$entry;

  inline$_v1.foo_loop_anon4_LoopHead$0$entry:
    inline$_v1.foo_loop_anon4_LoopHead$0$out_r := inline$_v1.foo_loop_anon4_LoopHead$0$in_r;
    goto inline$_v1.foo_loop_anon4_LoopHead$0$anon4_LoopHead;

  inline$_v1.foo_loop_anon4_LoopHead$0$anon4_LoopHead:
    goto inline$_v1.foo_loop_anon4_LoopHead$0$anon4_LoopDone, inline$_v1.foo_loop_anon4_LoopHead$0$anon4_LoopBody;

  inline$_v1.foo_loop_anon4_LoopHead$0$anon4_LoopBody:
    assume {:partition} 0 < _v1.n && _v1.n < 1000;
    _v1.cf := _v2.trackCF(_v1.cf, 2);
    goto inline$_v1.foo_loop_anon4_LoopHead$0$anon5_Then, inline$_v1.foo_loop_anon4_LoopHead$0$anon5_Else;

  inline$_v1.foo_loop_anon4_LoopHead$0$anon5_Else:
    assume {:partition} 0 >= _v1.x;
    _v1.cf := _v2.trackCF(_v1.cf, 4);
    _v1.n := _v1.n - 1;
    inline$_v1.foo_loop_anon4_LoopHead$0$out_r := inline$_v1.foo_loop_anon4_LoopHead$0$out_r - _v1.n;
    goto inline$_v1.foo_loop_anon4_LoopHead$0$anon5_Else_dummy;

  inline$_v1.foo_loop_anon4_LoopHead$0$anon5_Else_dummy:
    _v1.foo_loop_anon4_LoopHead_in_1_0, _v1.foo_loop_anon4_LoopHead_in_1_1, _v1.foo_loop_anon4_LoopHead_in_1_2 := inline$_v1.foo_loop_anon4_LoopHead$0$out_r, _v1.cf, _v1.n;
    call inline$_v1.foo_loop_anon4_LoopHead$0$out_r := _v1.foo_loop_anon4_LoopHead(inline$_v1.foo_loop_anon4_LoopHead$0$out_r);
    _v1.foo_loop_anon4_LoopHead_1_done := true;
    _v1.foo_loop_anon4_LoopHead_out_1_0, _v1.foo_loop_anon4_LoopHead_out_1_1, _v1.foo_loop_anon4_LoopHead_out_1_2 := inline$_v1.foo_loop_anon4_LoopHead$0$out_r, _v1.cf, _v1.n;
    goto inline$_v1.foo_loop_anon4_LoopHead$0$Return;

  inline$_v1.foo_loop_anon4_LoopHead$0$anon5_Then:
    assume {:partition} _v1.x > 0;
    _v1.cf := _v2.trackCF(_v1.cf, 3);
    _v1.n := _v1.n + 1;
    inline$_v1.foo_loop_anon4_LoopHead$0$out_r := inline$_v1.foo_loop_anon4_LoopHead$0$out_r + _v1.n;
    inline$_v1.foo_loop_anon4_LoopHead$0$out_r := inline$_v1.foo_loop_anon4_LoopHead$0$in_r;
    _v1.cf, _v1.n := inline$_v1.foo_loop_anon4_LoopHead$0$_v1.cf, inline$_v1.foo_loop_anon4_LoopHead$0$_v1.n;
    goto inline$_v1.foo_loop_anon4_LoopHead$0$anon5_Then_dummy;

  inline$_v1.foo_loop_anon4_LoopHead$0$anon5_Then_dummy:
    _v1.foo_loop_anon4_LoopHead_in_2_0, _v1.foo_loop_anon4_LoopHead_in_2_1, _v1.foo_loop_anon4_LoopHead_in_2_2 := inline$_v1.foo_loop_anon4_LoopHead$0$out_r, _v1.cf, _v1.n;
    call inline$_v1.foo_loop_anon4_LoopHead$0$out_r := _v1.foo_loop_anon4_LoopHead(inline$_v1.foo_loop_anon4_LoopHead$0$out_r);
    _v1.foo_loop_anon4_LoopHead_2_done := true;
    _v1.foo_loop_anon4_LoopHead_out_2_0, _v1.foo_loop_anon4_LoopHead_out_2_1, _v1.foo_loop_anon4_LoopHead_out_2_2 := inline$_v1.foo_loop_anon4_LoopHead$0$out_r, _v1.cf, _v1.n;
    goto inline$_v1.foo_loop_anon4_LoopHead$0$Return;

  inline$_v1.foo_loop_anon4_LoopHead$0$anon4_LoopDone:
    assume {:partition} !(0 < _v1.n && _v1.n < 1000);
    inline$_v1.foo_loop_anon4_LoopHead$0$out_r := inline$_v1.foo_loop_anon4_LoopHead$0$in_r;
    _v1.cf, _v1.n := inline$_v1.foo_loop_anon4_LoopHead$0$_v1.cf, inline$_v1.foo_loop_anon4_LoopHead$0$_v1.n;
    goto inline$_v1.foo_loop_anon4_LoopHead$0$Return;

  inline$_v1.foo_loop_anon4_LoopHead$0$Return:
    assume true;
    assume true;
    assume true;
    assume true;
    assume true;
    assume true;
    assume true;
    assert _houdini_16
   ==> inline$_v1.foo_loop_anon4_LoopHead$0$in_r
     <= inline$_v1.foo_loop_anon4_LoopHead$0$out_r;
    assert _houdini_17
   ==> inline$_v1.foo_loop_anon4_LoopHead$0$out_r
     <= inline$_v1.foo_loop_anon4_LoopHead$0$in_r;
    _v1.out_r := inline$_v1.foo_loop_anon4_LoopHead$0$out_r;
    goto START$1;

  START$1:
    goto inline$_v2.foo_loop_anon4_LoopHead$0$Entry;

  inline$_v2.foo_loop_anon4_LoopHead$0$Entry:
    inline$_v2.foo_loop_anon4_LoopHead$0$in_r := _v2.in_r;
    havoc inline$_v2.foo_loop_anon4_LoopHead$0$out_r;
    inline$_v2.foo_loop_anon4_LoopHead$0$_v2.cf := _v2.cf;
    inline$_v2.foo_loop_anon4_LoopHead$0$_v2.n := _v2.n;
    goto inline$_v2.foo_loop_anon4_LoopHead$0$entry;

  inline$_v2.foo_loop_anon4_LoopHead$0$entry:
    inline$_v2.foo_loop_anon4_LoopHead$0$out_r := inline$_v2.foo_loop_anon4_LoopHead$0$in_r;
    goto inline$_v2.foo_loop_anon4_LoopHead$0$anon4_LoopHead;

  inline$_v2.foo_loop_anon4_LoopHead$0$anon4_LoopHead:
    goto inline$_v2.foo_loop_anon4_LoopHead$0$anon4_LoopDone, inline$_v2.foo_loop_anon4_LoopHead$0$anon4_LoopBody;

  inline$_v2.foo_loop_anon4_LoopHead$0$anon4_LoopBody:
    assume {:partition} 0 < _v2.n && _v2.n < 1000;
    _v2.cf := _v2.trackCF(_v2.cf, 2);
    goto inline$_v2.foo_loop_anon4_LoopHead$0$anon5_Then, inline$_v2.foo_loop_anon4_LoopHead$0$anon5_Else;

  inline$_v2.foo_loop_anon4_LoopHead$0$anon5_Else:
    assume {:partition} 0 >= _v2.x;
    _v2.cf := _v2.trackCF(_v2.cf, 4);
    _v2.n := _v2.n - 1;
    inline$_v2.foo_loop_anon4_LoopHead$0$out_r := inline$_v2.foo_loop_anon4_LoopHead$0$out_r - _v2.n;
    goto inline$_v2.foo_loop_anon4_LoopHead$0$anon5_Else_dummy;

  inline$_v2.foo_loop_anon4_LoopHead$0$anon5_Else_dummy:
    _v2.foo_loop_anon4_LoopHead_in_3_0, _v2.foo_loop_anon4_LoopHead_in_3_1, _v2.foo_loop_anon4_LoopHead_in_3_2 := inline$_v2.foo_loop_anon4_LoopHead$0$out_r, _v2.cf, _v2.n;
    call inline$_v2.foo_loop_anon4_LoopHead$0$out_r := _v2.foo_loop_anon4_LoopHead(inline$_v2.foo_loop_anon4_LoopHead$0$out_r);
    _v2.foo_loop_anon4_LoopHead_3_done := true;
    _v2.foo_loop_anon4_LoopHead_out_3_0, _v2.foo_loop_anon4_LoopHead_out_3_1, _v2.foo_loop_anon4_LoopHead_out_3_2 := inline$_v2.foo_loop_anon4_LoopHead$0$out_r, _v2.cf, _v2.n;
    goto inline$_v2.foo_loop_anon4_LoopHead$0$Return;

  inline$_v2.foo_loop_anon4_LoopHead$0$anon5_Then:
    assume {:partition} _v2.x > 0;
    _v2.cf := _v2.trackCF(_v2.cf, 3);
    _v2.n := _v2.n + 1;
    inline$_v2.foo_loop_anon4_LoopHead$0$out_r := inline$_v2.foo_loop_anon4_LoopHead$0$out_r + _v2.n;
    inline$_v2.foo_loop_anon4_LoopHead$0$out_r := inline$_v2.foo_loop_anon4_LoopHead$0$in_r;
    _v2.cf, _v2.n := inline$_v2.foo_loop_anon4_LoopHead$0$_v2.cf, inline$_v2.foo_loop_anon4_LoopHead$0$_v2.n;
    goto inline$_v2.foo_loop_anon4_LoopHead$0$anon5_Then_dummy;

  inline$_v2.foo_loop_anon4_LoopHead$0$anon5_Then_dummy:
    _v2.foo_loop_anon4_LoopHead_in_4_0, _v2.foo_loop_anon4_LoopHead_in_4_1, _v2.foo_loop_anon4_LoopHead_in_4_2 := inline$_v2.foo_loop_anon4_LoopHead$0$out_r, _v2.cf, _v2.n;
    call inline$_v2.foo_loop_anon4_LoopHead$0$out_r := _v2.foo_loop_anon4_LoopHead(inline$_v2.foo_loop_anon4_LoopHead$0$out_r);
    _v2.foo_loop_anon4_LoopHead_4_done := true;
    _v2.foo_loop_anon4_LoopHead_out_4_0, _v2.foo_loop_anon4_LoopHead_out_4_1, _v2.foo_loop_anon4_LoopHead_out_4_2 := inline$_v2.foo_loop_anon4_LoopHead$0$out_r, _v2.cf, _v2.n;
    goto inline$_v2.foo_loop_anon4_LoopHead$0$Return;

  inline$_v2.foo_loop_anon4_LoopHead$0$anon4_LoopDone:
    assume {:partition} !(0 < _v2.n && _v2.n < 1000);
    inline$_v2.foo_loop_anon4_LoopHead$0$out_r := inline$_v2.foo_loop_anon4_LoopHead$0$in_r;
    _v2.cf, _v2.n := inline$_v2.foo_loop_anon4_LoopHead$0$_v2.cf, inline$_v2.foo_loop_anon4_LoopHead$0$_v2.n;
    goto inline$_v2.foo_loop_anon4_LoopHead$0$Return;

  inline$_v2.foo_loop_anon4_LoopHead$0$Return:
    assume true;
    assume true;
    assume true;
    assume true;
    assume true;
    assume true;
    assume true;
    assert _houdini_18
   ==> inline$_v2.foo_loop_anon4_LoopHead$0$in_r
     <= inline$_v2.foo_loop_anon4_LoopHead$0$out_r;
    assert _houdini_19
   ==> inline$_v2.foo_loop_anon4_LoopHead$0$out_r
     <= inline$_v2.foo_loop_anon4_LoopHead$0$in_r;
    _v2.out_r := inline$_v2.foo_loop_anon4_LoopHead$0$out_r;
    goto START$2;

  START$2:
    goto MS_L_0_3;

  MS_L_0_0:
    goto MS_L_taken_0, MS_L_not_taken_0;

  MS_L_taken_0:
    assume _v1.foo_loop_anon4_LoopHead_1_done && _v2.foo_loop_anon4_LoopHead_3_done;
    store__0__v1.cf, store__0__v1.n := _v1.cf, _v1.n;
    store__0__v2.cf, store__0__v2.n := _v2.cf, _v2.n;
    _v1.cf, _v1.n := _v1.foo_loop_anon4_LoopHead_in_1_1, _v1.foo_loop_anon4_LoopHead_in_1_2;
    _v2.cf, _v2.n := _v2.foo_loop_anon4_LoopHead_in_3_1, _v2.foo_loop_anon4_LoopHead_in_3_2;
    call out__v1.foo_loop_anon4_LoopHead_out_1_0_0, out__v2.foo_loop_anon4_LoopHead_out_3_0_0 := MS_Check__v1.foo_loop_anon4_LoopHead___v2.foo_loop_anon4_LoopHead(_v1.foo_loop_anon4_LoopHead_in_1_0, _v2.foo_loop_anon4_LoopHead_in_3_0);
    assume _v1.cf == _v1.foo_loop_anon4_LoopHead_out_1_1
   && _v1.n == _v1.foo_loop_anon4_LoopHead_out_1_2;
    assume _v2.cf == _v2.foo_loop_anon4_LoopHead_out_3_1
   && _v2.n == _v2.foo_loop_anon4_LoopHead_out_3_2;
    assume _v1.foo_loop_anon4_LoopHead_out_1_0 == out__v1.foo_loop_anon4_LoopHead_out_1_0_0
   && _v2.foo_loop_anon4_LoopHead_out_3_0 == out__v2.foo_loop_anon4_LoopHead_out_3_0_0;
    _v1.cf, _v1.n := store__0__v1.cf, store__0__v1.n;
    _v2.cf, _v2.n := store__0__v2.cf, store__0__v2.n;
    goto MS_L_meet_0;

  MS_L_not_taken_0:
    assume !(_v1.foo_loop_anon4_LoopHead_1_done && _v2.foo_loop_anon4_LoopHead_3_done);
    goto MS_L_meet_0;

  MS_L_meet_0:
    return;

  MS_L_0_1:
    goto MS_L_taken_1, MS_L_not_taken_1;

  MS_L_taken_1:
    assume _v1.foo_loop_anon4_LoopHead_1_done && _v2.foo_loop_anon4_LoopHead_4_done;
    store__1__v1.cf, store__1__v1.n := _v1.cf, _v1.n;
    store__1__v2.cf, store__1__v2.n := _v2.cf, _v2.n;
    _v1.cf, _v1.n := _v1.foo_loop_anon4_LoopHead_in_1_1, _v1.foo_loop_anon4_LoopHead_in_1_2;
    _v2.cf, _v2.n := _v2.foo_loop_anon4_LoopHead_in_4_1, _v2.foo_loop_anon4_LoopHead_in_4_2;
    call out__v1.foo_loop_anon4_LoopHead_out_1_0_1, out__v2.foo_loop_anon4_LoopHead_out_4_0_1 := MS_Check__v1.foo_loop_anon4_LoopHead___v2.foo_loop_anon4_LoopHead(_v1.foo_loop_anon4_LoopHead_in_1_0, _v2.foo_loop_anon4_LoopHead_in_4_0);
    assume _v1.cf == _v1.foo_loop_anon4_LoopHead_out_1_1
   && _v1.n == _v1.foo_loop_anon4_LoopHead_out_1_2;
    assume _v2.cf == _v2.foo_loop_anon4_LoopHead_out_4_1
   && _v2.n == _v2.foo_loop_anon4_LoopHead_out_4_2;
    assume _v1.foo_loop_anon4_LoopHead_out_1_0 == out__v1.foo_loop_anon4_LoopHead_out_1_0_1
   && _v2.foo_loop_anon4_LoopHead_out_4_0 == out__v2.foo_loop_anon4_LoopHead_out_4_0_1;
    _v1.cf, _v1.n := store__1__v1.cf, store__1__v1.n;
    _v2.cf, _v2.n := store__1__v2.cf, store__1__v2.n;
    goto MS_L_meet_1;

  MS_L_not_taken_1:
    assume !(_v1.foo_loop_anon4_LoopHead_1_done && _v2.foo_loop_anon4_LoopHead_4_done);
    goto MS_L_meet_1;

  MS_L_meet_1:
    goto MS_L_0_0;

  MS_L_0_2:
    goto MS_L_taken_2, MS_L_not_taken_2;

  MS_L_taken_2:
    assume _v1.foo_loop_anon4_LoopHead_2_done && _v2.foo_loop_anon4_LoopHead_3_done;
    store__2__v1.cf, store__2__v1.n := _v1.cf, _v1.n;
    store__2__v2.cf, store__2__v2.n := _v2.cf, _v2.n;
    _v1.cf, _v1.n := _v1.foo_loop_anon4_LoopHead_in_2_1, _v1.foo_loop_anon4_LoopHead_in_2_2;
    _v2.cf, _v2.n := _v2.foo_loop_anon4_LoopHead_in_3_1, _v2.foo_loop_anon4_LoopHead_in_3_2;
    call out__v1.foo_loop_anon4_LoopHead_out_2_0_2, out__v2.foo_loop_anon4_LoopHead_out_3_0_2 := MS_Check__v1.foo_loop_anon4_LoopHead___v2.foo_loop_anon4_LoopHead(_v1.foo_loop_anon4_LoopHead_in_2_0, _v2.foo_loop_anon4_LoopHead_in_3_0);
    assume _v1.cf == _v1.foo_loop_anon4_LoopHead_out_2_1
   && _v1.n == _v1.foo_loop_anon4_LoopHead_out_2_2;
    assume _v2.cf == _v2.foo_loop_anon4_LoopHead_out_3_1
   && _v2.n == _v2.foo_loop_anon4_LoopHead_out_3_2;
    assume _v1.foo_loop_anon4_LoopHead_out_2_0 == out__v1.foo_loop_anon4_LoopHead_out_2_0_2
   && _v2.foo_loop_anon4_LoopHead_out_3_0 == out__v2.foo_loop_anon4_LoopHead_out_3_0_2;
    _v1.cf, _v1.n := store__2__v1.cf, store__2__v1.n;
    _v2.cf, _v2.n := store__2__v2.cf, store__2__v2.n;
    goto MS_L_meet_2;

  MS_L_not_taken_2:
    assume !(_v1.foo_loop_anon4_LoopHead_2_done && _v2.foo_loop_anon4_LoopHead_3_done);
    goto MS_L_meet_2;

  MS_L_meet_2:
    goto MS_L_0_1;

  MS_L_0_3:
    goto MS_L_taken_3, MS_L_not_taken_3;

  MS_L_taken_3:
    assume _v1.foo_loop_anon4_LoopHead_2_done && _v2.foo_loop_anon4_LoopHead_4_done;
    store__3__v1.cf, store__3__v1.n := _v1.cf, _v1.n;
    store__3__v2.cf, store__3__v2.n := _v2.cf, _v2.n;
    _v1.cf, _v1.n := _v1.foo_loop_anon4_LoopHead_in_2_1, _v1.foo_loop_anon4_LoopHead_in_2_2;
    _v2.cf, _v2.n := _v2.foo_loop_anon4_LoopHead_in_4_1, _v2.foo_loop_anon4_LoopHead_in_4_2;
    call out__v1.foo_loop_anon4_LoopHead_out_2_0_3, out__v2.foo_loop_anon4_LoopHead_out_4_0_3 := MS_Check__v1.foo_loop_anon4_LoopHead___v2.foo_loop_anon4_LoopHead(_v1.foo_loop_anon4_LoopHead_in_2_0, _v2.foo_loop_anon4_LoopHead_in_4_0);
    assume _v1.cf == _v1.foo_loop_anon4_LoopHead_out_2_1
   && _v1.n == _v1.foo_loop_anon4_LoopHead_out_2_2;
    assume _v2.cf == _v2.foo_loop_anon4_LoopHead_out_4_1
   && _v2.n == _v2.foo_loop_anon4_LoopHead_out_4_2;
    assume _v1.foo_loop_anon4_LoopHead_out_2_0 == out__v1.foo_loop_anon4_LoopHead_out_2_0_3
   && _v2.foo_loop_anon4_LoopHead_out_4_0 == out__v2.foo_loop_anon4_LoopHead_out_4_0_3;
    _v1.cf, _v1.n := store__3__v1.cf, store__3__v1.n;
    _v2.cf, _v2.n := store__3__v2.cf, store__3__v2.n;
    goto MS_L_meet_3;

  MS_L_not_taken_3:
    assume !(_v1.foo_loop_anon4_LoopHead_2_done && _v2.foo_loop_anon4_LoopHead_4_done);
    goto MS_L_meet_3;

  MS_L_meet_3:
    goto MS_L_0_2;
}


