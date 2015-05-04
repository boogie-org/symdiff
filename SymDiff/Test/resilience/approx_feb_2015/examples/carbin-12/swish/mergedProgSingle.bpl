function {:inline true} _v2.RelaxedEq(x: int, y: int) : bool
{
  (x <= 10 && x == y) || (x > 10 && y >= 10)
}

procedure _v2.swish(max_r: int, N: int) returns (num_r: int);
  free ensures {:io_dependency "num_r", "N"} true;
  free ensures {:io_dependency "num_r", "N"} true;
  free ensures _v2.OK ==> old(_v2.OK);



procedure _v2.swish_loop_anon3_LoopHead(in_N: int, in_num_r: int, in_max_r: int) returns (out_num_r: int);
  free ensures {:io_dependency "out_num_r", "in_num_r", "in_max_r", "in_N"} true;
  free ensures {:io_dependency "out_num_r", "in_num_r", "in_max_r", "in_N"} true;
  free ensures _v2.OK ==> old(_v2.OK);
  ensures _houdini_12 ==> in_num_r <= out_num_r;
  ensures _houdini_13 ==> out_num_r <= in_num_r;



implementation _v2.swish(max_r_1: int, N: int) returns (num_r: int)
{
  var max_r: int;

  anon0:
    max_r := max_r_1;
    havoc max_r;
    assume _v2.RelaxedEq(max_r_1, max_r);
    num_r := 0;
    goto anon3_LoopHead;

  anon3_LoopHead:
    call num_r := _v2.swish_loop_anon3_LoopHead(N, num_r, max_r);
    goto anon3_LoopHead_last;

  anon3_LoopHead_last:
    goto anon3_LoopDone, anon3_LoopBody;

  anon3_LoopBody:
    assume {:partition} num_r < max_r && num_r < N;
    num_r := num_r + 1;
    goto anon3_LoopBody_dummy;

  anon3_LoopBody_dummy:
    assume false;
    return;

  anon3_LoopDone:
    assume {:partition} !(num_r < max_r && num_r < N);
    goto anon2;

  anon2:
    return;
}



implementation _v2.swish_loop_anon3_LoopHead(in_N: int, in_num_r: int, in_max_r: int) returns (out_num_r: int)
{

  entry:
    out_num_r := in_num_r;
    goto anon3_LoopHead;

  anon3_LoopHead:
    goto anon3_LoopDone, anon3_LoopBody;

  anon3_LoopBody:
    assume {:partition} out_num_r < in_max_r && out_num_r < in_N;
    out_num_r := out_num_r + 1;
    goto anon3_LoopBody_dummy;

  anon3_LoopBody_dummy:
    call out_num_r := _v2.swish_loop_anon3_LoopHead(in_N, out_num_r, in_max_r);
    return;

  anon3_LoopDone:
    assume {:partition} !(out_num_r < in_max_r && out_num_r < in_N);
    out_num_r := in_num_r;
    return;
}



var _v2.OK: bool;

procedure _v1.swish(max_r: int, N: int) returns (num_r: int);
  free ensures {:io_dependency "num_r", "max_r", "N"} true;
  free ensures {:io_dependency "num_r", "max_r", "N"} true;
  free ensures _v1.OK ==> old(_v1.OK);



procedure _v1.swish_loop_anon3_LoopHead(in_N: int, in_num_r: int, in_max_r: int) returns (out_num_r: int);
  free ensures {:io_dependency "out_num_r", "in_num_r", "in_max_r", "in_N"} true;
  free ensures {:io_dependency "out_num_r", "in_num_r", "in_max_r", "in_N"} true;
  free ensures _v1.OK ==> old(_v1.OK);
  ensures _houdini_10 ==> in_num_r <= out_num_r;
  ensures _houdini_11 ==> out_num_r <= in_num_r;



implementation _v1.swish(max_r_1: int, N: int) returns (num_r: int)
{
  var max_r: int;

  anon0:
    max_r := max_r_1;
    num_r := 0;
    goto anon3_LoopHead;

  anon3_LoopHead:
    call num_r := _v1.swish_loop_anon3_LoopHead(N, num_r, max_r);
    goto anon3_LoopHead_last;

  anon3_LoopHead_last:
    goto anon3_LoopDone, anon3_LoopBody;

  anon3_LoopBody:
    assume {:partition} num_r < max_r && num_r < N;
    num_r := num_r + 1;
    goto anon3_LoopBody_dummy;

  anon3_LoopBody_dummy:
    assume false;
    return;

  anon3_LoopDone:
    assume {:partition} !(num_r < max_r && num_r < N);
    goto anon2;

  anon2:
    return;
}



implementation _v1.swish_loop_anon3_LoopHead(in_N: int, in_num_r: int, in_max_r: int) returns (out_num_r: int)
{

  entry:
    out_num_r := in_num_r;
    goto anon3_LoopHead;

  anon3_LoopHead:
    goto anon3_LoopDone, anon3_LoopBody;

  anon3_LoopBody:
    assume {:partition} out_num_r < in_max_r && out_num_r < in_N;
    out_num_r := out_num_r + 1;
    goto anon3_LoopBody_dummy;

  anon3_LoopBody_dummy:
    call out_num_r := _v1.swish_loop_anon3_LoopHead(in_N, out_num_r, in_max_r);
    return;

  anon3_LoopDone:
    assume {:partition} !(out_num_r < in_max_r && out_num_r < in_N);
    out_num_r := in_num_r;
    return;
}



var _v1.OK: bool;

function {:inline true} MS$_v1.swish$_v2.swish(_v1.max_r: int, 
    _v1.N: int, 
    _v1.OK_old: bool, 
    _v1.num_r: int, 
    _v2.max_r: int, 
    _v2.N: int, 
    _v2.OK_old: bool, 
    _v2.num_r: int)
   : bool
{
  _v2.RelaxedEq(_v1.num_r, _v2.num_r)
}

const {:existential true} __my_houdini_0: bool;

const {:existential true} __my_houdini_1: bool;

function {:inline true} MS_pre_$_v1.swish_loop_anon3_LoopHead$_v2.swish_loop_anon3_LoopHead(_v1.in_N: int, 
    _v1.in_num_r: int, 
    _v1.in_max_r: int, 
    _v1.OK_old: bool, 
    _v2.in_N: int, 
    _v2.in_num_r: int, 
    _v2.in_max_r: int, 
    _v2.OK_old: bool)
   : bool
{
  __my_houdini_0 ==> _v2.RelaxedEq(_v1.in_max_r, _v2.in_max_r)
}

function {:inline true} MS$_v1.swish_loop_anon3_LoopHead$_v2.swish_loop_anon3_LoopHead(_v1.in_N: int, 
    _v1.in_num_r: int, 
    _v1.in_max_r: int, 
    _v1.OK_old: bool, 
    _v1.out_num_r: int, 
    _v2.in_N: int, 
    _v2.in_num_r: int, 
    _v2.in_max_r: int, 
    _v2.OK_old: bool, 
    _v2.out_num_r: int)
   : bool
{
  __my_houdini_1 ==> _v2.RelaxedEq(_v1.out_num_r, _v2.out_num_r)
}

function {:inline true} MS_pre_$_v1.swish$_v2.swish(_v1.max_r: int, 
    _v1.N: int, 
    _v1.OK_old: bool, 
    _v2.max_r: int, 
    _v2.N: int, 
    _v2.OK_old: bool)
   : bool
{
  true
}

procedure MS_Check__v1.swish___v2.swish(_v1.max_r: int, _v1.N: int, _v2.max_r: int, _v2.N: int)
   returns (_v1.num_r: int, _v2.num_r: int);
  requires MS_pre_$_v1.swish$_v2.swish(_v1.max_r, _v1.N, _v1.OK, _v2.max_r, _v2.N, _v2.OK);
  requires _v1.max_r == _v2.max_r && _v1.N == _v2.N && (_v1.OK <==> _v2.OK);
  ensures MS$_v1.swish$_v2.swish(_v1.max_r, 
  _v1.N, 
  old(_v1.OK), 
  _v1.num_r, 
  _v2.max_r, 
  _v2.N, 
  old(_v2.OK), 
  _v2.num_r);
  ensures _v1.OK ==> _v2.OK;



implementation MS_Check__v1.swish___v2.swish(_v1.max_r: int, _v1.N: int, _v2.max_r: int, _v2.N: int)
   returns (_v1.num_r: int, _v2.num_r: int)
{
  var inline$_v1.swish$0$max_r: int;
  var inline$_v1.swish$0$max_r_1: int;
  var inline$_v1.swish$0$N: int;
  var inline$_v1.swish$0$num_r: int;
  var inline$_v2.swish$0$max_r: int;
  var inline$_v2.swish$0$max_r_1: int;
  var inline$_v2.swish$0$N: int;
  var inline$_v2.swish$0$num_r: int;
  var _v1.swish_loop_anon3_LoopHead_1_done: bool;
  var _v1.swish_loop_anon3_LoopHead_in_1_0: int;
  var _v1.swish_loop_anon3_LoopHead_in_1_1: int;
  var _v1.swish_loop_anon3_LoopHead_in_1_2: int;
  var _v1.swish_loop_anon3_LoopHead_out_1_0: int;
  var _v2.swish_loop_anon3_LoopHead_2_done: bool;
  var _v2.swish_loop_anon3_LoopHead_in_2_0: int;
  var _v2.swish_loop_anon3_LoopHead_in_2_1: int;
  var _v2.swish_loop_anon3_LoopHead_in_2_2: int;
  var _v2.swish_loop_anon3_LoopHead_out_2_0: int;
  var out__v1.swish_loop_anon3_LoopHead_out_1_0_0: int;
  var out__v2.swish_loop_anon3_LoopHead_out_2_0_0: int;

  START:
    _v1.swish_loop_anon3_LoopHead_1_done, _v2.swish_loop_anon3_LoopHead_2_done := false, false;
    goto inline$_v1.swish$0$Entry;

  inline$_v1.swish$0$Entry:
    inline$_v1.swish$0$max_r_1 := _v1.max_r;
    inline$_v1.swish$0$N := _v1.N;
    havoc inline$_v1.swish$0$max_r, inline$_v1.swish$0$num_r;
    goto inline$_v1.swish$0$anon0;

  inline$_v1.swish$0$anon0:
    inline$_v1.swish$0$max_r := inline$_v1.swish$0$max_r_1;
    inline$_v1.swish$0$num_r := 0;
    goto inline$_v1.swish$0$anon3_LoopHead;

  inline$_v1.swish$0$anon3_LoopHead:
    _v1.swish_loop_anon3_LoopHead_in_1_0, _v1.swish_loop_anon3_LoopHead_in_1_1, _v1.swish_loop_anon3_LoopHead_in_1_2 := inline$_v1.swish$0$N, inline$_v1.swish$0$num_r, inline$_v1.swish$0$max_r;
    call inline$_v1.swish$0$num_r := _v1.swish_loop_anon3_LoopHead(inline$_v1.swish$0$N, inline$_v1.swish$0$num_r, inline$_v1.swish$0$max_r);
    _v1.swish_loop_anon3_LoopHead_1_done := true;
    _v1.swish_loop_anon3_LoopHead_out_1_0 := inline$_v1.swish$0$num_r;
    goto inline$_v1.swish$0$anon3_LoopHead_last;

  inline$_v1.swish$0$anon3_LoopHead_last:
    goto inline$_v1.swish$0$anon3_LoopDone, inline$_v1.swish$0$anon3_LoopBody;

  inline$_v1.swish$0$anon3_LoopBody:
    assume {:partition} inline$_v1.swish$0$num_r < inline$_v1.swish$0$max_r
   && inline$_v1.swish$0$num_r < inline$_v1.swish$0$N;
    inline$_v1.swish$0$num_r := inline$_v1.swish$0$num_r + 1;
    goto inline$_v1.swish$0$anon3_LoopBody_dummy;

  inline$_v1.swish$0$anon3_LoopBody_dummy:
    assume false;
    goto inline$_v1.swish$0$Return;

  inline$_v1.swish$0$anon3_LoopDone:
    assume {:partition} !(inline$_v1.swish$0$num_r < inline$_v1.swish$0$max_r
   && inline$_v1.swish$0$num_r < inline$_v1.swish$0$N);
    goto inline$_v1.swish$0$anon2;

  inline$_v1.swish$0$anon2:
    goto inline$_v1.swish$0$Return;

  inline$_v1.swish$0$Return:
    assume true;
    assume true;
    assume true;
    _v1.num_r := inline$_v1.swish$0$num_r;
    goto START$1;

  START$1:
    goto inline$_v2.swish$0$Entry;

  inline$_v2.swish$0$Entry:
    inline$_v2.swish$0$max_r_1 := _v2.max_r;
    inline$_v2.swish$0$N := _v2.N;
    havoc inline$_v2.swish$0$max_r, inline$_v2.swish$0$num_r;
    goto inline$_v2.swish$0$anon0;

  inline$_v2.swish$0$anon0:
    inline$_v2.swish$0$max_r := inline$_v2.swish$0$max_r_1;
    havoc inline$_v2.swish$0$max_r;
    assume _v2.RelaxedEq(inline$_v2.swish$0$max_r_1, inline$_v2.swish$0$max_r);
    inline$_v2.swish$0$num_r := 0;
    goto inline$_v2.swish$0$anon3_LoopHead;

  inline$_v2.swish$0$anon3_LoopHead:
    _v2.swish_loop_anon3_LoopHead_in_2_0, _v2.swish_loop_anon3_LoopHead_in_2_1, _v2.swish_loop_anon3_LoopHead_in_2_2 := inline$_v2.swish$0$N, inline$_v2.swish$0$num_r, inline$_v2.swish$0$max_r;
    call inline$_v2.swish$0$num_r := _v2.swish_loop_anon3_LoopHead(inline$_v2.swish$0$N, inline$_v2.swish$0$num_r, inline$_v2.swish$0$max_r);
    _v2.swish_loop_anon3_LoopHead_2_done := true;
    _v2.swish_loop_anon3_LoopHead_out_2_0 := inline$_v2.swish$0$num_r;
    goto inline$_v2.swish$0$anon3_LoopHead_last;

  inline$_v2.swish$0$anon3_LoopHead_last:
    goto inline$_v2.swish$0$anon3_LoopDone, inline$_v2.swish$0$anon3_LoopBody;

  inline$_v2.swish$0$anon3_LoopBody:
    assume {:partition} inline$_v2.swish$0$num_r < inline$_v2.swish$0$max_r
   && inline$_v2.swish$0$num_r < inline$_v2.swish$0$N;
    inline$_v2.swish$0$num_r := inline$_v2.swish$0$num_r + 1;
    goto inline$_v2.swish$0$anon3_LoopBody_dummy;

  inline$_v2.swish$0$anon3_LoopBody_dummy:
    assume false;
    goto inline$_v2.swish$0$Return;

  inline$_v2.swish$0$anon3_LoopDone:
    assume {:partition} !(inline$_v2.swish$0$num_r < inline$_v2.swish$0$max_r
   && inline$_v2.swish$0$num_r < inline$_v2.swish$0$N);
    goto inline$_v2.swish$0$anon2;

  inline$_v2.swish$0$anon2:
    goto inline$_v2.swish$0$Return;

  inline$_v2.swish$0$Return:
    assume true;
    assume true;
    assume true;
    _v2.num_r := inline$_v2.swish$0$num_r;
    goto START$2;

  START$2:
    goto MS_L_0_0;

  MS_L_0_0:
    goto MS_L_taken_0, MS_L_not_taken_0;

  MS_L_taken_0:
    assume _v1.swish_loop_anon3_LoopHead_1_done && _v2.swish_loop_anon3_LoopHead_2_done;
    call out__v1.swish_loop_anon3_LoopHead_out_1_0_0, out__v2.swish_loop_anon3_LoopHead_out_2_0_0 := MS_Check__v1.swish_loop_anon3_LoopHead___v2.swish_loop_anon3_LoopHead(_v1.swish_loop_anon3_LoopHead_in_1_0, _v1.swish_loop_anon3_LoopHead_in_1_1, _v1.swish_loop_anon3_LoopHead_in_1_2, _v2.swish_loop_anon3_LoopHead_in_2_0, _v2.swish_loop_anon3_LoopHead_in_2_1, _v2.swish_loop_anon3_LoopHead_in_2_2);
    assume true;
    assume true;
    assume _v1.swish_loop_anon3_LoopHead_out_1_0
     == out__v1.swish_loop_anon3_LoopHead_out_1_0_0
   && _v2.swish_loop_anon3_LoopHead_out_2_0
     == out__v2.swish_loop_anon3_LoopHead_out_2_0_0;
    goto MS_L_meet_0;

  MS_L_not_taken_0:
    assume !(_v1.swish_loop_anon3_LoopHead_1_done && _v2.swish_loop_anon3_LoopHead_2_done);
    goto MS_L_meet_0;

  MS_L_meet_0:
    return;
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

procedure MS_Check__v1.swish_loop_anon3_LoopHead___v2.swish_loop_anon3_LoopHead(_v1.in_N: int, 
    _v1.in_num_r: int, 
    _v1.in_max_r: int, 
    _v2.in_N: int, 
    _v2.in_num_r: int, 
    _v2.in_max_r: int)
   returns (_v1.out_num_r: int, _v2.out_num_r: int);
  requires MS_pre_$_v1.swish_loop_anon3_LoopHead$_v2.swish_loop_anon3_LoopHead(_v1.in_N, 
  _v1.in_num_r, 
  _v1.in_max_r, 
  _v1.OK, 
  _v2.in_N, 
  _v2.in_num_r, 
  _v2.in_max_r, 
  _v2.OK);
  requires _houdini_2 ==> _v1.in_N <= _v2.in_N;
  requires _houdini_3 ==> _v2.in_N <= _v1.in_N;
  requires _houdini_4 ==> _v1.in_num_r <= _v2.in_num_r;
  requires _houdini_5 ==> _v2.in_num_r <= _v1.in_num_r;
  requires _houdini_6 ==> _v1.in_max_r <= _v2.in_max_r;
  requires _houdini_7 ==> _v2.in_max_r <= _v1.in_max_r;
  requires _houdini_8 ==> _v1.OK ==> _v2.OK;
  requires _houdini_9 ==> _v2.OK ==> _v1.OK;
  ensures MS$_v1.swish_loop_anon3_LoopHead$_v2.swish_loop_anon3_LoopHead(_v1.in_N, 
  _v1.in_num_r, 
  _v1.in_max_r, 
  old(_v1.OK), 
  _v1.out_num_r, 
  _v2.in_N, 
  _v2.in_num_r, 
  _v2.in_max_r, 
  old(_v2.OK), 
  _v2.out_num_r);
  ensures _houdini_0 ==> _v1.out_num_r <= _v2.out_num_r;
  ensures _houdini_1 ==> _v2.out_num_r <= _v1.out_num_r;



implementation MS_Check__v1.swish_loop_anon3_LoopHead___v2.swish_loop_anon3_LoopHead(_v1.in_N: int, 
    _v1.in_num_r: int, 
    _v1.in_max_r: int, 
    _v2.in_N: int, 
    _v2.in_num_r: int, 
    _v2.in_max_r: int)
   returns (_v1.out_num_r: int, _v2.out_num_r: int)
{
  var inline$_v1.swish_loop_anon3_LoopHead$0$in_N: int;
  var inline$_v1.swish_loop_anon3_LoopHead$0$in_num_r: int;
  var inline$_v1.swish_loop_anon3_LoopHead$0$in_max_r: int;
  var inline$_v1.swish_loop_anon3_LoopHead$0$out_num_r: int;
  var inline$_v2.swish_loop_anon3_LoopHead$0$in_N: int;
  var inline$_v2.swish_loop_anon3_LoopHead$0$in_num_r: int;
  var inline$_v2.swish_loop_anon3_LoopHead$0$in_max_r: int;
  var inline$_v2.swish_loop_anon3_LoopHead$0$out_num_r: int;
  var _v1.swish_loop_anon3_LoopHead_1_done: bool;
  var _v1.swish_loop_anon3_LoopHead_in_1_0: int;
  var _v1.swish_loop_anon3_LoopHead_in_1_1: int;
  var _v1.swish_loop_anon3_LoopHead_in_1_2: int;
  var _v1.swish_loop_anon3_LoopHead_out_1_0: int;
  var _v2.swish_loop_anon3_LoopHead_2_done: bool;
  var _v2.swish_loop_anon3_LoopHead_in_2_0: int;
  var _v2.swish_loop_anon3_LoopHead_in_2_1: int;
  var _v2.swish_loop_anon3_LoopHead_in_2_2: int;
  var _v2.swish_loop_anon3_LoopHead_out_2_0: int;
  var out__v1.swish_loop_anon3_LoopHead_out_1_0_0: int;
  var out__v2.swish_loop_anon3_LoopHead_out_2_0_0: int;

  START:
    _v1.swish_loop_anon3_LoopHead_1_done, _v2.swish_loop_anon3_LoopHead_2_done := false, false;
    goto inline$_v1.swish_loop_anon3_LoopHead$0$Entry;

  inline$_v1.swish_loop_anon3_LoopHead$0$Entry:
    inline$_v1.swish_loop_anon3_LoopHead$0$in_N := _v1.in_N;
    inline$_v1.swish_loop_anon3_LoopHead$0$in_num_r := _v1.in_num_r;
    inline$_v1.swish_loop_anon3_LoopHead$0$in_max_r := _v1.in_max_r;
    havoc inline$_v1.swish_loop_anon3_LoopHead$0$out_num_r;
    goto inline$_v1.swish_loop_anon3_LoopHead$0$entry;

  inline$_v1.swish_loop_anon3_LoopHead$0$entry:
    inline$_v1.swish_loop_anon3_LoopHead$0$out_num_r := inline$_v1.swish_loop_anon3_LoopHead$0$in_num_r;
    goto inline$_v1.swish_loop_anon3_LoopHead$0$anon3_LoopHead;

  inline$_v1.swish_loop_anon3_LoopHead$0$anon3_LoopHead:
    goto inline$_v1.swish_loop_anon3_LoopHead$0$anon3_LoopDone, inline$_v1.swish_loop_anon3_LoopHead$0$anon3_LoopBody;

  inline$_v1.swish_loop_anon3_LoopHead$0$anon3_LoopBody:
    assume {:partition} inline$_v1.swish_loop_anon3_LoopHead$0$out_num_r
     < inline$_v1.swish_loop_anon3_LoopHead$0$in_max_r
   && inline$_v1.swish_loop_anon3_LoopHead$0$out_num_r
     < inline$_v1.swish_loop_anon3_LoopHead$0$in_N;
    inline$_v1.swish_loop_anon3_LoopHead$0$out_num_r := inline$_v1.swish_loop_anon3_LoopHead$0$out_num_r + 1;
    goto inline$_v1.swish_loop_anon3_LoopHead$0$anon3_LoopBody_dummy;

  inline$_v1.swish_loop_anon3_LoopHead$0$anon3_LoopBody_dummy:
    _v1.swish_loop_anon3_LoopHead_in_1_0, _v1.swish_loop_anon3_LoopHead_in_1_1, _v1.swish_loop_anon3_LoopHead_in_1_2 := inline$_v1.swish_loop_anon3_LoopHead$0$in_N, inline$_v1.swish_loop_anon3_LoopHead$0$out_num_r, inline$_v1.swish_loop_anon3_LoopHead$0$in_max_r;
    call inline$_v1.swish_loop_anon3_LoopHead$0$out_num_r := _v1.swish_loop_anon3_LoopHead(inline$_v1.swish_loop_anon3_LoopHead$0$in_N, inline$_v1.swish_loop_anon3_LoopHead$0$out_num_r, inline$_v1.swish_loop_anon3_LoopHead$0$in_max_r);
    _v1.swish_loop_anon3_LoopHead_1_done := true;
    _v1.swish_loop_anon3_LoopHead_out_1_0 := inline$_v1.swish_loop_anon3_LoopHead$0$out_num_r;
    goto inline$_v1.swish_loop_anon3_LoopHead$0$Return;

  inline$_v1.swish_loop_anon3_LoopHead$0$anon3_LoopDone:
    assume {:partition} !(inline$_v1.swish_loop_anon3_LoopHead$0$out_num_r
     < inline$_v1.swish_loop_anon3_LoopHead$0$in_max_r
   && inline$_v1.swish_loop_anon3_LoopHead$0$out_num_r
     < inline$_v1.swish_loop_anon3_LoopHead$0$in_N);
    inline$_v1.swish_loop_anon3_LoopHead$0$out_num_r := inline$_v1.swish_loop_anon3_LoopHead$0$in_num_r;
    goto inline$_v1.swish_loop_anon3_LoopHead$0$Return;

  inline$_v1.swish_loop_anon3_LoopHead$0$Return:
    assume true;
    assume true;
    assume true;
    assert _houdini_10
   ==> inline$_v1.swish_loop_anon3_LoopHead$0$in_num_r
     <= inline$_v1.swish_loop_anon3_LoopHead$0$out_num_r;
    assert _houdini_11
   ==> inline$_v1.swish_loop_anon3_LoopHead$0$out_num_r
     <= inline$_v1.swish_loop_anon3_LoopHead$0$in_num_r;
    _v1.out_num_r := inline$_v1.swish_loop_anon3_LoopHead$0$out_num_r;
    goto START$1;

  START$1:
    goto inline$_v2.swish_loop_anon3_LoopHead$0$Entry;

  inline$_v2.swish_loop_anon3_LoopHead$0$Entry:
    inline$_v2.swish_loop_anon3_LoopHead$0$in_N := _v2.in_N;
    inline$_v2.swish_loop_anon3_LoopHead$0$in_num_r := _v2.in_num_r;
    inline$_v2.swish_loop_anon3_LoopHead$0$in_max_r := _v2.in_max_r;
    havoc inline$_v2.swish_loop_anon3_LoopHead$0$out_num_r;
    goto inline$_v2.swish_loop_anon3_LoopHead$0$entry;

  inline$_v2.swish_loop_anon3_LoopHead$0$entry:
    inline$_v2.swish_loop_anon3_LoopHead$0$out_num_r := inline$_v2.swish_loop_anon3_LoopHead$0$in_num_r;
    goto inline$_v2.swish_loop_anon3_LoopHead$0$anon3_LoopHead;

  inline$_v2.swish_loop_anon3_LoopHead$0$anon3_LoopHead:
    goto inline$_v2.swish_loop_anon3_LoopHead$0$anon3_LoopDone, inline$_v2.swish_loop_anon3_LoopHead$0$anon3_LoopBody;

  inline$_v2.swish_loop_anon3_LoopHead$0$anon3_LoopBody:
    assume {:partition} inline$_v2.swish_loop_anon3_LoopHead$0$out_num_r
     < inline$_v2.swish_loop_anon3_LoopHead$0$in_max_r
   && inline$_v2.swish_loop_anon3_LoopHead$0$out_num_r
     < inline$_v2.swish_loop_anon3_LoopHead$0$in_N;
    inline$_v2.swish_loop_anon3_LoopHead$0$out_num_r := inline$_v2.swish_loop_anon3_LoopHead$0$out_num_r + 1;
    goto inline$_v2.swish_loop_anon3_LoopHead$0$anon3_LoopBody_dummy;

  inline$_v2.swish_loop_anon3_LoopHead$0$anon3_LoopBody_dummy:
    _v2.swish_loop_anon3_LoopHead_in_2_0, _v2.swish_loop_anon3_LoopHead_in_2_1, _v2.swish_loop_anon3_LoopHead_in_2_2 := inline$_v2.swish_loop_anon3_LoopHead$0$in_N, inline$_v2.swish_loop_anon3_LoopHead$0$out_num_r, inline$_v2.swish_loop_anon3_LoopHead$0$in_max_r;
    call inline$_v2.swish_loop_anon3_LoopHead$0$out_num_r := _v2.swish_loop_anon3_LoopHead(inline$_v2.swish_loop_anon3_LoopHead$0$in_N, inline$_v2.swish_loop_anon3_LoopHead$0$out_num_r, inline$_v2.swish_loop_anon3_LoopHead$0$in_max_r);
    _v2.swish_loop_anon3_LoopHead_2_done := true;
    _v2.swish_loop_anon3_LoopHead_out_2_0 := inline$_v2.swish_loop_anon3_LoopHead$0$out_num_r;
    goto inline$_v2.swish_loop_anon3_LoopHead$0$Return;

  inline$_v2.swish_loop_anon3_LoopHead$0$anon3_LoopDone:
    assume {:partition} !(inline$_v2.swish_loop_anon3_LoopHead$0$out_num_r
     < inline$_v2.swish_loop_anon3_LoopHead$0$in_max_r
   && inline$_v2.swish_loop_anon3_LoopHead$0$out_num_r
     < inline$_v2.swish_loop_anon3_LoopHead$0$in_N);
    inline$_v2.swish_loop_anon3_LoopHead$0$out_num_r := inline$_v2.swish_loop_anon3_LoopHead$0$in_num_r;
    goto inline$_v2.swish_loop_anon3_LoopHead$0$Return;

  inline$_v2.swish_loop_anon3_LoopHead$0$Return:
    assume true;
    assume true;
    assume true;
    assert _houdini_12
   ==> inline$_v2.swish_loop_anon3_LoopHead$0$in_num_r
     <= inline$_v2.swish_loop_anon3_LoopHead$0$out_num_r;
    assert _houdini_13
   ==> inline$_v2.swish_loop_anon3_LoopHead$0$out_num_r
     <= inline$_v2.swish_loop_anon3_LoopHead$0$in_num_r;
    _v2.out_num_r := inline$_v2.swish_loop_anon3_LoopHead$0$out_num_r;
    goto START$2;

  START$2:
    goto MS_L_0_0;

  MS_L_0_0:
    goto MS_L_taken_0, MS_L_not_taken_0;

  MS_L_taken_0:
    assume _v1.swish_loop_anon3_LoopHead_1_done && _v2.swish_loop_anon3_LoopHead_2_done;
    call out__v1.swish_loop_anon3_LoopHead_out_1_0_0, out__v2.swish_loop_anon3_LoopHead_out_2_0_0 := MS_Check__v1.swish_loop_anon3_LoopHead___v2.swish_loop_anon3_LoopHead(_v1.swish_loop_anon3_LoopHead_in_1_0, _v1.swish_loop_anon3_LoopHead_in_1_1, _v1.swish_loop_anon3_LoopHead_in_1_2, _v2.swish_loop_anon3_LoopHead_in_2_0, _v2.swish_loop_anon3_LoopHead_in_2_1, _v2.swish_loop_anon3_LoopHead_in_2_2);
    assume true;
    assume true;
    assume _v1.swish_loop_anon3_LoopHead_out_1_0
     == out__v1.swish_loop_anon3_LoopHead_out_1_0_0
   && _v2.swish_loop_anon3_LoopHead_out_2_0
     == out__v2.swish_loop_anon3_LoopHead_out_2_0_0;
    goto MS_L_meet_0;

  MS_L_not_taken_0:
    assume !(_v1.swish_loop_anon3_LoopHead_1_done && _v2.swish_loop_anon3_LoopHead_2_done);
    goto MS_L_meet_0;

  MS_L_meet_0:
    return;
}


