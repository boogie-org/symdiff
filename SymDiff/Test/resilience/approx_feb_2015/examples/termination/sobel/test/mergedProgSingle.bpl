procedure {:prefix "_v2"} _v2.Test(y: int) returns (r: int);
  free ensures R'___v2.Test(y);
  free ensures R___v2.Test(y, r);



procedure {:prefix "_v2"} _v2.Test_loop_anon2_LoopHead(in_y: int, in_x: int) returns (out_x: int);
  free ensures {:io_dependency "out_x", "in_x", "in_y"} true;
  free ensures {:io_dependency "out_x", "in_x", "in_y"} true;
  free ensures R'___v2.Test_loop_anon2_LoopHead(in_y, in_x);
  free ensures R___v2.Test_loop_anon2_LoopHead(in_y, in_x, out_x);



implementation _v2.Test(y: int) returns (r: int)
{
  var x: int;

  anon0:
    x := y;
    goto anon2_LoopHead;

  anon2_LoopHead:
    call x := _v2.Test_loop_anon2_LoopHead(y, x);
    goto anon2_LoopHead_last;

  anon2_LoopHead_last:
    goto anon2_LoopDone, anon2_LoopBody;

  anon2_LoopBody:
    assume {:partition} x < y + 10;
    x := x + 2;
    goto anon2_LoopBody_dummy;

  anon2_LoopBody_dummy:
    assume false;
    return;

  anon2_LoopDone:
    assume {:partition} y + 10 <= x;
    return;
}



implementation _v2.Test_loop_anon2_LoopHead(in_y: int, in_x: int) returns (out_x: int)
{

  entry:
    out_x := in_x;
    goto anon2_LoopHead;

  anon2_LoopHead:
    goto anon2_LoopDone, anon2_LoopBody;

  anon2_LoopBody:
    assume {:partition} out_x < in_y + 10;
    out_x := out_x + 2;
    goto anon2_LoopBody_dummy;

  anon2_LoopBody_dummy:
    call out_x := _v2.Test_loop_anon2_LoopHead(in_y, out_x);
    return;

  anon2_LoopDone:
    assume {:partition} in_y + 10 <= out_x;
    out_x := in_x;
    return;
}



procedure {:prefix "_v1"} _v1.Test(y: int) returns (r: int);
  free ensures R___v1.Test(y, r);



procedure {:prefix "_v1"} _v1.Test_loop_anon2_LoopHead(in_y: int, in_x: int) returns (out_x: int);
  free ensures {:io_dependency "out_x", "in_x", "in_y"} true;
  free ensures {:io_dependency "out_x", "in_x", "in_y"} true;
  free ensures R___v1.Test_loop_anon2_LoopHead(in_y, in_x, out_x);



implementation _v1.Test(y: int) returns (r: int)
{
  var x: int;

  anon0:
    x := y;
    goto anon2_LoopHead;

  anon2_LoopHead:
    call x := _v1.Test_loop_anon2_LoopHead(y, x);
    goto anon2_LoopHead_last;

  anon2_LoopHead_last:
    goto anon2_LoopDone, anon2_LoopBody;

  anon2_LoopBody:
    assume {:partition} x < y + 10;
    x := x + 1;
    goto anon2_LoopBody_dummy;

  anon2_LoopBody_dummy:
    assume false;
    return;

  anon2_LoopDone:
    assume {:partition} y + 10 <= x;
    return;
}



implementation _v1.Test_loop_anon2_LoopHead(in_y: int, in_x: int) returns (out_x: int)
{

  entry:
    out_x := in_x;
    goto anon2_LoopHead;

  anon2_LoopHead:
    goto anon2_LoopDone, anon2_LoopBody;

  anon2_LoopBody:
    assume {:partition} out_x < in_y + 10;
    out_x := out_x + 1;
    goto anon2_LoopBody_dummy;

  anon2_LoopBody_dummy:
    call out_x := _v1.Test_loop_anon2_LoopHead(in_y, out_x);
    return;

  anon2_LoopDone:
    assume {:partition} in_y + 10 <= out_x;
    out_x := in_x;
    return;
}



function R___v2.Test(.y: int, .r: int) : bool;

function R'___v2.Test(.y: int) : bool;

function R___v2.Test_loop_anon2_LoopHead(.in_y: int, .in_x: int, .out_x: int) : bool;

function R'___v2.Test_loop_anon2_LoopHead(.in_y: int, .in_x: int) : bool;

function R___v1.Test(.y: int, .r: int) : bool;

function R___v1.Test_loop_anon2_LoopHead(.in_y: int, .in_x: int, .out_x: int) : bool;

function {:inline true} MS$_v1.Test$_v2.Test(_v1.y: int, _v1.r: int, _v2.y: int, _v2.r: int) : bool
{
  _v1.y == _v2.y ==> _v1.r == _v2.r
}

axiom (forall _v1.y: int, _v1.r: int, _v2.y: int, _v2.r: int :: 
  { R___v1.Test(_v1.y, _v1.r), R___v2.Test(_v2.y, _v2.r) } 
  R___v1.Test(_v1.y, _v1.r) && R___v2.Test(_v2.y, _v2.r)
     ==> MS$_v1.Test$_v2.Test(_v1.y, _v1.r, _v2.y, _v2.r));

function {:inline true} MS_pre_$_v1.Test$_v2.Test(_v1.y: int, _v2.y: int) : bool
{
  _v1.y <= _v2.y 
}

procedure {:MS_procs "_v1.Test", "_v2.Test"} MS_Check__v1.Test___v2.Test(_v1.y: int, _v2.y: int) returns (_v1.r: int, _v2.r: int);
  requires MS_pre_$_v1.Test$_v2.Test(_v1.y, _v2.y);
  ensures MS$_v1.Test$_v2.Test(_v1.y, _v1.r, _v2.y, _v2.r);



implementation MS_Check__v1.Test___v2.Test(_v1.y: int, _v2.y: int) returns (_v1.r: int, _v2.r: int)
{
  var inline$_v1.Test$0$x: int;
  var inline$_v1.Test$0$y: int;
  var inline$_v1.Test$0$r: int;
  var inline$_v2.Test$0$x: int;
  var inline$_v2.Test$0$y: int;
  var inline$_v2.Test$0$r: int;

  START:
    goto inline$_v1.Test$0$Entry;

  inline$_v1.Test$0$Entry:
    inline$_v1.Test$0$y := _v1.y;
    havoc inline$_v1.Test$0$x, inline$_v1.Test$0$r;
    goto inline$_v1.Test$0$anon0;

  inline$_v1.Test$0$anon0:
    inline$_v1.Test$0$x := inline$_v1.Test$0$y;
    goto inline$_v1.Test$0$anon2_LoopHead;

  inline$_v1.Test$0$anon2_LoopHead:
    call inline$_v1.Test$0$x := _v1.Test_loop_anon2_LoopHead(inline$_v1.Test$0$y, inline$_v1.Test$0$x);
    goto inline$_v1.Test$0$anon2_LoopHead_last;

  inline$_v1.Test$0$anon2_LoopHead_last:
    goto inline$_v1.Test$0$anon2_LoopDone, inline$_v1.Test$0$anon2_LoopBody;

  inline$_v1.Test$0$anon2_LoopBody:
    assume {:partition} inline$_v1.Test$0$x < inline$_v1.Test$0$y + 10;
    inline$_v1.Test$0$x := inline$_v1.Test$0$x + 1;
    goto inline$_v1.Test$0$anon2_LoopBody_dummy;

  inline$_v1.Test$0$anon2_LoopBody_dummy:
    assume false;
    goto inline$_v1.Test$0$Return;

  inline$_v1.Test$0$anon2_LoopDone:
    assume {:partition} inline$_v1.Test$0$y + 10 <= inline$_v1.Test$0$x;
    goto inline$_v1.Test$0$Return;

  inline$_v1.Test$0$Return:
    assume true;
    _v1.r := inline$_v1.Test$0$r;
    goto START$1;

  START$1:
    goto inline$_v2.Test$0$Entry;

  inline$_v2.Test$0$Entry:
    inline$_v2.Test$0$y := _v2.y;
    havoc inline$_v2.Test$0$x, inline$_v2.Test$0$r;
    goto inline$_v2.Test$0$anon0;

  inline$_v2.Test$0$anon0:
    inline$_v2.Test$0$x := inline$_v2.Test$0$y;
    goto inline$_v2.Test$0$anon2_LoopHead;

  inline$_v2.Test$0$anon2_LoopHead:
    call inline$_v2.Test$0$x := _v2.Test_loop_anon2_LoopHead(inline$_v2.Test$0$y, inline$_v2.Test$0$x);
    goto inline$_v2.Test$0$anon2_LoopHead_last;

  inline$_v2.Test$0$anon2_LoopHead_last:
    goto inline$_v2.Test$0$anon2_LoopDone, inline$_v2.Test$0$anon2_LoopBody;

  inline$_v2.Test$0$anon2_LoopBody:
    assume {:partition} inline$_v2.Test$0$x < inline$_v2.Test$0$y + 10;
    inline$_v2.Test$0$x := inline$_v2.Test$0$x + 2;
    goto inline$_v2.Test$0$anon2_LoopBody_dummy;

  inline$_v2.Test$0$anon2_LoopBody_dummy:
    assume false;
    goto inline$_v2.Test$0$Return;

  inline$_v2.Test$0$anon2_LoopDone:
    assume {:partition} inline$_v2.Test$0$y + 10 <= inline$_v2.Test$0$x;
    goto inline$_v2.Test$0$Return;

  inline$_v2.Test$0$Return:
    assume true;
    assume true;
    _v2.r := inline$_v2.Test$0$r;
    goto START$2;

  START$2:
    return;
}



function {:inline true} RT_cond_$_v1.Test$_v2.Test(_v1.y: int, _v2.y: int) : bool
{
  MS_pre_$_v1.Test$_v2.Test(_v1.y, _v2.y)
}

axiom (forall _v1.y: int, _v1.r: int, _v2.y: int :: 
  { R___v1.Test(_v1.y, _v1.r), R'___v2.Test(_v2.y) } 
  RT_cond_$_v1.Test$_v2.Test(_v1.y, _v2.y) && R___v1.Test(_v1.y, _v1.r)
     ==> R'___v2.Test(_v2.y));

procedure RT_Check__v1.Test___v2.Test(_v1.y: int, _v2.y: int) returns (_v1.r: int, _v2.r: int);
  requires RT_cond_$_v1.Test$_v2.Test(_v1.y, _v2.y);



implementation RT_Check__v1.Test___v2.Test(_v1.y: int, _v2.y: int) returns (_v1.r: int, _v2.r: int)
{
  var inline$_v1.Test$0$x: int;
  var inline$_v1.Test$0$y: int;
  var inline$_v1.Test$0$r: int;
  var inline$_v2.Test$0$x: int;
  var inline$_v2.Test$0$y: int;
  var inline$_v2.Test$0$r: int;

  START:
    goto inline$_v1.Test$0$Entry;

  inline$_v1.Test$0$Entry:
    inline$_v1.Test$0$y := _v1.y;
    havoc inline$_v1.Test$0$x, inline$_v1.Test$0$r;
    goto inline$_v1.Test$0$anon0;

  inline$_v1.Test$0$anon0:
    inline$_v1.Test$0$x := inline$_v1.Test$0$y;
    goto inline$_v1.Test$0$anon2_LoopHead;

  inline$_v1.Test$0$anon2_LoopHead:
    call inline$_v1.Test$0$x := _v1.Test_loop_anon2_LoopHead(inline$_v1.Test$0$y, inline$_v1.Test$0$x);
    goto inline$_v1.Test$0$anon2_LoopHead_last;

  inline$_v1.Test$0$anon2_LoopHead_last:
    goto inline$_v1.Test$0$anon2_LoopDone, inline$_v1.Test$0$anon2_LoopBody;

  inline$_v1.Test$0$anon2_LoopBody:
    assume {:partition} inline$_v1.Test$0$x < inline$_v1.Test$0$y + 10;
    inline$_v1.Test$0$x := inline$_v1.Test$0$x + 1;
    goto inline$_v1.Test$0$anon2_LoopBody_dummy;

  inline$_v1.Test$0$anon2_LoopBody_dummy:
    assume false;
    goto inline$_v1.Test$0$Return;

  inline$_v1.Test$0$anon2_LoopDone:
    assume {:partition} inline$_v1.Test$0$y + 10 <= inline$_v1.Test$0$x;
    goto inline$_v1.Test$0$Return;

  inline$_v1.Test$0$Return:
    assume true;
    _v1.r := inline$_v1.Test$0$r;
    goto START$1;

  START$1:
    goto inline$_v2.Test$0$Entry;

  inline$_v2.Test$0$Entry:
    inline$_v2.Test$0$y := _v2.y;
    havoc inline$_v2.Test$0$x, inline$_v2.Test$0$r;
    goto inline$_v2.Test$0$anon0;

  inline$_v2.Test$0$anon0:
    inline$_v2.Test$0$x := inline$_v2.Test$0$y;
    goto inline$_v2.Test$0$anon2_LoopHead;

  inline$_v2.Test$0$anon2_LoopHead:
    assert R'___v2.Test_loop_anon2_LoopHead(inline$_v2.Test$0$y, inline$_v2.Test$0$x);
    call inline$_v2.Test$0$x := _v2.Test_loop_anon2_LoopHead(inline$_v2.Test$0$y, inline$_v2.Test$0$x);
    goto inline$_v2.Test$0$anon2_LoopHead_last;

  inline$_v2.Test$0$anon2_LoopHead_last:
    goto inline$_v2.Test$0$anon2_LoopDone, inline$_v2.Test$0$anon2_LoopBody;

  inline$_v2.Test$0$anon2_LoopBody:
    assume {:partition} inline$_v2.Test$0$x < inline$_v2.Test$0$y + 10;
    inline$_v2.Test$0$x := inline$_v2.Test$0$x + 2;
    goto inline$_v2.Test$0$anon2_LoopBody_dummy;

  inline$_v2.Test$0$anon2_LoopBody_dummy:
    assume false;
    goto inline$_v2.Test$0$Return;

  inline$_v2.Test$0$anon2_LoopDone:
    assume {:partition} inline$_v2.Test$0$y + 10 <= inline$_v2.Test$0$x;
    goto inline$_v2.Test$0$Return;

  inline$_v2.Test$0$Return:
    assume true;
    assume true;
    _v2.r := inline$_v2.Test$0$r;
    goto START$2;

  START$2:
    return;
}



function {:inline true} MS$_v1.Test_loop_anon2_LoopHead$_v2.Test_loop_anon2_LoopHead(_v1.in_y: int, 
    _v1.in_x: int, 
    _v1.out_x: int, 
    _v2.in_y: int, 
    _v2.in_x: int, 
    _v2.out_x: int)
   : bool
{
  _v1.in_y == _v2.in_y && _v1.in_x == _v2.in_x ==> _v1.out_x == _v2.out_x
}

axiom (forall _v1.in_y: int, 
    _v1.in_x: int, 
    _v1.out_x: int, 
    _v2.in_y: int, 
    _v2.in_x: int, 
    _v2.out_x: int :: 
  { R___v1.Test_loop_anon2_LoopHead(_v1.in_y, _v1.in_x, _v1.out_x), R___v2.Test_loop_anon2_LoopHead(_v2.in_y, _v2.in_x, _v2.out_x) } 
  R___v1.Test_loop_anon2_LoopHead(_v1.in_y, _v1.in_x, _v1.out_x)
       && R___v2.Test_loop_anon2_LoopHead(_v2.in_y, _v2.in_x, _v2.out_x)
     ==> MS$_v1.Test_loop_anon2_LoopHead$_v2.Test_loop_anon2_LoopHead(_v1.in_y, _v1.in_x, _v1.out_x, _v2.in_y, _v2.in_x, _v2.out_x));

function {:inline true} MS_pre_$_v1.Test_loop_anon2_LoopHead$_v2.Test_loop_anon2_LoopHead(_v1.in_y: int, _v1.in_x: int, _v2.in_y: int, _v2.in_x: int) : bool
{
  //((_v1.in_x - _v1.in_y) >= (_v2.in_x - _v2.in_y)) && ((_v2.in_x - _v2.in_y) >= 0) && ((_v1.in_x - _v1.in_y) >= 0) 
  _v2.in_x - _v1.in_x >= _v2.in_y - _v1.in_y
}

procedure {:MS_procs "_v1.Test_loop_anon2_LoopHead", "_v2.Test_loop_anon2_LoopHead"} MS_Check__v1.Test_loop_anon2_LoopHead___v2.Test_loop_anon2_LoopHead(_v1.in_y: int, _v1.in_x: int, _v2.in_y: int, _v2.in_x: int)
   returns (_v1.out_x: int, _v2.out_x: int);
  requires MS_pre_$_v1.Test_loop_anon2_LoopHead$_v2.Test_loop_anon2_LoopHead(_v1.in_y, _v1.in_x, _v2.in_y, _v2.in_x);
  ensures MS$_v1.Test_loop_anon2_LoopHead$_v2.Test_loop_anon2_LoopHead(_v1.in_y, _v1.in_x, _v1.out_x, _v2.in_y, _v2.in_x, _v2.out_x);



implementation MS_Check__v1.Test_loop_anon2_LoopHead___v2.Test_loop_anon2_LoopHead(_v1.in_y: int, _v1.in_x: int, _v2.in_y: int, _v2.in_x: int)
   returns (_v1.out_x: int, _v2.out_x: int)
{
  var inline$_v1.Test_loop_anon2_LoopHead$0$in_y: int;
  var inline$_v1.Test_loop_anon2_LoopHead$0$in_x: int;
  var inline$_v1.Test_loop_anon2_LoopHead$0$out_x: int;
  var inline$_v2.Test_loop_anon2_LoopHead$0$in_y: int;
  var inline$_v2.Test_loop_anon2_LoopHead$0$in_x: int;
  var inline$_v2.Test_loop_anon2_LoopHead$0$out_x: int;

  START:
    goto inline$_v1.Test_loop_anon2_LoopHead$0$Entry;

  inline$_v1.Test_loop_anon2_LoopHead$0$Entry:
    inline$_v1.Test_loop_anon2_LoopHead$0$in_y := _v1.in_y;
    inline$_v1.Test_loop_anon2_LoopHead$0$in_x := _v1.in_x;
    havoc inline$_v1.Test_loop_anon2_LoopHead$0$out_x;
    goto inline$_v1.Test_loop_anon2_LoopHead$0$entry;

  inline$_v1.Test_loop_anon2_LoopHead$0$entry:
    inline$_v1.Test_loop_anon2_LoopHead$0$out_x := inline$_v1.Test_loop_anon2_LoopHead$0$in_x;
    goto inline$_v1.Test_loop_anon2_LoopHead$0$anon2_LoopHead;

  inline$_v1.Test_loop_anon2_LoopHead$0$anon2_LoopHead:
    goto inline$_v1.Test_loop_anon2_LoopHead$0$anon2_LoopDone, inline$_v1.Test_loop_anon2_LoopHead$0$anon2_LoopBody;

  inline$_v1.Test_loop_anon2_LoopHead$0$anon2_LoopBody:
    assume {:partition} inline$_v1.Test_loop_anon2_LoopHead$0$out_x
   < inline$_v1.Test_loop_anon2_LoopHead$0$in_y + 10;
    inline$_v1.Test_loop_anon2_LoopHead$0$out_x := inline$_v1.Test_loop_anon2_LoopHead$0$out_x + 1;
    goto inline$_v1.Test_loop_anon2_LoopHead$0$anon2_LoopBody_dummy;

  inline$_v1.Test_loop_anon2_LoopHead$0$anon2_LoopBody_dummy:
    call inline$_v1.Test_loop_anon2_LoopHead$0$out_x := _v1.Test_loop_anon2_LoopHead(inline$_v1.Test_loop_anon2_LoopHead$0$in_y, inline$_v1.Test_loop_anon2_LoopHead$0$out_x);
    goto inline$_v1.Test_loop_anon2_LoopHead$0$Return;

  inline$_v1.Test_loop_anon2_LoopHead$0$anon2_LoopDone:
    assume {:partition} inline$_v1.Test_loop_anon2_LoopHead$0$in_y + 10
   <= inline$_v1.Test_loop_anon2_LoopHead$0$out_x;
    inline$_v1.Test_loop_anon2_LoopHead$0$out_x := inline$_v1.Test_loop_anon2_LoopHead$0$in_x;
    goto inline$_v1.Test_loop_anon2_LoopHead$0$Return;

  inline$_v1.Test_loop_anon2_LoopHead$0$Return:
    assume true;
    assume true;
    assume true;
    _v1.out_x := inline$_v1.Test_loop_anon2_LoopHead$0$out_x;
    goto START$1;

  START$1:
    goto inline$_v2.Test_loop_anon2_LoopHead$0$Entry;

  inline$_v2.Test_loop_anon2_LoopHead$0$Entry:
    inline$_v2.Test_loop_anon2_LoopHead$0$in_y := _v2.in_y;
    inline$_v2.Test_loop_anon2_LoopHead$0$in_x := _v2.in_x;
    havoc inline$_v2.Test_loop_anon2_LoopHead$0$out_x;
    goto inline$_v2.Test_loop_anon2_LoopHead$0$entry;

  inline$_v2.Test_loop_anon2_LoopHead$0$entry:
    inline$_v2.Test_loop_anon2_LoopHead$0$out_x := inline$_v2.Test_loop_anon2_LoopHead$0$in_x;
    goto inline$_v2.Test_loop_anon2_LoopHead$0$anon2_LoopHead;

  inline$_v2.Test_loop_anon2_LoopHead$0$anon2_LoopHead:
    goto inline$_v2.Test_loop_anon2_LoopHead$0$anon2_LoopDone, inline$_v2.Test_loop_anon2_LoopHead$0$anon2_LoopBody;

  inline$_v2.Test_loop_anon2_LoopHead$0$anon2_LoopBody:
    assume {:partition} inline$_v2.Test_loop_anon2_LoopHead$0$out_x
   < inline$_v2.Test_loop_anon2_LoopHead$0$in_y + 10;
    inline$_v2.Test_loop_anon2_LoopHead$0$out_x := inline$_v2.Test_loop_anon2_LoopHead$0$out_x + 2;
    goto inline$_v2.Test_loop_anon2_LoopHead$0$anon2_LoopBody_dummy;

  inline$_v2.Test_loop_anon2_LoopHead$0$anon2_LoopBody_dummy:
    call inline$_v2.Test_loop_anon2_LoopHead$0$out_x := _v2.Test_loop_anon2_LoopHead(inline$_v2.Test_loop_anon2_LoopHead$0$in_y, inline$_v2.Test_loop_anon2_LoopHead$0$out_x);
    goto inline$_v2.Test_loop_anon2_LoopHead$0$Return;

  inline$_v2.Test_loop_anon2_LoopHead$0$anon2_LoopDone:
    assume {:partition} inline$_v2.Test_loop_anon2_LoopHead$0$in_y + 10
   <= inline$_v2.Test_loop_anon2_LoopHead$0$out_x;
    inline$_v2.Test_loop_anon2_LoopHead$0$out_x := inline$_v2.Test_loop_anon2_LoopHead$0$in_x;
    goto inline$_v2.Test_loop_anon2_LoopHead$0$Return;

  inline$_v2.Test_loop_anon2_LoopHead$0$Return:
    assume true;
    assume true;
    assume true;
    assume true;
    _v2.out_x := inline$_v2.Test_loop_anon2_LoopHead$0$out_x;
    goto START$2;

  START$2:
    return;
}



function {:inline true} RT_cond_$_v1.Test_loop_anon2_LoopHead$_v2.Test_loop_anon2_LoopHead(_v1.in_y: int, _v1.in_x: int, _v2.in_y: int, _v2.in_x: int) : bool
{
  MS_pre_$_v1.Test_loop_anon2_LoopHead$_v2.Test_loop_anon2_LoopHead(_v1.in_y, _v1.in_x, _v2.in_y, _v2.in_x)
}

axiom (forall _v1.in_y: int, _v1.in_x: int, _v1.out_x: int, _v2.in_y: int, _v2.in_x: int :: 
  { R___v1.Test_loop_anon2_LoopHead(_v1.in_y, _v1.in_x, _v1.out_x), R'___v2.Test_loop_anon2_LoopHead(_v2.in_y, _v2.in_x) } 
  RT_cond_$_v1.Test_loop_anon2_LoopHead$_v2.Test_loop_anon2_LoopHead(_v1.in_y, _v1.in_x, _v2.in_y, _v2.in_x)
       && R___v1.Test_loop_anon2_LoopHead(_v1.in_y, _v1.in_x, _v1.out_x)
     ==> R'___v2.Test_loop_anon2_LoopHead(_v2.in_y, _v2.in_x));

procedure RT_Check__v1.Test_loop_anon2_LoopHead___v2.Test_loop_anon2_LoopHead(_v1.in_y: int, _v1.in_x: int, _v2.in_y: int, _v2.in_x: int)
   returns (_v1.out_x: int, _v2.out_x: int);
  requires RT_cond_$_v1.Test_loop_anon2_LoopHead$_v2.Test_loop_anon2_LoopHead(_v1.in_y, _v1.in_x, _v2.in_y, _v2.in_x);



implementation RT_Check__v1.Test_loop_anon2_LoopHead___v2.Test_loop_anon2_LoopHead(_v1.in_y: int, _v1.in_x: int, _v2.in_y: int, _v2.in_x: int)
   returns (_v1.out_x: int, _v2.out_x: int)
{
  var inline$_v1.Test_loop_anon2_LoopHead$0$in_y: int;
  var inline$_v1.Test_loop_anon2_LoopHead$0$in_x: int;
  var inline$_v1.Test_loop_anon2_LoopHead$0$out_x: int;
  var inline$_v2.Test_loop_anon2_LoopHead$0$in_y: int;
  var inline$_v2.Test_loop_anon2_LoopHead$0$in_x: int;
  var inline$_v2.Test_loop_anon2_LoopHead$0$out_x: int;

  START:
    goto inline$_v1.Test_loop_anon2_LoopHead$0$Entry;

  inline$_v1.Test_loop_anon2_LoopHead$0$Entry:
    inline$_v1.Test_loop_anon2_LoopHead$0$in_y := _v1.in_y;
    inline$_v1.Test_loop_anon2_LoopHead$0$in_x := _v1.in_x;
    havoc inline$_v1.Test_loop_anon2_LoopHead$0$out_x;
    goto inline$_v1.Test_loop_anon2_LoopHead$0$entry;

  inline$_v1.Test_loop_anon2_LoopHead$0$entry:
    inline$_v1.Test_loop_anon2_LoopHead$0$out_x := inline$_v1.Test_loop_anon2_LoopHead$0$in_x;
    goto inline$_v1.Test_loop_anon2_LoopHead$0$anon2_LoopHead;

  inline$_v1.Test_loop_anon2_LoopHead$0$anon2_LoopHead:
    goto inline$_v1.Test_loop_anon2_LoopHead$0$anon2_LoopDone, inline$_v1.Test_loop_anon2_LoopHead$0$anon2_LoopBody;

  inline$_v1.Test_loop_anon2_LoopHead$0$anon2_LoopBody:
    assume {:partition} inline$_v1.Test_loop_anon2_LoopHead$0$out_x
   < inline$_v1.Test_loop_anon2_LoopHead$0$in_y + 10;
    inline$_v1.Test_loop_anon2_LoopHead$0$out_x := inline$_v1.Test_loop_anon2_LoopHead$0$out_x + 1;
    goto inline$_v1.Test_loop_anon2_LoopHead$0$anon2_LoopBody_dummy;

  inline$_v1.Test_loop_anon2_LoopHead$0$anon2_LoopBody_dummy:
    call inline$_v1.Test_loop_anon2_LoopHead$0$out_x := _v1.Test_loop_anon2_LoopHead(inline$_v1.Test_loop_anon2_LoopHead$0$in_y, inline$_v1.Test_loop_anon2_LoopHead$0$out_x);
    goto inline$_v1.Test_loop_anon2_LoopHead$0$Return;

  inline$_v1.Test_loop_anon2_LoopHead$0$anon2_LoopDone:
    assume {:partition} inline$_v1.Test_loop_anon2_LoopHead$0$in_y + 10
   <= inline$_v1.Test_loop_anon2_LoopHead$0$out_x;
    inline$_v1.Test_loop_anon2_LoopHead$0$out_x := inline$_v1.Test_loop_anon2_LoopHead$0$in_x;
    goto inline$_v1.Test_loop_anon2_LoopHead$0$Return;

  inline$_v1.Test_loop_anon2_LoopHead$0$Return:
    assume true;
    assume true;
    assume true;
    _v1.out_x := inline$_v1.Test_loop_anon2_LoopHead$0$out_x;
    goto START$1;

  START$1:
    goto inline$_v2.Test_loop_anon2_LoopHead$0$Entry;

  inline$_v2.Test_loop_anon2_LoopHead$0$Entry:
    inline$_v2.Test_loop_anon2_LoopHead$0$in_y := _v2.in_y;
    inline$_v2.Test_loop_anon2_LoopHead$0$in_x := _v2.in_x;
    havoc inline$_v2.Test_loop_anon2_LoopHead$0$out_x;
    goto inline$_v2.Test_loop_anon2_LoopHead$0$entry;

  inline$_v2.Test_loop_anon2_LoopHead$0$entry:
    inline$_v2.Test_loop_anon2_LoopHead$0$out_x := inline$_v2.Test_loop_anon2_LoopHead$0$in_x;
    goto inline$_v2.Test_loop_anon2_LoopHead$0$anon2_LoopHead;

  inline$_v2.Test_loop_anon2_LoopHead$0$anon2_LoopHead:
    goto inline$_v2.Test_loop_anon2_LoopHead$0$anon2_LoopDone, inline$_v2.Test_loop_anon2_LoopHead$0$anon2_LoopBody;

  inline$_v2.Test_loop_anon2_LoopHead$0$anon2_LoopBody:
    assume {:partition} inline$_v2.Test_loop_anon2_LoopHead$0$out_x
   < inline$_v2.Test_loop_anon2_LoopHead$0$in_y + 10;
    inline$_v2.Test_loop_anon2_LoopHead$0$out_x := inline$_v2.Test_loop_anon2_LoopHead$0$out_x + 2;
    goto inline$_v2.Test_loop_anon2_LoopHead$0$anon2_LoopBody_dummy;

  inline$_v2.Test_loop_anon2_LoopHead$0$anon2_LoopBody_dummy:
    assert R'___v2.Test_loop_anon2_LoopHead(inline$_v2.Test_loop_anon2_LoopHead$0$in_y, 
  inline$_v2.Test_loop_anon2_LoopHead$0$out_x);
    call inline$_v2.Test_loop_anon2_LoopHead$0$out_x := _v2.Test_loop_anon2_LoopHead(inline$_v2.Test_loop_anon2_LoopHead$0$in_y, inline$_v2.Test_loop_anon2_LoopHead$0$out_x);
    goto inline$_v2.Test_loop_anon2_LoopHead$0$Return;

  inline$_v2.Test_loop_anon2_LoopHead$0$anon2_LoopDone:
    assume {:partition} inline$_v2.Test_loop_anon2_LoopHead$0$in_y + 10
   <= inline$_v2.Test_loop_anon2_LoopHead$0$out_x;
    inline$_v2.Test_loop_anon2_LoopHead$0$out_x := inline$_v2.Test_loop_anon2_LoopHead$0$in_x;
    goto inline$_v2.Test_loop_anon2_LoopHead$0$Return;

  inline$_v2.Test_loop_anon2_LoopHead$0$Return:
    assume true;
    assume true;
    assume true;
    assume true;
    _v2.out_x := inline$_v2.Test_loop_anon2_LoopHead$0$out_x;
    goto START$2;

  START$2:
    return;
}


