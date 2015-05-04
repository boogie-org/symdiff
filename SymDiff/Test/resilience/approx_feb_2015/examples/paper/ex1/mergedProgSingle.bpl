var _v2.g: int;

procedure _v2.F(x: int);
  modifies _v2.g;
  free ensures {:io_dependency "g", "g", "x"} true;
  free ensures {:io_dependency "g", "g", "x"} true;
  free ensures _v2.OK ==> old(_v2.OK);



procedure _v2.Main();
  modifies _v2.g;
  free ensures {:io_dependency "g", "g"} true;
  free ensures {:io_dependency "g", "g"} true;
  free ensures _v2.OK ==> old(_v2.OK);



implementation _v2.F(x: int)
{

  anon0:
    goto anon2_Then, anon2_Else;

  anon2_Else:
    assume {:partition} 100 <= x;
    return;

  anon2_Then:
    assume {:partition} x < 100;
    _v2.g := _v2.g + 2 * x;
    call _v2.F(x + 1);
    return;
}



implementation _v2.Main()
{

  anon0:
    call _v2.F(0);
    return;
}



var _v2.OK: bool;

var _v1.g: int;

procedure _v1.F(x: int);
  free requires x >= 0;
  modifies _v1.g;
  free ensures {:io_dependency "g", "g", "x"} true;
  free ensures {:io_dependency "g", "g", "x"} true;
  free ensures _v1.OK ==> old(_v1.OK);



procedure _v1.Main();
  modifies _v1.g;
  free ensures {:io_dependency "g", "g"} true;
  free ensures {:io_dependency "g", "g"} true;
  free ensures _v1.OK ==> old(_v1.OK);



implementation _v1.F(x: int)
{

  anon0:
    assume x >= 0;
    goto anon2_Then, anon2_Else;

  anon2_Else:
    assume {:partition} 100 <= x;
    return;

  anon2_Then:
    assume {:partition} x < 100;
    _v1.g := _v1.g + x;
    call _v1.F(x + 1);
    return;
}



implementation _v1.Main()
{

  anon0:
    call _v1.F(0);
    return;
}



var _v1.OK: bool;

function {:inline true} MS$_v1.Main$_v2.Main(_v1.g_old: int, 
    _v1.OK_old: bool, 
    _v1.g_: int, 
    _v2.g_old: int, 
    _v2.OK_old: bool, 
    _v2.g_: int)
   : bool
{
  _v1.g_ <= _v2.g_
}

function {:inline true, true, true} {:inline} MS$_v1.F$_v2.F(_v1.x: int, 
    _v1.g_old: int, 
    _v1.OK_old: bool, 
    _v1.g_: int, 
    _v2.x: int, 
    _v2.g_old: int, 
    _v2.OK_old: bool, 
    _v2.g_: int)
   : bool
{
  true
}

function {:inline true} MS_pre_$_v1.F$_v2.F(_v1.x: int, 
    _v1.g_old: int, 
    _v1.OK_old: bool, 
    _v2.x: int, 
    _v2.g_old: int, 
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

procedure MS_Check__v1.F___v2.F(_v1.x: int, _v2.x: int);
  requires MS_pre_$_v1.F$_v2.F(_v1.x, _v1.g, _v1.OK, _v2.x, _v2.g, _v2.OK);
  requires _houdini_2 ==> _v1.x <= _v2.x;
  requires _houdini_3 ==> _v2.x <= _v1.x;
  requires _houdini_4 ==> _v1.g <= _v2.g;
  requires _houdini_5 ==> _v2.g <= _v1.g;
  requires _houdini_6 ==> _v1.OK ==> _v2.OK;
  requires _houdini_7 ==> _v2.OK ==> _v1.OK;
  modifies _v1.g, _v2.g;
  ensures MS$_v1.F$_v2.F(_v1.x, old(_v1.g), old(_v1.OK), _v1.g, _v2.x, old(_v2.g), old(_v2.OK), _v2.g);
  ensures _houdini_0 ==> _v1.g <= _v2.g;
  ensures _houdini_1 ==> _v2.g <= _v1.g;



implementation MS_Check__v1.F___v2.F(_v1.x: int, _v2.x: int)
{
  var inline$_v1.F$0$x: int;
  var inline$_v1.F$0$_v1.g: int;
  var inline$_v2.F$0$x: int;
  var inline$_v2.F$0$_v2.g: int;
  var _v1.F_1_done: bool;
  var _v1.F_in_1_0: int;
  var _v1.F_in_1_1: int;
  var _v1.F_out_1_0: int;
  var _v2.F_2_done: bool;
  var _v2.F_in_2_0: int;
  var _v2.F_in_2_1: int;
  var _v2.F_out_2_0: int;
  var store__0__v1.g: int;
  var store__0__v2.g: int;

  START:
    _v1.F_1_done, _v2.F_2_done := false, false;
    goto inline$_v1.F$0$Entry;

  inline$_v1.F$0$Entry:
    inline$_v1.F$0$x := _v1.x;
    assert true;
    inline$_v1.F$0$_v1.g := _v1.g;
    goto inline$_v1.F$0$anon0;

  inline$_v1.F$0$anon0:
    assume inline$_v1.F$0$x >= 0;
    goto inline$_v1.F$0$anon2_Then, inline$_v1.F$0$anon2_Else;

  inline$_v1.F$0$anon2_Else:
    assume {:partition} 100 <= inline$_v1.F$0$x;
    goto inline$_v1.F$0$Return;

  inline$_v1.F$0$anon2_Then:
    assume {:partition} inline$_v1.F$0$x < 100;
    _v1.g := _v1.g + inline$_v1.F$0$x;
    _v1.F_in_1_0, _v1.F_in_1_1 := inline$_v1.F$0$x + 1, _v1.g;
    call _v1.F(inline$_v1.F$0$x + 1);
    _v1.F_1_done := true;
    _v1.F_out_1_0 := _v1.g;
    goto inline$_v1.F$0$Return;

  inline$_v1.F$0$Return:
    assume true;
    assume true;
    assume true;
    goto START$1;

  START$1:
    goto inline$_v2.F$0$Entry;

  inline$_v2.F$0$Entry:
    inline$_v2.F$0$x := _v2.x;
    inline$_v2.F$0$_v2.g := _v2.g;
    goto inline$_v2.F$0$anon0;

  inline$_v2.F$0$anon0:
    goto inline$_v2.F$0$anon2_Then, inline$_v2.F$0$anon2_Else;

  inline$_v2.F$0$anon2_Else:
    assume {:partition} 100 <= inline$_v2.F$0$x;
    goto inline$_v2.F$0$Return;

  inline$_v2.F$0$anon2_Then:
    assume {:partition} inline$_v2.F$0$x < 100;
    _v2.g := _v2.g + 2 * inline$_v2.F$0$x;
    _v2.F_in_2_0, _v2.F_in_2_1 := inline$_v2.F$0$x + 1, _v2.g;
    call _v2.F(inline$_v2.F$0$x + 1);
    _v2.F_2_done := true;
    _v2.F_out_2_0 := _v2.g;
    goto inline$_v2.F$0$Return;

  inline$_v2.F$0$Return:
    assume true;
    assume true;
    assume true;
    goto START$2;

  START$2:
    goto MS_L_0_0;

  MS_L_0_0:
    goto MS_L_taken_0, MS_L_not_taken_0;

  MS_L_taken_0:
    assume _v1.F_1_done && _v2.F_2_done;
    store__0__v1.g := _v1.g;
    store__0__v2.g := _v2.g;
    _v1.g := _v1.F_in_1_1;
    _v2.g := _v2.F_in_2_1;
    call MS_Check__v1.F___v2.F(_v1.F_in_1_0, _v2.F_in_2_0);
    assume _v1.g == _v1.F_out_1_0;
    assume _v2.g == _v2.F_out_2_0;
    assume true;
    _v1.g := store__0__v1.g;
    _v2.g := store__0__v2.g;
    goto MS_L_meet_0;

  MS_L_not_taken_0:
    assume !(_v1.F_1_done && _v2.F_2_done);
    goto MS_L_meet_0;

  MS_L_meet_0:
    return;
}



function {:inline true} MS_pre_$_v1.Main$_v2.Main(_v1.g_old: int, _v1.OK_old: bool, _v2.g_old: int, _v2.OK_old: bool) : bool
{
  true
}

procedure MS_Check__v1.Main___v2.Main();
  requires MS_pre_$_v1.Main$_v2.Main(_v1.g, _v1.OK, _v2.g, _v2.OK);
  requires _v1.g == _v2.g && (_v1.OK <==> _v2.OK);
  modifies _v1.g, _v2.g;
  ensures MS$_v1.Main$_v2.Main(old(_v1.g), old(_v1.OK), _v1.g, old(_v2.g), old(_v2.OK), _v2.g);
  ensures _v1.OK ==> _v2.OK;



implementation MS_Check__v1.Main___v2.Main()
{
  var inline$_v1.Main$0$_v1.g: int;
  var inline$_v2.Main$0$_v2.g: int;
  var _v1.F_1_done: bool;
  var _v1.F_in_1_0: int;
  var _v1.F_in_1_1: int;
  var _v1.F_out_1_0: int;
  var _v2.F_2_done: bool;
  var _v2.F_in_2_0: int;
  var _v2.F_in_2_1: int;
  var _v2.F_out_2_0: int;
  var store__0__v1.g: int;
  var store__0__v2.g: int;

  START:
    _v1.F_1_done, _v2.F_2_done := false, false;
    goto inline$_v1.Main$0$Entry;

  inline$_v1.Main$0$Entry:
    inline$_v1.Main$0$_v1.g := _v1.g;
    goto inline$_v1.Main$0$anon0;

  inline$_v1.Main$0$anon0:
    _v1.F_in_1_0, _v1.F_in_1_1 := 0, _v1.g;
    call _v1.F(0);
    _v1.F_1_done := true;
    _v1.F_out_1_0 := _v1.g;
    goto inline$_v1.Main$0$Return;

  inline$_v1.Main$0$Return:
    assume true;
    assume true;
    assume true;
    goto START$1;

  START$1:
    goto inline$_v2.Main$0$Entry;

  inline$_v2.Main$0$Entry:
    inline$_v2.Main$0$_v2.g := _v2.g;
    goto inline$_v2.Main$0$anon0;

  inline$_v2.Main$0$anon0:
    _v2.F_in_2_0, _v2.F_in_2_1 := 0, _v2.g;
    call _v2.F(0);
    _v2.F_2_done := true;
    _v2.F_out_2_0 := _v2.g;
    goto inline$_v2.Main$0$Return;

  inline$_v2.Main$0$Return:
    assume true;
    assume true;
    assume true;
    goto START$2;

  START$2:
    goto MS_L_0_0;

  MS_L_0_0:
    goto MS_L_taken_0, MS_L_not_taken_0;

  MS_L_taken_0:
    assume _v1.F_1_done && _v2.F_2_done;
    store__0__v1.g := _v1.g;
    store__0__v2.g := _v2.g;
    _v1.g := _v1.F_in_1_1;
    _v2.g := _v2.F_in_2_1;
    call MS_Check__v1.F___v2.F(_v1.F_in_1_0, _v2.F_in_2_0);
    assume _v1.g == _v1.F_out_1_0;
    assume _v2.g == _v2.F_out_2_0;
    assume true;
    _v1.g := store__0__v1.g;
    _v2.g := store__0__v2.g;
    goto MS_L_meet_0;

  MS_L_not_taken_0:
    assume !(_v1.F_1_done && _v2.F_2_done);
    goto MS_L_meet_0;

  MS_L_meet_0:
    return;
}


