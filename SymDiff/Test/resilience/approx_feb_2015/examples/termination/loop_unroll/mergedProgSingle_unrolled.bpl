var _v2.a: [int]int;

procedure {:prefix "_v2"} _v2.f(x: int) returns (r: int);
  free ensures {:io_dependency "r", "x"} true;
  free ensures {:io_dependency "r", "x"} true;
  free ensures R'___v2.f(x, old(_v2.a));
  free ensures R___v2.f(x, old(_v2.a), r);



procedure {:prefix "_v2"} _v2.Iterator(s: int) returns (r: int);
  modifies _v2.a;
  free ensures {:io_dependency "a", "a", "s"} true;
  free ensures {:io_dependency "a", "a", "s"} true;
  free ensures R'___v2.Iterator(s, old(_v2.a));
  free ensures R___v2.Iterator(s, old(_v2.a), _v2.a, r);



procedure {:prefix "_v2"} _v2.Iterator_loop_anon4_LoopHead(in_i: int, in_tmp: int) returns (out_i: int, out_tmp: int);
  modifies _v2.a;
  free ensures {:io_dependency "a", "a", "in_i"} true;
  free ensures {:io_dependency "out_i", "in_i", "a"} true;
  free ensures {:io_dependency "out_tmp", "in_tmp", "a", "in_i"} true;
  free ensures {:io_dependency "a", "a", "in_i"} true;
  free ensures {:io_dependency "out_i", "in_i", "a"} true;
  free ensures {:io_dependency "out_tmp", "in_tmp", "a", "in_i"} true;
  free ensures R'___v2.Iterator_loop_anon4_LoopHead(in_i, in_tmp, old(_v2.a));
  free ensures R___v2.Iterator_loop_anon4_LoopHead(in_i, in_tmp, old(_v2.a), _v2.a, out_i, out_tmp);
  //free ensures _v2.a[out_i] == 0;



implementation _v2.f(x: int) returns (r: int)
{

  anon0:
    r := x + 1;
    return;
}



implementation _v2.Iterator(s: int) returns (r: int)
{
  var i: int;
  var tmp: int;

  anon0:
    i := s;
    call i, tmp := _v2.Iterator_loop_anon4_LoopHead(i, tmp);
    goto anon4_LoopDone, anon4_LoopBody;

  anon4_LoopBody:
    assume {:partition} _v2.a[i] != 0;
    call tmp := _v2.f(_v2.a[i]);
    _v2.a[i] := tmp;
    i := i + 1;
    goto anon5_Then, anon5_Else;

  anon5_Else:
    assume {:partition} _v2.a[i] != 0;
    _v2.a[i] := tmp;
    i := i + 1;
    assume false;
    return;

  anon5_Then:
    assume {:partition} _v2.a[i] == 0;
    return;

  anon4_LoopDone:
    assume {:partition} _v2.a[i] == 0;
    return;
}



implementation _v2.Iterator_loop_anon4_LoopHead(in_i: int, in_tmp: int) returns (out_i: int, out_tmp: int)
{

  entry:
    out_i, out_tmp := in_i, in_tmp;
    goto anon4_LoopDone, anon4_LoopBody;

  anon4_LoopBody:
    assume {:partition} _v2.a[out_i] != 0;
    call out_tmp := _v2.f(_v2.a[out_i]);
    _v2.a[out_i] := out_tmp;
    out_i := out_i + 1;
    goto anon5_Then, anon5_Else;

  anon5_Else:
    assume {:partition} _v2.a[out_i] != 0;
    _v2.a[out_i] := out_tmp;
    out_i := out_i + 1;
    call out_i, out_tmp := _v2.Iterator_loop_anon4_LoopHead(out_i, out_tmp);
    return;

  anon5_Then:
    assume {:partition} _v2.a[out_i] == 0;
    out_i, out_tmp := in_i, in_tmp;
    _v2.a := old(_v2.a);
    return;

  anon4_LoopDone:
    assume {:partition} _v2.a[out_i] == 0;
    out_i, out_tmp := in_i, in_tmp;
    _v2.a := old(_v2.a);
    return;
}



var _v1.a: [int]int;

procedure {:prefix "_v1"} _v1.f(x: int) returns (r: int);
  free ensures {:io_dependency "r", "x"} true;
  free ensures {:io_dependency "r", "x"} true;
  free ensures R___v1.f(x, old(_v1.a), r);



procedure {:prefix "_v1"} _v1.Iterator(s: int) returns (r: int);
  modifies _v1.a;
  free ensures {:io_dependency "a", "a", "s"} true;
  free ensures {:io_dependency "a", "a", "s"} true;
  free ensures R___v1.Iterator(s, old(_v1.a), _v1.a, r);



procedure {:prefix "_v1"} _v1.Iterator_loop_anon2_LoopHead(in_i: int, in_tmp: int) returns (out_i: int, out_tmp: int);
  modifies _v1.a;
  free ensures {:io_dependency "a", "a", "in_i"} true;
  free ensures {:io_dependency "out_i", "in_i", "a"} true;
  free ensures {:io_dependency "out_tmp", "in_tmp", "a", "in_i"} true;
  free ensures {:io_dependency "a", "a", "in_i"} true;
  free ensures {:io_dependency "out_i", "in_i", "a"} true;
  free ensures {:io_dependency "out_tmp", "in_tmp", "a", "in_i"} true;
  free ensures R___v1.Iterator_loop_anon2_LoopHead(in_i, in_tmp, old(_v1.a), _v1.a, out_i, out_tmp);



implementation _v1.f(x: int) returns (r: int)
{

  anon0:
    r := x + 1;
    return;
}



implementation _v1.Iterator(s: int) returns (r: int)
{
  var i: int;
  var tmp: int;
  var inline$_v1.Iterator_loop_anon2_LoopHead$0$in_i: int;
  var inline$_v1.Iterator_loop_anon2_LoopHead$0$in_tmp: int;
  var inline$_v1.Iterator_loop_anon2_LoopHead$0$out_i: int;
  var inline$_v1.Iterator_loop_anon2_LoopHead$0$out_tmp: int;
  var inline$_v1.Iterator_loop_anon2_LoopHead$0$_v1.a: [int]int;

  anon0:
    i := s;
    goto inline$_v1.Iterator_loop_anon2_LoopHead$0$Entry;

  inline$_v1.Iterator_loop_anon2_LoopHead$0$Entry:
    inline$_v1.Iterator_loop_anon2_LoopHead$0$in_i := i;
    inline$_v1.Iterator_loop_anon2_LoopHead$0$in_tmp := tmp;
    havoc inline$_v1.Iterator_loop_anon2_LoopHead$0$out_i, inline$_v1.Iterator_loop_anon2_LoopHead$0$out_tmp;
    inline$_v1.Iterator_loop_anon2_LoopHead$0$_v1.a := _v1.a;
    goto inline$_v1.Iterator_loop_anon2_LoopHead$0$entry;

  inline$_v1.Iterator_loop_anon2_LoopHead$0$entry:
    inline$_v1.Iterator_loop_anon2_LoopHead$0$out_i, inline$_v1.Iterator_loop_anon2_LoopHead$0$out_tmp := inline$_v1.Iterator_loop_anon2_LoopHead$0$in_i, inline$_v1.Iterator_loop_anon2_LoopHead$0$in_tmp;
    goto inline$_v1.Iterator_loop_anon2_LoopHead$0$anon2_LoopDone, inline$_v1.Iterator_loop_anon2_LoopHead$0$anon2_LoopBody;

  inline$_v1.Iterator_loop_anon2_LoopHead$0$anon2_LoopBody:
    assume {:partition} _v1.a[inline$_v1.Iterator_loop_anon2_LoopHead$0$out_i] != 0;
    call inline$_v1.Iterator_loop_anon2_LoopHead$0$out_tmp := _v1.f(_v1.a[inline$_v1.Iterator_loop_anon2_LoopHead$0$out_i]);
    _v1.a[inline$_v1.Iterator_loop_anon2_LoopHead$0$out_i] := inline$_v1.Iterator_loop_anon2_LoopHead$0$out_tmp;
    inline$_v1.Iterator_loop_anon2_LoopHead$0$out_i := inline$_v1.Iterator_loop_anon2_LoopHead$0$out_i + 1;
    call inline$_v1.Iterator_loop_anon2_LoopHead$0$out_i, inline$_v1.Iterator_loop_anon2_LoopHead$0$out_tmp := _v1.Iterator_loop_anon2_LoopHead(inline$_v1.Iterator_loop_anon2_LoopHead$0$out_i, inline$_v1.Iterator_loop_anon2_LoopHead$0$out_tmp);
    goto inline$_v1.Iterator_loop_anon2_LoopHead$0$Return;

  inline$_v1.Iterator_loop_anon2_LoopHead$0$anon2_LoopDone:
    assume {:partition} _v1.a[inline$_v1.Iterator_loop_anon2_LoopHead$0$out_i] == 0;
    inline$_v1.Iterator_loop_anon2_LoopHead$0$out_i, inline$_v1.Iterator_loop_anon2_LoopHead$0$out_tmp := inline$_v1.Iterator_loop_anon2_LoopHead$0$in_i, inline$_v1.Iterator_loop_anon2_LoopHead$0$in_tmp;
    _v1.a := inline$_v1.Iterator_loop_anon2_LoopHead$0$_v1.a;
    goto inline$_v1.Iterator_loop_anon2_LoopHead$0$Return;

  inline$_v1.Iterator_loop_anon2_LoopHead$0$Return:
    assume true;
    assume true;
    assume true;
    assume true;
    assume true;
    assume true;
    assume true;
    i := inline$_v1.Iterator_loop_anon2_LoopHead$0$out_i;
    tmp := inline$_v1.Iterator_loop_anon2_LoopHead$0$out_tmp;
    goto anon0$1;

  anon0$1:
    goto anon2_LoopDone, anon2_LoopBody;

  anon2_LoopBody:
    assume {:partition} _v1.a[i] != 0;
    call tmp := _v1.f(_v1.a[i]);
    _v1.a[i] := tmp;
    i := i + 1;
    assume false;
    return;

  anon2_LoopDone:
    assume {:partition} _v1.a[i] == 0;
    return;
}



implementation _v1.Iterator_loop_anon2_LoopHead(in_i: int, in_tmp: int) returns (out_i: int, out_tmp: int)
{
  var inline$_v1.Iterator_loop_anon2_LoopHead$0$in_i: int;
  var inline$_v1.Iterator_loop_anon2_LoopHead$0$in_tmp: int;
  var inline$_v1.Iterator_loop_anon2_LoopHead$0$out_i: int;
  var inline$_v1.Iterator_loop_anon2_LoopHead$0$out_tmp: int;
  var inline$_v1.Iterator_loop_anon2_LoopHead$0$_v1.a: [int]int;

  entry:
    out_i, out_tmp := in_i, in_tmp;
    goto anon2_LoopDone, anon2_LoopBody;

  anon2_LoopBody:
    assume {:partition} _v1.a[out_i] != 0;
    call out_tmp := _v1.f(_v1.a[out_i]);
    _v1.a[out_i] := out_tmp;
    out_i := out_i + 1;
    goto inline$_v1.Iterator_loop_anon2_LoopHead$0$Entry;

  inline$_v1.Iterator_loop_anon2_LoopHead$0$Entry:
    inline$_v1.Iterator_loop_anon2_LoopHead$0$in_i := out_i;
    inline$_v1.Iterator_loop_anon2_LoopHead$0$in_tmp := out_tmp;
    havoc inline$_v1.Iterator_loop_anon2_LoopHead$0$out_i, inline$_v1.Iterator_loop_anon2_LoopHead$0$out_tmp;
    inline$_v1.Iterator_loop_anon2_LoopHead$0$_v1.a := _v1.a;
    goto inline$_v1.Iterator_loop_anon2_LoopHead$0$entry;

  inline$_v1.Iterator_loop_anon2_LoopHead$0$entry:
    inline$_v1.Iterator_loop_anon2_LoopHead$0$out_i, inline$_v1.Iterator_loop_anon2_LoopHead$0$out_tmp := inline$_v1.Iterator_loop_anon2_LoopHead$0$in_i, inline$_v1.Iterator_loop_anon2_LoopHead$0$in_tmp;
    goto inline$_v1.Iterator_loop_anon2_LoopHead$0$anon2_LoopDone, inline$_v1.Iterator_loop_anon2_LoopHead$0$anon2_LoopBody;

  inline$_v1.Iterator_loop_anon2_LoopHead$0$anon2_LoopBody:
    assume {:partition} _v1.a[inline$_v1.Iterator_loop_anon2_LoopHead$0$out_i] != 0;
    call inline$_v1.Iterator_loop_anon2_LoopHead$0$out_tmp := _v1.f(_v1.a[inline$_v1.Iterator_loop_anon2_LoopHead$0$out_i]);
    _v1.a[inline$_v1.Iterator_loop_anon2_LoopHead$0$out_i] := inline$_v1.Iterator_loop_anon2_LoopHead$0$out_tmp;
    inline$_v1.Iterator_loop_anon2_LoopHead$0$out_i := inline$_v1.Iterator_loop_anon2_LoopHead$0$out_i + 1;
    call inline$_v1.Iterator_loop_anon2_LoopHead$0$out_i, inline$_v1.Iterator_loop_anon2_LoopHead$0$out_tmp := _v1.Iterator_loop_anon2_LoopHead(inline$_v1.Iterator_loop_anon2_LoopHead$0$out_i, inline$_v1.Iterator_loop_anon2_LoopHead$0$out_tmp);
    goto inline$_v1.Iterator_loop_anon2_LoopHead$0$Return;

  inline$_v1.Iterator_loop_anon2_LoopHead$0$anon2_LoopDone:
    assume {:partition} _v1.a[inline$_v1.Iterator_loop_anon2_LoopHead$0$out_i] == 0;
    inline$_v1.Iterator_loop_anon2_LoopHead$0$out_i, inline$_v1.Iterator_loop_anon2_LoopHead$0$out_tmp := inline$_v1.Iterator_loop_anon2_LoopHead$0$in_i, inline$_v1.Iterator_loop_anon2_LoopHead$0$in_tmp;
    _v1.a := inline$_v1.Iterator_loop_anon2_LoopHead$0$_v1.a;
    goto inline$_v1.Iterator_loop_anon2_LoopHead$0$Return;

  inline$_v1.Iterator_loop_anon2_LoopHead$0$Return:
    assume true;
    assume true;
    assume true;
    assume true;
    assume true;
    assume true;
    assume true;
    out_i := inline$_v1.Iterator_loop_anon2_LoopHead$0$out_i;
    out_tmp := inline$_v1.Iterator_loop_anon2_LoopHead$0$out_tmp;
    goto anon2_LoopBody$1;

  anon2_LoopBody$1:
    return;

  anon2_LoopDone:
    assume {:partition} _v1.a[out_i] == 0;
    out_i, out_tmp := in_i, in_tmp;
    _v1.a := old(_v1.a);
    return;
}



function R___v2.f(.x: int, _v2.a_old: [int]int, .r: int) : bool;

function R'___v2.f(.x: int, _v2.a_old: [int]int) : bool;

function R___v2.Iterator(.s: int, _v2.a_old: [int]int, _v2.a_: [int]int, .r: int) : bool;

function R'___v2.Iterator(.s: int, _v2.a_old: [int]int) : bool;

function R___v2.Iterator_loop_anon4_LoopHead(.in_i: int, 
    .in_tmp: int, 
    _v2.a_old: [int]int, 
    _v2.a_: [int]int, 
    .out_i: int, 
    .out_tmp: int)
   : bool;

function R'___v2.Iterator_loop_anon4_LoopHead(.in_i: int, .in_tmp: int, _v2.a_old: [int]int) : bool;

function R___v1.f(.x: int, _v1.a_old: [int]int, .r: int) : bool;

function R___v1.Iterator(.s: int, _v1.a_old: [int]int, _v1.a_: [int]int, .r: int) : bool;

function R___v1.Iterator_loop_anon2_LoopHead(.in_i: int, 
    .in_tmp: int, 
    _v1.a_old: [int]int, 
    _v1.a_: [int]int, 
    .out_i: int, 
    .out_tmp: int)
   : bool;

function {:inline true} MS$_v1.f$_v2.f(_v1.x: int, 
    _v1.a_old: [int]int, 
    _v1.r: int, 
    _v2.x: int, 
    _v2.a_old: [int]int, 
    _v2.r: int)
   : bool
{
  _v1.x == _v2.x && _v1.a_old == _v2.a_old ==> _v1.r == _v2.r
}

axiom (forall _v1.x: int, 
    _v1.a_old: [int]int, 
    _v1.r: int, 
    _v2.x: int, 
    _v2.a_old: [int]int, 
    _v2.r: int :: 
  { R___v1.f(_v1.x, _v1.a_old, _v1.r), R___v2.f(_v2.x, _v2.a_old, _v2.r) } 
  R___v1.f(_v1.x, _v1.a_old, _v1.r) && R___v2.f(_v2.x, _v2.a_old, _v2.r)
     ==> MS$_v1.f$_v2.f(_v1.x, _v1.a_old, _v1.r, _v2.x, _v2.a_old, _v2.r));

function {:inline true} MS_pre_$_v1.f$_v2.f(_v1.x: int, _v1.a_old: [int]int, _v2.x: int, _v2.a_old: [int]int) : bool
{
  true
}

procedure {:MS_procs "_v1.f", "_v2.f"} MS_Check__v1.f___v2.f(_v1.x: int, _v2.x: int) returns (_v1.r: int, _v2.r: int);
  requires MS_pre_$_v1.f$_v2.f(_v1.x, _v1.a, _v2.x, _v2.a);
  ensures MS$_v1.f$_v2.f(_v1.x, old(_v1.a), _v1.r, _v2.x, old(_v2.a), _v2.r);



implementation MS_Check__v1.f___v2.f(_v1.x: int, _v2.x: int) returns (_v1.r: int, _v2.r: int)
{
  var inline$_v1.f$0$x: int;
  var inline$_v1.f$0$r: int;
  var inline$_v2.f$0$x: int;
  var inline$_v2.f$0$r: int;

  START:
    inline$_v1.f$0$x := _v1.x;
    havoc inline$_v1.f$0$r;
    inline$_v1.f$0$r := inline$_v1.f$0$x + 1;
    assume true;
    assume true;
    assume true;
    _v1.r := inline$_v1.f$0$r;
    inline$_v2.f$0$x := _v2.x;
    havoc inline$_v2.f$0$r;
    inline$_v2.f$0$r := inline$_v2.f$0$x + 1;
    assume true;
    assume true;
    assume true;
    assume true;
    _v2.r := inline$_v2.f$0$r;
    return;
}



function {:inline true} RT_cond_$_v1.f$_v2.f(_v1.x: int, _v1.a_old: [int]int, _v2.x: int, _v2.a_old: [int]int) : bool
{
  MS_pre_$_v1.f$_v2.f(_v1.x, _v1.a_old, _v2.x, _v2.a_old)
}

axiom (forall _v1.x: int, _v1.a_old: [int]int, _v1.r: int, _v2.x: int, _v2.a_old: [int]int :: 
  { R___v1.f(_v1.x, _v1.a_old, _v1.r), R'___v2.f(_v2.x, _v2.a_old) } 
  RT_cond_$_v1.f$_v2.f(_v1.x, _v1.a_old, _v2.x, _v2.a_old)
       && R___v1.f(_v1.x, _v1.a_old, _v1.r)
     ==> R'___v2.f(_v2.x, _v2.a_old));

procedure RT_Check__v1.f___v2.f(_v1.x: int, _v2.x: int) returns (_v1.r: int, _v2.r: int);
  requires RT_cond_$_v1.f$_v2.f(_v1.x, _v1.a, _v2.x, _v2.a);



implementation RT_Check__v1.f___v2.f(_v1.x: int, _v2.x: int) returns (_v1.r: int, _v2.r: int)
{
  var inline$_v1.f$0$x: int;
  var inline$_v1.f$0$r: int;
  var inline$_v2.f$0$x: int;
  var inline$_v2.f$0$r: int;

  START:
    inline$_v1.f$0$x := _v1.x;
    havoc inline$_v1.f$0$r;
    inline$_v1.f$0$r := inline$_v1.f$0$x + 1;
    assume true;
    assume true;
    assume true;
    _v1.r := inline$_v1.f$0$r;
    inline$_v2.f$0$x := _v2.x;
    havoc inline$_v2.f$0$r;
    inline$_v2.f$0$r := inline$_v2.f$0$x + 1;
    assume true;
    assume true;
    assume true;
    assume true;
    _v2.r := inline$_v2.f$0$r;
    return;
}



function {:inline true} MS$_v1.Iterator$_v2.Iterator(_v1.s: int, 
    _v1.a_old: [int]int, 
    _v1.a_: [int]int, 
    _v1.r: int, 
    _v2.s: int, 
    _v2.a_old: [int]int, 
    _v2.a_: [int]int, 
    _v2.r: int)
   : bool
{
  _v1.s == _v2.s && _v1.a_old == _v2.a_old ==> _v1.a_ == _v2.a_ && _v1.r == _v2.r
}

axiom (forall _v1.s: int, 
    _v1.a_old: [int]int, 
    _v1.a_: [int]int, 
    _v1.r: int, 
    _v2.s: int, 
    _v2.a_old: [int]int, 
    _v2.a_: [int]int, 
    _v2.r: int :: 
  { R___v1.Iterator(_v1.s, _v1.a_old, _v1.a_, _v1.r), R___v2.Iterator(_v2.s, _v2.a_old, _v2.a_, _v2.r) } 
  R___v1.Iterator(_v1.s, _v1.a_old, _v1.a_, _v1.r)
       && R___v2.Iterator(_v2.s, _v2.a_old, _v2.a_, _v2.r)
     ==> MS$_v1.Iterator$_v2.Iterator(_v1.s, _v1.a_old, _v1.a_, _v1.r, _v2.s, _v2.a_old, _v2.a_, _v2.r));

function {:inline true} MS_pre_$_v1.Iterator$_v2.Iterator(_v1.s: int, _v1.a_old: [int]int, _v2.s: int, _v2.a_old: [int]int) : bool
{
 _v1.s == _v2.s && _v1.a_old == _v2.a_old 
}

procedure {:MS_procs "_v1.Iterator", "_v2.Iterator"} MS_Check__v1.Iterator___v2.Iterator(_v1.s: int, _v2.s: int) returns (_v1.r: int, _v2.r: int);
  requires MS_pre_$_v1.Iterator$_v2.Iterator(_v1.s, _v1.a, _v2.s, _v2.a);
  modifies _v1.a, _v2.a;
  ensures MS$_v1.Iterator$_v2.Iterator(_v1.s, old(_v1.a), _v1.a, _v1.r, _v2.s, old(_v2.a), _v2.a, _v2.r);



implementation MS_Check__v1.Iterator___v2.Iterator(_v1.s: int, _v2.s: int) returns (_v1.r: int, _v2.r: int)
{
  var inline$_v1.Iterator$0$i: int;
  var inline$_v1.Iterator$0$tmp: int;
  var inline$_v1.Iterator$0$s: int;
  var inline$_v1.Iterator$0$r: int;
  var inline$_v1.Iterator$0$_v1.a: [int]int;
  var inline$_v2.Iterator$0$i: int;
  var inline$_v2.Iterator$0$tmp: int;
  var inline$_v2.Iterator$0$s: int;
  var inline$_v2.Iterator$0$r: int;
  var inline$_v2.Iterator$0$_v2.a: [int]int;
  var inline$$_v1.Iterator_loop_anon2_LoopHead$0$in_i: int;
  var inline$$_v1.Iterator_loop_anon2_LoopHead$0$in_tmp: int;
  var inline$$_v1.Iterator_loop_anon2_LoopHead$0$out_i: int;
  var inline$$_v1.Iterator_loop_anon2_LoopHead$0$out_tmp: int;
  var inline$$_v1.Iterator_loop_anon2_LoopHead$0$_v1.a: [int]int;

  START:
    inline$_v1.Iterator$0$s := _v1.s;
    havoc inline$_v1.Iterator$0$i, inline$_v1.Iterator$0$tmp, inline$_v1.Iterator$0$r;
    inline$_v1.Iterator$0$_v1.a := _v1.a;
    inline$_v1.Iterator$0$i := inline$_v1.Iterator$0$s;
    goto inline$$_v1.Iterator_loop_anon2_LoopHead$0$Entry;

  inline$$_v1.Iterator_loop_anon2_LoopHead$0$Entry:
    inline$$_v1.Iterator_loop_anon2_LoopHead$0$in_i := inline$_v1.Iterator$0$i;
    inline$$_v1.Iterator_loop_anon2_LoopHead$0$in_tmp := inline$_v1.Iterator$0$tmp;
    havoc inline$$_v1.Iterator_loop_anon2_LoopHead$0$out_i, inline$$_v1.Iterator_loop_anon2_LoopHead$0$out_tmp;
    inline$$_v1.Iterator_loop_anon2_LoopHead$0$_v1.a := _v1.a;
    goto inline$$_v1.Iterator_loop_anon2_LoopHead$0$entry;

  inline$$_v1.Iterator_loop_anon2_LoopHead$0$entry:
    inline$$_v1.Iterator_loop_anon2_LoopHead$0$out_i, inline$$_v1.Iterator_loop_anon2_LoopHead$0$out_tmp := inline$$_v1.Iterator_loop_anon2_LoopHead$0$in_i, inline$$_v1.Iterator_loop_anon2_LoopHead$0$in_tmp;
    goto inline$$_v1.Iterator_loop_anon2_LoopHead$0$anon2_LoopDone, inline$$_v1.Iterator_loop_anon2_LoopHead$0$anon2_LoopBody;

  inline$$_v1.Iterator_loop_anon2_LoopHead$0$anon2_LoopBody:
    assume {:partition} _v1.a[inline$$_v1.Iterator_loop_anon2_LoopHead$0$out_i] != 0;
    call inline$$_v1.Iterator_loop_anon2_LoopHead$0$out_tmp := _v1.f(_v1.a[inline$$_v1.Iterator_loop_anon2_LoopHead$0$out_i]);
    _v1.a[inline$$_v1.Iterator_loop_anon2_LoopHead$0$out_i] := inline$$_v1.Iterator_loop_anon2_LoopHead$0$out_tmp;
    inline$$_v1.Iterator_loop_anon2_LoopHead$0$out_i := inline$$_v1.Iterator_loop_anon2_LoopHead$0$out_i + 1;
    call inline$$_v1.Iterator_loop_anon2_LoopHead$0$out_i, inline$$_v1.Iterator_loop_anon2_LoopHead$0$out_tmp := _v1.Iterator_loop_anon2_LoopHead(inline$$_v1.Iterator_loop_anon2_LoopHead$0$out_i, inline$$_v1.Iterator_loop_anon2_LoopHead$0$out_tmp);
    goto inline$$_v1.Iterator_loop_anon2_LoopHead$0$Return;

  inline$$_v1.Iterator_loop_anon2_LoopHead$0$anon2_LoopDone:
    assume {:partition} _v1.a[inline$$_v1.Iterator_loop_anon2_LoopHead$0$out_i] == 0;
    inline$$_v1.Iterator_loop_anon2_LoopHead$0$out_i, inline$$_v1.Iterator_loop_anon2_LoopHead$0$out_tmp := inline$$_v1.Iterator_loop_anon2_LoopHead$0$in_i, inline$$_v1.Iterator_loop_anon2_LoopHead$0$in_tmp;
    _v1.a := inline$$_v1.Iterator_loop_anon2_LoopHead$0$_v1.a;
    goto inline$$_v1.Iterator_loop_anon2_LoopHead$0$Return;

  inline$$_v1.Iterator_loop_anon2_LoopHead$0$Return:
    assume true;
    assume true;
    assume true;
    assume true;
    assume true;
    assume true;
    assume true;
    inline$_v1.Iterator$0$i := inline$$_v1.Iterator_loop_anon2_LoopHead$0$out_i;
    inline$_v1.Iterator$0$tmp := inline$$_v1.Iterator_loop_anon2_LoopHead$0$out_tmp;
    goto START$1;

  START$1:
    goto inline$_v1.Iterator$0$anon2_LoopDone, inline$_v1.Iterator$0$anon2_LoopBody;

  inline$_v1.Iterator$0$anon2_LoopBody:
    assume {:partition} _v1.a[inline$_v1.Iterator$0$i] != 0;
    call inline$_v1.Iterator$0$tmp := _v1.f(_v1.a[inline$_v1.Iterator$0$i]);
    _v1.a[inline$_v1.Iterator$0$i] := inline$_v1.Iterator$0$tmp;
    inline$_v1.Iterator$0$i := inline$_v1.Iterator$0$i + 1;
    assume false;
    return;

  inline$_v1.Iterator$0$anon2_LoopDone:
    assume {:partition} _v1.a[inline$_v1.Iterator$0$i] == 0;
    assume true;
    assume true;
    assume true;
    _v1.r := inline$_v1.Iterator$0$r;
    inline$_v2.Iterator$0$s := _v2.s;
    havoc inline$_v2.Iterator$0$i, inline$_v2.Iterator$0$tmp, inline$_v2.Iterator$0$r;
    inline$_v2.Iterator$0$_v2.a := _v2.a;
    inline$_v2.Iterator$0$i := inline$_v2.Iterator$0$s;
    call inline$_v2.Iterator$0$i, inline$_v2.Iterator$0$tmp := _v2.Iterator_loop_anon4_LoopHead(inline$_v2.Iterator$0$i, inline$_v2.Iterator$0$tmp);
    goto inline$_v2.Iterator$0$anon4_LoopDone, inline$_v2.Iterator$0$anon4_LoopBody;

  inline$_v2.Iterator$0$anon4_LoopBody:
    assume {:partition} _v2.a[inline$_v2.Iterator$0$i] != 0;
    call inline$_v2.Iterator$0$tmp := _v2.f(_v2.a[inline$_v2.Iterator$0$i]);
    _v2.a[inline$_v2.Iterator$0$i] := inline$_v2.Iterator$0$tmp;
    inline$_v2.Iterator$0$i := inline$_v2.Iterator$0$i + 1;
    goto inline$_v2.Iterator$0$anon5_Then, inline$_v2.Iterator$0$anon5_Else;

  inline$_v2.Iterator$0$anon5_Else:
    assume {:partition} _v2.a[inline$_v2.Iterator$0$i] != 0;
    _v2.a[inline$_v2.Iterator$0$i] := inline$_v2.Iterator$0$tmp;
    inline$_v2.Iterator$0$i := inline$_v2.Iterator$0$i + 1;
    assume false;
    return;

  inline$_v2.Iterator$0$anon5_Then:
    assume {:partition} _v2.a[inline$_v2.Iterator$0$i] == 0;
    goto inline$_v2.Iterator$0$Return;

  inline$_v2.Iterator$0$Return:
    assume true;
    assume true;
    assume true;
    assume true;
    _v2.r := inline$_v2.Iterator$0$r;
    return;

  inline$_v2.Iterator$0$anon4_LoopDone:
    assume {:partition} _v2.a[inline$_v2.Iterator$0$i] == 0;
    goto inline$_v2.Iterator$0$Return;
}



function {:inline true} RT_cond_$_v1.Iterator$_v2.Iterator(_v1.s: int, _v1.a_old: [int]int, _v2.s: int, _v2.a_old: [int]int) : bool
{
  MS_pre_$_v1.Iterator$_v2.Iterator(_v1.s, _v1.a_old, _v2.s, _v2.a_old)
}

axiom (forall _v1.s: int, 
    _v1.a_old: [int]int, 
    _v1.a_: [int]int, 
    _v1.r: int, 
    _v2.s: int, 
    _v2.a_old: [int]int :: 
  { R___v1.Iterator(_v1.s, _v1.a_old, _v1.a_, _v1.r), R'___v2.Iterator(_v2.s, _v2.a_old) } 
  RT_cond_$_v1.Iterator$_v2.Iterator(_v1.s, _v1.a_old, _v2.s, _v2.a_old)
       && R___v1.Iterator(_v1.s, _v1.a_old, _v1.a_, _v1.r)
     ==> R'___v2.Iterator(_v2.s, _v2.a_old));

procedure RT_Check__v1.Iterator___v2.Iterator(_v1.s: int, _v2.s: int) returns (_v1.r: int, _v2.r: int);
  requires RT_cond_$_v1.Iterator$_v2.Iterator(_v1.s, _v1.a, _v2.s, _v2.a);
  modifies _v1.a, _v2.a;



implementation RT_Check__v1.Iterator___v2.Iterator(_v1.s: int, _v2.s: int) returns (_v1.r: int, _v2.r: int)
{
  var inline$_v1.Iterator$0$i: int;
  var inline$_v1.Iterator$0$tmp: int;
  var inline$_v1.Iterator$0$s: int;
  var inline$_v1.Iterator$0$r: int;
  var inline$_v1.Iterator$0$_v1.a: [int]int;
  var inline$_v2.Iterator$0$i: int;
  var inline$_v2.Iterator$0$tmp: int;
  var inline$_v2.Iterator$0$s: int;
  var inline$_v2.Iterator$0$r: int;
  var inline$_v2.Iterator$0$_v2.a: [int]int;

  START:
    goto inline$_v1.Iterator$0$Entry;

  inline$_v1.Iterator$0$Entry:
    inline$_v1.Iterator$0$s := _v1.s;
    havoc inline$_v1.Iterator$0$i, inline$_v1.Iterator$0$tmp, inline$_v1.Iterator$0$r;
    inline$_v1.Iterator$0$_v1.a := _v1.a;
    goto inline$_v1.Iterator$0$anon0;

  inline$_v1.Iterator$0$anon0:
    inline$_v1.Iterator$0$i := inline$_v1.Iterator$0$s;
    goto inline$_v1.Iterator$0$anon2_LoopHead;

  inline$_v1.Iterator$0$anon2_LoopHead:
    call inline$_v1.Iterator$0$i, inline$_v1.Iterator$0$tmp := _v1.Iterator_loop_anon2_LoopHead(inline$_v1.Iterator$0$i, inline$_v1.Iterator$0$tmp);
    goto inline$_v1.Iterator$0$anon2_LoopHead_last;

  inline$_v1.Iterator$0$anon2_LoopHead_last:
    goto inline$_v1.Iterator$0$anon2_LoopDone, inline$_v1.Iterator$0$anon2_LoopBody;

  inline$_v1.Iterator$0$anon2_LoopBody:
    assume {:partition} _v1.a[inline$_v1.Iterator$0$i] != 0;
    call inline$_v1.Iterator$0$tmp := _v1.f(_v1.a[inline$_v1.Iterator$0$i]);
    _v1.a[inline$_v1.Iterator$0$i] := inline$_v1.Iterator$0$tmp;
    inline$_v1.Iterator$0$i := inline$_v1.Iterator$0$i + 1;
    goto inline$_v1.Iterator$0$anon2_LoopBody_dummy;

  inline$_v1.Iterator$0$anon2_LoopBody_dummy:
    assume false;
    goto inline$_v1.Iterator$0$Return;

  inline$_v1.Iterator$0$anon2_LoopDone:
    assume {:partition} _v1.a[inline$_v1.Iterator$0$i] == 0;
    goto inline$_v1.Iterator$0$Return;

  inline$_v1.Iterator$0$Return:
    assume true;
    assume true;
    assume true;
    _v1.r := inline$_v1.Iterator$0$r;
    goto START$1;

  START$1:
    goto inline$_v2.Iterator$0$Entry;

  inline$_v2.Iterator$0$Entry:
    inline$_v2.Iterator$0$s := _v2.s;
    havoc inline$_v2.Iterator$0$i, inline$_v2.Iterator$0$tmp, inline$_v2.Iterator$0$r;
    inline$_v2.Iterator$0$_v2.a := _v2.a;
    goto inline$_v2.Iterator$0$anon0;

  inline$_v2.Iterator$0$anon0:
    inline$_v2.Iterator$0$i := inline$_v2.Iterator$0$s;
    goto inline$_v2.Iterator$0$anon4_LoopHead;

  inline$_v2.Iterator$0$anon4_LoopHead:
    assert R'___v2.Iterator_loop_anon4_LoopHead(inline$_v2.Iterator$0$i, inline$_v2.Iterator$0$tmp, _v2.a);
    call inline$_v2.Iterator$0$i, inline$_v2.Iterator$0$tmp := _v2.Iterator_loop_anon4_LoopHead(inline$_v2.Iterator$0$i, inline$_v2.Iterator$0$tmp);
    goto inline$_v2.Iterator$0$anon4_LoopHead_last;

  inline$_v2.Iterator$0$anon4_LoopHead_last:
    goto inline$_v2.Iterator$0$anon4_LoopDone, inline$_v2.Iterator$0$anon4_LoopBody;

  inline$_v2.Iterator$0$anon4_LoopBody:
    assume {:partition} _v2.a[inline$_v2.Iterator$0$i] != 0;
    assert R'___v2.f(_v2.a[inline$_v2.Iterator$0$i], _v2.a);
    call inline$_v2.Iterator$0$tmp := _v2.f(_v2.a[inline$_v2.Iterator$0$i]);
    _v2.a[inline$_v2.Iterator$0$i] := inline$_v2.Iterator$0$tmp;
    inline$_v2.Iterator$0$i := inline$_v2.Iterator$0$i + 1;
    goto inline$_v2.Iterator$0$anon5_Then, inline$_v2.Iterator$0$anon5_Else;

  inline$_v2.Iterator$0$anon5_Else:
    assume {:partition} _v2.a[inline$_v2.Iterator$0$i] != 0;
    goto inline$_v2.Iterator$0$anon3;

  inline$_v2.Iterator$0$anon3:
    _v2.a[inline$_v2.Iterator$0$i] := inline$_v2.Iterator$0$tmp;
    inline$_v2.Iterator$0$i := inline$_v2.Iterator$0$i + 1;
    goto inline$_v2.Iterator$0$anon3_dummy;

  inline$_v2.Iterator$0$anon3_dummy:
    assume false;
    goto inline$_v2.Iterator$0$Return;

  inline$_v2.Iterator$0$anon5_Then:
    assume {:partition} _v2.a[inline$_v2.Iterator$0$i] == 0;
    goto inline$_v2.Iterator$0$Return;

  inline$_v2.Iterator$0$anon4_LoopDone:
    assume {:partition} _v2.a[inline$_v2.Iterator$0$i] == 0;
    goto inline$_v2.Iterator$0$Return;

  inline$_v2.Iterator$0$Return:
    assume true;
    assume true;
    assume true;
    assume true;
    _v2.r := inline$_v2.Iterator$0$r;
    goto START$2;

  START$2:
    return;
}



function {:inline true} MS$_v1.Iterator_loop_anon2_LoopHead$_v2.Iterator_loop_anon4_LoopHead(_v1.in_i: int, 
    _v1.in_tmp: int, 
    _v1.a_old: [int]int, 
    _v1.a_: [int]int, 
    _v1.out_i: int, 
    _v1.out_tmp: int, 
    _v2.in_i: int, 
    _v2.in_tmp: int, 
    _v2.a_old: [int]int, 
    _v2.a_: [int]int, 
    _v2.out_i: int, 
    _v2.out_tmp: int)
   : bool
{
   _v1.in_i == _v2.in_i && ArrEqAfter(_v1.a_old, _v2.a_old, _v1.in_i)
   ==> _v1.out_i == _v2.out_i && ArrEqAfter(_v1.a_, _v2.a_, _v1.out_i) 
}

axiom (forall _v1.in_i: int, 
    _v1.in_tmp: int, 
    _v1.a_old: [int]int, 
    _v1.a_: [int]int, 
    _v1.out_i: int, 
    _v1.out_tmp: int, 
    _v2.in_i: int, 
    _v2.in_tmp: int, 
    _v2.a_old: [int]int, 
    _v2.a_: [int]int, 
    _v2.out_i: int, 
    _v2.out_tmp: int :: 
  { R___v1.Iterator_loop_anon2_LoopHead(_v1.in_i, _v1.in_tmp, _v1.a_old, _v1.a_, _v1.out_i, _v1.out_tmp), R___v2.Iterator_loop_anon4_LoopHead(_v2.in_i, _v2.in_tmp, _v2.a_old, _v2.a_, _v2.out_i, _v2.out_tmp) } 
  R___v1.Iterator_loop_anon2_LoopHead(_v1.in_i, _v1.in_tmp, _v1.a_old, _v1.a_, _v1.out_i, _v1.out_tmp)
       && R___v2.Iterator_loop_anon4_LoopHead(_v2.in_i, _v2.in_tmp, _v2.a_old, _v2.a_, _v2.out_i, _v2.out_tmp)
     ==> MS$_v1.Iterator_loop_anon2_LoopHead$_v2.Iterator_loop_anon4_LoopHead(_v1.in_i, 
      _v1.in_tmp, 
      _v1.a_old, 
      _v1.a_, 
      _v1.out_i, 
      _v1.out_tmp, 
      _v2.in_i, 
      _v2.in_tmp, 
      _v2.a_old, 
      _v2.a_, 
      _v2.out_i, 
      _v2.out_tmp));

function {:inline true} MS_pre_$_v1.Iterator_loop_anon2_LoopHead$_v2.Iterator_loop_anon4_LoopHead(_v1.in_i: int, 
    _v1.in_tmp: int, 
    _v1.a_old: [int]int, 
    _v2.in_i: int, 
    _v2.in_tmp: int, 
    _v2.a_old: [int]int)
   : bool
{
 _v1.in_i == _v2.in_i && ArrEqAfter(_v1.a_old, _v2.a_old, _v1.in_i) 
}

procedure {:MS_procs "_v1.Iterator_loop_anon2_LoopHead", "_v2.Iterator_loop_anon4_LoopHead"} MS_Check__v1.Iterator_loop_anon2_LoopHead___v2.Iterator_loop_anon4_LoopHead(_v1.in_i: int, _v1.in_tmp: int, _v2.in_i: int, _v2.in_tmp: int)
   returns (_v1.out_i: int, _v1.out_tmp: int, _v2.out_i: int, _v2.out_tmp: int);
  requires MS_pre_$_v1.Iterator_loop_anon2_LoopHead$_v2.Iterator_loop_anon4_LoopHead(_v1.in_i, _v1.in_tmp, _v1.a, _v2.in_i, _v2.in_tmp, _v2.a);
  modifies _v1.a, _v2.a;
  ensures MS$_v1.Iterator_loop_anon2_LoopHead$_v2.Iterator_loop_anon4_LoopHead(_v1.in_i, 
  _v1.in_tmp, 
  old(_v1.a), 
  _v1.a, 
  _v1.out_i, 
  _v1.out_tmp, 
  _v2.in_i, 
  _v2.in_tmp, 
  old(_v2.a), 
  _v2.a, 
  _v2.out_i, 
  _v2.out_tmp);



implementation MS_Check__v1.Iterator_loop_anon2_LoopHead___v2.Iterator_loop_anon4_LoopHead(_v1.in_i: int, _v1.in_tmp: int, _v2.in_i: int, _v2.in_tmp: int)
   returns (_v1.out_i: int, _v1.out_tmp: int, _v2.out_i: int, _v2.out_tmp: int)
{
  var inline$_v1.Iterator_loop_anon2_LoopHead$0$in_i: int;
  var inline$_v1.Iterator_loop_anon2_LoopHead$0$in_tmp: int;
  var inline$_v1.Iterator_loop_anon2_LoopHead$0$out_i: int;
  var inline$_v1.Iterator_loop_anon2_LoopHead$0$out_tmp: int;
  var inline$_v1.Iterator_loop_anon2_LoopHead$0$_v1.a: [int]int;
  var inline$_v2.Iterator_loop_anon4_LoopHead$0$in_i: int;
  var inline$_v2.Iterator_loop_anon4_LoopHead$0$in_tmp: int;
  var inline$_v2.Iterator_loop_anon4_LoopHead$0$out_i: int;
  var inline$_v2.Iterator_loop_anon4_LoopHead$0$out_tmp: int;
  var inline$_v2.Iterator_loop_anon4_LoopHead$0$_v2.a: [int]int;
  var inline$$_v1.Iterator_loop_anon2_LoopHead$0$in_i: int;
  var inline$$_v1.Iterator_loop_anon2_LoopHead$0$in_tmp: int;
  var inline$$_v1.Iterator_loop_anon2_LoopHead$0$out_i: int;
  var inline$$_v1.Iterator_loop_anon2_LoopHead$0$out_tmp: int;
  var inline$$_v1.Iterator_loop_anon2_LoopHead$0$_v1.a: [int]int;

  START:
    inline$_v1.Iterator_loop_anon2_LoopHead$0$in_i := _v1.in_i;
    inline$_v1.Iterator_loop_anon2_LoopHead$0$in_tmp := _v1.in_tmp;
    havoc inline$_v1.Iterator_loop_anon2_LoopHead$0$out_i, inline$_v1.Iterator_loop_anon2_LoopHead$0$out_tmp;
    inline$_v1.Iterator_loop_anon2_LoopHead$0$_v1.a := _v1.a;
    inline$_v1.Iterator_loop_anon2_LoopHead$0$out_i, inline$_v1.Iterator_loop_anon2_LoopHead$0$out_tmp := inline$_v1.Iterator_loop_anon2_LoopHead$0$in_i, inline$_v1.Iterator_loop_anon2_LoopHead$0$in_tmp;
    goto inline$_v1.Iterator_loop_anon2_LoopHead$0$anon2_LoopDone, inline$_v1.Iterator_loop_anon2_LoopHead$0$anon2_LoopBody;

  inline$_v1.Iterator_loop_anon2_LoopHead$0$anon2_LoopBody:
    assume {:partition} _v1.a[inline$_v1.Iterator_loop_anon2_LoopHead$0$out_i] != 0;
    call inline$_v1.Iterator_loop_anon2_LoopHead$0$out_tmp := _v1.f(_v1.a[inline$_v1.Iterator_loop_anon2_LoopHead$0$out_i]);
    _v1.a[inline$_v1.Iterator_loop_anon2_LoopHead$0$out_i] := inline$_v1.Iterator_loop_anon2_LoopHead$0$out_tmp;
    inline$_v1.Iterator_loop_anon2_LoopHead$0$out_i := inline$_v1.Iterator_loop_anon2_LoopHead$0$out_i + 1;
    goto inline$$_v1.Iterator_loop_anon2_LoopHead$0$Entry;

  inline$$_v1.Iterator_loop_anon2_LoopHead$0$Entry:
    inline$$_v1.Iterator_loop_anon2_LoopHead$0$in_i := inline$_v1.Iterator_loop_anon2_LoopHead$0$out_i;
    inline$$_v1.Iterator_loop_anon2_LoopHead$0$in_tmp := inline$_v1.Iterator_loop_anon2_LoopHead$0$out_tmp;
    havoc inline$$_v1.Iterator_loop_anon2_LoopHead$0$out_i, inline$$_v1.Iterator_loop_anon2_LoopHead$0$out_tmp;
    inline$$_v1.Iterator_loop_anon2_LoopHead$0$_v1.a := _v1.a;
    goto inline$$_v1.Iterator_loop_anon2_LoopHead$0$entry;

  inline$$_v1.Iterator_loop_anon2_LoopHead$0$entry:
    inline$$_v1.Iterator_loop_anon2_LoopHead$0$out_i, inline$$_v1.Iterator_loop_anon2_LoopHead$0$out_tmp := inline$$_v1.Iterator_loop_anon2_LoopHead$0$in_i, inline$$_v1.Iterator_loop_anon2_LoopHead$0$in_tmp;
    goto inline$$_v1.Iterator_loop_anon2_LoopHead$0$anon2_LoopDone, inline$$_v1.Iterator_loop_anon2_LoopHead$0$anon2_LoopBody;

  inline$$_v1.Iterator_loop_anon2_LoopHead$0$anon2_LoopBody:
    assume {:partition} _v1.a[inline$$_v1.Iterator_loop_anon2_LoopHead$0$out_i] != 0;
    call inline$$_v1.Iterator_loop_anon2_LoopHead$0$out_tmp := _v1.f(_v1.a[inline$$_v1.Iterator_loop_anon2_LoopHead$0$out_i]);
    _v1.a[inline$$_v1.Iterator_loop_anon2_LoopHead$0$out_i] := inline$$_v1.Iterator_loop_anon2_LoopHead$0$out_tmp;
    inline$$_v1.Iterator_loop_anon2_LoopHead$0$out_i := inline$$_v1.Iterator_loop_anon2_LoopHead$0$out_i + 1;
    call inline$$_v1.Iterator_loop_anon2_LoopHead$0$out_i, inline$$_v1.Iterator_loop_anon2_LoopHead$0$out_tmp := _v1.Iterator_loop_anon2_LoopHead(inline$$_v1.Iterator_loop_anon2_LoopHead$0$out_i, inline$$_v1.Iterator_loop_anon2_LoopHead$0$out_tmp);
    goto inline$$_v1.Iterator_loop_anon2_LoopHead$0$Return;

  inline$$_v1.Iterator_loop_anon2_LoopHead$0$anon2_LoopDone:
    assume {:partition} _v1.a[inline$$_v1.Iterator_loop_anon2_LoopHead$0$out_i] == 0;
    inline$$_v1.Iterator_loop_anon2_LoopHead$0$out_i, inline$$_v1.Iterator_loop_anon2_LoopHead$0$out_tmp := inline$$_v1.Iterator_loop_anon2_LoopHead$0$in_i, inline$$_v1.Iterator_loop_anon2_LoopHead$0$in_tmp;
    _v1.a := inline$$_v1.Iterator_loop_anon2_LoopHead$0$_v1.a;
    goto inline$$_v1.Iterator_loop_anon2_LoopHead$0$Return;

  inline$$_v1.Iterator_loop_anon2_LoopHead$0$Return:
    assume true;
    assume true;
    assume true;
    assume true;
    assume true;
    assume true;
    assume true;
    inline$_v1.Iterator_loop_anon2_LoopHead$0$out_i := inline$$_v1.Iterator_loop_anon2_LoopHead$0$out_i;
    inline$_v1.Iterator_loop_anon2_LoopHead$0$out_tmp := inline$$_v1.Iterator_loop_anon2_LoopHead$0$out_tmp;
    goto inline$_v1.Iterator_loop_anon2_LoopHead$0$anon2_LoopBody$1;

  inline$_v1.Iterator_loop_anon2_LoopHead$0$anon2_LoopBody$1:
    goto inline$_v1.Iterator_loop_anon2_LoopHead$0$Return;

  inline$_v1.Iterator_loop_anon2_LoopHead$0$Return:
    assume true;
    assume true;
    assume true;
    assume true;
    assume true;
    assume true;
    assume true;
    _v1.out_i := inline$_v1.Iterator_loop_anon2_LoopHead$0$out_i;
    _v1.out_tmp := inline$_v1.Iterator_loop_anon2_LoopHead$0$out_tmp;
    inline$_v2.Iterator_loop_anon4_LoopHead$0$in_i := _v2.in_i;
    inline$_v2.Iterator_loop_anon4_LoopHead$0$in_tmp := _v2.in_tmp;
    havoc inline$_v2.Iterator_loop_anon4_LoopHead$0$out_i, inline$_v2.Iterator_loop_anon4_LoopHead$0$out_tmp;
    inline$_v2.Iterator_loop_anon4_LoopHead$0$_v2.a := _v2.a;
    inline$_v2.Iterator_loop_anon4_LoopHead$0$out_i, inline$_v2.Iterator_loop_anon4_LoopHead$0$out_tmp := inline$_v2.Iterator_loop_anon4_LoopHead$0$in_i, inline$_v2.Iterator_loop_anon4_LoopHead$0$in_tmp;
    goto inline$_v2.Iterator_loop_anon4_LoopHead$0$anon4_LoopDone, inline$_v2.Iterator_loop_anon4_LoopHead$0$anon4_LoopBody;

  inline$_v2.Iterator_loop_anon4_LoopHead$0$anon4_LoopBody:
    assume {:partition} _v2.a[inline$_v2.Iterator_loop_anon4_LoopHead$0$out_i] != 0;
    call inline$_v2.Iterator_loop_anon4_LoopHead$0$out_tmp := _v2.f(_v2.a[inline$_v2.Iterator_loop_anon4_LoopHead$0$out_i]);
    _v2.a[inline$_v2.Iterator_loop_anon4_LoopHead$0$out_i] := inline$_v2.Iterator_loop_anon4_LoopHead$0$out_tmp;
    inline$_v2.Iterator_loop_anon4_LoopHead$0$out_i := inline$_v2.Iterator_loop_anon4_LoopHead$0$out_i + 1;
    goto inline$_v2.Iterator_loop_anon4_LoopHead$0$anon5_Then, inline$_v2.Iterator_loop_anon4_LoopHead$0$anon5_Else;

  inline$_v2.Iterator_loop_anon4_LoopHead$0$anon5_Else:
    assume {:partition} _v2.a[inline$_v2.Iterator_loop_anon4_LoopHead$0$out_i] != 0;
    _v2.a[inline$_v2.Iterator_loop_anon4_LoopHead$0$out_i] := inline$_v2.Iterator_loop_anon4_LoopHead$0$out_tmp;
    inline$_v2.Iterator_loop_anon4_LoopHead$0$out_i := inline$_v2.Iterator_loop_anon4_LoopHead$0$out_i + 1;
    call inline$_v2.Iterator_loop_anon4_LoopHead$0$out_i, inline$_v2.Iterator_loop_anon4_LoopHead$0$out_tmp := _v2.Iterator_loop_anon4_LoopHead(inline$_v2.Iterator_loop_anon4_LoopHead$0$out_i, inline$_v2.Iterator_loop_anon4_LoopHead$0$out_tmp);
    goto inline$_v2.Iterator_loop_anon4_LoopHead$0$Return;

  inline$_v2.Iterator_loop_anon4_LoopHead$0$Return:
    assume true;
    assume true;
    assume true;
    assume true;
    assume true;
    assume true;
    assume true;
    assume true;
    _v2.out_i := inline$_v2.Iterator_loop_anon4_LoopHead$0$out_i;
    _v2.out_tmp := inline$_v2.Iterator_loop_anon4_LoopHead$0$out_tmp;
    return;

  inline$_v2.Iterator_loop_anon4_LoopHead$0$anon5_Then:
    assume {:partition} _v2.a[inline$_v2.Iterator_loop_anon4_LoopHead$0$out_i] == 0;
    inline$_v2.Iterator_loop_anon4_LoopHead$0$out_i, inline$_v2.Iterator_loop_anon4_LoopHead$0$out_tmp := inline$_v2.Iterator_loop_anon4_LoopHead$0$in_i, inline$_v2.Iterator_loop_anon4_LoopHead$0$in_tmp;
    _v2.a := inline$_v2.Iterator_loop_anon4_LoopHead$0$_v2.a;
    goto inline$_v2.Iterator_loop_anon4_LoopHead$0$Return;

  inline$_v2.Iterator_loop_anon4_LoopHead$0$anon4_LoopDone:
    assume {:partition} _v2.a[inline$_v2.Iterator_loop_anon4_LoopHead$0$out_i] == 0;
    inline$_v2.Iterator_loop_anon4_LoopHead$0$out_i, inline$_v2.Iterator_loop_anon4_LoopHead$0$out_tmp := inline$_v2.Iterator_loop_anon4_LoopHead$0$in_i, inline$_v2.Iterator_loop_anon4_LoopHead$0$in_tmp;
    _v2.a := inline$_v2.Iterator_loop_anon4_LoopHead$0$_v2.a;
    goto inline$_v2.Iterator_loop_anon4_LoopHead$0$Return;

  inline$_v1.Iterator_loop_anon2_LoopHead$0$anon2_LoopDone:
    assume {:partition} _v1.a[inline$_v1.Iterator_loop_anon2_LoopHead$0$out_i] == 0;
    inline$_v1.Iterator_loop_anon2_LoopHead$0$out_i, inline$_v1.Iterator_loop_anon2_LoopHead$0$out_tmp := inline$_v1.Iterator_loop_anon2_LoopHead$0$in_i, inline$_v1.Iterator_loop_anon2_LoopHead$0$in_tmp;
    _v1.a := inline$_v1.Iterator_loop_anon2_LoopHead$0$_v1.a;
    goto inline$_v1.Iterator_loop_anon2_LoopHead$0$Return;
}



function {:inline true} RT_cond_$_v1.Iterator_loop_anon2_LoopHead$_v2.Iterator_loop_anon4_LoopHead(_v1.in_i: int, 
    _v1.in_tmp: int, 
    _v1.a_old: [int]int, 
    _v2.in_i: int, 
    _v2.in_tmp: int, 
    _v2.a_old: [int]int)
   : bool
{
  MS_pre_$_v1.Iterator_loop_anon2_LoopHead$_v2.Iterator_loop_anon4_LoopHead(_v1.in_i, _v1.in_tmp, _v1.a_old, _v2.in_i, _v2.in_tmp, _v2.a_old)
}

axiom (forall _v1.in_i: int, 
    _v1.in_tmp: int, 
    _v1.a_old: [int]int, 
    _v1.a_: [int]int, 
    _v1.out_i: int, 
    _v1.out_tmp: int, 
    _v2.in_i: int, 
    _v2.in_tmp: int, 
    _v2.a_old: [int]int :: 
  { R___v1.Iterator_loop_anon2_LoopHead(_v1.in_i, _v1.in_tmp, _v1.a_old, _v1.a_, _v1.out_i, _v1.out_tmp), R'___v2.Iterator_loop_anon4_LoopHead(_v2.in_i, _v2.in_tmp, _v2.a_old) } 
  RT_cond_$_v1.Iterator_loop_anon2_LoopHead$_v2.Iterator_loop_anon4_LoopHead(_v1.in_i, _v1.in_tmp, _v1.a_old, _v2.in_i, _v2.in_tmp, _v2.a_old)
       && R___v1.Iterator_loop_anon2_LoopHead(_v1.in_i, _v1.in_tmp, _v1.a_old, _v1.a_, _v1.out_i, _v1.out_tmp)
     ==> R'___v2.Iterator_loop_anon4_LoopHead(_v2.in_i, _v2.in_tmp, _v2.a_old));

procedure RT_Check__v1.Iterator_loop_anon2_LoopHead___v2.Iterator_loop_anon4_LoopHead(_v1.in_i: int, _v1.in_tmp: int, _v2.in_i: int, _v2.in_tmp: int)
   returns (_v1.out_i: int, _v1.out_tmp: int, _v2.out_i: int, _v2.out_tmp: int);
  requires RT_cond_$_v1.Iterator_loop_anon2_LoopHead$_v2.Iterator_loop_anon4_LoopHead(_v1.in_i, _v1.in_tmp, _v1.a, _v2.in_i, _v2.in_tmp, _v2.a);
  modifies _v1.a, _v2.a;



implementation RT_Check__v1.Iterator_loop_anon2_LoopHead___v2.Iterator_loop_anon4_LoopHead(_v1.in_i: int, _v1.in_tmp: int, _v2.in_i: int, _v2.in_tmp: int)
   returns (_v1.out_i: int, _v1.out_tmp: int, _v2.out_i: int, _v2.out_tmp: int)
{
  var inline$_v1.Iterator_loop_anon2_LoopHead$0$in_i: int;
  var inline$_v1.Iterator_loop_anon2_LoopHead$0$in_tmp: int;
  var inline$_v1.Iterator_loop_anon2_LoopHead$0$out_i: int;
  var inline$_v1.Iterator_loop_anon2_LoopHead$0$out_tmp: int;
  var inline$_v1.Iterator_loop_anon2_LoopHead$0$_v1.a: [int]int;
  var inline$_v2.Iterator_loop_anon4_LoopHead$0$in_i: int;
  var inline$_v2.Iterator_loop_anon4_LoopHead$0$in_tmp: int;
  var inline$_v2.Iterator_loop_anon4_LoopHead$0$out_i: int;
  var inline$_v2.Iterator_loop_anon4_LoopHead$0$out_tmp: int;
  var inline$_v2.Iterator_loop_anon4_LoopHead$0$_v2.a: [int]int;
  var inline$$_v1.Iterator_loop_anon2_LoopHead$0$in_i: int;
  var inline$$_v1.Iterator_loop_anon2_LoopHead$0$in_tmp: int;
  var inline$$_v1.Iterator_loop_anon2_LoopHead$0$out_i: int;
  var inline$$_v1.Iterator_loop_anon2_LoopHead$0$out_tmp: int;
  var inline$$_v1.Iterator_loop_anon2_LoopHead$0$_v1.a: [int]int;

  START:
    inline$_v1.Iterator_loop_anon2_LoopHead$0$in_i := _v1.in_i;
    inline$_v1.Iterator_loop_anon2_LoopHead$0$in_tmp := _v1.in_tmp;
    havoc inline$_v1.Iterator_loop_anon2_LoopHead$0$out_i, inline$_v1.Iterator_loop_anon2_LoopHead$0$out_tmp;
    inline$_v1.Iterator_loop_anon2_LoopHead$0$_v1.a := _v1.a;
    inline$_v1.Iterator_loop_anon2_LoopHead$0$out_i, inline$_v1.Iterator_loop_anon2_LoopHead$0$out_tmp := inline$_v1.Iterator_loop_anon2_LoopHead$0$in_i, inline$_v1.Iterator_loop_anon2_LoopHead$0$in_tmp;
    goto inline$_v1.Iterator_loop_anon2_LoopHead$0$anon2_LoopDone, inline$_v1.Iterator_loop_anon2_LoopHead$0$anon2_LoopBody;

  inline$_v1.Iterator_loop_anon2_LoopHead$0$anon2_LoopBody:
    assume {:partition} _v1.a[inline$_v1.Iterator_loop_anon2_LoopHead$0$out_i] != 0;
    call inline$_v1.Iterator_loop_anon2_LoopHead$0$out_tmp := _v1.f(_v1.a[inline$_v1.Iterator_loop_anon2_LoopHead$0$out_i]);
    _v1.a[inline$_v1.Iterator_loop_anon2_LoopHead$0$out_i] := inline$_v1.Iterator_loop_anon2_LoopHead$0$out_tmp;
    inline$_v1.Iterator_loop_anon2_LoopHead$0$out_i := inline$_v1.Iterator_loop_anon2_LoopHead$0$out_i + 1;
    goto inline$$_v1.Iterator_loop_anon2_LoopHead$0$Entry;

  inline$$_v1.Iterator_loop_anon2_LoopHead$0$Entry:
    inline$$_v1.Iterator_loop_anon2_LoopHead$0$in_i := inline$_v1.Iterator_loop_anon2_LoopHead$0$out_i;
    inline$$_v1.Iterator_loop_anon2_LoopHead$0$in_tmp := inline$_v1.Iterator_loop_anon2_LoopHead$0$out_tmp;
    havoc inline$$_v1.Iterator_loop_anon2_LoopHead$0$out_i, inline$$_v1.Iterator_loop_anon2_LoopHead$0$out_tmp;
    inline$$_v1.Iterator_loop_anon2_LoopHead$0$_v1.a := _v1.a;
    goto inline$$_v1.Iterator_loop_anon2_LoopHead$0$entry;

  inline$$_v1.Iterator_loop_anon2_LoopHead$0$entry:
    inline$$_v1.Iterator_loop_anon2_LoopHead$0$out_i, inline$$_v1.Iterator_loop_anon2_LoopHead$0$out_tmp := inline$$_v1.Iterator_loop_anon2_LoopHead$0$in_i, inline$$_v1.Iterator_loop_anon2_LoopHead$0$in_tmp;
    goto inline$$_v1.Iterator_loop_anon2_LoopHead$0$anon2_LoopDone, inline$$_v1.Iterator_loop_anon2_LoopHead$0$anon2_LoopBody;

  inline$$_v1.Iterator_loop_anon2_LoopHead$0$anon2_LoopBody:
    assume {:partition} _v1.a[inline$$_v1.Iterator_loop_anon2_LoopHead$0$out_i] != 0;
    call inline$$_v1.Iterator_loop_anon2_LoopHead$0$out_tmp := _v1.f(_v1.a[inline$$_v1.Iterator_loop_anon2_LoopHead$0$out_i]);
    _v1.a[inline$$_v1.Iterator_loop_anon2_LoopHead$0$out_i] := inline$$_v1.Iterator_loop_anon2_LoopHead$0$out_tmp;
    inline$$_v1.Iterator_loop_anon2_LoopHead$0$out_i := inline$$_v1.Iterator_loop_anon2_LoopHead$0$out_i + 1;
    call inline$$_v1.Iterator_loop_anon2_LoopHead$0$out_i, inline$$_v1.Iterator_loop_anon2_LoopHead$0$out_tmp := _v1.Iterator_loop_anon2_LoopHead(inline$$_v1.Iterator_loop_anon2_LoopHead$0$out_i, inline$$_v1.Iterator_loop_anon2_LoopHead$0$out_tmp);
    goto inline$$_v1.Iterator_loop_anon2_LoopHead$0$Return;

  inline$$_v1.Iterator_loop_anon2_LoopHead$0$anon2_LoopDone:
    assume {:partition} _v1.a[inline$$_v1.Iterator_loop_anon2_LoopHead$0$out_i] == 0;
    inline$$_v1.Iterator_loop_anon2_LoopHead$0$out_i, inline$$_v1.Iterator_loop_anon2_LoopHead$0$out_tmp := inline$$_v1.Iterator_loop_anon2_LoopHead$0$in_i, inline$$_v1.Iterator_loop_anon2_LoopHead$0$in_tmp;
    _v1.a := inline$$_v1.Iterator_loop_anon2_LoopHead$0$_v1.a;
    goto inline$$_v1.Iterator_loop_anon2_LoopHead$0$Return;

  inline$$_v1.Iterator_loop_anon2_LoopHead$0$Return:
    assume true;
    assume true;
    assume true;
    assume true;
    assume true;
    assume true;
    assume true;
    inline$_v1.Iterator_loop_anon2_LoopHead$0$out_i := inline$$_v1.Iterator_loop_anon2_LoopHead$0$out_i;
    inline$_v1.Iterator_loop_anon2_LoopHead$0$out_tmp := inline$$_v1.Iterator_loop_anon2_LoopHead$0$out_tmp;
    goto inline$_v1.Iterator_loop_anon2_LoopHead$0$anon2_LoopBody$1;

  inline$_v1.Iterator_loop_anon2_LoopHead$0$anon2_LoopBody$1:
    goto inline$_v1.Iterator_loop_anon2_LoopHead$0$Return;

  inline$_v1.Iterator_loop_anon2_LoopHead$0$Return:
    assume true;
    assume true;
    assume true;
    assume true;
    assume true;
    assume true;
    assume true;
    _v1.out_i := inline$_v1.Iterator_loop_anon2_LoopHead$0$out_i;
    _v1.out_tmp := inline$_v1.Iterator_loop_anon2_LoopHead$0$out_tmp;
    inline$_v2.Iterator_loop_anon4_LoopHead$0$in_i := _v2.in_i;
    inline$_v2.Iterator_loop_anon4_LoopHead$0$in_tmp := _v2.in_tmp;
    havoc inline$_v2.Iterator_loop_anon4_LoopHead$0$out_i, inline$_v2.Iterator_loop_anon4_LoopHead$0$out_tmp;
    inline$_v2.Iterator_loop_anon4_LoopHead$0$_v2.a := _v2.a;
    inline$_v2.Iterator_loop_anon4_LoopHead$0$out_i, inline$_v2.Iterator_loop_anon4_LoopHead$0$out_tmp := inline$_v2.Iterator_loop_anon4_LoopHead$0$in_i, inline$_v2.Iterator_loop_anon4_LoopHead$0$in_tmp;
    goto inline$_v2.Iterator_loop_anon4_LoopHead$0$anon4_LoopDone, inline$_v2.Iterator_loop_anon4_LoopHead$0$anon4_LoopBody;

  inline$_v2.Iterator_loop_anon4_LoopHead$0$anon4_LoopBody:
    assume {:partition} _v2.a[inline$_v2.Iterator_loop_anon4_LoopHead$0$out_i] != 0;
    assert R'___v2.f(_v2.a[inline$_v2.Iterator_loop_anon4_LoopHead$0$out_i], _v2.a);
    call inline$_v2.Iterator_loop_anon4_LoopHead$0$out_tmp := _v2.f(_v2.a[inline$_v2.Iterator_loop_anon4_LoopHead$0$out_i]);
    _v2.a[inline$_v2.Iterator_loop_anon4_LoopHead$0$out_i] := inline$_v2.Iterator_loop_anon4_LoopHead$0$out_tmp;
    inline$_v2.Iterator_loop_anon4_LoopHead$0$out_i := inline$_v2.Iterator_loop_anon4_LoopHead$0$out_i + 1;
    goto inline$_v2.Iterator_loop_anon4_LoopHead$0$anon5_Then, inline$_v2.Iterator_loop_anon4_LoopHead$0$anon5_Else;

  inline$_v2.Iterator_loop_anon4_LoopHead$0$anon5_Else:
    assume {:partition} _v2.a[inline$_v2.Iterator_loop_anon4_LoopHead$0$out_i] != 0;
    _v2.a[inline$_v2.Iterator_loop_anon4_LoopHead$0$out_i] := inline$_v2.Iterator_loop_anon4_LoopHead$0$out_tmp;
    inline$_v2.Iterator_loop_anon4_LoopHead$0$out_i := inline$_v2.Iterator_loop_anon4_LoopHead$0$out_i + 1;
    assert R'___v2.Iterator_loop_anon4_LoopHead(inline$_v2.Iterator_loop_anon4_LoopHead$0$out_i, 
  inline$_v2.Iterator_loop_anon4_LoopHead$0$out_tmp, 
  _v2.a);
    call inline$_v2.Iterator_loop_anon4_LoopHead$0$out_i, inline$_v2.Iterator_loop_anon4_LoopHead$0$out_tmp := _v2.Iterator_loop_anon4_LoopHead(inline$_v2.Iterator_loop_anon4_LoopHead$0$out_i, inline$_v2.Iterator_loop_anon4_LoopHead$0$out_tmp);
    goto inline$_v2.Iterator_loop_anon4_LoopHead$0$Return;

  inline$_v2.Iterator_loop_anon4_LoopHead$0$Return:
    assume true;
    assume true;
    assume true;
    assume true;
    assume true;
    assume true;
    assume true;
    assume true;
    _v2.out_i := inline$_v2.Iterator_loop_anon4_LoopHead$0$out_i;
    _v2.out_tmp := inline$_v2.Iterator_loop_anon4_LoopHead$0$out_tmp;
    return;

  inline$_v2.Iterator_loop_anon4_LoopHead$0$anon5_Then:
    assume {:partition} _v2.a[inline$_v2.Iterator_loop_anon4_LoopHead$0$out_i] == 0;
    inline$_v2.Iterator_loop_anon4_LoopHead$0$out_i, inline$_v2.Iterator_loop_anon4_LoopHead$0$out_tmp := inline$_v2.Iterator_loop_anon4_LoopHead$0$in_i, inline$_v2.Iterator_loop_anon4_LoopHead$0$in_tmp;
    _v2.a := inline$_v2.Iterator_loop_anon4_LoopHead$0$_v2.a;
    goto inline$_v2.Iterator_loop_anon4_LoopHead$0$Return;

  inline$_v2.Iterator_loop_anon4_LoopHead$0$anon4_LoopDone:
    assume {:partition} _v2.a[inline$_v2.Iterator_loop_anon4_LoopHead$0$out_i] == 0;
    inline$_v2.Iterator_loop_anon4_LoopHead$0$out_i, inline$_v2.Iterator_loop_anon4_LoopHead$0$out_tmp := inline$_v2.Iterator_loop_anon4_LoopHead$0$in_i, inline$_v2.Iterator_loop_anon4_LoopHead$0$in_tmp;
    _v2.a := inline$_v2.Iterator_loop_anon4_LoopHead$0$_v2.a;
    goto inline$_v2.Iterator_loop_anon4_LoopHead$0$Return;

  inline$_v1.Iterator_loop_anon2_LoopHead$0$anon2_LoopDone:
    assume {:partition} _v1.a[inline$_v1.Iterator_loop_anon2_LoopHead$0$out_i] == 0;
    inline$_v1.Iterator_loop_anon2_LoopHead$0$out_i, inline$_v1.Iterator_loop_anon2_LoopHead$0$out_tmp := inline$_v1.Iterator_loop_anon2_LoopHead$0$in_i, inline$_v1.Iterator_loop_anon2_LoopHead$0$in_tmp;
    _v1.a := inline$_v1.Iterator_loop_anon2_LoopHead$0$_v1.a;
    goto inline$_v1.Iterator_loop_anon2_LoopHead$0$Return;
}



function {:inline true} ArrEqAfter(a: [int]int, b: [int]int, i: int) : bool
{
  (forall j: int :: { a[j] } { b[j] } j >= i ==> a[j] == b[j])
}
