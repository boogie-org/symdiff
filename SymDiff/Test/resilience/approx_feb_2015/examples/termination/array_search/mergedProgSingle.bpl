var _v2.a: [int]int;

function {:inline true} _v2.sorted(a: [int]int) : bool
{
  (forall i: int, j: int :: i <= j ==> a[i] <= a[j])
}

procedure {:prefix "_v2"} _v2.Array_search(s: int, e: int, v: int) returns (r: int);
  free ensures {:io_dependency "r", "a", "e", "v", "s"} true;
  free ensures {:io_dependency "r", "a", "e", "v", "s"} true;
  free ensures R'___v2.Array_search(s, e, v, old(_v2.a));
  free ensures R___v2.Array_search(s, e, v, old(_v2.a), r);



procedure {:prefix "_v2"} _v2.Main(i: int, j: int, k: int) returns (r: int);
  free requires i <= j;
  free ensures {:io_dependency "r", "i", "a", "j", "k"} true;
  free ensures {:io_dependency "r", "i", "a", "j", "k"} true;
  free ensures R'___v2.Main(i, j, k, old(_v2.a));
  free ensures R___v2.Main(i, j, k, old(_v2.a), r);



procedure {:prefix "_v2"} _v2.Array_search_loop_anon4_LoopHead(in_v: int, in_r: int, in_k1: int, in_i: int) returns (out_r: int, out_i: int);
  free ensures {:io_dependency "out_r", "in_r", "in_k1", "a", "in_i", "in_v"} true;
  free ensures {:io_dependency "out_i", "in_i", "in_k1", "a", "in_v"} true;
  free ensures {:io_dependency "out_r", "in_r", "in_k1", "a", "in_i", "in_v"} true;
  free ensures {:io_dependency "out_i", "in_i", "in_k1", "a", "in_v"} true;
  free ensures R'___v2.Array_search_loop_anon4_LoopHead(in_v, in_r, in_k1, in_i, old(_v2.a));
  free ensures R___v2.Array_search_loop_anon4_LoopHead(in_v, in_r, in_k1, in_i, old(_v2.a), out_r, out_i);



implementation _v2.Array_search(s: int, e: int, v: int) returns (r: int)
{
  var k1: int;
  var i: int;

  anon0:
    k1 := _v2.a[e];
    i := s;
    r := 0;
    goto anon4_LoopHead;

  anon4_LoopHead:
    call r, i := _v2.Array_search_loop_anon4_LoopHead(v, r, k1, i);
    goto anon4_LoopHead_last;

  anon4_LoopHead_last:
    goto anon4_LoopDone, anon4_LoopBody;

  anon4_LoopBody:
    assume {:partition} _v2.a[i] < k1;
    goto anon5_Then, anon5_Else;

  anon5_Else:
    assume {:partition} v >= _v2.a[i];
    goto anon3;

  anon3:
    i := i + 2;
    goto anon3_dummy;

  anon3_dummy:
    assume false;
    return;

  anon5_Then:
    assume {:partition} _v2.a[i] > v;
    r := 1;
    return;

  anon4_LoopDone:
    assume {:partition} k1 <= _v2.a[i];
    return;
}



implementation _v2.Main(i: int, j: int, k: int) returns (r: int)
{

  anon0:
    assume i <= j;
    assume _v2.sorted(_v2.a);
    call r := _v2.Array_search(i, j, k);
    return;
}



implementation _v2.Array_search_loop_anon4_LoopHead(in_v: int, in_r: int, in_k1: int, in_i: int) returns (out_r: int, out_i: int)
{

  entry:
    out_r, out_i := in_r, in_i;
    goto anon4_LoopHead;

  anon4_LoopHead:
    goto anon4_LoopDone, anon4_LoopBody;

  anon4_LoopBody:
    assume {:partition} _v2.a[out_i] < in_k1;
    goto anon5_Then, anon5_Else;

  anon5_Else:
    assume {:partition} in_v >= _v2.a[out_i];
    goto anon3;

  anon3:
    out_i := out_i + 2;
    goto anon3_dummy;

  anon3_dummy:
    call out_r, out_i := _v2.Array_search_loop_anon4_LoopHead(in_v, out_r, in_k1, out_i);
    return;

  anon5_Then:
    assume {:partition} _v2.a[out_i] > in_v;
    out_r := 1;
    out_r, out_i := in_r, in_i;
    return;

  anon4_LoopDone:
    assume {:partition} in_k1 <= _v2.a[out_i];
    out_r, out_i := in_r, in_i;
    return;
}



var _v1.a: [int]int;

procedure {:prefix "_v1"} _v1.Array_search(s: int, e: int, v: int) returns (r: int);
  free ensures {:io_dependency "r", "a", "e", "v", "s"} true;
  free ensures {:io_dependency "r", "a", "e", "v", "s"} true;
  free ensures R___v1.Array_search(s, e, v, old(_v1.a), r);



procedure {:prefix "_v1"} _v1.Main(i: int, j: int, k: int) returns (r: int);
  free requires i <= j;
  free ensures {:io_dependency "r", "i", "a", "j", "k"} true;
  free ensures {:io_dependency "r", "i", "a", "j", "k"} true;
  free ensures R___v1.Main(i, j, k, old(_v1.a), r);



procedure {:prefix "_v1"} _v1.Array_search_loop_anon4_LoopHead(in_v: int, in_r: int, in_k1: int, in_i: int) returns (out_r: int, out_i: int);
  free ensures {:io_dependency "out_r", "in_r", "in_k1", "a", "in_i", "in_v"} true;
  free ensures {:io_dependency "out_i", "in_i", "in_k1", "a", "in_v"} true;
  free ensures {:io_dependency "out_r", "in_r", "in_k1", "a", "in_i", "in_v"} true;
  free ensures {:io_dependency "out_i", "in_i", "in_k1", "a", "in_v"} true;
  free ensures R___v1.Array_search_loop_anon4_LoopHead(in_v, in_r, in_k1, in_i, old(_v1.a), out_r, out_i);



implementation _v1.Array_search(s: int, e: int, v: int) returns (r: int)
{
  var k1: int;
  var i: int;

  anon0:
    k1 := _v1.a[e];
    i := s;
    r := 0;
    goto anon4_LoopHead;

  anon4_LoopHead:
    call r, i := _v1.Array_search_loop_anon4_LoopHead(v, r, k1, i);
    goto anon4_LoopHead_last;

  anon4_LoopHead_last:
    goto anon4_LoopDone, anon4_LoopBody;

  anon4_LoopBody:
    assume {:partition} _v1.a[i] < k1;
    goto anon5_Then, anon5_Else;

  anon5_Else:
    assume {:partition} v >= _v1.a[i];
    goto anon3;

  anon3:
    i := i + 1;
    goto anon3_dummy;

  anon3_dummy:
    assume false;
    return;

  anon5_Then:
    assume {:partition} _v1.a[i] > v;
    r := 1;
    return;

  anon4_LoopDone:
    assume {:partition} k1 <= _v1.a[i];
    return;
}



implementation _v1.Main(i: int, j: int, k: int) returns (r: int)
{

  anon0:
    assume i <= j;
    assume i <= j;
    assume _v2.sorted(_v1.a);
    call r := _v1.Array_search(i, j, k);
    return;
}



implementation _v1.Array_search_loop_anon4_LoopHead(in_v: int, in_r: int, in_k1: int, in_i: int) returns (out_r: int, out_i: int)
{

  entry:
    out_r, out_i := in_r, in_i;
    goto anon4_LoopHead;

  anon4_LoopHead:
    goto anon4_LoopDone, anon4_LoopBody;

  anon4_LoopBody:
    assume {:partition} _v1.a[out_i] < in_k1;
    goto anon5_Then, anon5_Else;

  anon5_Else:
    assume {:partition} in_v >= _v1.a[out_i];
    goto anon3;

  anon3:
    out_i := out_i + 1;
    goto anon3_dummy;

  anon3_dummy:
    call out_r, out_i := _v1.Array_search_loop_anon4_LoopHead(in_v, out_r, in_k1, out_i);
    return;

  anon5_Then:
    assume {:partition} _v1.a[out_i] > in_v;
    out_r := 1;
    out_r, out_i := in_r, in_i;
    return;

  anon4_LoopDone:
    assume {:partition} in_k1 <= _v1.a[out_i];
    out_r, out_i := in_r, in_i;
    return;
}



function R___v2.Array_search(.s: int, .e: int, .v: int, _v2.a_old: [int]int, .r: int) : bool;

function R'___v2.Array_search(.s: int, .e: int, .v: int, _v2.a_old: [int]int) : bool;

function R___v2.Main(.i: int, .j: int, .k: int, _v2.a_old: [int]int, .r: int) : bool;

function R'___v2.Main(.i: int, .j: int, .k: int, _v2.a_old: [int]int) : bool;

function R___v2.Array_search_loop_anon4_LoopHead(.in_v: int, 
    .in_r: int, 
    .in_k1: int, 
    .in_i: int, 
    _v2.a_old: [int]int, 
    .out_r: int, 
    .out_i: int)
   : bool;

function R'___v2.Array_search_loop_anon4_LoopHead(.in_v: int, .in_r: int, .in_k1: int, .in_i: int, _v2.a_old: [int]int) : bool;

function R___v1.Array_search(.s: int, .e: int, .v: int, _v1.a_old: [int]int, .r: int) : bool;

function R___v1.Main(.i: int, .j: int, .k: int, _v1.a_old: [int]int, .r: int) : bool;

function R___v1.Array_search_loop_anon4_LoopHead(.in_v: int, 
    .in_r: int, 
    .in_k1: int, 
    .in_i: int, 
    _v1.a_old: [int]int, 
    .out_r: int, 
    .out_i: int)
   : bool;

function {:inline true} MS$_v1.Array_search$_v2.Array_search(_v1.s: int, 
    _v1.e: int, 
    _v1.v: int, 
    _v1.a_old: [int]int, 
    _v1.r: int, 
    _v2.s: int, 
    _v2.e: int, 
    _v2.v: int, 
    _v2.a_old: [int]int, 
    _v2.r: int)
   : bool
{
  _v1.s == _v2.s && _v1.e == _v2.e && _v1.v == _v2.v && _v1.a_old == _v2.a_old
   ==> _v1.r == _v2.r
}

axiom (forall _v1.s: int, 
    _v1.e: int, 
    _v1.v: int, 
    _v1.a_old: [int]int, 
    _v1.r: int, 
    _v2.s: int, 
    _v2.e: int, 
    _v2.v: int, 
    _v2.a_old: [int]int, 
    _v2.r: int :: 
  { R___v1.Array_search(_v1.s, _v1.e, _v1.v, _v1.a_old, _v1.r), R___v2.Array_search(_v2.s, _v2.e, _v2.v, _v2.a_old, _v2.r) } 
  R___v1.Array_search(_v1.s, _v1.e, _v1.v, _v1.a_old, _v1.r)
       && R___v2.Array_search(_v2.s, _v2.e, _v2.v, _v2.a_old, _v2.r)
     ==> MS$_v1.Array_search$_v2.Array_search(_v1.s, _v1.e, _v1.v, _v1.a_old, _v1.r, _v2.s, _v2.e, _v2.v, _v2.a_old, _v2.r));

function {:inline true} MS_pre_$_v1.Array_search$_v2.Array_search(_v1.s: int, 
    _v1.e: int, 
    _v1.v: int, 
    _v1.a_old: [int]int, 
    _v2.s: int, 
    _v2.e: int, 
    _v2.v: int, 
    _v2.a_old: [int]int)
   : bool
{
  _v1.s == _v2.s && _v1.e == _v2.e && _v1.v == _v2.v && _v1.a_old == _v2.a_old && _v2.sorted(_v2.a_old) 
}

procedure {:MS_procs "_v1.Array_search", "_v2.Array_search"} MS_Check__v1.Array_search___v2.Array_search(_v1.s: int, _v1.e: int, _v1.v: int, _v2.s: int, _v2.e: int, _v2.v: int)
   returns (_v1.r: int, _v2.r: int);
  requires MS_pre_$_v1.Array_search$_v2.Array_search(_v1.s, _v1.e, _v1.v, _v1.a, _v2.s, _v2.e, _v2.v, _v2.a);
  ensures MS$_v1.Array_search$_v2.Array_search(_v1.s, _v1.e, _v1.v, old(_v1.a), _v1.r, _v2.s, _v2.e, _v2.v, old(_v2.a), _v2.r);



implementation MS_Check__v1.Array_search___v2.Array_search(_v1.s: int, _v1.e: int, _v1.v: int, _v2.s: int, _v2.e: int, _v2.v: int)
   returns (_v1.r: int, _v2.r: int)
{
  var inline$_v1.Array_search$0$k1: int;
  var inline$_v1.Array_search$0$i: int;
  var inline$_v1.Array_search$0$s: int;
  var inline$_v1.Array_search$0$e: int;
  var inline$_v1.Array_search$0$v: int;
  var inline$_v1.Array_search$0$r: int;
  var inline$_v2.Array_search$0$k1: int;
  var inline$_v2.Array_search$0$i: int;
  var inline$_v2.Array_search$0$s: int;
  var inline$_v2.Array_search$0$e: int;
  var inline$_v2.Array_search$0$v: int;
  var inline$_v2.Array_search$0$r: int;

  START:
    goto inline$_v1.Array_search$0$Entry;

  inline$_v1.Array_search$0$Entry:
    inline$_v1.Array_search$0$s := _v1.s;
    inline$_v1.Array_search$0$e := _v1.e;
    inline$_v1.Array_search$0$v := _v1.v;
    havoc inline$_v1.Array_search$0$k1, inline$_v1.Array_search$0$i, inline$_v1.Array_search$0$r;
    goto inline$_v1.Array_search$0$anon0;

  inline$_v1.Array_search$0$anon0:
    inline$_v1.Array_search$0$k1 := _v1.a[inline$_v1.Array_search$0$e];
    inline$_v1.Array_search$0$i := inline$_v1.Array_search$0$s;
    inline$_v1.Array_search$0$r := 0;
    goto inline$_v1.Array_search$0$anon4_LoopHead;

  inline$_v1.Array_search$0$anon4_LoopHead:
    call inline$_v1.Array_search$0$r, inline$_v1.Array_search$0$i := _v1.Array_search_loop_anon4_LoopHead(inline$_v1.Array_search$0$v, inline$_v1.Array_search$0$r, inline$_v1.Array_search$0$k1, inline$_v1.Array_search$0$i);
    goto inline$_v1.Array_search$0$anon4_LoopHead_last;

  inline$_v1.Array_search$0$anon4_LoopHead_last:
    goto inline$_v1.Array_search$0$anon4_LoopDone, inline$_v1.Array_search$0$anon4_LoopBody;

  inline$_v1.Array_search$0$anon4_LoopBody:
    assume {:partition} _v1.a[inline$_v1.Array_search$0$i] < inline$_v1.Array_search$0$k1;
    goto inline$_v1.Array_search$0$anon5_Then, inline$_v1.Array_search$0$anon5_Else;

  inline$_v1.Array_search$0$anon5_Else:
    assume {:partition} inline$_v1.Array_search$0$v >= _v1.a[inline$_v1.Array_search$0$i];
    goto inline$_v1.Array_search$0$anon3;

  inline$_v1.Array_search$0$anon3:
    inline$_v1.Array_search$0$i := inline$_v1.Array_search$0$i + 1;
    goto inline$_v1.Array_search$0$anon3_dummy;

  inline$_v1.Array_search$0$anon3_dummy:
    assume false;
    goto inline$_v1.Array_search$0$Return;

  inline$_v1.Array_search$0$anon5_Then:
    assume {:partition} _v1.a[inline$_v1.Array_search$0$i] > inline$_v1.Array_search$0$v;
    inline$_v1.Array_search$0$r := 1;
    goto inline$_v1.Array_search$0$Return;

  inline$_v1.Array_search$0$anon4_LoopDone:
    assume {:partition} inline$_v1.Array_search$0$k1 <= _v1.a[inline$_v1.Array_search$0$i];
    goto inline$_v1.Array_search$0$Return;

  inline$_v1.Array_search$0$Return:
    assume true;
    assume true;
    assume true;
    _v1.r := inline$_v1.Array_search$0$r;
    goto START$1;

  START$1:
    goto inline$_v2.Array_search$0$Entry;

  inline$_v2.Array_search$0$Entry:
    inline$_v2.Array_search$0$s := _v2.s;
    inline$_v2.Array_search$0$e := _v2.e;
    inline$_v2.Array_search$0$v := _v2.v;
    havoc inline$_v2.Array_search$0$k1, inline$_v2.Array_search$0$i, inline$_v2.Array_search$0$r;
    goto inline$_v2.Array_search$0$anon0;

  inline$_v2.Array_search$0$anon0:
    inline$_v2.Array_search$0$k1 := _v2.a[inline$_v2.Array_search$0$e];
    inline$_v2.Array_search$0$i := inline$_v2.Array_search$0$s;
    inline$_v2.Array_search$0$r := 0;
    goto inline$_v2.Array_search$0$anon4_LoopHead;

  inline$_v2.Array_search$0$anon4_LoopHead:
    call inline$_v2.Array_search$0$r, inline$_v2.Array_search$0$i := _v2.Array_search_loop_anon4_LoopHead(inline$_v2.Array_search$0$v, inline$_v2.Array_search$0$r, inline$_v2.Array_search$0$k1, inline$_v2.Array_search$0$i);
    goto inline$_v2.Array_search$0$anon4_LoopHead_last;

  inline$_v2.Array_search$0$anon4_LoopHead_last:
    goto inline$_v2.Array_search$0$anon4_LoopDone, inline$_v2.Array_search$0$anon4_LoopBody;

  inline$_v2.Array_search$0$anon4_LoopBody:
    assume {:partition} _v2.a[inline$_v2.Array_search$0$i] < inline$_v2.Array_search$0$k1;
    goto inline$_v2.Array_search$0$anon5_Then, inline$_v2.Array_search$0$anon5_Else;

  inline$_v2.Array_search$0$anon5_Else:
    assume {:partition} inline$_v2.Array_search$0$v >= _v2.a[inline$_v2.Array_search$0$i];
    goto inline$_v2.Array_search$0$anon3;

  inline$_v2.Array_search$0$anon3:
    inline$_v2.Array_search$0$i := inline$_v2.Array_search$0$i + 2;
    goto inline$_v2.Array_search$0$anon3_dummy;

  inline$_v2.Array_search$0$anon3_dummy:
    assume false;
    goto inline$_v2.Array_search$0$Return;

  inline$_v2.Array_search$0$anon5_Then:
    assume {:partition} _v2.a[inline$_v2.Array_search$0$i] > inline$_v2.Array_search$0$v;
    inline$_v2.Array_search$0$r := 1;
    goto inline$_v2.Array_search$0$Return;

  inline$_v2.Array_search$0$anon4_LoopDone:
    assume {:partition} inline$_v2.Array_search$0$k1 <= _v2.a[inline$_v2.Array_search$0$i];
    goto inline$_v2.Array_search$0$Return;

  inline$_v2.Array_search$0$Return:
    assume true;
    assume true;
    assume true;
    assume true;
    _v2.r := inline$_v2.Array_search$0$r;
    goto START$2;

  START$2:
    return;
}



function {:inline true} RT_cond_$_v1.Array_search$_v2.Array_search(_v1.s: int, 
    _v1.e: int, 
    _v1.v: int, 
    _v1.a_old: [int]int, 
    _v2.s: int, 
    _v2.e: int, 
    _v2.v: int, 
    _v2.a_old: [int]int)
   : bool
{
  MS_pre_$_v1.Array_search$_v2.Array_search(_v1.s, _v1.e, _v1.v, _v1.a_old, _v2.s, _v2.e, _v2.v, _v2.a_old)
}

axiom (forall _v1.s: int, 
    _v1.e: int, 
    _v1.v: int, 
    _v1.a_old: [int]int, 
    _v1.r: int, 
    _v2.s: int, 
    _v2.e: int, 
    _v2.v: int, 
    _v2.a_old: [int]int :: 
  { R___v1.Array_search(_v1.s, _v1.e, _v1.v, _v1.a_old, _v1.r), R'___v2.Array_search(_v2.s, _v2.e, _v2.v, _v2.a_old) } 
  RT_cond_$_v1.Array_search$_v2.Array_search(_v1.s, _v1.e, _v1.v, _v1.a_old, _v2.s, _v2.e, _v2.v, _v2.a_old)
       && R___v1.Array_search(_v1.s, _v1.e, _v1.v, _v1.a_old, _v1.r)
     ==> R'___v2.Array_search(_v2.s, _v2.e, _v2.v, _v2.a_old));

procedure RT_Check__v1.Array_search___v2.Array_search(_v1.s: int, _v1.e: int, _v1.v: int, _v2.s: int, _v2.e: int, _v2.v: int)
   returns (_v1.r: int, _v2.r: int);
  requires RT_cond_$_v1.Array_search$_v2.Array_search(_v1.s, _v1.e, _v1.v, _v1.a, _v2.s, _v2.e, _v2.v, _v2.a);



implementation RT_Check__v1.Array_search___v2.Array_search(_v1.s: int, _v1.e: int, _v1.v: int, _v2.s: int, _v2.e: int, _v2.v: int)
   returns (_v1.r: int, _v2.r: int)
{
  var inline$_v1.Array_search$0$k1: int;
  var inline$_v1.Array_search$0$i: int;
  var inline$_v1.Array_search$0$s: int;
  var inline$_v1.Array_search$0$e: int;
  var inline$_v1.Array_search$0$v: int;
  var inline$_v1.Array_search$0$r: int;
  var inline$_v2.Array_search$0$k1: int;
  var inline$_v2.Array_search$0$i: int;
  var inline$_v2.Array_search$0$s: int;
  var inline$_v2.Array_search$0$e: int;
  var inline$_v2.Array_search$0$v: int;
  var inline$_v2.Array_search$0$r: int;

  START:
    goto inline$_v1.Array_search$0$Entry;

  inline$_v1.Array_search$0$Entry:
    inline$_v1.Array_search$0$s := _v1.s;
    inline$_v1.Array_search$0$e := _v1.e;
    inline$_v1.Array_search$0$v := _v1.v;
    havoc inline$_v1.Array_search$0$k1, inline$_v1.Array_search$0$i, inline$_v1.Array_search$0$r;
    goto inline$_v1.Array_search$0$anon0;

  inline$_v1.Array_search$0$anon0:
    inline$_v1.Array_search$0$k1 := _v1.a[inline$_v1.Array_search$0$e];
    inline$_v1.Array_search$0$i := inline$_v1.Array_search$0$s;
    inline$_v1.Array_search$0$r := 0;
    goto inline$_v1.Array_search$0$anon4_LoopHead;

  inline$_v1.Array_search$0$anon4_LoopHead:
    call inline$_v1.Array_search$0$r, inline$_v1.Array_search$0$i := _v1.Array_search_loop_anon4_LoopHead(inline$_v1.Array_search$0$v, inline$_v1.Array_search$0$r, inline$_v1.Array_search$0$k1, inline$_v1.Array_search$0$i);
    goto inline$_v1.Array_search$0$anon4_LoopHead_last;

  inline$_v1.Array_search$0$anon4_LoopHead_last:
    goto inline$_v1.Array_search$0$anon4_LoopDone, inline$_v1.Array_search$0$anon4_LoopBody;

  inline$_v1.Array_search$0$anon4_LoopBody:
    assume {:partition} _v1.a[inline$_v1.Array_search$0$i] < inline$_v1.Array_search$0$k1;
    goto inline$_v1.Array_search$0$anon5_Then, inline$_v1.Array_search$0$anon5_Else;

  inline$_v1.Array_search$0$anon5_Else:
    assume {:partition} inline$_v1.Array_search$0$v >= _v1.a[inline$_v1.Array_search$0$i];
    goto inline$_v1.Array_search$0$anon3;

  inline$_v1.Array_search$0$anon3:
    inline$_v1.Array_search$0$i := inline$_v1.Array_search$0$i + 1;
    goto inline$_v1.Array_search$0$anon3_dummy;

  inline$_v1.Array_search$0$anon3_dummy:
    assume false;
    goto inline$_v1.Array_search$0$Return;

  inline$_v1.Array_search$0$anon5_Then:
    assume {:partition} _v1.a[inline$_v1.Array_search$0$i] > inline$_v1.Array_search$0$v;
    inline$_v1.Array_search$0$r := 1;
    goto inline$_v1.Array_search$0$Return;

  inline$_v1.Array_search$0$anon4_LoopDone:
    assume {:partition} inline$_v1.Array_search$0$k1 <= _v1.a[inline$_v1.Array_search$0$i];
    goto inline$_v1.Array_search$0$Return;

  inline$_v1.Array_search$0$Return:
    assume true;
    assume true;
    assume true;
    _v1.r := inline$_v1.Array_search$0$r;
    goto START$1;

  START$1:
    goto inline$_v2.Array_search$0$Entry;

  inline$_v2.Array_search$0$Entry:
    inline$_v2.Array_search$0$s := _v2.s;
    inline$_v2.Array_search$0$e := _v2.e;
    inline$_v2.Array_search$0$v := _v2.v;
    havoc inline$_v2.Array_search$0$k1, inline$_v2.Array_search$0$i, inline$_v2.Array_search$0$r;
    goto inline$_v2.Array_search$0$anon0;

  inline$_v2.Array_search$0$anon0:
    inline$_v2.Array_search$0$k1 := _v2.a[inline$_v2.Array_search$0$e];
    inline$_v2.Array_search$0$i := inline$_v2.Array_search$0$s;
    inline$_v2.Array_search$0$r := 0;
    goto inline$_v2.Array_search$0$anon4_LoopHead;

  inline$_v2.Array_search$0$anon4_LoopHead:
    assert inline$_v1.Array_search$0$v == inline$_v2.Array_search$0$v;
    assert inline$_v1.Array_search$0$k1 == inline$_v2.Array_search$0$k1;
    assert inline$_v1.Array_search$0$s <= inline$_v2.Array_search$0$s;
    assert _v1.a == _v2.a;
    assert R'___v2.Array_search_loop_anon4_LoopHead(inline$_v2.Array_search$0$v, 
  inline$_v2.Array_search$0$r, 
  inline$_v2.Array_search$0$k1, 
  inline$_v2.Array_search$0$i, 
  _v2.a);
    call inline$_v2.Array_search$0$r, inline$_v2.Array_search$0$i := _v2.Array_search_loop_anon4_LoopHead(inline$_v2.Array_search$0$v, inline$_v2.Array_search$0$r, inline$_v2.Array_search$0$k1, inline$_v2.Array_search$0$i);
    goto inline$_v2.Array_search$0$anon4_LoopHead_last;

  inline$_v2.Array_search$0$anon4_LoopHead_last:
    goto inline$_v2.Array_search$0$anon4_LoopDone, inline$_v2.Array_search$0$anon4_LoopBody;

  inline$_v2.Array_search$0$anon4_LoopBody:
    assume {:partition} _v2.a[inline$_v2.Array_search$0$i] < inline$_v2.Array_search$0$k1;
    goto inline$_v2.Array_search$0$anon5_Then, inline$_v2.Array_search$0$anon5_Else;

  inline$_v2.Array_search$0$anon5_Else:
    assume {:partition} inline$_v2.Array_search$0$v >= _v2.a[inline$_v2.Array_search$0$i];
    goto inline$_v2.Array_search$0$anon3;

  inline$_v2.Array_search$0$anon3:
    inline$_v2.Array_search$0$i := inline$_v2.Array_search$0$i + 2;
    goto inline$_v2.Array_search$0$anon3_dummy;

  inline$_v2.Array_search$0$anon3_dummy:
    assume false;
    goto inline$_v2.Array_search$0$Return;

  inline$_v2.Array_search$0$anon5_Then:
    assume {:partition} _v2.a[inline$_v2.Array_search$0$i] > inline$_v2.Array_search$0$v;
    inline$_v2.Array_search$0$r := 1;
    goto inline$_v2.Array_search$0$Return;

  inline$_v2.Array_search$0$anon4_LoopDone:
    assume {:partition} inline$_v2.Array_search$0$k1 <= _v2.a[inline$_v2.Array_search$0$i];
    goto inline$_v2.Array_search$0$Return;

  inline$_v2.Array_search$0$Return:
    assume true;
    assume true;
    assume true;
    assume true;
    _v2.r := inline$_v2.Array_search$0$r;
    goto START$2;

  START$2:
    return;
}



function {:inline true} MS$_v1.Main$_v2.Main(_v1.i: int, 
    _v1.j: int, 
    _v1.k: int, 
    _v1.a_old: [int]int, 
    _v1.r: int, 
    _v2.i: int, 
    _v2.j: int, 
    _v2.k: int, 
    _v2.a_old: [int]int, 
    _v2.r: int)
   : bool
{
  _v1.i == _v2.i && _v1.j == _v2.j && _v1.k == _v2.k && _v1.a_old == _v2.a_old
   ==> _v1.r == _v2.r
}

axiom (forall _v1.i: int, 
    _v1.j: int, 
    _v1.k: int, 
    _v1.a_old: [int]int, 
    _v1.r: int, 
    _v2.i: int, 
    _v2.j: int, 
    _v2.k: int, 
    _v2.a_old: [int]int, 
    _v2.r: int :: 
  { R___v1.Main(_v1.i, _v1.j, _v1.k, _v1.a_old, _v1.r), R___v2.Main(_v2.i, _v2.j, _v2.k, _v2.a_old, _v2.r) } 
  R___v1.Main(_v1.i, _v1.j, _v1.k, _v1.a_old, _v1.r)
       && R___v2.Main(_v2.i, _v2.j, _v2.k, _v2.a_old, _v2.r)
     ==> MS$_v1.Main$_v2.Main(_v1.i, _v1.j, _v1.k, _v1.a_old, _v1.r, _v2.i, _v2.j, _v2.k, _v2.a_old, _v2.r));

function {:inline true} MS_pre_$_v1.Main$_v2.Main(_v1.i: int, 
    _v1.j: int, 
    _v1.k: int, 
    _v1.a_old: [int]int, 
    _v2.i: int, 
    _v2.j: int, 
    _v2.k: int, 
    _v2.a_old: [int]int)
   : bool
{
  _v1.a_old == _v2.a_old && _v1.i == _v2.i && _v1.j == _v2.j && _v1.k == _v2.k 
}

procedure {:MS_procs "_v1.Main", "_v2.Main"} MS_Check__v1.Main___v2.Main(_v1.i: int, _v1.j: int, _v1.k: int, _v2.i: int, _v2.j: int, _v2.k: int)
   returns (_v1.r: int, _v2.r: int);
  requires MS_pre_$_v1.Main$_v2.Main(_v1.i, _v1.j, _v1.k, _v1.a, _v2.i, _v2.j, _v2.k, _v2.a);
  ensures MS$_v1.Main$_v2.Main(_v1.i, _v1.j, _v1.k, old(_v1.a), _v1.r, _v2.i, _v2.j, _v2.k, old(_v2.a), _v2.r);



implementation MS_Check__v1.Main___v2.Main(_v1.i: int, _v1.j: int, _v1.k: int, _v2.i: int, _v2.j: int, _v2.k: int)
   returns (_v1.r: int, _v2.r: int)
{
  var inline$_v1.Main$0$i: int;
  var inline$_v1.Main$0$j: int;
  var inline$_v1.Main$0$k: int;
  var inline$_v1.Main$0$r: int;
  var inline$_v2.Main$0$i: int;
  var inline$_v2.Main$0$j: int;
  var inline$_v2.Main$0$k: int;
  var inline$_v2.Main$0$r: int;

  START:
    goto inline$_v1.Main$0$Entry;

  inline$_v1.Main$0$Entry:
    inline$_v1.Main$0$i := _v1.i;
    inline$_v1.Main$0$j := _v1.j;
    inline$_v1.Main$0$k := _v1.k;
    assert true;
    havoc inline$_v1.Main$0$r;
    goto inline$_v1.Main$0$anon0;

  inline$_v1.Main$0$anon0:
    assume inline$_v1.Main$0$i <= inline$_v1.Main$0$j;
    assume inline$_v1.Main$0$i <= inline$_v1.Main$0$j;
    assume _v2.sorted(_v1.a);
    call inline$_v1.Main$0$r := _v1.Array_search(inline$_v1.Main$0$i, inline$_v1.Main$0$j, inline$_v1.Main$0$k);
    goto inline$_v1.Main$0$Return;

  inline$_v1.Main$0$Return:
    assume true;
    assume true;
    assume true;
    _v1.r := inline$_v1.Main$0$r;
    goto START$1;

  START$1:
    goto inline$_v2.Main$0$Entry;

  inline$_v2.Main$0$Entry:
    inline$_v2.Main$0$i := _v2.i;
    inline$_v2.Main$0$j := _v2.j;
    inline$_v2.Main$0$k := _v2.k;
    assert true;
    havoc inline$_v2.Main$0$r;
    goto inline$_v2.Main$0$anon0;

  inline$_v2.Main$0$anon0:
    assume inline$_v2.Main$0$i <= inline$_v2.Main$0$j;
    assume _v2.sorted(_v2.a);
    call inline$_v2.Main$0$r := _v2.Array_search(inline$_v2.Main$0$i, inline$_v2.Main$0$j, inline$_v2.Main$0$k);
    goto inline$_v2.Main$0$Return;

  inline$_v2.Main$0$Return:
    assume true;
    assume true;
    assume true;
    assume true;
    _v2.r := inline$_v2.Main$0$r;
    goto START$2;

  START$2:
    return;
}



function {:inline true} RT_cond_$_v1.Main$_v2.Main(_v1.i: int, 
    _v1.j: int, 
    _v1.k: int, 
    _v1.a_old: [int]int, 
    _v2.i: int, 
    _v2.j: int, 
    _v2.k: int, 
    _v2.a_old: [int]int)
   : bool
{
  MS_pre_$_v1.Main$_v2.Main(_v1.i, _v1.j, _v1.k, _v1.a_old, _v2.i, _v2.j, _v2.k, _v2.a_old)
}

axiom (forall _v1.i: int, 
    _v1.j: int, 
    _v1.k: int, 
    _v1.a_old: [int]int, 
    _v1.r: int, 
    _v2.i: int, 
    _v2.j: int, 
    _v2.k: int, 
    _v2.a_old: [int]int :: 
  { R___v1.Main(_v1.i, _v1.j, _v1.k, _v1.a_old, _v1.r), R'___v2.Main(_v2.i, _v2.j, _v2.k, _v2.a_old) } 
  RT_cond_$_v1.Main$_v2.Main(_v1.i, _v1.j, _v1.k, _v1.a_old, _v2.i, _v2.j, _v2.k, _v2.a_old)
       && R___v1.Main(_v1.i, _v1.j, _v1.k, _v1.a_old, _v1.r)
     ==> R'___v2.Main(_v2.i, _v2.j, _v2.k, _v2.a_old));

procedure RT_Check__v1.Main___v2.Main(_v1.i: int, _v1.j: int, _v1.k: int, _v2.i: int, _v2.j: int, _v2.k: int)
   returns (_v1.r: int, _v2.r: int);
  requires RT_cond_$_v1.Main$_v2.Main(_v1.i, _v1.j, _v1.k, _v1.a, _v2.i, _v2.j, _v2.k, _v2.a);



implementation RT_Check__v1.Main___v2.Main(_v1.i: int, _v1.j: int, _v1.k: int, _v2.i: int, _v2.j: int, _v2.k: int)
   returns (_v1.r: int, _v2.r: int)
{
  var inline$_v1.Main$0$i: int;
  var inline$_v1.Main$0$j: int;
  var inline$_v1.Main$0$k: int;
  var inline$_v1.Main$0$r: int;
  var inline$_v2.Main$0$i: int;
  var inline$_v2.Main$0$j: int;
  var inline$_v2.Main$0$k: int;
  var inline$_v2.Main$0$r: int;

  START:
    goto inline$_v1.Main$0$Entry;

  inline$_v1.Main$0$Entry:
    inline$_v1.Main$0$i := _v1.i;
    inline$_v1.Main$0$j := _v1.j;
    inline$_v1.Main$0$k := _v1.k;
    assert true;
    havoc inline$_v1.Main$0$r;
    goto inline$_v1.Main$0$anon0;

  inline$_v1.Main$0$anon0:
    assume inline$_v1.Main$0$i <= inline$_v1.Main$0$j;
    assume inline$_v1.Main$0$i <= inline$_v1.Main$0$j;
    assume _v2.sorted(_v1.a);
    call inline$_v1.Main$0$r := _v1.Array_search(inline$_v1.Main$0$i, inline$_v1.Main$0$j, inline$_v1.Main$0$k);
    goto inline$_v1.Main$0$Return;

  inline$_v1.Main$0$Return:
    assume true;
    assume true;
    assume true;
    _v1.r := inline$_v1.Main$0$r;
    goto START$1;

  START$1:
    goto inline$_v2.Main$0$Entry;

  inline$_v2.Main$0$Entry:
    inline$_v2.Main$0$i := _v2.i;
    inline$_v2.Main$0$j := _v2.j;
    inline$_v2.Main$0$k := _v2.k;
    assert true;
    havoc inline$_v2.Main$0$r;
    goto inline$_v2.Main$0$anon0;

  inline$_v2.Main$0$anon0:
    assume inline$_v2.Main$0$i <= inline$_v2.Main$0$j;
    assume _v2.sorted(_v2.a);
    assert R'___v2.Array_search(inline$_v2.Main$0$i, inline$_v2.Main$0$j, inline$_v2.Main$0$k, _v2.a);
    call inline$_v2.Main$0$r := _v2.Array_search(inline$_v2.Main$0$i, inline$_v2.Main$0$j, inline$_v2.Main$0$k);
    goto inline$_v2.Main$0$Return;

  inline$_v2.Main$0$Return:
    assume true;
    assume true;
    assume true;
    assume true;
    _v2.r := inline$_v2.Main$0$r;
    goto START$2;

  START$2:
    return;
}



function {:inline true} MS$_v1.Array_search_loop_anon4_LoopHead$_v2.Array_search_loop_anon4_LoopHead(_v1.in_v: int, 
    _v1.in_r: int, 
    _v1.in_k1: int, 
    _v1.in_i: int, 
    _v1.a_old: [int]int, 
    _v1.out_r: int, 
    _v1.out_i: int, 
    _v2.in_v: int, 
    _v2.in_r: int, 
    _v2.in_k1: int, 
    _v2.in_i: int, 
    _v2.a_old: [int]int, 
    _v2.out_r: int, 
    _v2.out_i: int)
   : bool
{
  _v1.in_v == _v2.in_v
     && _v1.in_r == _v2.in_r
     && _v1.in_k1 == _v2.in_k1
     && _v1.in_i == _v2.in_i
     && _v1.a_old == _v2.a_old
   ==> _v1.out_r == _v2.out_r && _v1.out_i == _v2.out_i
}

axiom (forall _v1.in_v: int, 
    _v1.in_r: int, 
    _v1.in_k1: int, 
    _v1.in_i: int, 
    _v1.a_old: [int]int, 
    _v1.out_r: int, 
    _v1.out_i: int, 
    _v2.in_v: int, 
    _v2.in_r: int, 
    _v2.in_k1: int, 
    _v2.in_i: int, 
    _v2.a_old: [int]int, 
    _v2.out_r: int, 
    _v2.out_i: int :: 
  { R___v1.Array_search_loop_anon4_LoopHead(_v1.in_v, _v1.in_r, _v1.in_k1, _v1.in_i, _v1.a_old, _v1.out_r, _v1.out_i), R___v2.Array_search_loop_anon4_LoopHead(_v2.in_v, _v2.in_r, _v2.in_k1, _v2.in_i, _v2.a_old, _v2.out_r, _v2.out_i) } 
  R___v1.Array_search_loop_anon4_LoopHead(_v1.in_v, _v1.in_r, _v1.in_k1, _v1.in_i, _v1.a_old, _v1.out_r, _v1.out_i)
       && R___v2.Array_search_loop_anon4_LoopHead(_v2.in_v, _v2.in_r, _v2.in_k1, _v2.in_i, _v2.a_old, _v2.out_r, _v2.out_i)
     ==> MS$_v1.Array_search_loop_anon4_LoopHead$_v2.Array_search_loop_anon4_LoopHead(_v1.in_v, 
      _v1.in_r, 
      _v1.in_k1, 
      _v1.in_i, 
      _v1.a_old, 
      _v1.out_r, 
      _v1.out_i, 
      _v2.in_v, 
      _v2.in_r, 
      _v2.in_k1, 
      _v2.in_i, 
      _v2.a_old, 
      _v2.out_r, 
      _v2.out_i));

function {:inline true} MS_pre_$_v1.Array_search_loop_anon4_LoopHead$_v2.Array_search_loop_anon4_LoopHead(_v1.in_v: int, 
    _v1.in_r: int, 
    _v1.in_k1: int, 
    _v1.in_i: int, 
    _v1.a_old: [int]int, 
    _v2.in_v: int, 
    _v2.in_r: int, 
    _v2.in_k1: int, 
    _v2.in_i: int, 
    _v2.a_old: [int]int)
   : bool
{
    _v1.in_i <= _v2.in_i
   && _v1.in_k1 == _v2.in_k1
  &&_v1.in_v == _v2.in_v
   && _v1.a_old == _v2.a_old
   && _v2.sorted(_v2.a_old)
}

procedure {:MS_procs "_v1.Array_search_loop_anon4_LoopHead", "_v2.Array_search_loop_anon4_LoopHead"} MS_Check__v1.Array_search_loop_anon4_LoopHead___v2.Array_search_loop_anon4_LoopHead(_v1.in_v: int, 
    _v1.in_r: int, 
    _v1.in_k1: int, 
    _v1.in_i: int, 
    _v2.in_v: int, 
    _v2.in_r: int, 
    _v2.in_k1: int, 
    _v2.in_i: int)
   returns (_v1.out_r: int, _v1.out_i: int, _v2.out_r: int, _v2.out_i: int);
  requires MS_pre_$_v1.Array_search_loop_anon4_LoopHead$_v2.Array_search_loop_anon4_LoopHead(_v1.in_v, 
  _v1.in_r, 
  _v1.in_k1, 
  _v1.in_i, 
  _v1.a, 
  _v2.in_v, 
  _v2.in_r, 
  _v2.in_k1, 
  _v2.in_i, 
  _v2.a);
  ensures MS$_v1.Array_search_loop_anon4_LoopHead$_v2.Array_search_loop_anon4_LoopHead(_v1.in_v, 
  _v1.in_r, 
  _v1.in_k1, 
  _v1.in_i, 
  old(_v1.a), 
  _v1.out_r, 
  _v1.out_i, 
  _v2.in_v, 
  _v2.in_r, 
  _v2.in_k1, 
  _v2.in_i, 
  old(_v2.a), 
  _v2.out_r, 
  _v2.out_i);



implementation MS_Check__v1.Array_search_loop_anon4_LoopHead___v2.Array_search_loop_anon4_LoopHead(_v1.in_v: int, 
    _v1.in_r: int, 
    _v1.in_k1: int, 
    _v1.in_i: int, 
    _v2.in_v: int, 
    _v2.in_r: int, 
    _v2.in_k1: int, 
    _v2.in_i: int)
   returns (_v1.out_r: int, _v1.out_i: int, _v2.out_r: int, _v2.out_i: int)
{
  var inline$_v1.Array_search_loop_anon4_LoopHead$0$in_v: int;
  var inline$_v1.Array_search_loop_anon4_LoopHead$0$in_r: int;
  var inline$_v1.Array_search_loop_anon4_LoopHead$0$in_k1: int;
  var inline$_v1.Array_search_loop_anon4_LoopHead$0$in_i: int;
  var inline$_v1.Array_search_loop_anon4_LoopHead$0$out_r: int;
  var inline$_v1.Array_search_loop_anon4_LoopHead$0$out_i: int;
  var inline$_v2.Array_search_loop_anon4_LoopHead$0$in_v: int;
  var inline$_v2.Array_search_loop_anon4_LoopHead$0$in_r: int;
  var inline$_v2.Array_search_loop_anon4_LoopHead$0$in_k1: int;
  var inline$_v2.Array_search_loop_anon4_LoopHead$0$in_i: int;
  var inline$_v2.Array_search_loop_anon4_LoopHead$0$out_r: int;
  var inline$_v2.Array_search_loop_anon4_LoopHead$0$out_i: int;

  START:
    goto inline$_v1.Array_search_loop_anon4_LoopHead$0$Entry;

  inline$_v1.Array_search_loop_anon4_LoopHead$0$Entry:
    inline$_v1.Array_search_loop_anon4_LoopHead$0$in_v := _v1.in_v;
    inline$_v1.Array_search_loop_anon4_LoopHead$0$in_r := _v1.in_r;
    inline$_v1.Array_search_loop_anon4_LoopHead$0$in_k1 := _v1.in_k1;
    inline$_v1.Array_search_loop_anon4_LoopHead$0$in_i := _v1.in_i;
    havoc inline$_v1.Array_search_loop_anon4_LoopHead$0$out_r, inline$_v1.Array_search_loop_anon4_LoopHead$0$out_i;
    goto inline$_v1.Array_search_loop_anon4_LoopHead$0$entry;

  inline$_v1.Array_search_loop_anon4_LoopHead$0$entry:
    inline$_v1.Array_search_loop_anon4_LoopHead$0$out_r, inline$_v1.Array_search_loop_anon4_LoopHead$0$out_i := inline$_v1.Array_search_loop_anon4_LoopHead$0$in_r, inline$_v1.Array_search_loop_anon4_LoopHead$0$in_i;
    goto inline$_v1.Array_search_loop_anon4_LoopHead$0$anon4_LoopHead;

  inline$_v1.Array_search_loop_anon4_LoopHead$0$anon4_LoopHead:
    goto inline$_v1.Array_search_loop_anon4_LoopHead$0$anon4_LoopDone, inline$_v1.Array_search_loop_anon4_LoopHead$0$anon4_LoopBody;

  inline$_v1.Array_search_loop_anon4_LoopHead$0$anon4_LoopBody:
    assume {:partition} _v1.a[inline$_v1.Array_search_loop_anon4_LoopHead$0$out_i]
   < inline$_v1.Array_search_loop_anon4_LoopHead$0$in_k1;
    goto inline$_v1.Array_search_loop_anon4_LoopHead$0$anon5_Then, inline$_v1.Array_search_loop_anon4_LoopHead$0$anon5_Else;

  inline$_v1.Array_search_loop_anon4_LoopHead$0$anon5_Else:
    assume {:partition} inline$_v1.Array_search_loop_anon4_LoopHead$0$in_v
   >= _v1.a[inline$_v1.Array_search_loop_anon4_LoopHead$0$out_i];
    goto inline$_v1.Array_search_loop_anon4_LoopHead$0$anon3;

  inline$_v1.Array_search_loop_anon4_LoopHead$0$anon3:
    inline$_v1.Array_search_loop_anon4_LoopHead$0$out_i := inline$_v1.Array_search_loop_anon4_LoopHead$0$out_i + 1;
    goto inline$_v1.Array_search_loop_anon4_LoopHead$0$anon3_dummy;

  inline$_v1.Array_search_loop_anon4_LoopHead$0$anon3_dummy:
    call inline$_v1.Array_search_loop_anon4_LoopHead$0$out_r, inline$_v1.Array_search_loop_anon4_LoopHead$0$out_i := _v1.Array_search_loop_anon4_LoopHead(inline$_v1.Array_search_loop_anon4_LoopHead$0$in_v, inline$_v1.Array_search_loop_anon4_LoopHead$0$out_r, inline$_v1.Array_search_loop_anon4_LoopHead$0$in_k1, inline$_v1.Array_search_loop_anon4_LoopHead$0$out_i);
    goto inline$_v1.Array_search_loop_anon4_LoopHead$0$Return;

  inline$_v1.Array_search_loop_anon4_LoopHead$0$anon5_Then:
    assume {:partition} _v1.a[inline$_v1.Array_search_loop_anon4_LoopHead$0$out_i]
   > inline$_v1.Array_search_loop_anon4_LoopHead$0$in_v;
    inline$_v1.Array_search_loop_anon4_LoopHead$0$out_r := 1;
    inline$_v1.Array_search_loop_anon4_LoopHead$0$out_r, inline$_v1.Array_search_loop_anon4_LoopHead$0$out_i := inline$_v1.Array_search_loop_anon4_LoopHead$0$in_r, inline$_v1.Array_search_loop_anon4_LoopHead$0$in_i;
    goto inline$_v1.Array_search_loop_anon4_LoopHead$0$Return;

  inline$_v1.Array_search_loop_anon4_LoopHead$0$anon4_LoopDone:
    assume {:partition} inline$_v1.Array_search_loop_anon4_LoopHead$0$in_k1
   <= _v1.a[inline$_v1.Array_search_loop_anon4_LoopHead$0$out_i];
    inline$_v1.Array_search_loop_anon4_LoopHead$0$out_r, inline$_v1.Array_search_loop_anon4_LoopHead$0$out_i := inline$_v1.Array_search_loop_anon4_LoopHead$0$in_r, inline$_v1.Array_search_loop_anon4_LoopHead$0$in_i;
    goto inline$_v1.Array_search_loop_anon4_LoopHead$0$Return;

  inline$_v1.Array_search_loop_anon4_LoopHead$0$Return:
    assume true;
    assume true;
    assume true;
    assume true;
    assume true;
    _v1.out_r := inline$_v1.Array_search_loop_anon4_LoopHead$0$out_r;
    _v1.out_i := inline$_v1.Array_search_loop_anon4_LoopHead$0$out_i;
    goto START$1;

  START$1:
    goto inline$_v2.Array_search_loop_anon4_LoopHead$0$Entry;

  inline$_v2.Array_search_loop_anon4_LoopHead$0$Entry:
    inline$_v2.Array_search_loop_anon4_LoopHead$0$in_v := _v2.in_v;
    inline$_v2.Array_search_loop_anon4_LoopHead$0$in_r := _v2.in_r;
    inline$_v2.Array_search_loop_anon4_LoopHead$0$in_k1 := _v2.in_k1;
    inline$_v2.Array_search_loop_anon4_LoopHead$0$in_i := _v2.in_i;
    havoc inline$_v2.Array_search_loop_anon4_LoopHead$0$out_r, inline$_v2.Array_search_loop_anon4_LoopHead$0$out_i;
    goto inline$_v2.Array_search_loop_anon4_LoopHead$0$entry;

  inline$_v2.Array_search_loop_anon4_LoopHead$0$entry:
    inline$_v2.Array_search_loop_anon4_LoopHead$0$out_r, inline$_v2.Array_search_loop_anon4_LoopHead$0$out_i := inline$_v2.Array_search_loop_anon4_LoopHead$0$in_r, inline$_v2.Array_search_loop_anon4_LoopHead$0$in_i;
    goto inline$_v2.Array_search_loop_anon4_LoopHead$0$anon4_LoopHead;

  inline$_v2.Array_search_loop_anon4_LoopHead$0$anon4_LoopHead:
    goto inline$_v2.Array_search_loop_anon4_LoopHead$0$anon4_LoopDone, inline$_v2.Array_search_loop_anon4_LoopHead$0$anon4_LoopBody;

  inline$_v2.Array_search_loop_anon4_LoopHead$0$anon4_LoopBody:
    assume {:partition} _v2.a[inline$_v2.Array_search_loop_anon4_LoopHead$0$out_i]
   < inline$_v2.Array_search_loop_anon4_LoopHead$0$in_k1;
    goto inline$_v2.Array_search_loop_anon4_LoopHead$0$anon5_Then, inline$_v2.Array_search_loop_anon4_LoopHead$0$anon5_Else;

  inline$_v2.Array_search_loop_anon4_LoopHead$0$anon5_Else:
    assume {:partition} inline$_v2.Array_search_loop_anon4_LoopHead$0$in_v
   >= _v2.a[inline$_v2.Array_search_loop_anon4_LoopHead$0$out_i];
    goto inline$_v2.Array_search_loop_anon4_LoopHead$0$anon3;

  inline$_v2.Array_search_loop_anon4_LoopHead$0$anon3:
    inline$_v2.Array_search_loop_anon4_LoopHead$0$out_i := inline$_v2.Array_search_loop_anon4_LoopHead$0$out_i + 2;
    goto inline$_v2.Array_search_loop_anon4_LoopHead$0$anon3_dummy;

  inline$_v2.Array_search_loop_anon4_LoopHead$0$anon3_dummy:
    call inline$_v2.Array_search_loop_anon4_LoopHead$0$out_r, inline$_v2.Array_search_loop_anon4_LoopHead$0$out_i := _v2.Array_search_loop_anon4_LoopHead(inline$_v2.Array_search_loop_anon4_LoopHead$0$in_v, inline$_v2.Array_search_loop_anon4_LoopHead$0$out_r, inline$_v2.Array_search_loop_anon4_LoopHead$0$in_k1, inline$_v2.Array_search_loop_anon4_LoopHead$0$out_i);
    goto inline$_v2.Array_search_loop_anon4_LoopHead$0$Return;

  inline$_v2.Array_search_loop_anon4_LoopHead$0$anon5_Then:
    assume {:partition} _v2.a[inline$_v2.Array_search_loop_anon4_LoopHead$0$out_i]
   > inline$_v2.Array_search_loop_anon4_LoopHead$0$in_v;
    inline$_v2.Array_search_loop_anon4_LoopHead$0$out_r := 1;
    inline$_v2.Array_search_loop_anon4_LoopHead$0$out_r, inline$_v2.Array_search_loop_anon4_LoopHead$0$out_i := inline$_v2.Array_search_loop_anon4_LoopHead$0$in_r, inline$_v2.Array_search_loop_anon4_LoopHead$0$in_i;
    goto inline$_v2.Array_search_loop_anon4_LoopHead$0$Return;

  inline$_v2.Array_search_loop_anon4_LoopHead$0$anon4_LoopDone:
    assume {:partition} inline$_v2.Array_search_loop_anon4_LoopHead$0$in_k1
   <= _v2.a[inline$_v2.Array_search_loop_anon4_LoopHead$0$out_i];
    inline$_v2.Array_search_loop_anon4_LoopHead$0$out_r, inline$_v2.Array_search_loop_anon4_LoopHead$0$out_i := inline$_v2.Array_search_loop_anon4_LoopHead$0$in_r, inline$_v2.Array_search_loop_anon4_LoopHead$0$in_i;
    goto inline$_v2.Array_search_loop_anon4_LoopHead$0$Return;

  inline$_v2.Array_search_loop_anon4_LoopHead$0$Return:
    assume true;
    assume true;
    assume true;
    assume true;
    assume true;
    assume true;
    _v2.out_r := inline$_v2.Array_search_loop_anon4_LoopHead$0$out_r;
    _v2.out_i := inline$_v2.Array_search_loop_anon4_LoopHead$0$out_i;
    goto START$2;

  START$2:
    return;
}



function {:inline true} RT_cond_$_v1.Array_search_loop_anon4_LoopHead$_v2.Array_search_loop_anon4_LoopHead(_v1.in_v: int, 
    _v1.in_r: int, 
    _v1.in_k1: int, 
    _v1.in_i: int, 
    _v1.a_old: [int]int, 
    _v2.in_v: int, 
    _v2.in_r: int, 
    _v2.in_k1: int, 
    _v2.in_i: int, 
    _v2.a_old: [int]int)
   : bool
{
  MS_pre_$_v1.Array_search_loop_anon4_LoopHead$_v2.Array_search_loop_anon4_LoopHead(_v1.in_v, 
  _v1.in_r, 
  _v1.in_k1, 
  _v1.in_i, 
  _v1.a_old, 
  _v2.in_v, 
  _v2.in_r, 
  _v2.in_k1, 
  _v2.in_i, 
  _v2.a_old)
}

axiom (forall _v1.in_v: int, 
    _v1.in_r: int, 
    _v1.in_k1: int, 
    _v1.in_i: int, 
    _v1.a_old: [int]int, 
    _v1.out_r: int, 
    _v1.out_i: int, 
    _v2.in_v: int, 
    _v2.in_r: int, 
    _v2.in_k1: int, 
    _v2.in_i: int, 
    _v2.a_old: [int]int :: 
  { R___v1.Array_search_loop_anon4_LoopHead(_v1.in_v, _v1.in_r, _v1.in_k1, _v1.in_i, _v1.a_old, _v1.out_r, _v1.out_i), R'___v2.Array_search_loop_anon4_LoopHead(_v2.in_v, _v2.in_r, _v2.in_k1, _v2.in_i, _v2.a_old) } 
  RT_cond_$_v1.Array_search_loop_anon4_LoopHead$_v2.Array_search_loop_anon4_LoopHead(_v1.in_v, 
        _v1.in_r, 
        _v1.in_k1, 
        _v1.in_i, 
        _v1.a_old, 
        _v2.in_v, 
        _v2.in_r, 
        _v2.in_k1, 
        _v2.in_i, 
        _v2.a_old)
       && R___v1.Array_search_loop_anon4_LoopHead(_v1.in_v, _v1.in_r, _v1.in_k1, _v1.in_i, _v1.a_old, _v1.out_r, _v1.out_i)
     ==> R'___v2.Array_search_loop_anon4_LoopHead(_v2.in_v, _v2.in_r, _v2.in_k1, _v2.in_i, _v2.a_old));

procedure RT_Check__v1.Array_search_loop_anon4_LoopHead___v2.Array_search_loop_anon4_LoopHead(_v1.in_v: int, 
    _v1.in_r: int, 
    _v1.in_k1: int, 
    _v1.in_i: int, 
    _v2.in_v: int, 
    _v2.in_r: int, 
    _v2.in_k1: int, 
    _v2.in_i: int)
   returns (_v1.out_r: int, _v1.out_i: int, _v2.out_r: int, _v2.out_i: int);
  requires RT_cond_$_v1.Array_search_loop_anon4_LoopHead$_v2.Array_search_loop_anon4_LoopHead(_v1.in_v, 
  _v1.in_r, 
  _v1.in_k1, 
  _v1.in_i, 
  _v1.a, 
  _v2.in_v, 
  _v2.in_r, 
  _v2.in_k1, 
  _v2.in_i, 
  _v2.a);



implementation RT_Check__v1.Array_search_loop_anon4_LoopHead___v2.Array_search_loop_anon4_LoopHead(_v1.in_v: int, 
    _v1.in_r: int, 
    _v1.in_k1: int, 
    _v1.in_i: int, 
    _v2.in_v: int, 
    _v2.in_r: int, 
    _v2.in_k1: int, 
    _v2.in_i: int)
   returns (_v1.out_r: int, _v1.out_i: int, _v2.out_r: int, _v2.out_i: int)
{
  var inline$_v1.Array_search_loop_anon4_LoopHead$0$in_v: int;
  var inline$_v1.Array_search_loop_anon4_LoopHead$0$in_r: int;
  var inline$_v1.Array_search_loop_anon4_LoopHead$0$in_k1: int;
  var inline$_v1.Array_search_loop_anon4_LoopHead$0$in_i: int;
  var inline$_v1.Array_search_loop_anon4_LoopHead$0$out_r: int;
  var inline$_v1.Array_search_loop_anon4_LoopHead$0$out_i: int;
  var inline$_v2.Array_search_loop_anon4_LoopHead$0$in_v: int;
  var inline$_v2.Array_search_loop_anon4_LoopHead$0$in_r: int;
  var inline$_v2.Array_search_loop_anon4_LoopHead$0$in_k1: int;
  var inline$_v2.Array_search_loop_anon4_LoopHead$0$in_i: int;
  var inline$_v2.Array_search_loop_anon4_LoopHead$0$out_r: int;
  var inline$_v2.Array_search_loop_anon4_LoopHead$0$out_i: int;

  START:
    goto inline$_v1.Array_search_loop_anon4_LoopHead$0$Entry;

  inline$_v1.Array_search_loop_anon4_LoopHead$0$Entry:
    inline$_v1.Array_search_loop_anon4_LoopHead$0$in_v := _v1.in_v;
    inline$_v1.Array_search_loop_anon4_LoopHead$0$in_r := _v1.in_r;
    inline$_v1.Array_search_loop_anon4_LoopHead$0$in_k1 := _v1.in_k1;
    inline$_v1.Array_search_loop_anon4_LoopHead$0$in_i := _v1.in_i;
    havoc inline$_v1.Array_search_loop_anon4_LoopHead$0$out_r, inline$_v1.Array_search_loop_anon4_LoopHead$0$out_i;
    goto inline$_v1.Array_search_loop_anon4_LoopHead$0$entry;

  inline$_v1.Array_search_loop_anon4_LoopHead$0$entry:
    inline$_v1.Array_search_loop_anon4_LoopHead$0$out_r, inline$_v1.Array_search_loop_anon4_LoopHead$0$out_i := inline$_v1.Array_search_loop_anon4_LoopHead$0$in_r, inline$_v1.Array_search_loop_anon4_LoopHead$0$in_i;
    goto inline$_v1.Array_search_loop_anon4_LoopHead$0$anon4_LoopHead;

  inline$_v1.Array_search_loop_anon4_LoopHead$0$anon4_LoopHead:
    goto inline$_v1.Array_search_loop_anon4_LoopHead$0$anon4_LoopDone, inline$_v1.Array_search_loop_anon4_LoopHead$0$anon4_LoopBody;

  inline$_v1.Array_search_loop_anon4_LoopHead$0$anon4_LoopBody:
    assume {:partition} _v1.a[inline$_v1.Array_search_loop_anon4_LoopHead$0$out_i]
   < inline$_v1.Array_search_loop_anon4_LoopHead$0$in_k1;
    goto inline$_v1.Array_search_loop_anon4_LoopHead$0$anon5_Then, inline$_v1.Array_search_loop_anon4_LoopHead$0$anon5_Else;

  inline$_v1.Array_search_loop_anon4_LoopHead$0$anon5_Else:
    assume {:partition} inline$_v1.Array_search_loop_anon4_LoopHead$0$in_v
   >= _v1.a[inline$_v1.Array_search_loop_anon4_LoopHead$0$out_i];
    goto inline$_v1.Array_search_loop_anon4_LoopHead$0$anon3;

  inline$_v1.Array_search_loop_anon4_LoopHead$0$anon3:
    inline$_v1.Array_search_loop_anon4_LoopHead$0$out_i := inline$_v1.Array_search_loop_anon4_LoopHead$0$out_i + 1;
    goto inline$_v1.Array_search_loop_anon4_LoopHead$0$anon3_dummy;

  inline$_v1.Array_search_loop_anon4_LoopHead$0$anon3_dummy:
    call inline$_v1.Array_search_loop_anon4_LoopHead$0$out_r, inline$_v1.Array_search_loop_anon4_LoopHead$0$out_i := _v1.Array_search_loop_anon4_LoopHead(inline$_v1.Array_search_loop_anon4_LoopHead$0$in_v, inline$_v1.Array_search_loop_anon4_LoopHead$0$out_r, inline$_v1.Array_search_loop_anon4_LoopHead$0$in_k1, inline$_v1.Array_search_loop_anon4_LoopHead$0$out_i);
    goto inline$_v1.Array_search_loop_anon4_LoopHead$0$Return;

  inline$_v1.Array_search_loop_anon4_LoopHead$0$anon5_Then:
    assume {:partition} _v1.a[inline$_v1.Array_search_loop_anon4_LoopHead$0$out_i]
   > inline$_v1.Array_search_loop_anon4_LoopHead$0$in_v;
    inline$_v1.Array_search_loop_anon4_LoopHead$0$out_r := 1;
    inline$_v1.Array_search_loop_anon4_LoopHead$0$out_r, inline$_v1.Array_search_loop_anon4_LoopHead$0$out_i := inline$_v1.Array_search_loop_anon4_LoopHead$0$in_r, inline$_v1.Array_search_loop_anon4_LoopHead$0$in_i;
    goto inline$_v1.Array_search_loop_anon4_LoopHead$0$Return;

  inline$_v1.Array_search_loop_anon4_LoopHead$0$anon4_LoopDone:
    assume {:partition} inline$_v1.Array_search_loop_anon4_LoopHead$0$in_k1
   <= _v1.a[inline$_v1.Array_search_loop_anon4_LoopHead$0$out_i];
    inline$_v1.Array_search_loop_anon4_LoopHead$0$out_r, inline$_v1.Array_search_loop_anon4_LoopHead$0$out_i := inline$_v1.Array_search_loop_anon4_LoopHead$0$in_r, inline$_v1.Array_search_loop_anon4_LoopHead$0$in_i;
    goto inline$_v1.Array_search_loop_anon4_LoopHead$0$Return;

  inline$_v1.Array_search_loop_anon4_LoopHead$0$Return:
    assume true;
    assume true;
    assume true;
    assume true;
    assume true;
    _v1.out_r := inline$_v1.Array_search_loop_anon4_LoopHead$0$out_r;
    _v1.out_i := inline$_v1.Array_search_loop_anon4_LoopHead$0$out_i;
    goto START$1;

  START$1:
    goto inline$_v2.Array_search_loop_anon4_LoopHead$0$Entry;

  inline$_v2.Array_search_loop_anon4_LoopHead$0$Entry:
    inline$_v2.Array_search_loop_anon4_LoopHead$0$in_v := _v2.in_v;
    inline$_v2.Array_search_loop_anon4_LoopHead$0$in_r := _v2.in_r;
    inline$_v2.Array_search_loop_anon4_LoopHead$0$in_k1 := _v2.in_k1;
    inline$_v2.Array_search_loop_anon4_LoopHead$0$in_i := _v2.in_i;
    havoc inline$_v2.Array_search_loop_anon4_LoopHead$0$out_r, inline$_v2.Array_search_loop_anon4_LoopHead$0$out_i;
    goto inline$_v2.Array_search_loop_anon4_LoopHead$0$entry;

  inline$_v2.Array_search_loop_anon4_LoopHead$0$entry:
    inline$_v2.Array_search_loop_anon4_LoopHead$0$out_r, inline$_v2.Array_search_loop_anon4_LoopHead$0$out_i := inline$_v2.Array_search_loop_anon4_LoopHead$0$in_r, inline$_v2.Array_search_loop_anon4_LoopHead$0$in_i;
    goto inline$_v2.Array_search_loop_anon4_LoopHead$0$anon4_LoopHead;

  inline$_v2.Array_search_loop_anon4_LoopHead$0$anon4_LoopHead:
    goto inline$_v2.Array_search_loop_anon4_LoopHead$0$anon4_LoopDone, inline$_v2.Array_search_loop_anon4_LoopHead$0$anon4_LoopBody;

  inline$_v2.Array_search_loop_anon4_LoopHead$0$anon4_LoopBody:
    assume {:partition} _v2.a[inline$_v2.Array_search_loop_anon4_LoopHead$0$out_i]
   < inline$_v2.Array_search_loop_anon4_LoopHead$0$in_k1;
    goto inline$_v2.Array_search_loop_anon4_LoopHead$0$anon5_Then, inline$_v2.Array_search_loop_anon4_LoopHead$0$anon5_Else;

  inline$_v2.Array_search_loop_anon4_LoopHead$0$anon5_Else:
    assume {:partition} inline$_v2.Array_search_loop_anon4_LoopHead$0$in_v
   >= _v2.a[inline$_v2.Array_search_loop_anon4_LoopHead$0$out_i];
    goto inline$_v2.Array_search_loop_anon4_LoopHead$0$anon3;

  inline$_v2.Array_search_loop_anon4_LoopHead$0$anon3:
    inline$_v2.Array_search_loop_anon4_LoopHead$0$out_i := inline$_v2.Array_search_loop_anon4_LoopHead$0$out_i + 2;
    goto inline$_v2.Array_search_loop_anon4_LoopHead$0$anon3_dummy;

  inline$_v2.Array_search_loop_anon4_LoopHead$0$anon3_dummy:
    assert R'___v2.Array_search_loop_anon4_LoopHead(inline$_v2.Array_search_loop_anon4_LoopHead$0$in_v, 
  inline$_v2.Array_search_loop_anon4_LoopHead$0$out_r, 
  inline$_v2.Array_search_loop_anon4_LoopHead$0$in_k1, 
  inline$_v2.Array_search_loop_anon4_LoopHead$0$out_i, 
  _v2.a);
    call inline$_v2.Array_search_loop_anon4_LoopHead$0$out_r, inline$_v2.Array_search_loop_anon4_LoopHead$0$out_i := _v2.Array_search_loop_anon4_LoopHead(inline$_v2.Array_search_loop_anon4_LoopHead$0$in_v, inline$_v2.Array_search_loop_anon4_LoopHead$0$out_r, inline$_v2.Array_search_loop_anon4_LoopHead$0$in_k1, inline$_v2.Array_search_loop_anon4_LoopHead$0$out_i);
    goto inline$_v2.Array_search_loop_anon4_LoopHead$0$Return;

  inline$_v2.Array_search_loop_anon4_LoopHead$0$anon5_Then:
    assume {:partition} _v2.a[inline$_v2.Array_search_loop_anon4_LoopHead$0$out_i]
   > inline$_v2.Array_search_loop_anon4_LoopHead$0$in_v;
    inline$_v2.Array_search_loop_anon4_LoopHead$0$out_r := 1;
    inline$_v2.Array_search_loop_anon4_LoopHead$0$out_r, inline$_v2.Array_search_loop_anon4_LoopHead$0$out_i := inline$_v2.Array_search_loop_anon4_LoopHead$0$in_r, inline$_v2.Array_search_loop_anon4_LoopHead$0$in_i;
    goto inline$_v2.Array_search_loop_anon4_LoopHead$0$Return;

  inline$_v2.Array_search_loop_anon4_LoopHead$0$anon4_LoopDone:
    assume {:partition} inline$_v2.Array_search_loop_anon4_LoopHead$0$in_k1
   <= _v2.a[inline$_v2.Array_search_loop_anon4_LoopHead$0$out_i];
    inline$_v2.Array_search_loop_anon4_LoopHead$0$out_r, inline$_v2.Array_search_loop_anon4_LoopHead$0$out_i := inline$_v2.Array_search_loop_anon4_LoopHead$0$in_r, inline$_v2.Array_search_loop_anon4_LoopHead$0$in_i;
    goto inline$_v2.Array_search_loop_anon4_LoopHead$0$Return;

  inline$_v2.Array_search_loop_anon4_LoopHead$0$Return:
    assume true;
    assume true;
    assume true;
    assume true;
    assume true;
    assume true;
    _v2.out_r := inline$_v2.Array_search_loop_anon4_LoopHead$0$out_r;
    _v2.out_i := inline$_v2.Array_search_loop_anon4_LoopHead$0$out_i;
    goto START$2;

  START$2:
    return;
}


