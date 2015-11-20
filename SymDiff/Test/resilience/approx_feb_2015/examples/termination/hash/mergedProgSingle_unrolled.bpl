var _v2.str: [int]int;

procedure {:prefix "_v2"} _v2.hash() returns (r: int);
  free ensures R'___v2.hash(old(_v2.str));
  free ensures R___v2.hash(old(_v2.str), r);



procedure {:prefix "_v2"} _v2.hash_loop_anon4_LoopHead(in_i: int, in_hash: int) returns (out_i: int, out_hash: int);
  free ensures {:io_dependency "out_i", "in_i", "str"} true;
  free ensures {:io_dependency "out_hash", "in_hash", "str", "in_i"} true;
  free ensures {:io_dependency "out_i", "in_i", "str"} true;
  free ensures {:io_dependency "out_hash", "in_hash", "str", "in_i"} true;
  free ensures R'___v2.hash_loop_anon4_LoopHead(in_i, in_hash, old(_v2.str));
  free ensures R___v2.hash_loop_anon4_LoopHead(in_i, in_hash, old(_v2.str), out_i, out_hash);



implementation _v2.hash() returns (r: int)
{
  var i: int;
  var hash: int;

  anon0:
    i := 0;
    hash := 0;
    call i, hash := _v2.hash_loop_anon4_LoopHead(i, hash);
    goto anon4_LoopDone, anon4_LoopBody;

  anon4_LoopBody:
    assume {:partition} _v2.str[i] != 0;
    hash := hash + _v2.str[i];
    i := i + 1;
    goto anon5_Then, anon5_Else;

  anon5_Else:
    assume {:partition} _v2.str[i] != 0;
    i := i + 1;
    assume false;
    return;

  anon5_Then:
    assume {:partition} _v2.str[i] == 0;
    return;

  anon4_LoopDone:
    assume {:partition} _v2.str[i] == 0;
    return;
}



implementation _v2.hash_loop_anon4_LoopHead(in_i: int, in_hash: int) returns (out_i: int, out_hash: int)
{

  entry:
    out_i, out_hash := in_i, in_hash;
    goto anon4_LoopDone, anon4_LoopBody;

  anon4_LoopBody:
    assume {:partition} _v2.str[out_i] != 0;
    out_hash := out_hash + _v2.str[out_i];
    out_i := out_i + 1;
    goto anon5_Then, anon5_Else;

  anon5_Else:
    assume {:partition} _v2.str[out_i] != 0;
    out_i := out_i + 1;
    call out_i, out_hash := _v2.hash_loop_anon4_LoopHead(out_i, out_hash);
    return;

  anon5_Then:
    assume {:partition} _v2.str[out_i] == 0;
    out_i, out_hash := in_i, in_hash;
    return;

  anon4_LoopDone:
    assume {:partition} _v2.str[out_i] == 0;
    out_i, out_hash := in_i, in_hash;
    return;
}



var _v1.str: [int]int;

procedure {:prefix "_v1"} _v1.hash() returns (r: int);
  free ensures {:io_dependency "r", "str"} true;
  free ensures {:io_dependency "r", "str"} true;
  free ensures R___v1.hash(old(_v1.str), r);



procedure {:prefix "_v1"} _v1.hash_loop_anon3_LoopHead(in_i: int, in_hash: int) returns (out_i: int, out_hash: int);
  free ensures {:io_dependency "out_i", "in_i", "str"} true;
  free ensures {:io_dependency "out_hash", "in_hash", "str", "in_i"} true;
  free ensures {:io_dependency "out_i", "in_i", "str"} true;
  free ensures {:io_dependency "out_hash", "in_hash", "str", "in_i"} true;
  free ensures R___v1.hash_loop_anon3_LoopHead(in_i, in_hash, old(_v1.str), out_i, out_hash);



implementation _v1.hash() returns (r: int)
{
  var i: int;
  var hash: int;
  var inline$_v1.hash_loop_anon3_LoopHead$0$in_i: int;
  var inline$_v1.hash_loop_anon3_LoopHead$0$in_hash: int;
  var inline$_v1.hash_loop_anon3_LoopHead$0$out_i: int;
  var inline$_v1.hash_loop_anon3_LoopHead$0$out_hash: int;

  anon0:
    i := 0;
    hash := 0;
    goto inline$_v1.hash_loop_anon3_LoopHead$0$Entry;

  inline$_v1.hash_loop_anon3_LoopHead$0$Entry:
    inline$_v1.hash_loop_anon3_LoopHead$0$in_i := i;
    inline$_v1.hash_loop_anon3_LoopHead$0$in_hash := hash;
    havoc inline$_v1.hash_loop_anon3_LoopHead$0$out_i, inline$_v1.hash_loop_anon3_LoopHead$0$out_hash;
    goto inline$_v1.hash_loop_anon3_LoopHead$0$entry;

  inline$_v1.hash_loop_anon3_LoopHead$0$entry:
    inline$_v1.hash_loop_anon3_LoopHead$0$out_i, inline$_v1.hash_loop_anon3_LoopHead$0$out_hash := inline$_v1.hash_loop_anon3_LoopHead$0$in_i, inline$_v1.hash_loop_anon3_LoopHead$0$in_hash;
    goto inline$_v1.hash_loop_anon3_LoopHead$0$anon3_LoopDone, inline$_v1.hash_loop_anon3_LoopHead$0$anon3_LoopBody;

  inline$_v1.hash_loop_anon3_LoopHead$0$anon3_LoopBody:
    assume {:partition} _v1.str[inline$_v1.hash_loop_anon3_LoopHead$0$out_i] != 0;
    inline$_v1.hash_loop_anon3_LoopHead$0$out_hash := inline$_v1.hash_loop_anon3_LoopHead$0$out_hash
   + _v1.str[inline$_v1.hash_loop_anon3_LoopHead$0$out_i];
    inline$_v1.hash_loop_anon3_LoopHead$0$out_i := inline$_v1.hash_loop_anon3_LoopHead$0$out_i + 1;
    call inline$_v1.hash_loop_anon3_LoopHead$0$out_i, inline$_v1.hash_loop_anon3_LoopHead$0$out_hash := _v1.hash_loop_anon3_LoopHead(inline$_v1.hash_loop_anon3_LoopHead$0$out_i, inline$_v1.hash_loop_anon3_LoopHead$0$out_hash);
    goto inline$_v1.hash_loop_anon3_LoopHead$0$Return;

  inline$_v1.hash_loop_anon3_LoopHead$0$anon3_LoopDone:
    assume {:partition} _v1.str[inline$_v1.hash_loop_anon3_LoopHead$0$out_i] == 0;
    inline$_v1.hash_loop_anon3_LoopHead$0$out_i, inline$_v1.hash_loop_anon3_LoopHead$0$out_hash := inline$_v1.hash_loop_anon3_LoopHead$0$in_i, inline$_v1.hash_loop_anon3_LoopHead$0$in_hash;
    goto inline$_v1.hash_loop_anon3_LoopHead$0$Return;

  inline$_v1.hash_loop_anon3_LoopHead$0$Return:
    assume true;
    assume true;
    assume true;
    assume true;
    assume true;
    i := inline$_v1.hash_loop_anon3_LoopHead$0$out_i;
    hash := inline$_v1.hash_loop_anon3_LoopHead$0$out_hash;
    goto anon0$1;

  anon0$1:
    goto anon3_LoopDone, anon3_LoopBody;

  anon3_LoopBody:
    assume {:partition} _v1.str[i] != 0;
    hash := hash + _v1.str[i];
    i := i + 1;
    assume false;
    return;

  anon3_LoopDone:
    assume {:partition} _v1.str[i] == 0;
    r := hash;
    return;
}



implementation _v1.hash_loop_anon3_LoopHead(in_i: int, in_hash: int) returns (out_i: int, out_hash: int)
{
  var inline$_v1.hash_loop_anon3_LoopHead$0$in_i: int;
  var inline$_v1.hash_loop_anon3_LoopHead$0$in_hash: int;
  var inline$_v1.hash_loop_anon3_LoopHead$0$out_i: int;
  var inline$_v1.hash_loop_anon3_LoopHead$0$out_hash: int;

  entry:
    out_i, out_hash := in_i, in_hash;
    goto anon3_LoopDone, anon3_LoopBody;

  anon3_LoopBody:
    assume {:partition} _v1.str[out_i] != 0;
    out_hash := out_hash + _v1.str[out_i];
    out_i := out_i + 1;
    goto inline$_v1.hash_loop_anon3_LoopHead$0$Entry;

  inline$_v1.hash_loop_anon3_LoopHead$0$Entry:
    inline$_v1.hash_loop_anon3_LoopHead$0$in_i := out_i;
    inline$_v1.hash_loop_anon3_LoopHead$0$in_hash := out_hash;
    havoc inline$_v1.hash_loop_anon3_LoopHead$0$out_i, inline$_v1.hash_loop_anon3_LoopHead$0$out_hash;
    goto inline$_v1.hash_loop_anon3_LoopHead$0$entry;

  inline$_v1.hash_loop_anon3_LoopHead$0$entry:
    inline$_v1.hash_loop_anon3_LoopHead$0$out_i, inline$_v1.hash_loop_anon3_LoopHead$0$out_hash := inline$_v1.hash_loop_anon3_LoopHead$0$in_i, inline$_v1.hash_loop_anon3_LoopHead$0$in_hash;
    goto inline$_v1.hash_loop_anon3_LoopHead$0$anon3_LoopDone, inline$_v1.hash_loop_anon3_LoopHead$0$anon3_LoopBody;

  inline$_v1.hash_loop_anon3_LoopHead$0$anon3_LoopBody:
    assume {:partition} _v1.str[inline$_v1.hash_loop_anon3_LoopHead$0$out_i] != 0;
    inline$_v1.hash_loop_anon3_LoopHead$0$out_hash := inline$_v1.hash_loop_anon3_LoopHead$0$out_hash
   + _v1.str[inline$_v1.hash_loop_anon3_LoopHead$0$out_i];
    inline$_v1.hash_loop_anon3_LoopHead$0$out_i := inline$_v1.hash_loop_anon3_LoopHead$0$out_i + 1;
    call inline$_v1.hash_loop_anon3_LoopHead$0$out_i, inline$_v1.hash_loop_anon3_LoopHead$0$out_hash := _v1.hash_loop_anon3_LoopHead(inline$_v1.hash_loop_anon3_LoopHead$0$out_i, inline$_v1.hash_loop_anon3_LoopHead$0$out_hash);
    goto inline$_v1.hash_loop_anon3_LoopHead$0$Return;

  inline$_v1.hash_loop_anon3_LoopHead$0$anon3_LoopDone:
    assume {:partition} _v1.str[inline$_v1.hash_loop_anon3_LoopHead$0$out_i] == 0;
    inline$_v1.hash_loop_anon3_LoopHead$0$out_i, inline$_v1.hash_loop_anon3_LoopHead$0$out_hash := inline$_v1.hash_loop_anon3_LoopHead$0$in_i, inline$_v1.hash_loop_anon3_LoopHead$0$in_hash;
    goto inline$_v1.hash_loop_anon3_LoopHead$0$Return;

  inline$_v1.hash_loop_anon3_LoopHead$0$Return:
    assume true;
    assume true;
    assume true;
    assume true;
    assume true;
    out_i := inline$_v1.hash_loop_anon3_LoopHead$0$out_i;
    out_hash := inline$_v1.hash_loop_anon3_LoopHead$0$out_hash;
    goto anon3_LoopBody$1;

  anon3_LoopBody$1:
    return;

  anon3_LoopDone:
    assume {:partition} _v1.str[out_i] == 0;
    out_i, out_hash := in_i, in_hash;
    return;
}



function R___v2.hash(_v2.str_old: [int]int, .r: int) : bool;

function R'___v2.hash(_v2.str_old: [int]int) : bool;

function R___v2.hash_loop_anon4_LoopHead(.in_i: int, .in_hash: int, _v2.str_old: [int]int, .out_i: int, .out_hash: int)
   : bool;

function R'___v2.hash_loop_anon4_LoopHead(.in_i: int, .in_hash: int, _v2.str_old: [int]int) : bool;

function R___v1.hash(_v1.str_old: [int]int, .r: int) : bool;

function R___v1.hash_loop_anon3_LoopHead(.in_i: int, .in_hash: int, _v1.str_old: [int]int, .out_i: int, .out_hash: int)
   : bool;

function {:inline true} MS$_v1.hash$_v2.hash(_v1.str_old: [int]int, _v1.r: int, _v2.str_old: [int]int, _v2.r: int) : bool
{
  _v1.str_old == _v2.str_old ==> _v1.r == _v2.r
}

axiom (forall _v1.str_old: [int]int, _v1.r: int, _v2.str_old: [int]int, _v2.r: int :: 
  { R___v1.hash(_v1.str_old, _v1.r), R___v2.hash(_v2.str_old, _v2.r) } 
  R___v1.hash(_v1.str_old, _v1.r) && R___v2.hash(_v2.str_old, _v2.r)
     ==> MS$_v1.hash$_v2.hash(_v1.str_old, _v1.r, _v2.str_old, _v2.r));

function {:inline true} MS_pre_$_v1.hash$_v2.hash(_v1.str_old: [int]int, _v2.str_old: [int]int) : bool
{
 _v1.str_old == _v2.str_old 
}

procedure {:MS_procs "_v1.hash", "_v2.hash"} MS_Check__v1.hash___v2.hash() returns (_v1.r: int, _v2.r: int);
  requires MS_pre_$_v1.hash$_v2.hash(_v1.str, _v2.str);
  ensures MS$_v1.hash$_v2.hash(old(_v1.str), _v1.r, old(_v2.str), _v2.r);



implementation MS_Check__v1.hash___v2.hash() returns (_v1.r: int, _v2.r: int)
{
  var inline$_v1.hash$0$i: int;
  var inline$_v1.hash$0$hash: int;
  var inline$_v1.hash$0$r: int;
  var inline$_v2.hash$0$i: int;
  var inline$_v2.hash$0$hash: int;
  var inline$_v2.hash$0$r: int;
  var inline$$_v1.hash_loop_anon3_LoopHead$0$in_i: int;
  var inline$$_v1.hash_loop_anon3_LoopHead$0$in_hash: int;
  var inline$$_v1.hash_loop_anon3_LoopHead$0$out_i: int;
  var inline$$_v1.hash_loop_anon3_LoopHead$0$out_hash: int;

  START:
    havoc inline$_v1.hash$0$i, inline$_v1.hash$0$hash, inline$_v1.hash$0$r;
    inline$_v1.hash$0$i := 0;
    inline$_v1.hash$0$hash := 0;
    goto inline$$_v1.hash_loop_anon3_LoopHead$0$Entry;

  inline$$_v1.hash_loop_anon3_LoopHead$0$Entry:
    inline$$_v1.hash_loop_anon3_LoopHead$0$in_i := inline$_v1.hash$0$i;
    inline$$_v1.hash_loop_anon3_LoopHead$0$in_hash := inline$_v1.hash$0$hash;
    havoc inline$$_v1.hash_loop_anon3_LoopHead$0$out_i, inline$$_v1.hash_loop_anon3_LoopHead$0$out_hash;
    goto inline$$_v1.hash_loop_anon3_LoopHead$0$entry;

  inline$$_v1.hash_loop_anon3_LoopHead$0$entry:
    inline$$_v1.hash_loop_anon3_LoopHead$0$out_i, inline$$_v1.hash_loop_anon3_LoopHead$0$out_hash := inline$$_v1.hash_loop_anon3_LoopHead$0$in_i, inline$$_v1.hash_loop_anon3_LoopHead$0$in_hash;
    goto inline$$_v1.hash_loop_anon3_LoopHead$0$anon3_LoopDone, inline$$_v1.hash_loop_anon3_LoopHead$0$anon3_LoopBody;

  inline$$_v1.hash_loop_anon3_LoopHead$0$anon3_LoopBody:
    assume {:partition} _v1.str[inline$$_v1.hash_loop_anon3_LoopHead$0$out_i] != 0;
    inline$$_v1.hash_loop_anon3_LoopHead$0$out_hash := inline$$_v1.hash_loop_anon3_LoopHead$0$out_hash
   + _v1.str[inline$$_v1.hash_loop_anon3_LoopHead$0$out_i];
    inline$$_v1.hash_loop_anon3_LoopHead$0$out_i := inline$$_v1.hash_loop_anon3_LoopHead$0$out_i + 1;
    call inline$$_v1.hash_loop_anon3_LoopHead$0$out_i, inline$$_v1.hash_loop_anon3_LoopHead$0$out_hash := _v1.hash_loop_anon3_LoopHead(inline$$_v1.hash_loop_anon3_LoopHead$0$out_i, inline$$_v1.hash_loop_anon3_LoopHead$0$out_hash);
    goto inline$$_v1.hash_loop_anon3_LoopHead$0$Return;

  inline$$_v1.hash_loop_anon3_LoopHead$0$anon3_LoopDone:
    assume {:partition} _v1.str[inline$$_v1.hash_loop_anon3_LoopHead$0$out_i] == 0;
    inline$$_v1.hash_loop_anon3_LoopHead$0$out_i, inline$$_v1.hash_loop_anon3_LoopHead$0$out_hash := inline$$_v1.hash_loop_anon3_LoopHead$0$in_i, inline$$_v1.hash_loop_anon3_LoopHead$0$in_hash;
    goto inline$$_v1.hash_loop_anon3_LoopHead$0$Return;

  inline$$_v1.hash_loop_anon3_LoopHead$0$Return:
    assume true;
    assume true;
    assume true;
    assume true;
    assume true;
    inline$_v1.hash$0$i := inline$$_v1.hash_loop_anon3_LoopHead$0$out_i;
    inline$_v1.hash$0$hash := inline$$_v1.hash_loop_anon3_LoopHead$0$out_hash;
    goto START$1;

  START$1:
    goto inline$_v1.hash$0$anon3_LoopDone, inline$_v1.hash$0$anon3_LoopBody;

  inline$_v1.hash$0$anon3_LoopBody:
    assume {:partition} _v1.str[inline$_v1.hash$0$i] != 0;
    inline$_v1.hash$0$hash := inline$_v1.hash$0$hash + _v1.str[inline$_v1.hash$0$i];
    inline$_v1.hash$0$i := inline$_v1.hash$0$i + 1;
    assume false;
    return;

  inline$_v1.hash$0$anon3_LoopDone:
    assume {:partition} _v1.str[inline$_v1.hash$0$i] == 0;
    inline$_v1.hash$0$r := inline$_v1.hash$0$hash;
    assume true;
    assume true;
    assume true;
    _v1.r := inline$_v1.hash$0$r;
    havoc inline$_v2.hash$0$i, inline$_v2.hash$0$hash, inline$_v2.hash$0$r;
    inline$_v2.hash$0$i := 0;
    inline$_v2.hash$0$hash := 0;
    call inline$_v2.hash$0$i, inline$_v2.hash$0$hash := _v2.hash_loop_anon4_LoopHead(inline$_v2.hash$0$i, inline$_v2.hash$0$hash);
    goto inline$_v2.hash$0$anon4_LoopDone, inline$_v2.hash$0$anon4_LoopBody;

  inline$_v2.hash$0$anon4_LoopBody:
    assume {:partition} _v2.str[inline$_v2.hash$0$i] != 0;
    inline$_v2.hash$0$hash := inline$_v2.hash$0$hash + _v2.str[inline$_v2.hash$0$i];
    inline$_v2.hash$0$i := inline$_v2.hash$0$i + 1;
    goto inline$_v2.hash$0$anon5_Then, inline$_v2.hash$0$anon5_Else;

  inline$_v2.hash$0$anon5_Else:
    assume {:partition} _v2.str[inline$_v2.hash$0$i] != 0;
    inline$_v2.hash$0$i := inline$_v2.hash$0$i + 1;
    assume false;
    return;

  inline$_v2.hash$0$anon5_Then:
    assume {:partition} _v2.str[inline$_v2.hash$0$i] == 0;
    goto inline$_v2.hash$0$Return;

  inline$_v2.hash$0$Return:
    assume true;
    assume true;
    _v2.r := inline$_v2.hash$0$r;
    return;

  inline$_v2.hash$0$anon4_LoopDone:
    assume {:partition} _v2.str[inline$_v2.hash$0$i] == 0;
    goto inline$_v2.hash$0$Return;
}



function {:inline true} RT_cond_$_v1.hash$_v2.hash(_v1.str_old: [int]int, _v2.str_old: [int]int) : bool
{
  MS_pre_$_v1.hash$_v2.hash(_v1.str_old, _v2.str_old)
}

axiom (forall _v1.str_old: [int]int, _v1.r: int, _v2.str_old: [int]int :: 
  { R___v1.hash(_v1.str_old, _v1.r), R'___v2.hash(_v2.str_old) } 
  RT_cond_$_v1.hash$_v2.hash(_v1.str_old, _v2.str_old)
       && R___v1.hash(_v1.str_old, _v1.r)
     ==> R'___v2.hash(_v2.str_old));

procedure RT_Check__v1.hash___v2.hash() returns (_v1.r: int, _v2.r: int);
  requires RT_cond_$_v1.hash$_v2.hash(_v1.str, _v2.str);



implementation RT_Check__v1.hash___v2.hash() returns (_v1.r: int, _v2.r: int)
{
  var inline$_v1.hash$0$i: int;
  var inline$_v1.hash$0$hash: int;
  var inline$_v1.hash$0$r: int;
  var inline$_v2.hash$0$i: int;
  var inline$_v2.hash$0$hash: int;
  var inline$_v2.hash$0$r: int;

  START:
    goto inline$_v1.hash$0$Entry;

  inline$_v1.hash$0$Entry:
    havoc inline$_v1.hash$0$i, inline$_v1.hash$0$hash, inline$_v1.hash$0$r;
    goto inline$_v1.hash$0$anon0;

  inline$_v1.hash$0$anon0:
    inline$_v1.hash$0$i := 0;
    inline$_v1.hash$0$hash := 0;
    goto inline$_v1.hash$0$anon3_LoopHead;

  inline$_v1.hash$0$anon3_LoopHead:
    call inline$_v1.hash$0$i, inline$_v1.hash$0$hash := _v1.hash_loop_anon3_LoopHead(inline$_v1.hash$0$i, inline$_v1.hash$0$hash);
    goto inline$_v1.hash$0$anon3_LoopHead_last;

  inline$_v1.hash$0$anon3_LoopHead_last:
    goto inline$_v1.hash$0$anon3_LoopDone, inline$_v1.hash$0$anon3_LoopBody;

  inline$_v1.hash$0$anon3_LoopBody:
    assume {:partition} _v1.str[inline$_v1.hash$0$i] != 0;
    inline$_v1.hash$0$hash := inline$_v1.hash$0$hash + _v1.str[inline$_v1.hash$0$i];
    inline$_v1.hash$0$i := inline$_v1.hash$0$i + 1;
    goto inline$_v1.hash$0$anon3_LoopBody_dummy;

  inline$_v1.hash$0$anon3_LoopBody_dummy:
    assume false;
    goto inline$_v1.hash$0$Return;

  inline$_v1.hash$0$anon3_LoopDone:
    assume {:partition} _v1.str[inline$_v1.hash$0$i] == 0;
    goto inline$_v1.hash$0$anon2;

  inline$_v1.hash$0$anon2:
    inline$_v1.hash$0$r := inline$_v1.hash$0$hash;
    goto inline$_v1.hash$0$Return;

  inline$_v1.hash$0$Return:
    assume true;
    assume true;
    assume true;
    _v1.r := inline$_v1.hash$0$r;
    goto START$1;

  START$1:
    goto inline$_v2.hash$0$Entry;

  inline$_v2.hash$0$Entry:
    havoc inline$_v2.hash$0$i, inline$_v2.hash$0$hash, inline$_v2.hash$0$r;
    goto inline$_v2.hash$0$anon0;

  inline$_v2.hash$0$anon0:
    inline$_v2.hash$0$i := 0;
    inline$_v2.hash$0$hash := 0;
    goto inline$_v2.hash$0$anon4_LoopHead;

  inline$_v2.hash$0$anon4_LoopHead:
    assert R'___v2.hash_loop_anon4_LoopHead(inline$_v2.hash$0$i, inline$_v2.hash$0$hash, _v2.str);
    call inline$_v2.hash$0$i, inline$_v2.hash$0$hash := _v2.hash_loop_anon4_LoopHead(inline$_v2.hash$0$i, inline$_v2.hash$0$hash);
    goto inline$_v2.hash$0$anon4_LoopHead_last;

  inline$_v2.hash$0$anon4_LoopHead_last:
    goto inline$_v2.hash$0$anon4_LoopDone, inline$_v2.hash$0$anon4_LoopBody;

  inline$_v2.hash$0$anon4_LoopBody:
    assume {:partition} _v2.str[inline$_v2.hash$0$i] != 0;
    inline$_v2.hash$0$hash := inline$_v2.hash$0$hash + _v2.str[inline$_v2.hash$0$i];
    inline$_v2.hash$0$i := inline$_v2.hash$0$i + 1;
    goto inline$_v2.hash$0$anon5_Then, inline$_v2.hash$0$anon5_Else;

  inline$_v2.hash$0$anon5_Else:
    assume {:partition} _v2.str[inline$_v2.hash$0$i] != 0;
    goto inline$_v2.hash$0$anon3;

  inline$_v2.hash$0$anon3:
    inline$_v2.hash$0$i := inline$_v2.hash$0$i + 1;
    goto inline$_v2.hash$0$anon3_dummy;

  inline$_v2.hash$0$anon3_dummy:
    assume false;
    goto inline$_v2.hash$0$Return;

  inline$_v2.hash$0$anon5_Then:
    assume {:partition} _v2.str[inline$_v2.hash$0$i] == 0;
    goto inline$_v2.hash$0$Return;

  inline$_v2.hash$0$anon4_LoopDone:
    assume {:partition} _v2.str[inline$_v2.hash$0$i] == 0;
    goto inline$_v2.hash$0$Return;

  inline$_v2.hash$0$Return:
    assume true;
    assume true;
    _v2.r := inline$_v2.hash$0$r;
    goto START$2;

  START$2:
    return;
}



function {:inline true} MS$_v1.hash_loop_anon3_LoopHead$_v2.hash_loop_anon4_LoopHead(_v1.in_i: int, 
    _v1.in_hash: int, 
    _v1.str_old: [int]int, 
    _v1.out_i: int, 
    _v1.out_hash: int, 
    _v2.in_i: int, 
    _v2.in_hash: int, 
    _v2.str_old: [int]int, 
    _v2.out_i: int, 
    _v2.out_hash: int)
   : bool
{
  _v1.in_i == _v2.in_i && _v1.in_hash == _v2.in_hash && _v1.str_old == _v2.str_old
   ==> _v1.out_i == _v2.out_i && _v1.out_hash == _v2.out_hash
}

axiom (forall _v1.in_i: int, 
    _v1.in_hash: int, 
    _v1.str_old: [int]int, 
    _v1.out_i: int, 
    _v1.out_hash: int, 
    _v2.in_i: int, 
    _v2.in_hash: int, 
    _v2.str_old: [int]int, 
    _v2.out_i: int, 
    _v2.out_hash: int :: 
  { R___v1.hash_loop_anon3_LoopHead(_v1.in_i, _v1.in_hash, _v1.str_old, _v1.out_i, _v1.out_hash), R___v2.hash_loop_anon4_LoopHead(_v2.in_i, _v2.in_hash, _v2.str_old, _v2.out_i, _v2.out_hash) } 
  R___v1.hash_loop_anon3_LoopHead(_v1.in_i, _v1.in_hash, _v1.str_old, _v1.out_i, _v1.out_hash)
       && R___v2.hash_loop_anon4_LoopHead(_v2.in_i, _v2.in_hash, _v2.str_old, _v2.out_i, _v2.out_hash)
     ==> MS$_v1.hash_loop_anon3_LoopHead$_v2.hash_loop_anon4_LoopHead(_v1.in_i, 
      _v1.in_hash, 
      _v1.str_old, 
      _v1.out_i, 
      _v1.out_hash, 
      _v2.in_i, 
      _v2.in_hash, 
      _v2.str_old, 
      _v2.out_i, 
      _v2.out_hash));

function {:inline true} MS_pre_$_v1.hash_loop_anon3_LoopHead$_v2.hash_loop_anon4_LoopHead(_v1.in_i: int, 
    _v1.in_hash: int, 
    _v1.str_old: [int]int, 
    _v2.in_i: int, 
    _v2.in_hash: int, 
    _v2.str_old: [int]int)
   : bool
{
 _v1.in_i == _v2.in_i && _v1.str_old == _v2.str_old 
}

procedure {:MS_procs "_v1.hash_loop_anon3_LoopHead", "_v2.hash_loop_anon4_LoopHead"} MS_Check__v1.hash_loop_anon3_LoopHead___v2.hash_loop_anon4_LoopHead(_v1.in_i: int, _v1.in_hash: int, _v2.in_i: int, _v2.in_hash: int)
   returns (_v1.out_i: int, _v1.out_hash: int, _v2.out_i: int, _v2.out_hash: int);
  requires MS_pre_$_v1.hash_loop_anon3_LoopHead$_v2.hash_loop_anon4_LoopHead(_v1.in_i, _v1.in_hash, _v1.str, _v2.in_i, _v2.in_hash, _v2.str);
  ensures MS$_v1.hash_loop_anon3_LoopHead$_v2.hash_loop_anon4_LoopHead(_v1.in_i, 
  _v1.in_hash, 
  old(_v1.str), 
  _v1.out_i, 
  _v1.out_hash, 
  _v2.in_i, 
  _v2.in_hash, 
  old(_v2.str), 
  _v2.out_i, 
  _v2.out_hash);



implementation MS_Check__v1.hash_loop_anon3_LoopHead___v2.hash_loop_anon4_LoopHead(_v1.in_i: int, _v1.in_hash: int, _v2.in_i: int, _v2.in_hash: int)
   returns (_v1.out_i: int, _v1.out_hash: int, _v2.out_i: int, _v2.out_hash: int)
{
  var inline$_v1.hash_loop_anon3_LoopHead$0$in_i: int;
  var inline$_v1.hash_loop_anon3_LoopHead$0$in_hash: int;
  var inline$_v1.hash_loop_anon3_LoopHead$0$out_i: int;
  var inline$_v1.hash_loop_anon3_LoopHead$0$out_hash: int;
  var inline$_v2.hash_loop_anon4_LoopHead$0$in_i: int;
  var inline$_v2.hash_loop_anon4_LoopHead$0$in_hash: int;
  var inline$_v2.hash_loop_anon4_LoopHead$0$out_i: int;
  var inline$_v2.hash_loop_anon4_LoopHead$0$out_hash: int;
  var inline$$_v1.hash_loop_anon3_LoopHead$0$in_i: int;
  var inline$$_v1.hash_loop_anon3_LoopHead$0$in_hash: int;
  var inline$$_v1.hash_loop_anon3_LoopHead$0$out_i: int;
  var inline$$_v1.hash_loop_anon3_LoopHead$0$out_hash: int;

  START:
    inline$_v1.hash_loop_anon3_LoopHead$0$in_i := _v1.in_i;
    inline$_v1.hash_loop_anon3_LoopHead$0$in_hash := _v1.in_hash;
    havoc inline$_v1.hash_loop_anon3_LoopHead$0$out_i, inline$_v1.hash_loop_anon3_LoopHead$0$out_hash;
    inline$_v1.hash_loop_anon3_LoopHead$0$out_i, inline$_v1.hash_loop_anon3_LoopHead$0$out_hash := inline$_v1.hash_loop_anon3_LoopHead$0$in_i, inline$_v1.hash_loop_anon3_LoopHead$0$in_hash;
    goto inline$_v1.hash_loop_anon3_LoopHead$0$anon3_LoopDone, inline$_v1.hash_loop_anon3_LoopHead$0$anon3_LoopBody;

  inline$_v1.hash_loop_anon3_LoopHead$0$anon3_LoopBody:
    assume {:partition} _v1.str[inline$_v1.hash_loop_anon3_LoopHead$0$out_i] != 0;
    inline$_v1.hash_loop_anon3_LoopHead$0$out_hash := inline$_v1.hash_loop_anon3_LoopHead$0$out_hash
   + _v1.str[inline$_v1.hash_loop_anon3_LoopHead$0$out_i];
    inline$_v1.hash_loop_anon3_LoopHead$0$out_i := inline$_v1.hash_loop_anon3_LoopHead$0$out_i + 1;
    goto inline$$_v1.hash_loop_anon3_LoopHead$0$Entry;

  inline$$_v1.hash_loop_anon3_LoopHead$0$Entry:
    inline$$_v1.hash_loop_anon3_LoopHead$0$in_i := inline$_v1.hash_loop_anon3_LoopHead$0$out_i;
    inline$$_v1.hash_loop_anon3_LoopHead$0$in_hash := inline$_v1.hash_loop_anon3_LoopHead$0$out_hash;
    havoc inline$$_v1.hash_loop_anon3_LoopHead$0$out_i, inline$$_v1.hash_loop_anon3_LoopHead$0$out_hash;
    goto inline$$_v1.hash_loop_anon3_LoopHead$0$entry;

  inline$$_v1.hash_loop_anon3_LoopHead$0$entry:
    inline$$_v1.hash_loop_anon3_LoopHead$0$out_i, inline$$_v1.hash_loop_anon3_LoopHead$0$out_hash := inline$$_v1.hash_loop_anon3_LoopHead$0$in_i, inline$$_v1.hash_loop_anon3_LoopHead$0$in_hash;
    goto inline$$_v1.hash_loop_anon3_LoopHead$0$anon3_LoopDone, inline$$_v1.hash_loop_anon3_LoopHead$0$anon3_LoopBody;

  inline$$_v1.hash_loop_anon3_LoopHead$0$anon3_LoopBody:
    assume {:partition} _v1.str[inline$$_v1.hash_loop_anon3_LoopHead$0$out_i] != 0;
    inline$$_v1.hash_loop_anon3_LoopHead$0$out_hash := inline$$_v1.hash_loop_anon3_LoopHead$0$out_hash
   + _v1.str[inline$$_v1.hash_loop_anon3_LoopHead$0$out_i];
    inline$$_v1.hash_loop_anon3_LoopHead$0$out_i := inline$$_v1.hash_loop_anon3_LoopHead$0$out_i + 1;
    call inline$$_v1.hash_loop_anon3_LoopHead$0$out_i, inline$$_v1.hash_loop_anon3_LoopHead$0$out_hash := _v1.hash_loop_anon3_LoopHead(inline$$_v1.hash_loop_anon3_LoopHead$0$out_i, inline$$_v1.hash_loop_anon3_LoopHead$0$out_hash);
    goto inline$$_v1.hash_loop_anon3_LoopHead$0$Return;

  inline$$_v1.hash_loop_anon3_LoopHead$0$anon3_LoopDone:
    assume {:partition} _v1.str[inline$$_v1.hash_loop_anon3_LoopHead$0$out_i] == 0;
    inline$$_v1.hash_loop_anon3_LoopHead$0$out_i, inline$$_v1.hash_loop_anon3_LoopHead$0$out_hash := inline$$_v1.hash_loop_anon3_LoopHead$0$in_i, inline$$_v1.hash_loop_anon3_LoopHead$0$in_hash;
    goto inline$$_v1.hash_loop_anon3_LoopHead$0$Return;

  inline$$_v1.hash_loop_anon3_LoopHead$0$Return:
    assume true;
    assume true;
    assume true;
    assume true;
    assume true;
    inline$_v1.hash_loop_anon3_LoopHead$0$out_i := inline$$_v1.hash_loop_anon3_LoopHead$0$out_i;
    inline$_v1.hash_loop_anon3_LoopHead$0$out_hash := inline$$_v1.hash_loop_anon3_LoopHead$0$out_hash;
    goto inline$_v1.hash_loop_anon3_LoopHead$0$anon3_LoopBody$1;

  inline$_v1.hash_loop_anon3_LoopHead$0$anon3_LoopBody$1:
    goto inline$_v1.hash_loop_anon3_LoopHead$0$Return;

  inline$_v1.hash_loop_anon3_LoopHead$0$Return:
    assume true;
    assume true;
    assume true;
    assume true;
    assume true;
    _v1.out_i := inline$_v1.hash_loop_anon3_LoopHead$0$out_i;
    _v1.out_hash := inline$_v1.hash_loop_anon3_LoopHead$0$out_hash;
    inline$_v2.hash_loop_anon4_LoopHead$0$in_i := _v2.in_i;
    inline$_v2.hash_loop_anon4_LoopHead$0$in_hash := _v2.in_hash;
    havoc inline$_v2.hash_loop_anon4_LoopHead$0$out_i, inline$_v2.hash_loop_anon4_LoopHead$0$out_hash;
    inline$_v2.hash_loop_anon4_LoopHead$0$out_i, inline$_v2.hash_loop_anon4_LoopHead$0$out_hash := inline$_v2.hash_loop_anon4_LoopHead$0$in_i, inline$_v2.hash_loop_anon4_LoopHead$0$in_hash;
    goto inline$_v2.hash_loop_anon4_LoopHead$0$anon4_LoopDone, inline$_v2.hash_loop_anon4_LoopHead$0$anon4_LoopBody;

  inline$_v2.hash_loop_anon4_LoopHead$0$anon4_LoopBody:
    assume {:partition} _v2.str[inline$_v2.hash_loop_anon4_LoopHead$0$out_i] != 0;
    inline$_v2.hash_loop_anon4_LoopHead$0$out_hash := inline$_v2.hash_loop_anon4_LoopHead$0$out_hash
   + _v2.str[inline$_v2.hash_loop_anon4_LoopHead$0$out_i];
    inline$_v2.hash_loop_anon4_LoopHead$0$out_i := inline$_v2.hash_loop_anon4_LoopHead$0$out_i + 1;
    goto inline$_v2.hash_loop_anon4_LoopHead$0$anon5_Then, inline$_v2.hash_loop_anon4_LoopHead$0$anon5_Else;

  inline$_v2.hash_loop_anon4_LoopHead$0$anon5_Else:
    assume {:partition} _v2.str[inline$_v2.hash_loop_anon4_LoopHead$0$out_i] != 0;
    inline$_v2.hash_loop_anon4_LoopHead$0$out_i := inline$_v2.hash_loop_anon4_LoopHead$0$out_i + 1;
    call inline$_v2.hash_loop_anon4_LoopHead$0$out_i, inline$_v2.hash_loop_anon4_LoopHead$0$out_hash := _v2.hash_loop_anon4_LoopHead(inline$_v2.hash_loop_anon4_LoopHead$0$out_i, inline$_v2.hash_loop_anon4_LoopHead$0$out_hash);
    goto inline$_v2.hash_loop_anon4_LoopHead$0$Return;

  inline$_v2.hash_loop_anon4_LoopHead$0$Return:
    assume true;
    assume true;
    assume true;
    assume true;
    assume true;
    assume true;
    _v2.out_i := inline$_v2.hash_loop_anon4_LoopHead$0$out_i;
    _v2.out_hash := inline$_v2.hash_loop_anon4_LoopHead$0$out_hash;
    return;

  inline$_v2.hash_loop_anon4_LoopHead$0$anon5_Then:
    assume {:partition} _v2.str[inline$_v2.hash_loop_anon4_LoopHead$0$out_i] == 0;
    inline$_v2.hash_loop_anon4_LoopHead$0$out_i, inline$_v2.hash_loop_anon4_LoopHead$0$out_hash := inline$_v2.hash_loop_anon4_LoopHead$0$in_i, inline$_v2.hash_loop_anon4_LoopHead$0$in_hash;
    goto inline$_v2.hash_loop_anon4_LoopHead$0$Return;

  inline$_v2.hash_loop_anon4_LoopHead$0$anon4_LoopDone:
    assume {:partition} _v2.str[inline$_v2.hash_loop_anon4_LoopHead$0$out_i] == 0;
    inline$_v2.hash_loop_anon4_LoopHead$0$out_i, inline$_v2.hash_loop_anon4_LoopHead$0$out_hash := inline$_v2.hash_loop_anon4_LoopHead$0$in_i, inline$_v2.hash_loop_anon4_LoopHead$0$in_hash;
    goto inline$_v2.hash_loop_anon4_LoopHead$0$Return;

  inline$_v1.hash_loop_anon3_LoopHead$0$anon3_LoopDone:
    assume {:partition} _v1.str[inline$_v1.hash_loop_anon3_LoopHead$0$out_i] == 0;
    inline$_v1.hash_loop_anon3_LoopHead$0$out_i, inline$_v1.hash_loop_anon3_LoopHead$0$out_hash := inline$_v1.hash_loop_anon3_LoopHead$0$in_i, inline$_v1.hash_loop_anon3_LoopHead$0$in_hash;
    goto inline$_v1.hash_loop_anon3_LoopHead$0$Return;
}



function {:inline true} RT_cond_$_v1.hash_loop_anon3_LoopHead$_v2.hash_loop_anon4_LoopHead(_v1.in_i: int, 
    _v1.in_hash: int, 
    _v1.str_old: [int]int, 
    _v2.in_i: int, 
    _v2.in_hash: int, 
    _v2.str_old: [int]int)
   : bool
{
  MS_pre_$_v1.hash_loop_anon3_LoopHead$_v2.hash_loop_anon4_LoopHead(_v1.in_i, _v1.in_hash, _v1.str_old, _v2.in_i, _v2.in_hash, _v2.str_old)
}

axiom (forall _v1.in_i: int, 
    _v1.in_hash: int, 
    _v1.str_old: [int]int, 
    _v1.out_i: int, 
    _v1.out_hash: int, 
    _v2.in_i: int, 
    _v2.in_hash: int, 
    _v2.str_old: [int]int :: 
  { R___v1.hash_loop_anon3_LoopHead(_v1.in_i, _v1.in_hash, _v1.str_old, _v1.out_i, _v1.out_hash), R'___v2.hash_loop_anon4_LoopHead(_v2.in_i, _v2.in_hash, _v2.str_old) } 
  RT_cond_$_v1.hash_loop_anon3_LoopHead$_v2.hash_loop_anon4_LoopHead(_v1.in_i, _v1.in_hash, _v1.str_old, _v2.in_i, _v2.in_hash, _v2.str_old)
       && R___v1.hash_loop_anon3_LoopHead(_v1.in_i, _v1.in_hash, _v1.str_old, _v1.out_i, _v1.out_hash)
     ==> R'___v2.hash_loop_anon4_LoopHead(_v2.in_i, _v2.in_hash, _v2.str_old));

procedure RT_Check__v1.hash_loop_anon3_LoopHead___v2.hash_loop_anon4_LoopHead(_v1.in_i: int, _v1.in_hash: int, _v2.in_i: int, _v2.in_hash: int)
   returns (_v1.out_i: int, _v1.out_hash: int, _v2.out_i: int, _v2.out_hash: int);
  requires RT_cond_$_v1.hash_loop_anon3_LoopHead$_v2.hash_loop_anon4_LoopHead(_v1.in_i, _v1.in_hash, _v1.str, _v2.in_i, _v2.in_hash, _v2.str);



implementation RT_Check__v1.hash_loop_anon3_LoopHead___v2.hash_loop_anon4_LoopHead(_v1.in_i: int, _v1.in_hash: int, _v2.in_i: int, _v2.in_hash: int)
   returns (_v1.out_i: int, _v1.out_hash: int, _v2.out_i: int, _v2.out_hash: int)
{
  var inline$_v1.hash_loop_anon3_LoopHead$0$in_i: int;
  var inline$_v1.hash_loop_anon3_LoopHead$0$in_hash: int;
  var inline$_v1.hash_loop_anon3_LoopHead$0$out_i: int;
  var inline$_v1.hash_loop_anon3_LoopHead$0$out_hash: int;
  var inline$_v2.hash_loop_anon4_LoopHead$0$in_i: int;
  var inline$_v2.hash_loop_anon4_LoopHead$0$in_hash: int;
  var inline$_v2.hash_loop_anon4_LoopHead$0$out_i: int;
  var inline$_v2.hash_loop_anon4_LoopHead$0$out_hash: int;
  var inline$$_v1.hash_loop_anon3_LoopHead$0$in_i: int;
  var inline$$_v1.hash_loop_anon3_LoopHead$0$in_hash: int;
  var inline$$_v1.hash_loop_anon3_LoopHead$0$out_i: int;
  var inline$$_v1.hash_loop_anon3_LoopHead$0$out_hash: int;

  START:
    inline$_v1.hash_loop_anon3_LoopHead$0$in_i := _v1.in_i;
    inline$_v1.hash_loop_anon3_LoopHead$0$in_hash := _v1.in_hash;
    havoc inline$_v1.hash_loop_anon3_LoopHead$0$out_i, inline$_v1.hash_loop_anon3_LoopHead$0$out_hash;
    inline$_v1.hash_loop_anon3_LoopHead$0$out_i, inline$_v1.hash_loop_anon3_LoopHead$0$out_hash := inline$_v1.hash_loop_anon3_LoopHead$0$in_i, inline$_v1.hash_loop_anon3_LoopHead$0$in_hash;
    goto inline$_v1.hash_loop_anon3_LoopHead$0$anon3_LoopDone, inline$_v1.hash_loop_anon3_LoopHead$0$anon3_LoopBody;

  inline$_v1.hash_loop_anon3_LoopHead$0$anon3_LoopBody:
    assume {:partition} _v1.str[inline$_v1.hash_loop_anon3_LoopHead$0$out_i] != 0;
    inline$_v1.hash_loop_anon3_LoopHead$0$out_hash := inline$_v1.hash_loop_anon3_LoopHead$0$out_hash
   + _v1.str[inline$_v1.hash_loop_anon3_LoopHead$0$out_i];
    inline$_v1.hash_loop_anon3_LoopHead$0$out_i := inline$_v1.hash_loop_anon3_LoopHead$0$out_i + 1;
    goto inline$$_v1.hash_loop_anon3_LoopHead$0$Entry;

  inline$$_v1.hash_loop_anon3_LoopHead$0$Entry:
    inline$$_v1.hash_loop_anon3_LoopHead$0$in_i := inline$_v1.hash_loop_anon3_LoopHead$0$out_i;
    inline$$_v1.hash_loop_anon3_LoopHead$0$in_hash := inline$_v1.hash_loop_anon3_LoopHead$0$out_hash;
    havoc inline$$_v1.hash_loop_anon3_LoopHead$0$out_i, inline$$_v1.hash_loop_anon3_LoopHead$0$out_hash;
    goto inline$$_v1.hash_loop_anon3_LoopHead$0$entry;

  inline$$_v1.hash_loop_anon3_LoopHead$0$entry:
    inline$$_v1.hash_loop_anon3_LoopHead$0$out_i, inline$$_v1.hash_loop_anon3_LoopHead$0$out_hash := inline$$_v1.hash_loop_anon3_LoopHead$0$in_i, inline$$_v1.hash_loop_anon3_LoopHead$0$in_hash;
    goto inline$$_v1.hash_loop_anon3_LoopHead$0$anon3_LoopDone, inline$$_v1.hash_loop_anon3_LoopHead$0$anon3_LoopBody;

  inline$$_v1.hash_loop_anon3_LoopHead$0$anon3_LoopBody:
    assume {:partition} _v1.str[inline$$_v1.hash_loop_anon3_LoopHead$0$out_i] != 0;
    inline$$_v1.hash_loop_anon3_LoopHead$0$out_hash := inline$$_v1.hash_loop_anon3_LoopHead$0$out_hash
   + _v1.str[inline$$_v1.hash_loop_anon3_LoopHead$0$out_i];
    inline$$_v1.hash_loop_anon3_LoopHead$0$out_i := inline$$_v1.hash_loop_anon3_LoopHead$0$out_i + 1;
    call inline$$_v1.hash_loop_anon3_LoopHead$0$out_i, inline$$_v1.hash_loop_anon3_LoopHead$0$out_hash := _v1.hash_loop_anon3_LoopHead(inline$$_v1.hash_loop_anon3_LoopHead$0$out_i, inline$$_v1.hash_loop_anon3_LoopHead$0$out_hash);
    goto inline$$_v1.hash_loop_anon3_LoopHead$0$Return;

  inline$$_v1.hash_loop_anon3_LoopHead$0$anon3_LoopDone:
    assume {:partition} _v1.str[inline$$_v1.hash_loop_anon3_LoopHead$0$out_i] == 0;
    inline$$_v1.hash_loop_anon3_LoopHead$0$out_i, inline$$_v1.hash_loop_anon3_LoopHead$0$out_hash := inline$$_v1.hash_loop_anon3_LoopHead$0$in_i, inline$$_v1.hash_loop_anon3_LoopHead$0$in_hash;
    goto inline$$_v1.hash_loop_anon3_LoopHead$0$Return;

  inline$$_v1.hash_loop_anon3_LoopHead$0$Return:
    assume true;
    assume true;
    assume true;
    assume true;
    assume true;
    inline$_v1.hash_loop_anon3_LoopHead$0$out_i := inline$$_v1.hash_loop_anon3_LoopHead$0$out_i;
    inline$_v1.hash_loop_anon3_LoopHead$0$out_hash := inline$$_v1.hash_loop_anon3_LoopHead$0$out_hash;
    goto inline$_v1.hash_loop_anon3_LoopHead$0$anon3_LoopBody$1;

  inline$_v1.hash_loop_anon3_LoopHead$0$anon3_LoopBody$1:
    goto inline$_v1.hash_loop_anon3_LoopHead$0$Return;

  inline$_v1.hash_loop_anon3_LoopHead$0$Return:
    assume true;
    assume true;
    assume true;
    assume true;
    assume true;
    _v1.out_i := inline$_v1.hash_loop_anon3_LoopHead$0$out_i;
    _v1.out_hash := inline$_v1.hash_loop_anon3_LoopHead$0$out_hash;
    inline$_v2.hash_loop_anon4_LoopHead$0$in_i := _v2.in_i;
    inline$_v2.hash_loop_anon4_LoopHead$0$in_hash := _v2.in_hash;
    havoc inline$_v2.hash_loop_anon4_LoopHead$0$out_i, inline$_v2.hash_loop_anon4_LoopHead$0$out_hash;
    inline$_v2.hash_loop_anon4_LoopHead$0$out_i, inline$_v2.hash_loop_anon4_LoopHead$0$out_hash := inline$_v2.hash_loop_anon4_LoopHead$0$in_i, inline$_v2.hash_loop_anon4_LoopHead$0$in_hash;
    goto inline$_v2.hash_loop_anon4_LoopHead$0$anon4_LoopDone, inline$_v2.hash_loop_anon4_LoopHead$0$anon4_LoopBody;

  inline$_v2.hash_loop_anon4_LoopHead$0$anon4_LoopBody:
    assume {:partition} _v2.str[inline$_v2.hash_loop_anon4_LoopHead$0$out_i] != 0;
    inline$_v2.hash_loop_anon4_LoopHead$0$out_hash := inline$_v2.hash_loop_anon4_LoopHead$0$out_hash
   + _v2.str[inline$_v2.hash_loop_anon4_LoopHead$0$out_i];
    inline$_v2.hash_loop_anon4_LoopHead$0$out_i := inline$_v2.hash_loop_anon4_LoopHead$0$out_i + 1;
    goto inline$_v2.hash_loop_anon4_LoopHead$0$anon5_Then, inline$_v2.hash_loop_anon4_LoopHead$0$anon5_Else;

  inline$_v2.hash_loop_anon4_LoopHead$0$anon5_Else:
    assume {:partition} _v2.str[inline$_v2.hash_loop_anon4_LoopHead$0$out_i] != 0;
    inline$_v2.hash_loop_anon4_LoopHead$0$out_i := inline$_v2.hash_loop_anon4_LoopHead$0$out_i + 1;
    assert R'___v2.hash_loop_anon4_LoopHead(inline$_v2.hash_loop_anon4_LoopHead$0$out_i, 
  inline$_v2.hash_loop_anon4_LoopHead$0$out_hash, 
  _v2.str);
    call inline$_v2.hash_loop_anon4_LoopHead$0$out_i, inline$_v2.hash_loop_anon4_LoopHead$0$out_hash := _v2.hash_loop_anon4_LoopHead(inline$_v2.hash_loop_anon4_LoopHead$0$out_i, inline$_v2.hash_loop_anon4_LoopHead$0$out_hash);
    goto inline$_v2.hash_loop_anon4_LoopHead$0$Return;

  inline$_v2.hash_loop_anon4_LoopHead$0$Return:
    assume true;
    assume true;
    assume true;
    assume true;
    assume true;
    assume true;
    _v2.out_i := inline$_v2.hash_loop_anon4_LoopHead$0$out_i;
    _v2.out_hash := inline$_v2.hash_loop_anon4_LoopHead$0$out_hash;
    return;

  inline$_v2.hash_loop_anon4_LoopHead$0$anon5_Then:
    assume {:partition} _v2.str[inline$_v2.hash_loop_anon4_LoopHead$0$out_i] == 0;
    inline$_v2.hash_loop_anon4_LoopHead$0$out_i, inline$_v2.hash_loop_anon4_LoopHead$0$out_hash := inline$_v2.hash_loop_anon4_LoopHead$0$in_i, inline$_v2.hash_loop_anon4_LoopHead$0$in_hash;
    goto inline$_v2.hash_loop_anon4_LoopHead$0$Return;

  inline$_v2.hash_loop_anon4_LoopHead$0$anon4_LoopDone:
    assume {:partition} _v2.str[inline$_v2.hash_loop_anon4_LoopHead$0$out_i] == 0;
    inline$_v2.hash_loop_anon4_LoopHead$0$out_i, inline$_v2.hash_loop_anon4_LoopHead$0$out_hash := inline$_v2.hash_loop_anon4_LoopHead$0$in_i, inline$_v2.hash_loop_anon4_LoopHead$0$in_hash;
    goto inline$_v2.hash_loop_anon4_LoopHead$0$Return;

  inline$_v1.hash_loop_anon3_LoopHead$0$anon3_LoopDone:
    assume {:partition} _v1.str[inline$_v1.hash_loop_anon3_LoopHead$0$out_i] == 0;
    inline$_v1.hash_loop_anon3_LoopHead$0$out_i, inline$_v1.hash_loop_anon3_LoopHead$0$out_hash := inline$_v1.hash_loop_anon3_LoopHead$0$in_i, inline$_v1.hash_loop_anon3_LoopHead$0$in_hash;
    goto inline$_v1.hash_loop_anon3_LoopHead$0$Return;
}



