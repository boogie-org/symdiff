var _v2.array: [int]int;

var _v2.cf: int;

const _v2.n: int;

const _v2.x: int;

const _v2.y: int;

function _v2.uif(history: int, block: int) : int;

procedure _v2.ReplaceChar();
  modifies _v2.cf, _v2.array;
  free ensures {:io_dependency "cf", "cf"} true;
  free ensures {:io_dependency "array", "array"} true;
  free ensures {:io_dependency "cf", "cf"} true;
  free ensures {:io_dependency "array", "array"} true;
  free ensures _v2.OK ==> old(_v2.OK);



procedure _v2.Helper(i: int);
  modifies _v2.cf, _v2.array;
  free ensures {:io_dependency "cf", "cf"} true;
  free ensures {:io_dependency "array", "i", "array"} true;
  free ensures {:io_dependency "cf", "cf"} true;
  free ensures {:io_dependency "array", "i", "array"} true;
  free ensures _v2.OK ==> old(_v2.OK);



implementation _v2.ReplaceChar()
{

  anon0:
    call _v2.Helper(0);
    return;
}



implementation _v2.Helper(i: int)
{
  var tmp: int;

  anon0:
    goto anon3_Then, anon3_Else;

  anon3_Else:
    assume {:partition} !(i < _v2.n && _v2.array[i] != -1);
    goto anon2;

  anon2:
    _v2.cf := _v2.uif(_v2.cf, 2);
    return;

  anon3_Then:
    assume {:partition} i < _v2.n && _v2.array[i] != -1;
    _v2.cf := _v2.uif(_v2.cf, 1);
    tmp := _v2.array[i];
    havoc tmp;
    _v2.array[i] := (if tmp == _v2.x then _v2.y else tmp);
    call _v2.Helper(i + 1);
    goto anon2;
}



var _v2.OK: bool;

var _v1.array: [int]int;

var _v1.cf: int;

const _v1.n: int;

const _v1.x: int;

const _v1.y: int;

function _v2.ArrEqAfter(a: [int]int, b: [int]int, i: int) : bool;

axiom (forall a: [int]int, b: [int]int, i: int :: 
  { _v2.ArrEqAfter(a, b, i): bool } 
  _v2.ArrEqAfter(a, b, i): bool <==> (forall j: int :: j >= i ==> a[j] == b[j]));

procedure _v1.ReplaceChar();
  modifies _v1.cf, _v1.array;
  free ensures {:io_dependency "cf", "cf"} true;
  free ensures {:io_dependency "array", "array"} true;
  free ensures {:io_dependency "cf", "cf"} true;
  free ensures {:io_dependency "array", "array"} true;
  free ensures _v1.OK ==> old(_v1.OK);



procedure _v1.Helper(i: int);
  modifies _v1.cf, _v1.array;
  free ensures {:io_dependency "cf", "cf"} true;
  free ensures {:io_dependency "array", "array", "i"} true;
  free ensures {:io_dependency "cf", "cf"} true;
  free ensures {:io_dependency "array", "array", "i"} true;
  free ensures _v1.OK ==> old(_v1.OK);



implementation _v1.ReplaceChar()
{

  anon0:
    call _v1.Helper(0);
    return;
}



implementation _v1.Helper(i: int)
{
  var tmp: int;

  anon0:
    goto anon3_Then, anon3_Else;

  anon3_Else:
    assume {:partition} !(i < _v2.n && _v1.array[i] != -1);
    goto anon2;

  anon2:
    _v1.cf := _v2.uif(_v1.cf, 2);
    return;

  anon3_Then:
    assume {:partition} i < _v2.n && _v1.array[i] != -1;
    _v1.cf := _v2.uif(_v1.cf, 1);
    tmp := _v1.array[i];
    _v1.array[i] := (if tmp == _v2.x then _v2.y else tmp);
    call _v1.Helper(i + 1);
    goto anon2;
}



var _v1.OK: bool;

function {:inline true} MS$_v1.ReplaceChar$_v2.ReplaceChar(_v1.array_old: [int]int, 
    _v1.cf_old: int, 
    _v1.OK_old: bool, 
    _v1.cf_: int, 
    _v1.array_: [int]int, 
    _v2.array_old: [int]int, 
    _v2.cf_old: int, 
    _v2.OK_old: bool, 
    _v2.cf_: int, 
    _v2.array_: [int]int)
   : bool
{
  _v1.cf_ == _v2.cf_
}

function {:inline true} MS_pre_$_v1.Helper$_v2.Helper(_v1.i: int, 
    _v1.array_old: [int]int, 
    _v1.cf_old: int, 
    _v1.OK_old: bool, 
    _v2.i: int, 
    _v2.array_old: [int]int, 
    _v2.cf_old: int, 
    _v2.OK_old: bool)
   : bool
{
  _v2.ArrEqAfter(_v1.array_old, _v2.array_old, _v1.i)
}

function {:inline true} MS_pre_$_v1.ReplaceChar$_v2.ReplaceChar(_v1.array_old: [int]int, 
    _v1.cf_old: int, 
    _v1.OK_old: bool, 
    _v2.array_old: [int]int, 
    _v2.cf_old: int, 
    _v2.OK_old: bool)
   : bool
{
  true
}

procedure MS_Check__v1.ReplaceChar___v2.ReplaceChar();
  requires MS_pre_$_v1.ReplaceChar$_v2.ReplaceChar(_v1.array, _v1.cf, _v1.OK, _v2.array, _v2.cf, _v2.OK);
  requires _v1.array == _v2.array && _v1.cf == _v2.cf && (_v1.OK <==> _v2.OK);
  modifies _v1.cf, _v1.array, _v2.cf, _v2.array;
  ensures MS$_v1.ReplaceChar$_v2.ReplaceChar(old(_v1.array), 
  old(_v1.cf), 
  old(_v1.OK), 
  _v1.cf, 
  _v1.array, 
  old(_v2.array), 
  old(_v2.cf), 
  old(_v2.OK), 
  _v2.cf, 
  _v2.array);
  ensures _v1.OK ==> _v2.OK;



implementation MS_Check__v1.ReplaceChar___v2.ReplaceChar()
{
  var inline$_v1.ReplaceChar$0$_v1.cf: int;
  var inline$_v1.ReplaceChar$0$_v1.array: [int]int;
  var inline$_v2.ReplaceChar$0$_v2.cf: int;
  var inline$_v2.ReplaceChar$0$_v2.array: [int]int;
  var _v1.Helper_1_done: bool;
  var _v1.Helper_in_1_0: int;
  var _v1.Helper_in_1_1: int;
  var _v1.Helper_in_1_2: [int]int;
  var _v1.Helper_out_1_0: int;
  var _v1.Helper_out_1_1: [int]int;
  var _v2.Helper_2_done: bool;
  var _v2.Helper_in_2_0: int;
  var _v2.Helper_in_2_1: int;
  var _v2.Helper_in_2_2: [int]int;
  var _v2.Helper_out_2_0: int;
  var _v2.Helper_out_2_1: [int]int;
  var store__0__v1.cf: int;
  var store__0__v1.array: [int]int;
  var store__0__v2.cf: int;
  var store__0__v2.array: [int]int;

  START:
    _v1.Helper_1_done, _v2.Helper_2_done := false, false;
    goto inline$_v1.ReplaceChar$0$Entry;

  inline$_v1.ReplaceChar$0$Entry:
    inline$_v1.ReplaceChar$0$_v1.cf := _v1.cf;
    inline$_v1.ReplaceChar$0$_v1.array := _v1.array;
    goto inline$_v1.ReplaceChar$0$anon0;

  inline$_v1.ReplaceChar$0$anon0:
    _v1.Helper_in_1_0, _v1.Helper_in_1_1, _v1.Helper_in_1_2 := 0, _v1.cf, _v1.array;
    call _v1.Helper(0);
    _v1.Helper_1_done := true;
    _v1.Helper_out_1_0, _v1.Helper_out_1_1 := _v1.cf, _v1.array;
    goto inline$_v1.ReplaceChar$0$Return;

  inline$_v1.ReplaceChar$0$Return:
    assume true;
    assume true;
    assume true;
    assume true;
    assume true;
    goto START$1;

  START$1:
    goto inline$_v2.ReplaceChar$0$Entry;

  inline$_v2.ReplaceChar$0$Entry:
    inline$_v2.ReplaceChar$0$_v2.cf := _v2.cf;
    inline$_v2.ReplaceChar$0$_v2.array := _v2.array;
    goto inline$_v2.ReplaceChar$0$anon0;

  inline$_v2.ReplaceChar$0$anon0:
    _v2.Helper_in_2_0, _v2.Helper_in_2_1, _v2.Helper_in_2_2 := 0, _v2.cf, _v2.array;
    call _v2.Helper(0);
    _v2.Helper_2_done := true;
    _v2.Helper_out_2_0, _v2.Helper_out_2_1 := _v2.cf, _v2.array;
    goto inline$_v2.ReplaceChar$0$Return;

  inline$_v2.ReplaceChar$0$Return:
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
    assume _v1.Helper_1_done && _v2.Helper_2_done;
    store__0__v1.cf, store__0__v1.array := _v1.cf, _v1.array;
    store__0__v2.cf, store__0__v2.array := _v2.cf, _v2.array;
    _v1.cf, _v1.array := _v1.Helper_in_1_1, _v1.Helper_in_1_2;
    _v2.cf, _v2.array := _v2.Helper_in_2_1, _v2.Helper_in_2_2;
    call MS_Check__v1.Helper___v2.Helper(_v1.Helper_in_1_0, _v2.Helper_in_2_0);
    assume _v1.cf == _v1.Helper_out_1_0 && _v1.array == _v1.Helper_out_1_1;
    assume _v2.cf == _v2.Helper_out_2_0 && _v2.array == _v2.Helper_out_2_1;
    assume true;
    _v1.cf, _v1.array := store__0__v1.cf, store__0__v1.array;
    _v2.cf, _v2.array := store__0__v2.cf, store__0__v2.array;
    goto MS_L_meet_0;

  MS_L_not_taken_0:
    assume !(_v1.Helper_1_done && _v2.Helper_2_done);
    goto MS_L_meet_0;

  MS_L_meet_0:
    return;
}



function {:inline true} MS$_v1.Helper$_v2.Helper(_v1.i: int, 
    _v1.array_old: [int]int, 
    _v1.cf_old: int, 
    _v1.OK_old: bool, 
    _v1.cf_: int, 
    _v1.array_: [int]int, 
    _v2.i: int, 
    _v2.array_old: [int]int, 
    _v2.cf_old: int, 
    _v2.OK_old: bool, 
    _v2.cf_: int, 
    _v2.array_: [int]int)
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

procedure MS_Check__v1.Helper___v2.Helper(_v1.i: int, _v2.i: int);
  requires MS_pre_$_v1.Helper$_v2.Helper(_v1.i, _v1.array, _v1.cf, _v1.OK, _v2.i, _v2.array, _v2.cf, _v2.OK);
  requires _houdini_3 ==> _v1.i <= _v2.i;
  requires _houdini_4 ==> _v2.i <= _v1.i;
  requires _houdini_5 ==> _v1.array == _v2.array;
  requires _houdini_6 ==> _v1.cf <= _v2.cf;
  requires _houdini_7 ==> _v2.cf <= _v1.cf;
  requires _houdini_8 ==> _v1.OK ==> _v2.OK;
  requires _houdini_9 ==> _v2.OK ==> _v1.OK;
  modifies _v1.cf, _v1.array, _v2.cf, _v2.array;
  ensures MS$_v1.Helper$_v2.Helper(_v1.i, 
  old(_v1.array), 
  old(_v1.cf), 
  old(_v1.OK), 
  _v1.cf, 
  _v1.array, 
  _v2.i, 
  old(_v2.array), 
  old(_v2.cf), 
  old(_v2.OK), 
  _v2.cf, 
  _v2.array);
  ensures _houdini_0 ==> _v1.cf <= _v2.cf;
  ensures _houdini_1 ==> _v2.cf <= _v1.cf;
  ensures _houdini_2 ==> _v1.array == _v2.array;



implementation MS_Check__v1.Helper___v2.Helper(_v1.i: int, _v2.i: int)
{
  var inline$_v1.Helper$0$tmp: int;
  var inline$_v1.Helper$0$i: int;
  var inline$_v1.Helper$0$_v1.cf: int;
  var inline$_v1.Helper$0$_v1.array: [int]int;
  var inline$_v2.Helper$0$tmp: int;
  var inline$_v2.Helper$0$i: int;
  var inline$_v2.Helper$0$_v2.cf: int;
  var inline$_v2.Helper$0$_v2.array: [int]int;
  var _v1.Helper_1_done: bool;
  var _v1.Helper_in_1_0: int;
  var _v1.Helper_in_1_1: int;
  var _v1.Helper_in_1_2: [int]int;
  var _v1.Helper_out_1_0: int;
  var _v1.Helper_out_1_1: [int]int;
  var _v2.Helper_2_done: bool;
  var _v2.Helper_in_2_0: int;
  var _v2.Helper_in_2_1: int;
  var _v2.Helper_in_2_2: [int]int;
  var _v2.Helper_out_2_0: int;
  var _v2.Helper_out_2_1: [int]int;
  var store__0__v1.cf: int;
  var store__0__v1.array: [int]int;
  var store__0__v2.cf: int;
  var store__0__v2.array: [int]int;

  START:
    _v1.Helper_1_done, _v2.Helper_2_done := false, false;
    goto inline$_v1.Helper$0$Entry;

  inline$_v1.Helper$0$Entry:
    inline$_v1.Helper$0$i := _v1.i;
    havoc inline$_v1.Helper$0$tmp;
    inline$_v1.Helper$0$_v1.cf := _v1.cf;
    inline$_v1.Helper$0$_v1.array := _v1.array;
    goto inline$_v1.Helper$0$anon0;

  inline$_v1.Helper$0$anon0:
    goto inline$_v1.Helper$0$anon3_Then, inline$_v1.Helper$0$anon3_Else;

  inline$_v1.Helper$0$anon3_Else:
    assume {:partition} !(inline$_v1.Helper$0$i < _v2.n && _v1.array[inline$_v1.Helper$0$i] != -1);
    goto inline$_v1.Helper$0$anon2;

  inline$_v1.Helper$0$anon2:
    _v1.cf := _v2.uif(_v1.cf, 2);
    goto inline$_v1.Helper$0$Return;

  inline$_v1.Helper$0$anon3_Then:
    assume {:partition} inline$_v1.Helper$0$i < _v2.n && _v1.array[inline$_v1.Helper$0$i] != -1;
    _v1.cf := _v2.uif(_v1.cf, 1);
    inline$_v1.Helper$0$tmp := _v1.array[inline$_v1.Helper$0$i];
    _v1.array[inline$_v1.Helper$0$i] := (if inline$_v1.Helper$0$tmp == _v2.x then _v2.y else inline$_v1.Helper$0$tmp);
    _v1.Helper_in_1_0, _v1.Helper_in_1_1, _v1.Helper_in_1_2 := inline$_v1.Helper$0$i + 1, _v1.cf, _v1.array;
    call _v1.Helper(inline$_v1.Helper$0$i + 1);
    _v1.Helper_1_done := true;
    _v1.Helper_out_1_0, _v1.Helper_out_1_1 := _v1.cf, _v1.array;
    goto inline$_v1.Helper$0$anon2;

  inline$_v1.Helper$0$Return:
    assume true;
    assume true;
    assume true;
    assume true;
    assume true;
    goto START$1;

  START$1:
    goto inline$_v2.Helper$0$Entry;

  inline$_v2.Helper$0$Entry:
    inline$_v2.Helper$0$i := _v2.i;
    havoc inline$_v2.Helper$0$tmp;
    inline$_v2.Helper$0$_v2.cf := _v2.cf;
    inline$_v2.Helper$0$_v2.array := _v2.array;
    goto inline$_v2.Helper$0$anon0;

  inline$_v2.Helper$0$anon0:
    goto inline$_v2.Helper$0$anon3_Then, inline$_v2.Helper$0$anon3_Else;

  inline$_v2.Helper$0$anon3_Else:
    assume {:partition} !(inline$_v2.Helper$0$i < _v2.n && _v2.array[inline$_v2.Helper$0$i] != -1);
    goto inline$_v2.Helper$0$anon2;

  inline$_v2.Helper$0$anon2:
    _v2.cf := _v2.uif(_v2.cf, 2);
    goto inline$_v2.Helper$0$Return;

  inline$_v2.Helper$0$anon3_Then:
    assume {:partition} inline$_v2.Helper$0$i < _v2.n && _v2.array[inline$_v2.Helper$0$i] != -1;
    _v2.cf := _v2.uif(_v2.cf, 1);
    inline$_v2.Helper$0$tmp := _v2.array[inline$_v2.Helper$0$i];
    havoc inline$_v2.Helper$0$tmp;
    _v2.array[inline$_v2.Helper$0$i] := (if inline$_v2.Helper$0$tmp == _v2.x then _v2.y else inline$_v2.Helper$0$tmp);
    _v2.Helper_in_2_0, _v2.Helper_in_2_1, _v2.Helper_in_2_2 := inline$_v2.Helper$0$i + 1, _v2.cf, _v2.array;
    call _v2.Helper(inline$_v2.Helper$0$i + 1);
    _v2.Helper_2_done := true;
    _v2.Helper_out_2_0, _v2.Helper_out_2_1 := _v2.cf, _v2.array;
    goto inline$_v2.Helper$0$anon2;

  inline$_v2.Helper$0$Return:
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
    assume _v1.Helper_1_done && _v2.Helper_2_done;
    store__0__v1.cf, store__0__v1.array := _v1.cf, _v1.array;
    store__0__v2.cf, store__0__v2.array := _v2.cf, _v2.array;
    _v1.cf, _v1.array := _v1.Helper_in_1_1, _v1.Helper_in_1_2;
    _v2.cf, _v2.array := _v2.Helper_in_2_1, _v2.Helper_in_2_2;
    call MS_Check__v1.Helper___v2.Helper(_v1.Helper_in_1_0, _v2.Helper_in_2_0);
    assume _v1.cf == _v1.Helper_out_1_0 && _v1.array == _v1.Helper_out_1_1;
    assume _v2.cf == _v2.Helper_out_2_0 && _v2.array == _v2.Helper_out_2_1;
    assume true;
    _v1.cf, _v1.array := store__0__v1.cf, store__0__v1.array;
    _v2.cf, _v2.array := store__0__v2.cf, store__0__v2.array;
    goto MS_L_meet_0;

  MS_L_not_taken_0:
    assume !(_v1.Helper_1_done && _v2.Helper_2_done);
    goto MS_L_meet_0;

  MS_L_meet_0:
    return;
}


