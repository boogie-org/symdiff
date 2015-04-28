const _v2.e: int;

function _v2.A(arg_0: int, arg_1: int) : int;

function _v2.RelaxedEq(x: int, y: int) : bool;

axiom (forall x: int, y: int :: 
  { _v2.RelaxedEq(x, y): bool } 
  _v2.RelaxedEq(x, y): bool <==> x <= y + _v2.e && y <= x + _v2.e);

axiom _v2.e >= 0;

procedure _v2.lu(column: int, N: int, max_1: int) returns (max: int);
  free ensures {:io_dependency "max", "max_1", "N", "column"} true;
  free ensures {:io_dependency "max", "max_1", "N", "column"} true;
  free ensures _v2.OK ==> old(_v2.OK);



procedure _v2.lu_loop_anon5_LoopHead(in_column: int, in_N: int, in_max: int, in_i: int, in_a: int, in_old_a: int)
   returns (out_max: int, out_i: int, out_a: int, out_old_a: int);
  free ensures {:io_dependency "out_max", "in_max", "in_N", "in_i"} true;
  free ensures {:io_dependency "out_i", "in_i", "in_N"} true;
  free ensures {:io_dependency "out_a", "in_a", "in_N", "in_i"} true;
  free ensures {:io_dependency "out_old_a", "in_old_a", "in_N", "in_i", "in_column"} true;
  free ensures {:io_dependency "out_max", "in_max", "in_N", "in_i"} true;
  free ensures {:io_dependency "out_i", "in_i", "in_N"} true;
  free ensures {:io_dependency "out_a", "in_a", "in_N", "in_i"} true;
  free ensures {:io_dependency "out_old_a", "in_old_a", "in_N", "in_i", "in_column"} true;
  free ensures _v2.OK ==> old(_v2.OK);
  ensures _abshoudini_24(in_max <= out_max);
  ensures _abshoudini_25(out_max <= in_max);
  ensures _abshoudini_26(in_i <= out_i);
  ensures _abshoudini_27(out_i <= in_i);
  ensures _abshoudini_28(in_a <= out_a);
  ensures _abshoudini_29(out_a <= in_a);
  ensures _abshoudini_30(in_old_a <= out_old_a);
  ensures _abshoudini_31(out_old_a <= in_old_a);



implementation _v2.lu(column: int, N: int, max_1: int) returns (max: int)
{
  var i: int;
  var a: int;
  var old_a: int;

  anon0:
    i := column + 1;
    max := max_1;
    goto anon5_LoopHead;

  anon5_LoopHead:
    call max, i, a, old_a := _v2.lu_loop_anon5_LoopHead(column, N, max, i, a, old_a);
    goto anon5_LoopHead_last;

  anon5_LoopHead_last:
    goto anon5_LoopDone, anon5_LoopBody;

  anon5_LoopBody:
    assume {:partition} i < N;
    a := _v2.A(i, column);
    old_a := a;
    havoc a;
    assume _v2.RelaxedEq(old_a, a);
    goto anon6_Then, anon6_Else;

  anon6_Else:
    assume {:partition} max >= a;
    goto anon3;

  anon3:
    i := i + 1;
    goto anon3_dummy;

  anon3_dummy:
    assume false;
    return;

  anon6_Then:
    assume {:partition} a > max;
    max := a;
    goto anon3;

  anon5_LoopDone:
    assume {:partition} N <= i;
    goto anon4;

  anon4:
    return;
}



implementation _v2.lu_loop_anon5_LoopHead(in_column: int, in_N: int, in_max: int, in_i: int, in_a: int, in_old_a: int)
   returns (out_max: int, out_i: int, out_a: int, out_old_a: int)
{

  entry:
    out_max, out_i, out_a, out_old_a := in_max, in_i, in_a, in_old_a;
    goto anon5_LoopHead;

  anon5_LoopHead:
    goto anon5_LoopDone, anon5_LoopBody;

  anon5_LoopBody:
    assume {:partition} out_i < in_N;
    out_a := _v2.A(out_i, in_column);
    out_old_a := out_a;
    havoc out_a;
    assume _v2.RelaxedEq(out_old_a, out_a);
    goto anon6_Then, anon6_Else;

  anon6_Else:
    assume {:partition} out_max >= out_a;
    goto anon3;

  anon3:
    out_i := out_i + 1;
    goto anon3_dummy;

  anon3_dummy:
    call out_max, out_i, out_a, out_old_a := _v2.lu_loop_anon5_LoopHead(in_column, in_N, out_max, out_i, out_a, out_old_a);
    return;

  anon6_Then:
    assume {:partition} out_a > out_max;
    out_max := out_a;
    goto anon3;

  anon5_LoopDone:
    assume {:partition} in_N <= out_i;
    out_max, out_i, out_a, out_old_a := in_max, in_i, in_a, in_old_a;
    return;
}



var _v2.OK: bool;

procedure _v1.lu(column: int, N: int, max_1: int) returns (max: int);
  free ensures {:io_dependency "max", "max_1", "N", "column"} true;
  free ensures {:io_dependency "max", "max_1", "N", "column"} true;
  free ensures _v1.OK ==> old(_v1.OK);



procedure _v1.lu_loop_anon5_LoopHead(in_column: int, in_N: int, in_max: int, in_i: int, in_a: int)
   returns (out_max: int, out_i: int, out_a: int);
  free ensures {:io_dependency "out_max", "in_max", "in_N", "in_i", "in_column"} true;
  free ensures {:io_dependency "out_i", "in_i", "in_N"} true;
  free ensures {:io_dependency "out_a", "in_a", "in_N", "in_i", "in_column"} true;
  free ensures {:io_dependency "out_max", "in_max", "in_N", "in_i", "in_column"} true;
  free ensures {:io_dependency "out_i", "in_i", "in_N"} true;
  free ensures {:io_dependency "out_a", "in_a", "in_N", "in_i", "in_column"} true;
  free ensures _v1.OK ==> old(_v1.OK);
  ensures _abshoudini_18(in_max <= out_max);
  ensures _abshoudini_19(out_max <= in_max);
  ensures _abshoudini_20(in_i <= out_i);
  ensures _abshoudini_21(out_i <= in_i);
  ensures _abshoudini_22(in_a <= out_a);
  ensures _abshoudini_23(out_a <= in_a);



implementation _v1.lu(column: int, N: int, max_1: int) returns (max: int)
{
  var i: int;
  var a: int;

  anon0:
    i := column + 1;
    max := max_1;
    goto anon5_LoopHead;

  anon5_LoopHead:
    call max, i, a := _v1.lu_loop_anon5_LoopHead(column, N, max, i, a);
    goto anon5_LoopHead_last;

  anon5_LoopHead_last:
    goto anon5_LoopDone, anon5_LoopBody;

  anon5_LoopBody:
    assume {:partition} i < N;
    a := _v2.A(i, column);
    goto anon6_Then, anon6_Else;

  anon6_Else:
    assume {:partition} max >= a;
    goto anon3;

  anon3:
    i := i + 1;
    goto anon3_dummy;

  anon3_dummy:
    assume false;
    return;

  anon6_Then:
    assume {:partition} a > max;
    max := a;
    goto anon3;

  anon5_LoopDone:
    assume {:partition} N <= i;
    goto anon4;

  anon4:
    return;
}



implementation _v1.lu_loop_anon5_LoopHead(in_column: int, in_N: int, in_max: int, in_i: int, in_a: int)
   returns (out_max: int, out_i: int, out_a: int)
{

  entry:
    out_max, out_i, out_a := in_max, in_i, in_a;
    goto anon5_LoopHead;

  anon5_LoopHead:
    goto anon5_LoopDone, anon5_LoopBody;

  anon5_LoopBody:
    assume {:partition} out_i < in_N;
    out_a := _v2.A(out_i, in_column);
    goto anon6_Then, anon6_Else;

  anon6_Else:
    assume {:partition} out_max >= out_a;
    goto anon3;

  anon3:
    out_i := out_i + 1;
    goto anon3_dummy;

  anon3_dummy:
    call out_max, out_i, out_a := _v1.lu_loop_anon5_LoopHead(in_column, in_N, out_max, out_i, out_a);
    return;

  anon6_Then:
    assume {:partition} out_a > out_max;
    out_max := out_a;
    goto anon3;

  anon5_LoopDone:
    assume {:partition} in_N <= out_i;
    out_max, out_i, out_a := in_max, in_i, in_a;
    return;
}



var _v1.OK: bool;

function {:inline true} MS$_v1.lu_loop_anon5_LoopHead$_v2.lu_loop_anon5_LoopHead(_v1.in_column: int, 
    _v1.in_N: int, 
    _v1.in_max: int, 
    _v1.in_i: int, 
    _v1.in_a: int, 
    _v1.OK_old: bool, 
    _v1.out_max: int, 
    _v1.out_i: int, 
    _v1.out_a: int, 
    _v2.in_column: int, 
    _v2.in_N: int, 
    _v2.in_max: int, 
    _v2.in_i: int, 
    _v2.in_a: int, 
    _v2.in_old_a: int, 
    _v2.OK_old: bool, 
    _v2.out_max: int, 
    _v2.out_i: int, 
    _v2.out_a: int, 
    _v2.out_old_a: int)
   : bool
{
  _v2.RelaxedEq(_v2.out_max, _v1.out_max)
}

function {:inline true} MS_pre_$_v1.lu_loop_anon5_LoopHead$_v2.lu_loop_anon5_LoopHead(_v1.in_column: int, 
    _v1.in_N: int, 
    _v1.in_max: int, 
    _v1.in_i: int, 
    _v1.in_a: int, 
    _v1.OK_old: bool, 
    _v2.in_column: int, 
    _v2.in_N: int, 
    _v2.in_max: int, 
    _v2.in_i: int, 
    _v2.in_a: int, 
    _v2.in_old_a: int, 
    _v2.OK_old: bool)
   : bool
{
  _v2.RelaxedEq(_v2.in_max, _v1.in_max)
}

function {:inline true} MS$_v1.lu$_v2.lu(_v1.column: int, 
    _v1.N: int, 
    _v1.max_1: int, 
    _v1.OK_old: bool, 
    _v1.max: int, 
    _v2.column: int, 
    _v2.N: int, 
    _v2.max_1: int, 
    _v2.OK_old: bool, 
    _v2.max: int)
   : bool
{
  _v2.RelaxedEq(_v2.max, _v1.max)
}

function {:inline true} MS_pre_$_v1.lu$_v2.lu(_v1.column: int, 
    _v1.N: int, 
    _v1.max_1: int, 
    _v1.OK_old: bool, 
    _v2.column: int, 
    _v2.N: int, 
    _v2.max_1: int, 
    _v2.OK_old: bool)
   : bool
{
  true
}

procedure MS_Check__v1.lu___v2.lu(_v1.column: int, 
    _v1.N: int, 
    _v1.max_1: int, 
    _v2.column: int, 
    _v2.N: int, 
    _v2.max_1: int)
   returns (_v1.max: int, _v2.max: int);
  requires MS_pre_$_v1.lu$_v2.lu(_v1.column, _v1.N, _v1.max_1, _v1.OK, _v2.column, _v2.N, _v2.max_1, _v2.OK);
  requires _v1.column == _v2.column
   && _v1.N == _v2.N
   && _v1.max_1 == _v2.max_1
   && (_v1.OK <==> _v2.OK);
  ensures MS$_v1.lu$_v2.lu(_v1.column, 
  _v1.N, 
  _v1.max_1, 
  old(_v1.OK), 
  _v1.max, 
  _v2.column, 
  _v2.N, 
  _v2.max_1, 
  old(_v2.OK), 
  _v2.max);
  ensures _v1.OK ==> _v2.OK;



implementation MS_Check__v1.lu___v2.lu(_v1.column: int, 
    _v1.N: int, 
    _v1.max_1: int, 
    _v2.column: int, 
    _v2.N: int, 
    _v2.max_1: int)
   returns (_v1.max: int, _v2.max: int)
{
  var inline$_v1.lu$0$i: int;
  var inline$_v1.lu$0$a: int;
  var inline$_v1.lu$0$column: int;
  var inline$_v1.lu$0$N: int;
  var inline$_v1.lu$0$max_1: int;
  var inline$_v1.lu$0$max: int;
  var inline$_v2.lu$0$i: int;
  var inline$_v2.lu$0$a: int;
  var inline$_v2.lu$0$old_a: int;
  var inline$_v2.lu$0$column: int;
  var inline$_v2.lu$0$N: int;
  var inline$_v2.lu$0$max_1: int;
  var inline$_v2.lu$0$max: int;
  var _v1.lu_loop_anon5_LoopHead_1_done: bool;
  var _v1.lu_loop_anon5_LoopHead_in_1_0: int;
  var _v1.lu_loop_anon5_LoopHead_in_1_1: int;
  var _v1.lu_loop_anon5_LoopHead_in_1_2: int;
  var _v1.lu_loop_anon5_LoopHead_in_1_3: int;
  var _v1.lu_loop_anon5_LoopHead_in_1_4: int;
  var _v1.lu_loop_anon5_LoopHead_out_1_0: int;
  var _v1.lu_loop_anon5_LoopHead_out_1_1: int;
  var _v1.lu_loop_anon5_LoopHead_out_1_2: int;
  var _v2.lu_loop_anon5_LoopHead_2_done: bool;
  var _v2.lu_loop_anon5_LoopHead_in_2_0: int;
  var _v2.lu_loop_anon5_LoopHead_in_2_1: int;
  var _v2.lu_loop_anon5_LoopHead_in_2_2: int;
  var _v2.lu_loop_anon5_LoopHead_in_2_3: int;
  var _v2.lu_loop_anon5_LoopHead_in_2_4: int;
  var _v2.lu_loop_anon5_LoopHead_in_2_5: int;
  var _v2.lu_loop_anon5_LoopHead_out_2_0: int;
  var _v2.lu_loop_anon5_LoopHead_out_2_1: int;
  var _v2.lu_loop_anon5_LoopHead_out_2_2: int;
  var _v2.lu_loop_anon5_LoopHead_out_2_3: int;
  var out__v1.lu_loop_anon5_LoopHead_out_1_0_0: int;
  var out__v1.lu_loop_anon5_LoopHead_out_1_1_0: int;
  var out__v1.lu_loop_anon5_LoopHead_out_1_2_0: int;
  var out__v2.lu_loop_anon5_LoopHead_out_2_0_0: int;
  var out__v2.lu_loop_anon5_LoopHead_out_2_1_0: int;
  var out__v2.lu_loop_anon5_LoopHead_out_2_2_0: int;
  var out__v2.lu_loop_anon5_LoopHead_out_2_3_0: int;

  START:
    _v1.lu_loop_anon5_LoopHead_1_done, _v2.lu_loop_anon5_LoopHead_2_done := false, false;
    goto inline$_v1.lu$0$Entry;

  inline$_v1.lu$0$Entry:
    inline$_v1.lu$0$column := _v1.column;
    inline$_v1.lu$0$N := _v1.N;
    inline$_v1.lu$0$max_1 := _v1.max_1;
    havoc inline$_v1.lu$0$i, inline$_v1.lu$0$a, inline$_v1.lu$0$max;
    goto inline$_v1.lu$0$anon0;

  inline$_v1.lu$0$anon0:
    inline$_v1.lu$0$i := inline$_v1.lu$0$column + 1;
    inline$_v1.lu$0$max := inline$_v1.lu$0$max_1;
    goto inline$_v1.lu$0$anon5_LoopHead;

  inline$_v1.lu$0$anon5_LoopHead:
    _v1.lu_loop_anon5_LoopHead_in_1_0, _v1.lu_loop_anon5_LoopHead_in_1_1, _v1.lu_loop_anon5_LoopHead_in_1_2, _v1.lu_loop_anon5_LoopHead_in_1_3, _v1.lu_loop_anon5_LoopHead_in_1_4 := inline$_v1.lu$0$column, inline$_v1.lu$0$N, inline$_v1.lu$0$max, inline$_v1.lu$0$i, inline$_v1.lu$0$a;
    call inline$_v1.lu$0$max, inline$_v1.lu$0$i, inline$_v1.lu$0$a := _v1.lu_loop_anon5_LoopHead(inline$_v1.lu$0$column, inline$_v1.lu$0$N, inline$_v1.lu$0$max, inline$_v1.lu$0$i, inline$_v1.lu$0$a);
    _v1.lu_loop_anon5_LoopHead_1_done := true;
    _v1.lu_loop_anon5_LoopHead_out_1_0, _v1.lu_loop_anon5_LoopHead_out_1_1, _v1.lu_loop_anon5_LoopHead_out_1_2 := inline$_v1.lu$0$max, inline$_v1.lu$0$i, inline$_v1.lu$0$a;
    goto inline$_v1.lu$0$anon5_LoopHead_last;

  inline$_v1.lu$0$anon5_LoopHead_last:
    goto inline$_v1.lu$0$anon5_LoopDone, inline$_v1.lu$0$anon5_LoopBody;

  inline$_v1.lu$0$anon5_LoopBody:
    assume {:partition} inline$_v1.lu$0$i < inline$_v1.lu$0$N;
    inline$_v1.lu$0$a := _v2.A(inline$_v1.lu$0$i, inline$_v1.lu$0$column);
    goto inline$_v1.lu$0$anon6_Then, inline$_v1.lu$0$anon6_Else;

  inline$_v1.lu$0$anon6_Else:
    assume {:partition} inline$_v1.lu$0$max >= inline$_v1.lu$0$a;
    goto inline$_v1.lu$0$anon3;

  inline$_v1.lu$0$anon3:
    inline$_v1.lu$0$i := inline$_v1.lu$0$i + 1;
    goto inline$_v1.lu$0$anon3_dummy;

  inline$_v1.lu$0$anon3_dummy:
    assume false;
    goto inline$_v1.lu$0$Return;

  inline$_v1.lu$0$anon6_Then:
    assume {:partition} inline$_v1.lu$0$a > inline$_v1.lu$0$max;
    inline$_v1.lu$0$max := inline$_v1.lu$0$a;
    goto inline$_v1.lu$0$anon3;

  inline$_v1.lu$0$anon5_LoopDone:
    assume {:partition} inline$_v1.lu$0$N <= inline$_v1.lu$0$i;
    goto inline$_v1.lu$0$anon4;

  inline$_v1.lu$0$anon4:
    goto inline$_v1.lu$0$Return;

  inline$_v1.lu$0$Return:
    assume true;
    assume true;
    assume true;
    _v1.max := inline$_v1.lu$0$max;
    goto START$1;

  START$1:
    goto inline$_v2.lu$0$Entry;

  inline$_v2.lu$0$Entry:
    inline$_v2.lu$0$column := _v2.column;
    inline$_v2.lu$0$N := _v2.N;
    inline$_v2.lu$0$max_1 := _v2.max_1;
    havoc inline$_v2.lu$0$i, inline$_v2.lu$0$a, inline$_v2.lu$0$old_a, inline$_v2.lu$0$max;
    goto inline$_v2.lu$0$anon0;

  inline$_v2.lu$0$anon0:
    inline$_v2.lu$0$i := inline$_v2.lu$0$column + 1;
    inline$_v2.lu$0$max := inline$_v2.lu$0$max_1;
    goto inline$_v2.lu$0$anon5_LoopHead;

  inline$_v2.lu$0$anon5_LoopHead:
    _v2.lu_loop_anon5_LoopHead_in_2_0, _v2.lu_loop_anon5_LoopHead_in_2_1, _v2.lu_loop_anon5_LoopHead_in_2_2, _v2.lu_loop_anon5_LoopHead_in_2_3, _v2.lu_loop_anon5_LoopHead_in_2_4, _v2.lu_loop_anon5_LoopHead_in_2_5 := inline$_v2.lu$0$column, inline$_v2.lu$0$N, inline$_v2.lu$0$max, inline$_v2.lu$0$i, inline$_v2.lu$0$a, inline$_v2.lu$0$old_a;
    call inline$_v2.lu$0$max, inline$_v2.lu$0$i, inline$_v2.lu$0$a, inline$_v2.lu$0$old_a := _v2.lu_loop_anon5_LoopHead(inline$_v2.lu$0$column, inline$_v2.lu$0$N, inline$_v2.lu$0$max, inline$_v2.lu$0$i, inline$_v2.lu$0$a, inline$_v2.lu$0$old_a);
    _v2.lu_loop_anon5_LoopHead_2_done := true;
    _v2.lu_loop_anon5_LoopHead_out_2_0, _v2.lu_loop_anon5_LoopHead_out_2_1, _v2.lu_loop_anon5_LoopHead_out_2_2, _v2.lu_loop_anon5_LoopHead_out_2_3 := inline$_v2.lu$0$max, inline$_v2.lu$0$i, inline$_v2.lu$0$a, inline$_v2.lu$0$old_a;
    goto inline$_v2.lu$0$anon5_LoopHead_last;

  inline$_v2.lu$0$anon5_LoopHead_last:
    goto inline$_v2.lu$0$anon5_LoopDone, inline$_v2.lu$0$anon5_LoopBody;

  inline$_v2.lu$0$anon5_LoopBody:
    assume {:partition} inline$_v2.lu$0$i < inline$_v2.lu$0$N;
    inline$_v2.lu$0$a := _v2.A(inline$_v2.lu$0$i, inline$_v2.lu$0$column);
    inline$_v2.lu$0$old_a := inline$_v2.lu$0$a;
    havoc inline$_v2.lu$0$a;
    assume _v2.RelaxedEq(inline$_v2.lu$0$old_a, inline$_v2.lu$0$a);
    goto inline$_v2.lu$0$anon6_Then, inline$_v2.lu$0$anon6_Else;

  inline$_v2.lu$0$anon6_Else:
    assume {:partition} inline$_v2.lu$0$max >= inline$_v2.lu$0$a;
    goto inline$_v2.lu$0$anon3;

  inline$_v2.lu$0$anon3:
    inline$_v2.lu$0$i := inline$_v2.lu$0$i + 1;
    goto inline$_v2.lu$0$anon3_dummy;

  inline$_v2.lu$0$anon3_dummy:
    assume false;
    goto inline$_v2.lu$0$Return;

  inline$_v2.lu$0$anon6_Then:
    assume {:partition} inline$_v2.lu$0$a > inline$_v2.lu$0$max;
    inline$_v2.lu$0$max := inline$_v2.lu$0$a;
    goto inline$_v2.lu$0$anon3;

  inline$_v2.lu$0$anon5_LoopDone:
    assume {:partition} inline$_v2.lu$0$N <= inline$_v2.lu$0$i;
    goto inline$_v2.lu$0$anon4;

  inline$_v2.lu$0$anon4:
    goto inline$_v2.lu$0$Return;

  inline$_v2.lu$0$Return:
    assume true;
    assume true;
    assume true;
    _v2.max := inline$_v2.lu$0$max;
    goto START$2;

  START$2:
    goto MS_L_0_0;

  MS_L_0_0:
    goto MS_L_taken_0, MS_L_not_taken_0;

  MS_L_taken_0:
    assume _v1.lu_loop_anon5_LoopHead_1_done && _v2.lu_loop_anon5_LoopHead_2_done;
    call out__v1.lu_loop_anon5_LoopHead_out_1_0_0, out__v1.lu_loop_anon5_LoopHead_out_1_1_0, out__v1.lu_loop_anon5_LoopHead_out_1_2_0, out__v2.lu_loop_anon5_LoopHead_out_2_0_0, out__v2.lu_loop_anon5_LoopHead_out_2_1_0, out__v2.lu_loop_anon5_LoopHead_out_2_2_0, out__v2.lu_loop_anon5_LoopHead_out_2_3_0 := MS_Check__v1.lu_loop_anon5_LoopHead___v2.lu_loop_anon5_LoopHead(_v1.lu_loop_anon5_LoopHead_in_1_0, _v1.lu_loop_anon5_LoopHead_in_1_1, _v1.lu_loop_anon5_LoopHead_in_1_2, _v1.lu_loop_anon5_LoopHead_in_1_3, _v1.lu_loop_anon5_LoopHead_in_1_4, _v2.lu_loop_anon5_LoopHead_in_2_0, _v2.lu_loop_anon5_LoopHead_in_2_1, _v2.lu_loop_anon5_LoopHead_in_2_2, _v2.lu_loop_anon5_LoopHead_in_2_3, _v2.lu_loop_anon5_LoopHead_in_2_4, _v2.lu_loop_anon5_LoopHead_in_2_5);
    assume true;
    assume true;
    assume _v1.lu_loop_anon5_LoopHead_out_1_0 == out__v1.lu_loop_anon5_LoopHead_out_1_0_0
   && _v1.lu_loop_anon5_LoopHead_out_1_1 == out__v1.lu_loop_anon5_LoopHead_out_1_1_0
   && _v1.lu_loop_anon5_LoopHead_out_1_2 == out__v1.lu_loop_anon5_LoopHead_out_1_2_0
   && _v2.lu_loop_anon5_LoopHead_out_2_0 == out__v2.lu_loop_anon5_LoopHead_out_2_0_0
   && _v2.lu_loop_anon5_LoopHead_out_2_1 == out__v2.lu_loop_anon5_LoopHead_out_2_1_0
   && _v2.lu_loop_anon5_LoopHead_out_2_2 == out__v2.lu_loop_anon5_LoopHead_out_2_2_0
   && _v2.lu_loop_anon5_LoopHead_out_2_3 == out__v2.lu_loop_anon5_LoopHead_out_2_3_0;
    goto MS_L_meet_0;

  MS_L_not_taken_0:
    assume !(_v1.lu_loop_anon5_LoopHead_1_done && _v2.lu_loop_anon5_LoopHead_2_done);
    goto MS_L_meet_0;

  MS_L_meet_0:
    return;
}



// abshouini
function {:existential true} _abshoudini_0(i0: bool) : bool;

// abshouini
function {:existential true} _abshoudini_1(i0: bool) : bool;

// abshouini
function {:existential true} _abshoudini_2(i0: bool) : bool;

// abshouini
function {:existential true} _abshoudini_3(i0: bool) : bool;

// abshouini
function {:existential true} _abshoudini_4(i0: bool) : bool;

// abshouini
function {:existential true} _abshoudini_5(i0: bool) : bool;

// abshouini
function {:existential true} _abshoudini_6(i0: bool) : bool;

// abshouini
function {:existential true} _abshoudini_7(i0: bool) : bool;

// abshouini
function {:existential true} _abshoudini_8(i0: bool) : bool;

// abshouini
function {:existential true} _abshoudini_9(i0: bool) : bool;

// abshouini
function {:existential true} _abshoudini_10(i0: bool) : bool;

// abshouini
function {:existential true} _abshoudini_11(i0: bool) : bool;

// abshouini
function {:existential true} _abshoudini_12(i0: bool) : bool;

// abshouini
function {:existential true} _abshoudini_13(i0: bool) : bool;

// abshouini
function {:existential true} _abshoudini_14(i0: bool) : bool;

// abshouini
function {:existential true} _abshoudini_15(i0: bool) : bool;

// abshouini
function {:existential true} _abshoudini_16(i0: bool) : bool;

// abshouini
function {:existential true} _abshoudini_17(i0: bool) : bool;

// abshouini
function {:existential true} _abshoudini_18(i0: bool) : bool;

// abshouini
function {:existential true} _abshoudini_19(i0: bool) : bool;

// abshouini
function {:existential true} _abshoudini_20(i0: bool) : bool;

// abshouini
function {:existential true} _abshoudini_21(i0: bool) : bool;

// abshouini
function {:existential true} _abshoudini_22(i0: bool) : bool;

// abshouini
function {:existential true} _abshoudini_23(i0: bool) : bool;

// abshouini
function {:existential true} _abshoudini_24(i0: bool) : bool;

// abshouini
function {:existential true} _abshoudini_25(i0: bool) : bool;

// abshouini
function {:existential true} _abshoudini_26(i0: bool) : bool;

// abshouini
function {:existential true} _abshoudini_27(i0: bool) : bool;

// abshouini
function {:existential true} _abshoudini_28(i0: bool) : bool;

// abshouini
function {:existential true} _abshoudini_29(i0: bool) : bool;

// abshouini
function {:existential true} _abshoudini_30(i0: bool) : bool;

// abshouini
function {:existential true} _abshoudini_31(i0: bool) : bool;

procedure MS_Check__v1.lu_loop_anon5_LoopHead___v2.lu_loop_anon5_LoopHead(_v1.in_column: int, 
    _v1.in_N: int, 
    _v1.in_max: int, 
    _v1.in_i: int, 
    _v1.in_a: int, 
    _v2.in_column: int, 
    _v2.in_N: int, 
    _v2.in_max: int, 
    _v2.in_i: int, 
    _v2.in_a: int, 
    _v2.in_old_a: int)
   returns (_v1.out_max: int, 
    _v1.out_i: int, 
    _v1.out_a: int, 
    _v2.out_max: int, 
    _v2.out_i: int, 
    _v2.out_a: int, 
    _v2.out_old_a: int);
  requires MS_pre_$_v1.lu_loop_anon5_LoopHead$_v2.lu_loop_anon5_LoopHead(_v1.in_column, 
  _v1.in_N, 
  _v1.in_max, 
  _v1.in_i, 
  _v1.in_a, 
  _v1.OK, 
  _v2.in_column, 
  _v2.in_N, 
  _v2.in_max, 
  _v2.in_i, 
  _v2.in_a, 
  _v2.in_old_a, 
  _v2.OK);
  requires _abshoudini_6(_v1.in_column <= _v2.in_column);
  requires _abshoudini_7(_v2.in_column <= _v1.in_column);
  requires _abshoudini_8(_v1.in_N <= _v2.in_N);
  requires _abshoudini_9(_v2.in_N <= _v1.in_N);
  requires _abshoudini_10(_v1.in_max <= _v2.in_max);
  requires _abshoudini_11(_v2.in_max <= _v1.in_max);
  requires _abshoudini_12(_v1.in_i <= _v2.in_i);
  requires _abshoudini_13(_v2.in_i <= _v1.in_i);
  requires _abshoudini_14(_v1.in_a <= _v2.in_a);
  requires _abshoudini_15(_v2.in_a <= _v1.in_a);
  requires _abshoudini_16(_v1.OK ==> _v2.OK);
  requires _abshoudini_17(_v2.OK ==> _v1.OK);
  ensures MS$_v1.lu_loop_anon5_LoopHead$_v2.lu_loop_anon5_LoopHead(_v1.in_column, 
  _v1.in_N, 
  _v1.in_max, 
  _v1.in_i, 
  _v1.in_a, 
  old(_v1.OK), 
  _v1.out_max, 
  _v1.out_i, 
  _v1.out_a, 
  _v2.in_column, 
  _v2.in_N, 
  _v2.in_max, 
  _v2.in_i, 
  _v2.in_a, 
  _v2.in_old_a, 
  old(_v2.OK), 
  _v2.out_max, 
  _v2.out_i, 
  _v2.out_a, 
  _v2.out_old_a);
  ensures _abshoudini_0(_v1.out_max <= _v2.out_max);
  ensures _abshoudini_1(_v2.out_max <= _v1.out_max);
  ensures _abshoudini_2(_v1.out_i <= _v2.out_i);
  ensures _abshoudini_3(_v2.out_i <= _v1.out_i);
  ensures _abshoudini_4(_v1.out_a <= _v2.out_a);
  ensures _abshoudini_5(_v2.out_a <= _v1.out_a);



implementation MS_Check__v1.lu_loop_anon5_LoopHead___v2.lu_loop_anon5_LoopHead(_v1.in_column: int, 
    _v1.in_N: int, 
    _v1.in_max: int, 
    _v1.in_i: int, 
    _v1.in_a: int, 
    _v2.in_column: int, 
    _v2.in_N: int, 
    _v2.in_max: int, 
    _v2.in_i: int, 
    _v2.in_a: int, 
    _v2.in_old_a: int)
   returns (_v1.out_max: int, 
    _v1.out_i: int, 
    _v1.out_a: int, 
    _v2.out_max: int, 
    _v2.out_i: int, 
    _v2.out_a: int, 
    _v2.out_old_a: int)
{
  var inline$_v1.lu_loop_anon5_LoopHead$0$in_column: int;
  var inline$_v1.lu_loop_anon5_LoopHead$0$in_N: int;
  var inline$_v1.lu_loop_anon5_LoopHead$0$in_max: int;
  var inline$_v1.lu_loop_anon5_LoopHead$0$in_i: int;
  var inline$_v1.lu_loop_anon5_LoopHead$0$in_a: int;
  var inline$_v1.lu_loop_anon5_LoopHead$0$out_max: int;
  var inline$_v1.lu_loop_anon5_LoopHead$0$out_i: int;
  var inline$_v1.lu_loop_anon5_LoopHead$0$out_a: int;
  var inline$_v2.lu_loop_anon5_LoopHead$0$in_column: int;
  var inline$_v2.lu_loop_anon5_LoopHead$0$in_N: int;
  var inline$_v2.lu_loop_anon5_LoopHead$0$in_max: int;
  var inline$_v2.lu_loop_anon5_LoopHead$0$in_i: int;
  var inline$_v2.lu_loop_anon5_LoopHead$0$in_a: int;
  var inline$_v2.lu_loop_anon5_LoopHead$0$in_old_a: int;
  var inline$_v2.lu_loop_anon5_LoopHead$0$out_max: int;
  var inline$_v2.lu_loop_anon5_LoopHead$0$out_i: int;
  var inline$_v2.lu_loop_anon5_LoopHead$0$out_a: int;
  var inline$_v2.lu_loop_anon5_LoopHead$0$out_old_a: int;
  var _v1.lu_loop_anon5_LoopHead_1_done: bool;
  var _v1.lu_loop_anon5_LoopHead_in_1_0: int;
  var _v1.lu_loop_anon5_LoopHead_in_1_1: int;
  var _v1.lu_loop_anon5_LoopHead_in_1_2: int;
  var _v1.lu_loop_anon5_LoopHead_in_1_3: int;
  var _v1.lu_loop_anon5_LoopHead_in_1_4: int;
  var _v1.lu_loop_anon5_LoopHead_out_1_0: int;
  var _v1.lu_loop_anon5_LoopHead_out_1_1: int;
  var _v1.lu_loop_anon5_LoopHead_out_1_2: int;
  var _v2.lu_loop_anon5_LoopHead_2_done: bool;
  var _v2.lu_loop_anon5_LoopHead_in_2_0: int;
  var _v2.lu_loop_anon5_LoopHead_in_2_1: int;
  var _v2.lu_loop_anon5_LoopHead_in_2_2: int;
  var _v2.lu_loop_anon5_LoopHead_in_2_3: int;
  var _v2.lu_loop_anon5_LoopHead_in_2_4: int;
  var _v2.lu_loop_anon5_LoopHead_in_2_5: int;
  var _v2.lu_loop_anon5_LoopHead_out_2_0: int;
  var _v2.lu_loop_anon5_LoopHead_out_2_1: int;
  var _v2.lu_loop_anon5_LoopHead_out_2_2: int;
  var _v2.lu_loop_anon5_LoopHead_out_2_3: int;
  var out__v1.lu_loop_anon5_LoopHead_out_1_0_0: int;
  var out__v1.lu_loop_anon5_LoopHead_out_1_1_0: int;
  var out__v1.lu_loop_anon5_LoopHead_out_1_2_0: int;
  var out__v2.lu_loop_anon5_LoopHead_out_2_0_0: int;
  var out__v2.lu_loop_anon5_LoopHead_out_2_1_0: int;
  var out__v2.lu_loop_anon5_LoopHead_out_2_2_0: int;
  var out__v2.lu_loop_anon5_LoopHead_out_2_3_0: int;

  START:
    _v1.lu_loop_anon5_LoopHead_1_done, _v2.lu_loop_anon5_LoopHead_2_done := false, false;
    goto inline$_v1.lu_loop_anon5_LoopHead$0$Entry;

  inline$_v1.lu_loop_anon5_LoopHead$0$Entry:
    inline$_v1.lu_loop_anon5_LoopHead$0$in_column := _v1.in_column;
    inline$_v1.lu_loop_anon5_LoopHead$0$in_N := _v1.in_N;
    inline$_v1.lu_loop_anon5_LoopHead$0$in_max := _v1.in_max;
    inline$_v1.lu_loop_anon5_LoopHead$0$in_i := _v1.in_i;
    inline$_v1.lu_loop_anon5_LoopHead$0$in_a := _v1.in_a;
    havoc inline$_v1.lu_loop_anon5_LoopHead$0$out_max, inline$_v1.lu_loop_anon5_LoopHead$0$out_i, inline$_v1.lu_loop_anon5_LoopHead$0$out_a;
    goto inline$_v1.lu_loop_anon5_LoopHead$0$entry;

  inline$_v1.lu_loop_anon5_LoopHead$0$entry:
    inline$_v1.lu_loop_anon5_LoopHead$0$out_max, inline$_v1.lu_loop_anon5_LoopHead$0$out_i, inline$_v1.lu_loop_anon5_LoopHead$0$out_a := inline$_v1.lu_loop_anon5_LoopHead$0$in_max, inline$_v1.lu_loop_anon5_LoopHead$0$in_i, inline$_v1.lu_loop_anon5_LoopHead$0$in_a;
    goto inline$_v1.lu_loop_anon5_LoopHead$0$anon5_LoopHead;

  inline$_v1.lu_loop_anon5_LoopHead$0$anon5_LoopHead:
    goto inline$_v1.lu_loop_anon5_LoopHead$0$anon5_LoopDone, inline$_v1.lu_loop_anon5_LoopHead$0$anon5_LoopBody;

  inline$_v1.lu_loop_anon5_LoopHead$0$anon5_LoopBody:
    assume {:partition} inline$_v1.lu_loop_anon5_LoopHead$0$out_i
   < inline$_v1.lu_loop_anon5_LoopHead$0$in_N;
    inline$_v1.lu_loop_anon5_LoopHead$0$out_a := _v2.A(inline$_v1.lu_loop_anon5_LoopHead$0$out_i, 
  inline$_v1.lu_loop_anon5_LoopHead$0$in_column);
    goto inline$_v1.lu_loop_anon5_LoopHead$0$anon6_Then, inline$_v1.lu_loop_anon5_LoopHead$0$anon6_Else;

  inline$_v1.lu_loop_anon5_LoopHead$0$anon6_Else:
    assume {:partition} inline$_v1.lu_loop_anon5_LoopHead$0$out_max
   >= inline$_v1.lu_loop_anon5_LoopHead$0$out_a;
    goto inline$_v1.lu_loop_anon5_LoopHead$0$anon3;

  inline$_v1.lu_loop_anon5_LoopHead$0$anon3:
    inline$_v1.lu_loop_anon5_LoopHead$0$out_i := inline$_v1.lu_loop_anon5_LoopHead$0$out_i + 1;
    goto inline$_v1.lu_loop_anon5_LoopHead$0$anon3_dummy;

  inline$_v1.lu_loop_anon5_LoopHead$0$anon3_dummy:
    _v1.lu_loop_anon5_LoopHead_in_1_0, _v1.lu_loop_anon5_LoopHead_in_1_1, _v1.lu_loop_anon5_LoopHead_in_1_2, _v1.lu_loop_anon5_LoopHead_in_1_3, _v1.lu_loop_anon5_LoopHead_in_1_4 := inline$_v1.lu_loop_anon5_LoopHead$0$in_column, inline$_v1.lu_loop_anon5_LoopHead$0$in_N, inline$_v1.lu_loop_anon5_LoopHead$0$out_max, inline$_v1.lu_loop_anon5_LoopHead$0$out_i, inline$_v1.lu_loop_anon5_LoopHead$0$out_a;
    call inline$_v1.lu_loop_anon5_LoopHead$0$out_max, inline$_v1.lu_loop_anon5_LoopHead$0$out_i, inline$_v1.lu_loop_anon5_LoopHead$0$out_a := _v1.lu_loop_anon5_LoopHead(inline$_v1.lu_loop_anon5_LoopHead$0$in_column, inline$_v1.lu_loop_anon5_LoopHead$0$in_N, inline$_v1.lu_loop_anon5_LoopHead$0$out_max, inline$_v1.lu_loop_anon5_LoopHead$0$out_i, inline$_v1.lu_loop_anon5_LoopHead$0$out_a);
    _v1.lu_loop_anon5_LoopHead_1_done := true;
    _v1.lu_loop_anon5_LoopHead_out_1_0, _v1.lu_loop_anon5_LoopHead_out_1_1, _v1.lu_loop_anon5_LoopHead_out_1_2 := inline$_v1.lu_loop_anon5_LoopHead$0$out_max, inline$_v1.lu_loop_anon5_LoopHead$0$out_i, inline$_v1.lu_loop_anon5_LoopHead$0$out_a;
    goto inline$_v1.lu_loop_anon5_LoopHead$0$Return;

  inline$_v1.lu_loop_anon5_LoopHead$0$anon6_Then:
    assume {:partition} inline$_v1.lu_loop_anon5_LoopHead$0$out_a
   > inline$_v1.lu_loop_anon5_LoopHead$0$out_max;
    inline$_v1.lu_loop_anon5_LoopHead$0$out_max := inline$_v1.lu_loop_anon5_LoopHead$0$out_a;
    goto inline$_v1.lu_loop_anon5_LoopHead$0$anon3;

  inline$_v1.lu_loop_anon5_LoopHead$0$anon5_LoopDone:
    assume {:partition} inline$_v1.lu_loop_anon5_LoopHead$0$in_N
   <= inline$_v1.lu_loop_anon5_LoopHead$0$out_i;
    inline$_v1.lu_loop_anon5_LoopHead$0$out_max, inline$_v1.lu_loop_anon5_LoopHead$0$out_i, inline$_v1.lu_loop_anon5_LoopHead$0$out_a := inline$_v1.lu_loop_anon5_LoopHead$0$in_max, inline$_v1.lu_loop_anon5_LoopHead$0$in_i, inline$_v1.lu_loop_anon5_LoopHead$0$in_a;
    goto inline$_v1.lu_loop_anon5_LoopHead$0$Return;

  inline$_v1.lu_loop_anon5_LoopHead$0$Return:
    assume true;
    assume true;
    assume true;
    assume true;
    assume true;
    assume true;
    assume true;
    assert _abshoudini_18(inline$_v1.lu_loop_anon5_LoopHead$0$in_max
     <= inline$_v1.lu_loop_anon5_LoopHead$0$out_max);
    assert _abshoudini_19(inline$_v1.lu_loop_anon5_LoopHead$0$out_max
     <= inline$_v1.lu_loop_anon5_LoopHead$0$in_max);
    assert _abshoudini_20(inline$_v1.lu_loop_anon5_LoopHead$0$in_i
     <= inline$_v1.lu_loop_anon5_LoopHead$0$out_i);
    assert _abshoudini_21(inline$_v1.lu_loop_anon5_LoopHead$0$out_i
     <= inline$_v1.lu_loop_anon5_LoopHead$0$in_i);
    assert _abshoudini_22(inline$_v1.lu_loop_anon5_LoopHead$0$in_a
     <= inline$_v1.lu_loop_anon5_LoopHead$0$out_a);
    assert _abshoudini_23(inline$_v1.lu_loop_anon5_LoopHead$0$out_a
     <= inline$_v1.lu_loop_anon5_LoopHead$0$in_a);
    _v1.out_max := inline$_v1.lu_loop_anon5_LoopHead$0$out_max;
    _v1.out_i := inline$_v1.lu_loop_anon5_LoopHead$0$out_i;
    _v1.out_a := inline$_v1.lu_loop_anon5_LoopHead$0$out_a;
    goto START$1;

  START$1:
    goto inline$_v2.lu_loop_anon5_LoopHead$0$Entry;

  inline$_v2.lu_loop_anon5_LoopHead$0$Entry:
    inline$_v2.lu_loop_anon5_LoopHead$0$in_column := _v2.in_column;
    inline$_v2.lu_loop_anon5_LoopHead$0$in_N := _v2.in_N;
    inline$_v2.lu_loop_anon5_LoopHead$0$in_max := _v2.in_max;
    inline$_v2.lu_loop_anon5_LoopHead$0$in_i := _v2.in_i;
    inline$_v2.lu_loop_anon5_LoopHead$0$in_a := _v2.in_a;
    inline$_v2.lu_loop_anon5_LoopHead$0$in_old_a := _v2.in_old_a;
    havoc inline$_v2.lu_loop_anon5_LoopHead$0$out_max, inline$_v2.lu_loop_anon5_LoopHead$0$out_i, inline$_v2.lu_loop_anon5_LoopHead$0$out_a, inline$_v2.lu_loop_anon5_LoopHead$0$out_old_a;
    goto inline$_v2.lu_loop_anon5_LoopHead$0$entry;

  inline$_v2.lu_loop_anon5_LoopHead$0$entry:
    inline$_v2.lu_loop_anon5_LoopHead$0$out_max, inline$_v2.lu_loop_anon5_LoopHead$0$out_i, inline$_v2.lu_loop_anon5_LoopHead$0$out_a, inline$_v2.lu_loop_anon5_LoopHead$0$out_old_a := inline$_v2.lu_loop_anon5_LoopHead$0$in_max, inline$_v2.lu_loop_anon5_LoopHead$0$in_i, inline$_v2.lu_loop_anon5_LoopHead$0$in_a, inline$_v2.lu_loop_anon5_LoopHead$0$in_old_a;
    goto inline$_v2.lu_loop_anon5_LoopHead$0$anon5_LoopHead;

  inline$_v2.lu_loop_anon5_LoopHead$0$anon5_LoopHead:
    goto inline$_v2.lu_loop_anon5_LoopHead$0$anon5_LoopDone, inline$_v2.lu_loop_anon5_LoopHead$0$anon5_LoopBody;

  inline$_v2.lu_loop_anon5_LoopHead$0$anon5_LoopBody:
    assume {:partition} inline$_v2.lu_loop_anon5_LoopHead$0$out_i
   < inline$_v2.lu_loop_anon5_LoopHead$0$in_N;
    inline$_v2.lu_loop_anon5_LoopHead$0$out_a := _v2.A(inline$_v2.lu_loop_anon5_LoopHead$0$out_i, 
  inline$_v2.lu_loop_anon5_LoopHead$0$in_column);
    inline$_v2.lu_loop_anon5_LoopHead$0$out_old_a := inline$_v2.lu_loop_anon5_LoopHead$0$out_a;
    havoc inline$_v2.lu_loop_anon5_LoopHead$0$out_a;
    assume _v2.RelaxedEq(inline$_v2.lu_loop_anon5_LoopHead$0$out_old_a, 
  inline$_v2.lu_loop_anon5_LoopHead$0$out_a);
    goto inline$_v2.lu_loop_anon5_LoopHead$0$anon6_Then, inline$_v2.lu_loop_anon5_LoopHead$0$anon6_Else;

  inline$_v2.lu_loop_anon5_LoopHead$0$anon6_Else:
    assume {:partition} inline$_v2.lu_loop_anon5_LoopHead$0$out_max
   >= inline$_v2.lu_loop_anon5_LoopHead$0$out_a;
    goto inline$_v2.lu_loop_anon5_LoopHead$0$anon3;

  inline$_v2.lu_loop_anon5_LoopHead$0$anon3:
    inline$_v2.lu_loop_anon5_LoopHead$0$out_i := inline$_v2.lu_loop_anon5_LoopHead$0$out_i + 1;
    goto inline$_v2.lu_loop_anon5_LoopHead$0$anon3_dummy;

  inline$_v2.lu_loop_anon5_LoopHead$0$anon3_dummy:
    _v2.lu_loop_anon5_LoopHead_in_2_0, _v2.lu_loop_anon5_LoopHead_in_2_1, _v2.lu_loop_anon5_LoopHead_in_2_2, _v2.lu_loop_anon5_LoopHead_in_2_3, _v2.lu_loop_anon5_LoopHead_in_2_4, _v2.lu_loop_anon5_LoopHead_in_2_5 := inline$_v2.lu_loop_anon5_LoopHead$0$in_column, inline$_v2.lu_loop_anon5_LoopHead$0$in_N, inline$_v2.lu_loop_anon5_LoopHead$0$out_max, inline$_v2.lu_loop_anon5_LoopHead$0$out_i, inline$_v2.lu_loop_anon5_LoopHead$0$out_a, inline$_v2.lu_loop_anon5_LoopHead$0$out_old_a;
    call inline$_v2.lu_loop_anon5_LoopHead$0$out_max, inline$_v2.lu_loop_anon5_LoopHead$0$out_i, inline$_v2.lu_loop_anon5_LoopHead$0$out_a, inline$_v2.lu_loop_anon5_LoopHead$0$out_old_a := _v2.lu_loop_anon5_LoopHead(inline$_v2.lu_loop_anon5_LoopHead$0$in_column, inline$_v2.lu_loop_anon5_LoopHead$0$in_N, inline$_v2.lu_loop_anon5_LoopHead$0$out_max, inline$_v2.lu_loop_anon5_LoopHead$0$out_i, inline$_v2.lu_loop_anon5_LoopHead$0$out_a, inline$_v2.lu_loop_anon5_LoopHead$0$out_old_a);
    _v2.lu_loop_anon5_LoopHead_2_done := true;
    _v2.lu_loop_anon5_LoopHead_out_2_0, _v2.lu_loop_anon5_LoopHead_out_2_1, _v2.lu_loop_anon5_LoopHead_out_2_2, _v2.lu_loop_anon5_LoopHead_out_2_3 := inline$_v2.lu_loop_anon5_LoopHead$0$out_max, inline$_v2.lu_loop_anon5_LoopHead$0$out_i, inline$_v2.lu_loop_anon5_LoopHead$0$out_a, inline$_v2.lu_loop_anon5_LoopHead$0$out_old_a;
    goto inline$_v2.lu_loop_anon5_LoopHead$0$Return;

  inline$_v2.lu_loop_anon5_LoopHead$0$anon6_Then:
    assume {:partition} inline$_v2.lu_loop_anon5_LoopHead$0$out_a
   > inline$_v2.lu_loop_anon5_LoopHead$0$out_max;
    inline$_v2.lu_loop_anon5_LoopHead$0$out_max := inline$_v2.lu_loop_anon5_LoopHead$0$out_a;
    goto inline$_v2.lu_loop_anon5_LoopHead$0$anon3;

  inline$_v2.lu_loop_anon5_LoopHead$0$anon5_LoopDone:
    assume {:partition} inline$_v2.lu_loop_anon5_LoopHead$0$in_N
   <= inline$_v2.lu_loop_anon5_LoopHead$0$out_i;
    inline$_v2.lu_loop_anon5_LoopHead$0$out_max, inline$_v2.lu_loop_anon5_LoopHead$0$out_i, inline$_v2.lu_loop_anon5_LoopHead$0$out_a, inline$_v2.lu_loop_anon5_LoopHead$0$out_old_a := inline$_v2.lu_loop_anon5_LoopHead$0$in_max, inline$_v2.lu_loop_anon5_LoopHead$0$in_i, inline$_v2.lu_loop_anon5_LoopHead$0$in_a, inline$_v2.lu_loop_anon5_LoopHead$0$in_old_a;
    goto inline$_v2.lu_loop_anon5_LoopHead$0$Return;

  inline$_v2.lu_loop_anon5_LoopHead$0$Return:
    assume true;
    assume true;
    assume true;
    assume true;
    assume true;
    assume true;
    assume true;
    assume true;
    assume true;
    assert _abshoudini_24(inline$_v2.lu_loop_anon5_LoopHead$0$in_max
     <= inline$_v2.lu_loop_anon5_LoopHead$0$out_max);
    assert _abshoudini_25(inline$_v2.lu_loop_anon5_LoopHead$0$out_max
     <= inline$_v2.lu_loop_anon5_LoopHead$0$in_max);
    assert _abshoudini_26(inline$_v2.lu_loop_anon5_LoopHead$0$in_i
     <= inline$_v2.lu_loop_anon5_LoopHead$0$out_i);
    assert _abshoudini_27(inline$_v2.lu_loop_anon5_LoopHead$0$out_i
     <= inline$_v2.lu_loop_anon5_LoopHead$0$in_i);
    assert _abshoudini_28(inline$_v2.lu_loop_anon5_LoopHead$0$in_a
     <= inline$_v2.lu_loop_anon5_LoopHead$0$out_a);
    assert _abshoudini_29(inline$_v2.lu_loop_anon5_LoopHead$0$out_a
     <= inline$_v2.lu_loop_anon5_LoopHead$0$in_a);
    assert _abshoudini_30(inline$_v2.lu_loop_anon5_LoopHead$0$in_old_a
     <= inline$_v2.lu_loop_anon5_LoopHead$0$out_old_a);
    assert _abshoudini_31(inline$_v2.lu_loop_anon5_LoopHead$0$out_old_a
     <= inline$_v2.lu_loop_anon5_LoopHead$0$in_old_a);
    _v2.out_max := inline$_v2.lu_loop_anon5_LoopHead$0$out_max;
    _v2.out_i := inline$_v2.lu_loop_anon5_LoopHead$0$out_i;
    _v2.out_a := inline$_v2.lu_loop_anon5_LoopHead$0$out_a;
    _v2.out_old_a := inline$_v2.lu_loop_anon5_LoopHead$0$out_old_a;
    goto START$2;

  START$2:
    goto MS_L_0_0;

  MS_L_0_0:
    goto MS_L_taken_0, MS_L_not_taken_0;

  MS_L_taken_0:
    assume _v1.lu_loop_anon5_LoopHead_1_done && _v2.lu_loop_anon5_LoopHead_2_done;
    call out__v1.lu_loop_anon5_LoopHead_out_1_0_0, out__v1.lu_loop_anon5_LoopHead_out_1_1_0, out__v1.lu_loop_anon5_LoopHead_out_1_2_0, out__v2.lu_loop_anon5_LoopHead_out_2_0_0, out__v2.lu_loop_anon5_LoopHead_out_2_1_0, out__v2.lu_loop_anon5_LoopHead_out_2_2_0, out__v2.lu_loop_anon5_LoopHead_out_2_3_0 := MS_Check__v1.lu_loop_anon5_LoopHead___v2.lu_loop_anon5_LoopHead(_v1.lu_loop_anon5_LoopHead_in_1_0, _v1.lu_loop_anon5_LoopHead_in_1_1, _v1.lu_loop_anon5_LoopHead_in_1_2, _v1.lu_loop_anon5_LoopHead_in_1_3, _v1.lu_loop_anon5_LoopHead_in_1_4, _v2.lu_loop_anon5_LoopHead_in_2_0, _v2.lu_loop_anon5_LoopHead_in_2_1, _v2.lu_loop_anon5_LoopHead_in_2_2, _v2.lu_loop_anon5_LoopHead_in_2_3, _v2.lu_loop_anon5_LoopHead_in_2_4, _v2.lu_loop_anon5_LoopHead_in_2_5);
    assume true;
    assume true;
    assume _v1.lu_loop_anon5_LoopHead_out_1_0 == out__v1.lu_loop_anon5_LoopHead_out_1_0_0
   && _v1.lu_loop_anon5_LoopHead_out_1_1 == out__v1.lu_loop_anon5_LoopHead_out_1_1_0
   && _v1.lu_loop_anon5_LoopHead_out_1_2 == out__v1.lu_loop_anon5_LoopHead_out_1_2_0
   && _v2.lu_loop_anon5_LoopHead_out_2_0 == out__v2.lu_loop_anon5_LoopHead_out_2_0_0
   && _v2.lu_loop_anon5_LoopHead_out_2_1 == out__v2.lu_loop_anon5_LoopHead_out_2_1_0
   && _v2.lu_loop_anon5_LoopHead_out_2_2 == out__v2.lu_loop_anon5_LoopHead_out_2_2_0
   && _v2.lu_loop_anon5_LoopHead_out_2_3 == out__v2.lu_loop_anon5_LoopHead_out_2_3_0;
    goto MS_L_meet_0;

  MS_L_not_taken_0:
    assume !(_v1.lu_loop_anon5_LoopHead_1_done && _v2.lu_loop_anon5_LoopHead_2_done);
    goto MS_L_meet_0;

  MS_L_meet_0:
    return;
}


