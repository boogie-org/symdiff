var _v2.FF: [int]int;

var _v2.RS: [int]int;

var _v2.K: int;

procedure _v2.water(len_FF: int, len_RS: int, N: int, gCUT2: int);
  modifies _v2.K, _v2.RS, _v2.OK, _v2.FF;
  free ensures {:io_dependency "K", "K", "N"} true;
  free ensures {:io_dependency "RS"} true;
  free ensures {:io_dependency "FF", "FF", "K", "N", "RS", "gCUT2"} true;
  free ensures {:io_dependency "K", "K", "N"} true;
  free ensures {:io_dependency "RS"} true;
  free ensures {:io_dependency "FF", "FF", "K", "N", "RS", "gCUT2"} true;
  free ensures _v2.OK ==> old(_v2.OK);



procedure _v2.water_loop_anon4_LoopHead(in_len_FF: int, in_len_RS: int, in_N: int, in_gCUT2: int, in_rand: int)
   returns (out_rand: int);
  modifies _v2.OK, _v2.K, _v2.FF;
  free ensures {:io_dependency "K", "K", "in_N"} true;
  free ensures {:io_dependency "FF", "FF", "in_N", "K", "RS", "in_gCUT2"} true;
  free ensures {:io_dependency "out_rand", "in_rand", "in_N", "K", "RS", "in_gCUT2"} true;
  free ensures {:io_dependency "K", "K", "in_N"} true;
  free ensures {:io_dependency "FF", "FF", "in_N", "K", "RS", "in_gCUT2"} true;
  free ensures {:io_dependency "out_rand", "in_rand", "in_N", "K", "RS", "in_gCUT2"} true;
  free ensures _v2.OK ==> old(_v2.OK);
  ensures _houdini_25 ==> in_rand <= out_rand;
  ensures _houdini_26 ==> out_rand <= in_rand;



implementation _v2.water(len_FF: int, len_RS: int, N: int, gCUT2: int)
{
  var rand: int;
  var old_RS: [int]int;

  anon0:
    _v2.K := 1;
    old_RS := _v2.RS;
    havoc _v2.RS;
    goto anon4_LoopHead;

  anon4_LoopHead:
    call rand := _v2.water_loop_anon4_LoopHead(len_FF, len_RS, N, gCUT2, rand);
    goto anon4_LoopHead_last;

  anon4_LoopHead_last:
    goto anon4_LoopDone, anon4_LoopBody;

  anon4_LoopBody:
    assume {:partition} _v2.K < N;
    _v2.OK := _v2.OK && _v2.K < len_FF;
    assert true;
    _v2.OK := _v2.OK && _v2.K < len_RS;
    assert true;
    goto anon5_Then, anon5_Else;

  anon5_Else:
    assume {:partition} gCUT2 <= _v2.RS[_v2.K];
    goto anon3;

  anon3:
    _v2.K := _v2.K + 1;
    goto anon3_dummy;

  anon3_dummy:
    assume false;
    return;

  anon5_Then:
    assume {:partition} _v2.RS[_v2.K] < gCUT2;
    havoc rand;
    _v2.FF[_v2.K] := rand;
    goto anon3;

  anon4_LoopDone:
    assume {:partition} N <= _v2.K;
    return;
}



implementation _v2.water_loop_anon4_LoopHead(in_len_FF: int, in_len_RS: int, in_N: int, in_gCUT2: int, in_rand: int)
   returns (out_rand: int)
{

  entry:
    out_rand := in_rand;
    goto anon4_LoopHead;

  anon4_LoopHead:
    goto anon4_LoopDone, anon4_LoopBody;

  anon4_LoopBody:
    assume {:partition} _v2.K < in_N;
    _v2.OK := _v2.OK && _v2.K < in_len_FF;
    assert true;
    _v2.OK := _v2.OK && _v2.K < in_len_RS;
    assert true;
    goto anon5_Then, anon5_Else;

  anon5_Else:
    assume {:partition} in_gCUT2 <= _v2.RS[_v2.K];
    goto anon3;

  anon3:
    _v2.K := _v2.K + 1;
    goto anon3_dummy;

  anon3_dummy:
    call out_rand := _v2.water_loop_anon4_LoopHead(in_len_FF, in_len_RS, in_N, in_gCUT2, out_rand);
    return;

  anon5_Then:
    assume {:partition} _v2.RS[_v2.K] < in_gCUT2;
    havoc out_rand;
    _v2.FF[_v2.K] := out_rand;
    goto anon3;

  anon4_LoopDone:
    assume {:partition} in_N <= _v2.K;
    out_rand := in_rand;
    _v2.K, _v2.FF := old(_v2.K), old(_v2.FF);
    return;
}



var _v2.OK: bool;

var _v1.FF: [int]int;

var _v1.RS: [int]int;

var _v1.K: int;

procedure _v1.water(len_FF: int, len_RS: int, N: int, gCUT2: int);
  modifies _v1.K, _v1.OK, _v1.FF;
  free ensures {:io_dependency "K", "K", "N"} true;
  free ensures {:io_dependency "FF", "FF", "K", "N", "RS", "gCUT2"} true;
  free ensures {:io_dependency "K", "K", "N"} true;
  free ensures {:io_dependency "FF", "FF", "K", "N", "RS", "gCUT2"} true;
  free ensures _v1.OK ==> old(_v1.OK);



procedure _v1.water_loop_anon4_LoopHead(in_len_FF: int, in_len_RS: int, in_N: int, in_gCUT2: int, in_rand: int)
   returns (out_rand: int);
  modifies _v1.OK, _v1.K, _v1.FF;
  free ensures {:io_dependency "K", "K", "in_N"} true;
  free ensures {:io_dependency "FF", "FF", "in_N", "K", "RS", "in_gCUT2"} true;
  free ensures {:io_dependency "out_rand", "in_rand", "in_N", "K", "RS", "in_gCUT2"} true;
  free ensures {:io_dependency "K", "K", "in_N"} true;
  free ensures {:io_dependency "FF", "FF", "in_N", "K", "RS", "in_gCUT2"} true;
  free ensures {:io_dependency "out_rand", "in_rand", "in_N", "K", "RS", "in_gCUT2"} true;
  free ensures _v1.OK ==> old(_v1.OK);
  ensures _houdini_23 ==> in_rand <= out_rand;
  ensures _houdini_24 ==> out_rand <= in_rand;



implementation _v1.water(len_FF: int, len_RS: int, N: int, gCUT2: int)
{
  var rand: int;

  anon0:
    _v1.K := 1;
    goto anon4_LoopHead;

  anon4_LoopHead:
    call rand := _v1.water_loop_anon4_LoopHead(len_FF, len_RS, N, gCUT2, rand);
    goto anon4_LoopHead_last;

  anon4_LoopHead_last:
    goto anon4_LoopDone, anon4_LoopBody;

  anon4_LoopBody:
    assume {:partition} _v1.K < N;
    _v1.OK := _v1.OK && _v1.K < len_FF;
    assert true;
    _v1.OK := _v1.OK && _v1.K < len_RS;
    assert true;
    goto anon5_Then, anon5_Else;

  anon5_Else:
    assume {:partition} gCUT2 <= _v1.RS[_v1.K];
    goto anon3;

  anon3:
    _v1.K := _v1.K + 1;
    goto anon3_dummy;

  anon3_dummy:
    assume false;
    return;

  anon5_Then:
    assume {:partition} _v1.RS[_v1.K] < gCUT2;
    havoc rand;
    _v1.FF[_v1.K] := rand;
    goto anon3;

  anon4_LoopDone:
    assume {:partition} N <= _v1.K;
    return;
}



implementation _v1.water_loop_anon4_LoopHead(in_len_FF: int, in_len_RS: int, in_N: int, in_gCUT2: int, in_rand: int)
   returns (out_rand: int)
{

  entry:
    out_rand := in_rand;
    goto anon4_LoopHead;

  anon4_LoopHead:
    goto anon4_LoopDone, anon4_LoopBody;

  anon4_LoopBody:
    assume {:partition} _v1.K < in_N;
    _v1.OK := _v1.OK && _v1.K < in_len_FF;
    assert true;
    _v1.OK := _v1.OK && _v1.K < in_len_RS;
    assert true;
    goto anon5_Then, anon5_Else;

  anon5_Else:
    assume {:partition} in_gCUT2 <= _v1.RS[_v1.K];
    goto anon3;

  anon3:
    _v1.K := _v1.K + 1;
    goto anon3_dummy;

  anon3_dummy:
    call out_rand := _v1.water_loop_anon4_LoopHead(in_len_FF, in_len_RS, in_N, in_gCUT2, out_rand);
    return;

  anon5_Then:
    assume {:partition} _v1.RS[_v1.K] < in_gCUT2;
    havoc out_rand;
    _v1.FF[_v1.K] := out_rand;
    goto anon3;

  anon4_LoopDone:
    assume {:partition} in_N <= _v1.K;
    out_rand := in_rand;
    _v1.K, _v1.FF := old(_v1.K), old(_v1.FF);
    return;
}



var _v1.OK: bool;

function {:inline true} MS$_v1.water$_v2.water(_v1.len_FF: int, 
    _v1.len_RS: int, 
    _v1.N: int, 
    _v1.gCUT2: int, 
    _v1.FF_old: [int]int, 
    _v1.RS_old: [int]int, 
    _v1.K_old: int, 
    _v1.OK_old: bool, 
    _v1.K_: int, 
    _v1.OK_: bool, 
    _v1.FF_: [int]int, 
    _v2.len_FF: int, 
    _v2.len_RS: int, 
    _v2.N: int, 
    _v2.gCUT2: int, 
    _v2.FF_old: [int]int, 
    _v2.RS_old: [int]int, 
    _v2.K_old: int, 
    _v2.OK_old: bool, 
    _v2.K_: int, 
    _v2.RS_: [int]int, 
    _v2.OK_: bool, 
    _v2.FF_: [int]int)
   : bool
{
  true
}

function {:inline true} MS_pre_$_v1.water$_v2.water(_v1.len_FF: int, 
    _v1.len_RS: int, 
    _v1.N: int, 
    _v1.gCUT2: int, 
    _v1.FF_old: [int]int, 
    _v1.RS_old: [int]int, 
    _v1.K_old: int, 
    _v1.OK_old: bool, 
    _v2.len_FF: int, 
    _v2.len_RS: int, 
    _v2.N: int, 
    _v2.gCUT2: int, 
    _v2.FF_old: [int]int, 
    _v2.RS_old: [int]int, 
    _v2.K_old: int, 
    _v2.OK_old: bool)
   : bool
{
  true
}

procedure MS_Check__v1.water___v2.water(_v1.len_FF: int, 
    _v1.len_RS: int, 
    _v1.N: int, 
    _v1.gCUT2: int, 
    _v2.len_FF: int, 
    _v2.len_RS: int, 
    _v2.N: int, 
    _v2.gCUT2: int);
  requires MS_pre_$_v1.water$_v2.water(_v1.len_FF, 
  _v1.len_RS, 
  _v1.N, 
  _v1.gCUT2, 
  _v1.FF, 
  _v1.RS, 
  _v1.K, 
  _v1.OK, 
  _v2.len_FF, 
  _v2.len_RS, 
  _v2.N, 
  _v2.gCUT2, 
  _v2.FF, 
  _v2.RS, 
  _v2.K, 
  _v2.OK);
  requires _v1.len_FF == _v2.len_FF
   && _v1.len_RS == _v2.len_RS
   && _v1.N == _v2.N
   && _v1.gCUT2 == _v2.gCUT2
   && 
  _v1.FF == _v2.FF
   && _v1.RS == _v2.RS
   && _v1.K == _v2.K
   && (_v1.OK <==> _v2.OK);
  modifies _v1.K, _v1.OK, _v1.FF, _v2.K, _v2.RS, _v2.OK, _v2.FF;
  ensures MS$_v1.water$_v2.water(_v1.len_FF, 
  _v1.len_RS, 
  _v1.N, 
  _v1.gCUT2, 
  old(_v1.FF), 
  old(_v1.RS), 
  old(_v1.K), 
  old(_v1.OK), 
  _v1.K, 
  _v1.OK, 
  _v1.FF, 
  _v2.len_FF, 
  _v2.len_RS, 
  _v2.N, 
  _v2.gCUT2, 
  old(_v2.FF), 
  old(_v2.RS), 
  old(_v2.K), 
  old(_v2.OK), 
  _v2.K, 
  _v2.RS, 
  _v2.OK, 
  _v2.FF);
  ensures _v1.OK ==> _v2.OK;



implementation MS_Check__v1.water___v2.water(_v1.len_FF: int, 
    _v1.len_RS: int, 
    _v1.N: int, 
    _v1.gCUT2: int, 
    _v2.len_FF: int, 
    _v2.len_RS: int, 
    _v2.N: int, 
    _v2.gCUT2: int)
{
  var inline$_v1.water$0$rand: int;
  var inline$_v1.water$0$len_FF: int;
  var inline$_v1.water$0$len_RS: int;
  var inline$_v1.water$0$N: int;
  var inline$_v1.water$0$gCUT2: int;
  var inline$_v1.water$0$_v1.K: int;
  var inline$_v1.water$0$_v1.OK: bool;
  var inline$_v1.water$0$_v1.FF: [int]int;
  var inline$_v2.water$0$rand: int;
  var inline$_v2.water$0$old_RS: [int]int;
  var inline$_v2.water$0$len_FF: int;
  var inline$_v2.water$0$len_RS: int;
  var inline$_v2.water$0$N: int;
  var inline$_v2.water$0$gCUT2: int;
  var inline$_v2.water$0$_v2.K: int;
  var inline$_v2.water$0$_v2.RS: [int]int;
  var inline$_v2.water$0$_v2.OK: bool;
  var inline$_v2.water$0$_v2.FF: [int]int;
  var _v1.water_loop_anon4_LoopHead_1_done: bool;
  var _v1.water_loop_anon4_LoopHead_in_1_0: int;
  var _v1.water_loop_anon4_LoopHead_in_1_1: int;
  var _v1.water_loop_anon4_LoopHead_in_1_2: int;
  var _v1.water_loop_anon4_LoopHead_in_1_3: int;
  var _v1.water_loop_anon4_LoopHead_in_1_4: int;
  var _v1.water_loop_anon4_LoopHead_in_1_5: int;
  var _v1.water_loop_anon4_LoopHead_in_1_6: bool;
  var _v1.water_loop_anon4_LoopHead_in_1_7: [int]int;
  var _v1.water_loop_anon4_LoopHead_out_1_0: int;
  var _v1.water_loop_anon4_LoopHead_out_1_1: bool;
  var _v1.water_loop_anon4_LoopHead_out_1_2: int;
  var _v1.water_loop_anon4_LoopHead_out_1_3: [int]int;
  var _v2.water_loop_anon4_LoopHead_2_done: bool;
  var _v2.water_loop_anon4_LoopHead_in_2_0: int;
  var _v2.water_loop_anon4_LoopHead_in_2_1: int;
  var _v2.water_loop_anon4_LoopHead_in_2_2: int;
  var _v2.water_loop_anon4_LoopHead_in_2_3: int;
  var _v2.water_loop_anon4_LoopHead_in_2_4: int;
  var _v2.water_loop_anon4_LoopHead_in_2_5: int;
  var _v2.water_loop_anon4_LoopHead_in_2_6: [int]int;
  var _v2.water_loop_anon4_LoopHead_in_2_7: bool;
  var _v2.water_loop_anon4_LoopHead_in_2_8: [int]int;
  var _v2.water_loop_anon4_LoopHead_out_2_0: int;
  var _v2.water_loop_anon4_LoopHead_out_2_1: bool;
  var _v2.water_loop_anon4_LoopHead_out_2_2: int;
  var _v2.water_loop_anon4_LoopHead_out_2_3: [int]int;
  var store__0__v1.K: int;
  var store__0__v1.OK: bool;
  var store__0__v1.FF: [int]int;
  var store__0__v2.K: int;
  var store__0__v2.RS: [int]int;
  var store__0__v2.OK: bool;
  var store__0__v2.FF: [int]int;
  var out__v1.water_loop_anon4_LoopHead_out_1_0_0: int;
  var out__v2.water_loop_anon4_LoopHead_out_2_0_0: int;

  START:
    _v1.water_loop_anon4_LoopHead_1_done, _v2.water_loop_anon4_LoopHead_2_done := false, false;
    goto inline$_v1.water$0$Entry;

  inline$_v1.water$0$Entry:
    inline$_v1.water$0$len_FF := _v1.len_FF;
    inline$_v1.water$0$len_RS := _v1.len_RS;
    inline$_v1.water$0$N := _v1.N;
    inline$_v1.water$0$gCUT2 := _v1.gCUT2;
    havoc inline$_v1.water$0$rand;
    inline$_v1.water$0$_v1.K := _v1.K;
    inline$_v1.water$0$_v1.OK := _v1.OK;
    inline$_v1.water$0$_v1.FF := _v1.FF;
    goto inline$_v1.water$0$anon0;

  inline$_v1.water$0$anon0:
    _v1.K := 1;
    goto inline$_v1.water$0$anon4_LoopHead;

  inline$_v1.water$0$anon4_LoopHead:
    _v1.water_loop_anon4_LoopHead_in_1_0, _v1.water_loop_anon4_LoopHead_in_1_1, _v1.water_loop_anon4_LoopHead_in_1_2, _v1.water_loop_anon4_LoopHead_in_1_3, _v1.water_loop_anon4_LoopHead_in_1_4, _v1.water_loop_anon4_LoopHead_in_1_5, _v1.water_loop_anon4_LoopHead_in_1_6, _v1.water_loop_anon4_LoopHead_in_1_7 := inline$_v1.water$0$len_FF, inline$_v1.water$0$len_RS, inline$_v1.water$0$N, inline$_v1.water$0$gCUT2, inline$_v1.water$0$rand, _v1.K, _v1.OK, _v1.FF;
    call inline$_v1.water$0$rand := _v1.water_loop_anon4_LoopHead(inline$_v1.water$0$len_FF, inline$_v1.water$0$len_RS, inline$_v1.water$0$N, inline$_v1.water$0$gCUT2, inline$_v1.water$0$rand);
    _v1.water_loop_anon4_LoopHead_1_done := true;
    _v1.water_loop_anon4_LoopHead_out_1_0, _v1.water_loop_anon4_LoopHead_out_1_1, _v1.water_loop_anon4_LoopHead_out_1_2, _v1.water_loop_anon4_LoopHead_out_1_3 := inline$_v1.water$0$rand, _v1.OK, _v1.K, _v1.FF;
    goto inline$_v1.water$0$anon4_LoopHead_last;

  inline$_v1.water$0$anon4_LoopHead_last:
    goto inline$_v1.water$0$anon4_LoopDone, inline$_v1.water$0$anon4_LoopBody;

  inline$_v1.water$0$anon4_LoopBody:
    assume {:partition} _v1.K < inline$_v1.water$0$N;
    _v1.OK := _v1.OK && _v1.K < inline$_v1.water$0$len_FF;
    assert true;
    _v1.OK := _v1.OK && _v1.K < inline$_v1.water$0$len_RS;
    assert true;
    goto inline$_v1.water$0$anon5_Then, inline$_v1.water$0$anon5_Else;

  inline$_v1.water$0$anon5_Else:
    assume {:partition} inline$_v1.water$0$gCUT2 <= _v1.RS[_v1.K];
    goto inline$_v1.water$0$anon3;

  inline$_v1.water$0$anon3:
    _v1.K := _v1.K + 1;
    goto inline$_v1.water$0$anon3_dummy;

  inline$_v1.water$0$anon3_dummy:
    assume false;
    goto inline$_v1.water$0$Return;

  inline$_v1.water$0$anon5_Then:
    assume {:partition} _v1.RS[_v1.K] < inline$_v1.water$0$gCUT2;
    havoc inline$_v1.water$0$rand;
    _v1.FF[_v1.K] := inline$_v1.water$0$rand;
    goto inline$_v1.water$0$anon3;

  inline$_v1.water$0$anon4_LoopDone:
    assume {:partition} inline$_v1.water$0$N <= _v1.K;
    goto inline$_v1.water$0$Return;

  inline$_v1.water$0$Return:
    assume true;
    assume true;
    assume true;
    assume true;
    assume true;
    goto START$1;

  START$1:
    goto inline$_v2.water$0$Entry;

  inline$_v2.water$0$Entry:
    inline$_v2.water$0$len_FF := _v2.len_FF;
    inline$_v2.water$0$len_RS := _v2.len_RS;
    inline$_v2.water$0$N := _v2.N;
    inline$_v2.water$0$gCUT2 := _v2.gCUT2;
    havoc inline$_v2.water$0$rand, inline$_v2.water$0$old_RS;
    inline$_v2.water$0$_v2.K := _v2.K;
    inline$_v2.water$0$_v2.RS := _v2.RS;
    inline$_v2.water$0$_v2.OK := _v2.OK;
    inline$_v2.water$0$_v2.FF := _v2.FF;
    goto inline$_v2.water$0$anon0;

  inline$_v2.water$0$anon0:
    _v2.K := 1;
    inline$_v2.water$0$old_RS := _v2.RS;
    havoc _v2.RS;
    goto inline$_v2.water$0$anon4_LoopHead;

  inline$_v2.water$0$anon4_LoopHead:
    _v2.water_loop_anon4_LoopHead_in_2_0, _v2.water_loop_anon4_LoopHead_in_2_1, _v2.water_loop_anon4_LoopHead_in_2_2, _v2.water_loop_anon4_LoopHead_in_2_3, _v2.water_loop_anon4_LoopHead_in_2_4, _v2.water_loop_anon4_LoopHead_in_2_5, _v2.water_loop_anon4_LoopHead_in_2_6, _v2.water_loop_anon4_LoopHead_in_2_7, _v2.water_loop_anon4_LoopHead_in_2_8 := inline$_v2.water$0$len_FF, inline$_v2.water$0$len_RS, inline$_v2.water$0$N, inline$_v2.water$0$gCUT2, inline$_v2.water$0$rand, _v2.K, _v2.RS, _v2.OK, _v2.FF;
    call inline$_v2.water$0$rand := _v2.water_loop_anon4_LoopHead(inline$_v2.water$0$len_FF, inline$_v2.water$0$len_RS, inline$_v2.water$0$N, inline$_v2.water$0$gCUT2, inline$_v2.water$0$rand);
    _v2.water_loop_anon4_LoopHead_2_done := true;
    _v2.water_loop_anon4_LoopHead_out_2_0, _v2.water_loop_anon4_LoopHead_out_2_1, _v2.water_loop_anon4_LoopHead_out_2_2, _v2.water_loop_anon4_LoopHead_out_2_3 := inline$_v2.water$0$rand, _v2.OK, _v2.K, _v2.FF;
    goto inline$_v2.water$0$anon4_LoopHead_last;

  inline$_v2.water$0$anon4_LoopHead_last:
    goto inline$_v2.water$0$anon4_LoopDone, inline$_v2.water$0$anon4_LoopBody;

  inline$_v2.water$0$anon4_LoopBody:
    assume {:partition} _v2.K < inline$_v2.water$0$N;
    _v2.OK := _v2.OK && _v2.K < inline$_v2.water$0$len_FF;
    assert true;
    _v2.OK := _v2.OK && _v2.K < inline$_v2.water$0$len_RS;
    assert true;
    goto inline$_v2.water$0$anon5_Then, inline$_v2.water$0$anon5_Else;

  inline$_v2.water$0$anon5_Else:
    assume {:partition} inline$_v2.water$0$gCUT2 <= _v2.RS[_v2.K];
    goto inline$_v2.water$0$anon3;

  inline$_v2.water$0$anon3:
    _v2.K := _v2.K + 1;
    goto inline$_v2.water$0$anon3_dummy;

  inline$_v2.water$0$anon3_dummy:
    assume false;
    goto inline$_v2.water$0$Return;

  inline$_v2.water$0$anon5_Then:
    assume {:partition} _v2.RS[_v2.K] < inline$_v2.water$0$gCUT2;
    havoc inline$_v2.water$0$rand;
    _v2.FF[_v2.K] := inline$_v2.water$0$rand;
    goto inline$_v2.water$0$anon3;

  inline$_v2.water$0$anon4_LoopDone:
    assume {:partition} inline$_v2.water$0$N <= _v2.K;
    goto inline$_v2.water$0$Return;

  inline$_v2.water$0$Return:
    assume true;
    assume true;
    assume true;
    assume true;
    assume true;
    assume true;
    assume true;
    goto START$2;

  START$2:
    goto MS_L_0_0;

  MS_L_0_0:
    goto MS_L_taken_0, MS_L_not_taken_0;

  MS_L_taken_0:
    assume _v1.water_loop_anon4_LoopHead_1_done && _v2.water_loop_anon4_LoopHead_2_done;
    store__0__v1.K, store__0__v1.OK, store__0__v1.FF := _v1.K, _v1.OK, _v1.FF;
    store__0__v2.K, store__0__v2.RS, store__0__v2.OK, store__0__v2.FF := _v2.K, _v2.RS, _v2.OK, _v2.FF;
    _v1.K, _v1.OK, _v1.FF := _v1.water_loop_anon4_LoopHead_in_1_5, _v1.water_loop_anon4_LoopHead_in_1_6, _v1.water_loop_anon4_LoopHead_in_1_7;
    _v2.K, _v2.RS, _v2.OK, _v2.FF := _v2.water_loop_anon4_LoopHead_in_2_5, _v2.water_loop_anon4_LoopHead_in_2_6, _v2.water_loop_anon4_LoopHead_in_2_7, _v2.water_loop_anon4_LoopHead_in_2_8;
    call out__v1.water_loop_anon4_LoopHead_out_1_0_0, out__v2.water_loop_anon4_LoopHead_out_2_0_0 := MS_Check__v1.water_loop_anon4_LoopHead___v2.water_loop_anon4_LoopHead(_v1.water_loop_anon4_LoopHead_in_1_0, _v1.water_loop_anon4_LoopHead_in_1_1, _v1.water_loop_anon4_LoopHead_in_1_2, _v1.water_loop_anon4_LoopHead_in_1_3, _v1.water_loop_anon4_LoopHead_in_1_4, _v2.water_loop_anon4_LoopHead_in_2_0, _v2.water_loop_anon4_LoopHead_in_2_1, _v2.water_loop_anon4_LoopHead_in_2_2, _v2.water_loop_anon4_LoopHead_in_2_3, _v2.water_loop_anon4_LoopHead_in_2_4);
    assume (_v1.OK <==> _v1.water_loop_anon4_LoopHead_out_1_1)
   && _v1.K == _v1.water_loop_anon4_LoopHead_out_1_2
   && _v1.FF == _v1.water_loop_anon4_LoopHead_out_1_3;
    assume (_v2.OK <==> _v2.water_loop_anon4_LoopHead_out_2_1)
   && _v2.K == _v2.water_loop_anon4_LoopHead_out_2_2
   && _v2.FF == _v2.water_loop_anon4_LoopHead_out_2_3;
    assume _v1.water_loop_anon4_LoopHead_out_1_0
     == out__v1.water_loop_anon4_LoopHead_out_1_0_0
   && _v2.water_loop_anon4_LoopHead_out_2_0
     == out__v2.water_loop_anon4_LoopHead_out_2_0_0;
    _v1.K, _v1.OK, _v1.FF := store__0__v1.K, store__0__v1.OK, store__0__v1.FF;
    _v2.K, _v2.RS, _v2.OK, _v2.FF := store__0__v2.K, store__0__v2.RS, store__0__v2.OK, store__0__v2.FF;
    goto MS_L_meet_0;

  MS_L_not_taken_0:
    assume !(_v1.water_loop_anon4_LoopHead_1_done && _v2.water_loop_anon4_LoopHead_2_done);
    goto MS_L_meet_0;

  MS_L_meet_0:
    return;
}



function {:inline true} MS$_v1.water_loop_anon4_LoopHead$_v2.water_loop_anon4_LoopHead(_v1.in_len_FF: int, 
    _v1.in_len_RS: int, 
    _v1.in_N: int, 
    _v1.in_gCUT2: int, 
    _v1.in_rand: int, 
    _v1.FF_old: [int]int, 
    _v1.RS_old: [int]int, 
    _v1.K_old: int, 
    _v1.OK_old: bool, 
    _v1.OK_: bool, 
    _v1.K_: int, 
    _v1.FF_: [int]int, 
    _v1.out_rand: int, 
    _v2.in_len_FF: int, 
    _v2.in_len_RS: int, 
    _v2.in_N: int, 
    _v2.in_gCUT2: int, 
    _v2.in_rand: int, 
    _v2.FF_old: [int]int, 
    _v2.RS_old: [int]int, 
    _v2.K_old: int, 
    _v2.OK_old: bool, 
    _v2.OK_: bool, 
    _v2.K_: int, 
    _v2.FF_: [int]int, 
    _v2.out_rand: int)
   : bool
{
  true
}

function {:inline true} MS_pre_$_v1.water_loop_anon4_LoopHead$_v2.water_loop_anon4_LoopHead(_v1.in_len_FF: int, 
    _v1.in_len_RS: int, 
    _v1.in_N: int, 
    _v1.in_gCUT2: int, 
    _v1.in_rand: int, 
    _v1.FF_old: [int]int, 
    _v1.RS_old: [int]int, 
    _v1.K_old: int, 
    _v1.OK_old: bool, 
    _v2.in_len_FF: int, 
    _v2.in_len_RS: int, 
    _v2.in_N: int, 
    _v2.in_gCUT2: int, 
    _v2.in_rand: int, 
    _v2.FF_old: [int]int, 
    _v2.RS_old: [int]int, 
    _v2.K_old: int, 
    _v2.OK_old: bool)
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

const {:existential true} _houdini_20: bool;

const {:existential true} _houdini_21: bool;

const {:existential true} _houdini_22: bool;

const {:existential true} _houdini_23: bool;

const {:existential true} _houdini_24: bool;

const {:existential true} _houdini_25: bool;

const {:existential true} _houdini_26: bool;

procedure MS_Check__v1.water_loop_anon4_LoopHead___v2.water_loop_anon4_LoopHead(_v1.in_len_FF: int, 
    _v1.in_len_RS: int, 
    _v1.in_N: int, 
    _v1.in_gCUT2: int, 
    _v1.in_rand: int, 
    _v2.in_len_FF: int, 
    _v2.in_len_RS: int, 
    _v2.in_N: int, 
    _v2.in_gCUT2: int, 
    _v2.in_rand: int)
   returns (_v1.out_rand: int, _v2.out_rand: int);
  requires MS_pre_$_v1.water_loop_anon4_LoopHead$_v2.water_loop_anon4_LoopHead(_v1.in_len_FF, 
  _v1.in_len_RS, 
  _v1.in_N, 
  _v1.in_gCUT2, 
  _v1.in_rand, 
  _v1.FF, 
  _v1.RS, 
  _v1.K, 
  _v1.OK, 
  _v2.in_len_FF, 
  _v2.in_len_RS, 
  _v2.in_N, 
  _v2.in_gCUT2, 
  _v2.in_rand, 
  _v2.FF, 
  _v2.RS, 
  _v2.K, 
  _v2.OK);
  requires _houdini_7 ==> _v1.in_len_FF <= _v2.in_len_FF;
  requires _houdini_8 ==> _v2.in_len_FF <= _v1.in_len_FF;
  requires _houdini_9 ==> _v1.in_len_RS <= _v2.in_len_RS;
  requires _houdini_10 ==> _v2.in_len_RS <= _v1.in_len_RS;
  requires _houdini_11 ==> _v1.in_N <= _v2.in_N;
  requires _houdini_12 ==> _v2.in_N <= _v1.in_N;
  requires _houdini_13 ==> _v1.in_gCUT2 <= _v2.in_gCUT2;
  requires _houdini_14 ==> _v2.in_gCUT2 <= _v1.in_gCUT2;
  requires _houdini_15 ==> _v1.in_rand <= _v2.in_rand;
  requires _houdini_16 ==> _v2.in_rand <= _v1.in_rand;
  requires _houdini_17 ==> _v1.FF == _v2.FF;
  requires _houdini_18 ==> _v1.RS == _v2.RS;
  requires _houdini_19 ==> _v1.K <= _v2.K;
  requires _houdini_20 ==> _v2.K <= _v1.K;
  requires _houdini_21 ==> _v1.OK ==> _v2.OK;
  requires _houdini_22 ==> _v2.OK ==> _v1.OK;
  modifies _v1.OK, _v1.K, _v1.FF, _v2.OK, _v2.K, _v2.FF;
  ensures MS$_v1.water_loop_anon4_LoopHead$_v2.water_loop_anon4_LoopHead(_v1.in_len_FF, 
  _v1.in_len_RS, 
  _v1.in_N, 
  _v1.in_gCUT2, 
  _v1.in_rand, 
  old(_v1.FF), 
  old(_v1.RS), 
  old(_v1.K), 
  old(_v1.OK), 
  _v1.OK, 
  _v1.K, 
  _v1.FF, 
  _v1.out_rand, 
  _v2.in_len_FF, 
  _v2.in_len_RS, 
  _v2.in_N, 
  _v2.in_gCUT2, 
  _v2.in_rand, 
  old(_v2.FF), 
  old(_v2.RS), 
  old(_v2.K), 
  old(_v2.OK), 
  _v2.OK, 
  _v2.K, 
  _v2.FF, 
  _v2.out_rand);
  ensures _houdini_0 ==> _v1.out_rand <= _v2.out_rand;
  ensures _houdini_1 ==> _v2.out_rand <= _v1.out_rand;
  ensures _houdini_2 ==> _v1.OK ==> _v2.OK;
  ensures _houdini_3 ==> _v2.OK ==> _v1.OK;
  ensures _houdini_4 ==> _v1.K <= _v2.K;
  ensures _houdini_5 ==> _v2.K <= _v1.K;
  ensures _houdini_6 ==> _v1.FF == _v2.FF;



implementation MS_Check__v1.water_loop_anon4_LoopHead___v2.water_loop_anon4_LoopHead(_v1.in_len_FF: int, 
    _v1.in_len_RS: int, 
    _v1.in_N: int, 
    _v1.in_gCUT2: int, 
    _v1.in_rand: int, 
    _v2.in_len_FF: int, 
    _v2.in_len_RS: int, 
    _v2.in_N: int, 
    _v2.in_gCUT2: int, 
    _v2.in_rand: int)
   returns (_v1.out_rand: int, _v2.out_rand: int)
{
  var inline$_v1.water_loop_anon4_LoopHead$0$in_len_FF: int;
  var inline$_v1.water_loop_anon4_LoopHead$0$in_len_RS: int;
  var inline$_v1.water_loop_anon4_LoopHead$0$in_N: int;
  var inline$_v1.water_loop_anon4_LoopHead$0$in_gCUT2: int;
  var inline$_v1.water_loop_anon4_LoopHead$0$in_rand: int;
  var inline$_v1.water_loop_anon4_LoopHead$0$out_rand: int;
  var inline$_v1.water_loop_anon4_LoopHead$0$_v1.OK: bool;
  var inline$_v1.water_loop_anon4_LoopHead$0$_v1.K: int;
  var inline$_v1.water_loop_anon4_LoopHead$0$_v1.FF: [int]int;
  var inline$_v2.water_loop_anon4_LoopHead$0$in_len_FF: int;
  var inline$_v2.water_loop_anon4_LoopHead$0$in_len_RS: int;
  var inline$_v2.water_loop_anon4_LoopHead$0$in_N: int;
  var inline$_v2.water_loop_anon4_LoopHead$0$in_gCUT2: int;
  var inline$_v2.water_loop_anon4_LoopHead$0$in_rand: int;
  var inline$_v2.water_loop_anon4_LoopHead$0$out_rand: int;
  var inline$_v2.water_loop_anon4_LoopHead$0$_v2.OK: bool;
  var inline$_v2.water_loop_anon4_LoopHead$0$_v2.K: int;
  var inline$_v2.water_loop_anon4_LoopHead$0$_v2.FF: [int]int;
  var _v1.water_loop_anon4_LoopHead_1_done: bool;
  var _v1.water_loop_anon4_LoopHead_in_1_0: int;
  var _v1.water_loop_anon4_LoopHead_in_1_1: int;
  var _v1.water_loop_anon4_LoopHead_in_1_2: int;
  var _v1.water_loop_anon4_LoopHead_in_1_3: int;
  var _v1.water_loop_anon4_LoopHead_in_1_4: int;
  var _v1.water_loop_anon4_LoopHead_in_1_5: bool;
  var _v1.water_loop_anon4_LoopHead_in_1_6: int;
  var _v1.water_loop_anon4_LoopHead_in_1_7: [int]int;
  var _v1.water_loop_anon4_LoopHead_out_1_0: int;
  var _v1.water_loop_anon4_LoopHead_out_1_1: bool;
  var _v1.water_loop_anon4_LoopHead_out_1_2: int;
  var _v1.water_loop_anon4_LoopHead_out_1_3: [int]int;
  var _v2.water_loop_anon4_LoopHead_2_done: bool;
  var _v2.water_loop_anon4_LoopHead_in_2_0: int;
  var _v2.water_loop_anon4_LoopHead_in_2_1: int;
  var _v2.water_loop_anon4_LoopHead_in_2_2: int;
  var _v2.water_loop_anon4_LoopHead_in_2_3: int;
  var _v2.water_loop_anon4_LoopHead_in_2_4: int;
  var _v2.water_loop_anon4_LoopHead_in_2_5: bool;
  var _v2.water_loop_anon4_LoopHead_in_2_6: int;
  var _v2.water_loop_anon4_LoopHead_in_2_7: [int]int;
  var _v2.water_loop_anon4_LoopHead_out_2_0: int;
  var _v2.water_loop_anon4_LoopHead_out_2_1: bool;
  var _v2.water_loop_anon4_LoopHead_out_2_2: int;
  var _v2.water_loop_anon4_LoopHead_out_2_3: [int]int;
  var store__0__v1.OK: bool;
  var store__0__v1.K: int;
  var store__0__v1.FF: [int]int;
  var store__0__v2.OK: bool;
  var store__0__v2.K: int;
  var store__0__v2.FF: [int]int;
  var out__v1.water_loop_anon4_LoopHead_out_1_0_0: int;
  var out__v2.water_loop_anon4_LoopHead_out_2_0_0: int;

  START:
    _v1.water_loop_anon4_LoopHead_1_done, _v2.water_loop_anon4_LoopHead_2_done := false, false;
    goto inline$_v1.water_loop_anon4_LoopHead$0$Entry;

  inline$_v1.water_loop_anon4_LoopHead$0$Entry:
    inline$_v1.water_loop_anon4_LoopHead$0$in_len_FF := _v1.in_len_FF;
    inline$_v1.water_loop_anon4_LoopHead$0$in_len_RS := _v1.in_len_RS;
    inline$_v1.water_loop_anon4_LoopHead$0$in_N := _v1.in_N;
    inline$_v1.water_loop_anon4_LoopHead$0$in_gCUT2 := _v1.in_gCUT2;
    inline$_v1.water_loop_anon4_LoopHead$0$in_rand := _v1.in_rand;
    havoc inline$_v1.water_loop_anon4_LoopHead$0$out_rand;
    inline$_v1.water_loop_anon4_LoopHead$0$_v1.OK := _v1.OK;
    inline$_v1.water_loop_anon4_LoopHead$0$_v1.K := _v1.K;
    inline$_v1.water_loop_anon4_LoopHead$0$_v1.FF := _v1.FF;
    goto inline$_v1.water_loop_anon4_LoopHead$0$entry;

  inline$_v1.water_loop_anon4_LoopHead$0$entry:
    inline$_v1.water_loop_anon4_LoopHead$0$out_rand := inline$_v1.water_loop_anon4_LoopHead$0$in_rand;
    goto inline$_v1.water_loop_anon4_LoopHead$0$anon4_LoopHead;

  inline$_v1.water_loop_anon4_LoopHead$0$anon4_LoopHead:
    goto inline$_v1.water_loop_anon4_LoopHead$0$anon4_LoopDone, inline$_v1.water_loop_anon4_LoopHead$0$anon4_LoopBody;

  inline$_v1.water_loop_anon4_LoopHead$0$anon4_LoopBody:
    assume {:partition} _v1.K < inline$_v1.water_loop_anon4_LoopHead$0$in_N;
    _v1.OK := _v1.OK && _v1.K < inline$_v1.water_loop_anon4_LoopHead$0$in_len_FF;
    assert true;
    _v1.OK := _v1.OK && _v1.K < inline$_v1.water_loop_anon4_LoopHead$0$in_len_RS;
    assert true;
    goto inline$_v1.water_loop_anon4_LoopHead$0$anon5_Then, inline$_v1.water_loop_anon4_LoopHead$0$anon5_Else;

  inline$_v1.water_loop_anon4_LoopHead$0$anon5_Else:
    assume {:partition} inline$_v1.water_loop_anon4_LoopHead$0$in_gCUT2 <= _v1.RS[_v1.K];
    goto inline$_v1.water_loop_anon4_LoopHead$0$anon3;

  inline$_v1.water_loop_anon4_LoopHead$0$anon3:
    _v1.K := _v1.K + 1;
    goto inline$_v1.water_loop_anon4_LoopHead$0$anon3_dummy;

  inline$_v1.water_loop_anon4_LoopHead$0$anon3_dummy:
    _v1.water_loop_anon4_LoopHead_in_1_0, _v1.water_loop_anon4_LoopHead_in_1_1, _v1.water_loop_anon4_LoopHead_in_1_2, _v1.water_loop_anon4_LoopHead_in_1_3, _v1.water_loop_anon4_LoopHead_in_1_4, _v1.water_loop_anon4_LoopHead_in_1_5, _v1.water_loop_anon4_LoopHead_in_1_6, _v1.water_loop_anon4_LoopHead_in_1_7 := inline$_v1.water_loop_anon4_LoopHead$0$in_len_FF, inline$_v1.water_loop_anon4_LoopHead$0$in_len_RS, inline$_v1.water_loop_anon4_LoopHead$0$in_N, inline$_v1.water_loop_anon4_LoopHead$0$in_gCUT2, inline$_v1.water_loop_anon4_LoopHead$0$out_rand, _v1.OK, _v1.K, _v1.FF;
    call inline$_v1.water_loop_anon4_LoopHead$0$out_rand := _v1.water_loop_anon4_LoopHead(inline$_v1.water_loop_anon4_LoopHead$0$in_len_FF, inline$_v1.water_loop_anon4_LoopHead$0$in_len_RS, inline$_v1.water_loop_anon4_LoopHead$0$in_N, inline$_v1.water_loop_anon4_LoopHead$0$in_gCUT2, inline$_v1.water_loop_anon4_LoopHead$0$out_rand);
    _v1.water_loop_anon4_LoopHead_1_done := true;
    _v1.water_loop_anon4_LoopHead_out_1_0, _v1.water_loop_anon4_LoopHead_out_1_1, _v1.water_loop_anon4_LoopHead_out_1_2, _v1.water_loop_anon4_LoopHead_out_1_3 := inline$_v1.water_loop_anon4_LoopHead$0$out_rand, _v1.OK, _v1.K, _v1.FF;
    goto inline$_v1.water_loop_anon4_LoopHead$0$Return;

  inline$_v1.water_loop_anon4_LoopHead$0$anon5_Then:
    assume {:partition} _v1.RS[_v1.K] < inline$_v1.water_loop_anon4_LoopHead$0$in_gCUT2;
    havoc inline$_v1.water_loop_anon4_LoopHead$0$out_rand;
    _v1.FF[_v1.K] := inline$_v1.water_loop_anon4_LoopHead$0$out_rand;
    goto inline$_v1.water_loop_anon4_LoopHead$0$anon3;

  inline$_v1.water_loop_anon4_LoopHead$0$anon4_LoopDone:
    assume {:partition} inline$_v1.water_loop_anon4_LoopHead$0$in_N <= _v1.K;
    inline$_v1.water_loop_anon4_LoopHead$0$out_rand := inline$_v1.water_loop_anon4_LoopHead$0$in_rand;
    _v1.K, _v1.FF := inline$_v1.water_loop_anon4_LoopHead$0$_v1.K, inline$_v1.water_loop_anon4_LoopHead$0$_v1.FF;
    goto inline$_v1.water_loop_anon4_LoopHead$0$Return;

  inline$_v1.water_loop_anon4_LoopHead$0$Return:
    assume true;
    assume true;
    assume true;
    assume true;
    assume true;
    assume true;
    assume true;
    assert _houdini_23
   ==> inline$_v1.water_loop_anon4_LoopHead$0$in_rand
     <= inline$_v1.water_loop_anon4_LoopHead$0$out_rand;
    assert _houdini_24
   ==> inline$_v1.water_loop_anon4_LoopHead$0$out_rand
     <= inline$_v1.water_loop_anon4_LoopHead$0$in_rand;
    _v1.out_rand := inline$_v1.water_loop_anon4_LoopHead$0$out_rand;
    goto START$1;

  START$1:
    goto inline$_v2.water_loop_anon4_LoopHead$0$Entry;

  inline$_v2.water_loop_anon4_LoopHead$0$Entry:
    inline$_v2.water_loop_anon4_LoopHead$0$in_len_FF := _v2.in_len_FF;
    inline$_v2.water_loop_anon4_LoopHead$0$in_len_RS := _v2.in_len_RS;
    inline$_v2.water_loop_anon4_LoopHead$0$in_N := _v2.in_N;
    inline$_v2.water_loop_anon4_LoopHead$0$in_gCUT2 := _v2.in_gCUT2;
    inline$_v2.water_loop_anon4_LoopHead$0$in_rand := _v2.in_rand;
    havoc inline$_v2.water_loop_anon4_LoopHead$0$out_rand;
    inline$_v2.water_loop_anon4_LoopHead$0$_v2.OK := _v2.OK;
    inline$_v2.water_loop_anon4_LoopHead$0$_v2.K := _v2.K;
    inline$_v2.water_loop_anon4_LoopHead$0$_v2.FF := _v2.FF;
    goto inline$_v2.water_loop_anon4_LoopHead$0$entry;

  inline$_v2.water_loop_anon4_LoopHead$0$entry:
    inline$_v2.water_loop_anon4_LoopHead$0$out_rand := inline$_v2.water_loop_anon4_LoopHead$0$in_rand;
    goto inline$_v2.water_loop_anon4_LoopHead$0$anon4_LoopHead;

  inline$_v2.water_loop_anon4_LoopHead$0$anon4_LoopHead:
    goto inline$_v2.water_loop_anon4_LoopHead$0$anon4_LoopDone, inline$_v2.water_loop_anon4_LoopHead$0$anon4_LoopBody;

  inline$_v2.water_loop_anon4_LoopHead$0$anon4_LoopBody:
    assume {:partition} _v2.K < inline$_v2.water_loop_anon4_LoopHead$0$in_N;
    _v2.OK := _v2.OK && _v2.K < inline$_v2.water_loop_anon4_LoopHead$0$in_len_FF;
    assert true;
    _v2.OK := _v2.OK && _v2.K < inline$_v2.water_loop_anon4_LoopHead$0$in_len_RS;
    assert true;
    goto inline$_v2.water_loop_anon4_LoopHead$0$anon5_Then, inline$_v2.water_loop_anon4_LoopHead$0$anon5_Else;

  inline$_v2.water_loop_anon4_LoopHead$0$anon5_Else:
    assume {:partition} inline$_v2.water_loop_anon4_LoopHead$0$in_gCUT2 <= _v2.RS[_v2.K];
    goto inline$_v2.water_loop_anon4_LoopHead$0$anon3;

  inline$_v2.water_loop_anon4_LoopHead$0$anon3:
    _v2.K := _v2.K + 1;
    goto inline$_v2.water_loop_anon4_LoopHead$0$anon3_dummy;

  inline$_v2.water_loop_anon4_LoopHead$0$anon3_dummy:
    _v2.water_loop_anon4_LoopHead_in_2_0, _v2.water_loop_anon4_LoopHead_in_2_1, _v2.water_loop_anon4_LoopHead_in_2_2, _v2.water_loop_anon4_LoopHead_in_2_3, _v2.water_loop_anon4_LoopHead_in_2_4, _v2.water_loop_anon4_LoopHead_in_2_5, _v2.water_loop_anon4_LoopHead_in_2_6, _v2.water_loop_anon4_LoopHead_in_2_7 := inline$_v2.water_loop_anon4_LoopHead$0$in_len_FF, inline$_v2.water_loop_anon4_LoopHead$0$in_len_RS, inline$_v2.water_loop_anon4_LoopHead$0$in_N, inline$_v2.water_loop_anon4_LoopHead$0$in_gCUT2, inline$_v2.water_loop_anon4_LoopHead$0$out_rand, _v2.OK, _v2.K, _v2.FF;
    call inline$_v2.water_loop_anon4_LoopHead$0$out_rand := _v2.water_loop_anon4_LoopHead(inline$_v2.water_loop_anon4_LoopHead$0$in_len_FF, inline$_v2.water_loop_anon4_LoopHead$0$in_len_RS, inline$_v2.water_loop_anon4_LoopHead$0$in_N, inline$_v2.water_loop_anon4_LoopHead$0$in_gCUT2, inline$_v2.water_loop_anon4_LoopHead$0$out_rand);
    _v2.water_loop_anon4_LoopHead_2_done := true;
    _v2.water_loop_anon4_LoopHead_out_2_0, _v2.water_loop_anon4_LoopHead_out_2_1, _v2.water_loop_anon4_LoopHead_out_2_2, _v2.water_loop_anon4_LoopHead_out_2_3 := inline$_v2.water_loop_anon4_LoopHead$0$out_rand, _v2.OK, _v2.K, _v2.FF;
    goto inline$_v2.water_loop_anon4_LoopHead$0$Return;

  inline$_v2.water_loop_anon4_LoopHead$0$anon5_Then:
    assume {:partition} _v2.RS[_v2.K] < inline$_v2.water_loop_anon4_LoopHead$0$in_gCUT2;
    havoc inline$_v2.water_loop_anon4_LoopHead$0$out_rand;
    _v2.FF[_v2.K] := inline$_v2.water_loop_anon4_LoopHead$0$out_rand;
    goto inline$_v2.water_loop_anon4_LoopHead$0$anon3;

  inline$_v2.water_loop_anon4_LoopHead$0$anon4_LoopDone:
    assume {:partition} inline$_v2.water_loop_anon4_LoopHead$0$in_N <= _v2.K;
    inline$_v2.water_loop_anon4_LoopHead$0$out_rand := inline$_v2.water_loop_anon4_LoopHead$0$in_rand;
    _v2.K, _v2.FF := inline$_v2.water_loop_anon4_LoopHead$0$_v2.K, inline$_v2.water_loop_anon4_LoopHead$0$_v2.FF;
    goto inline$_v2.water_loop_anon4_LoopHead$0$Return;

  inline$_v2.water_loop_anon4_LoopHead$0$Return:
    assume true;
    assume true;
    assume true;
    assume true;
    assume true;
    assume true;
    assume true;
    assert _houdini_25
   ==> inline$_v2.water_loop_anon4_LoopHead$0$in_rand
     <= inline$_v2.water_loop_anon4_LoopHead$0$out_rand;
    assert _houdini_26
   ==> inline$_v2.water_loop_anon4_LoopHead$0$out_rand
     <= inline$_v2.water_loop_anon4_LoopHead$0$in_rand;
    _v2.out_rand := inline$_v2.water_loop_anon4_LoopHead$0$out_rand;
    goto START$2;

  START$2:
    goto MS_L_0_0;

  MS_L_0_0:
    goto MS_L_taken_0, MS_L_not_taken_0;

  MS_L_taken_0:
    assume _v1.water_loop_anon4_LoopHead_1_done && _v2.water_loop_anon4_LoopHead_2_done;
    store__0__v1.OK, store__0__v1.K, store__0__v1.FF := _v1.OK, _v1.K, _v1.FF;
    store__0__v2.OK, store__0__v2.K, store__0__v2.FF := _v2.OK, _v2.K, _v2.FF;
    _v1.OK, _v1.K, _v1.FF := _v1.water_loop_anon4_LoopHead_in_1_5, _v1.water_loop_anon4_LoopHead_in_1_6, _v1.water_loop_anon4_LoopHead_in_1_7;
    _v2.OK, _v2.K, _v2.FF := _v2.water_loop_anon4_LoopHead_in_2_5, _v2.water_loop_anon4_LoopHead_in_2_6, _v2.water_loop_anon4_LoopHead_in_2_7;
    call out__v1.water_loop_anon4_LoopHead_out_1_0_0, out__v2.water_loop_anon4_LoopHead_out_2_0_0 := MS_Check__v1.water_loop_anon4_LoopHead___v2.water_loop_anon4_LoopHead(_v1.water_loop_anon4_LoopHead_in_1_0, _v1.water_loop_anon4_LoopHead_in_1_1, _v1.water_loop_anon4_LoopHead_in_1_2, _v1.water_loop_anon4_LoopHead_in_1_3, _v1.water_loop_anon4_LoopHead_in_1_4, _v2.water_loop_anon4_LoopHead_in_2_0, _v2.water_loop_anon4_LoopHead_in_2_1, _v2.water_loop_anon4_LoopHead_in_2_2, _v2.water_loop_anon4_LoopHead_in_2_3, _v2.water_loop_anon4_LoopHead_in_2_4);
    assume (_v1.OK <==> _v1.water_loop_anon4_LoopHead_out_1_1)
   && _v1.K == _v1.water_loop_anon4_LoopHead_out_1_2
   && _v1.FF == _v1.water_loop_anon4_LoopHead_out_1_3;
    assume (_v2.OK <==> _v2.water_loop_anon4_LoopHead_out_2_1)
   && _v2.K == _v2.water_loop_anon4_LoopHead_out_2_2
   && _v2.FF == _v2.water_loop_anon4_LoopHead_out_2_3;
    assume _v1.water_loop_anon4_LoopHead_out_1_0
     == out__v1.water_loop_anon4_LoopHead_out_1_0_0
   && _v2.water_loop_anon4_LoopHead_out_2_0
     == out__v2.water_loop_anon4_LoopHead_out_2_0_0;
    _v1.OK, _v1.K, _v1.FF := store__0__v1.OK, store__0__v1.K, store__0__v1.FF;
    _v2.OK, _v2.K, _v2.FF := store__0__v2.OK, store__0__v2.K, store__0__v2.FF;
    goto MS_L_meet_0;

  MS_L_not_taken_0:
    assume !(_v1.water_loop_anon4_LoopHead_1_done && _v2.water_loop_anon4_LoopHead_2_done);
    goto MS_L_meet_0;

  MS_L_meet_0:
    return;
}


