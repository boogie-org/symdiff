var _v2.array: [int]int;

var _v2.cf: int;

const _v2.n: int;

function _v2.uif(history: int, block: int) : int;

function _v2.ArrEqAfter(a: [int]int, b: [int]int, i: int) : bool;

axiom (forall a: [int]int, b: [int]int, i: int :: 
  { _v2.ArrEqAfter(a, b, i): bool } 
  _v2.ArrEqAfter(a, b, i): bool <==> (forall j: int :: j >= i ==> a[j] == b[j]));

procedure _v2.SelectionSort();
  modifies _v2.cf, _v2.array;
  free ensures {:io_dependency "cf", "cf"} true;
  free ensures {:io_dependency "array", "array"} true;
  free ensures {:io_dependency "cf", "cf"} true;
  free ensures {:io_dependency "array", "array"} true;
  free ensures _v2.OK ==> old(_v2.OK);



procedure _v2.Find(c: int) returns (position: int);
  modifies _v2.cf;
  free ensures {:io_dependency "cf", "cf", "c"} true;
  free ensures {:io_dependency "position", "c", "array"} true;
  free ensures {:io_dependency "cf", "cf", "c"} true;
  free ensures {:io_dependency "position", "c", "array"} true;
  free ensures _v2.OK ==> old(_v2.OK);



procedure _v2.SelectionSort_loop_anon5_LoopHead(in_c: int, in_position: int, in_temp: int)
   returns (out_c: int, out_position: int, out_temp: int);
  modifies _v2.cf, _v2.array;
  free ensures {:io_dependency "cf", "cf", "in_c"} true;
  free ensures {:io_dependency "array", "array", "in_c"} true;
  free ensures {:io_dependency "out_c", "in_c"} true;
  free ensures {:io_dependency "out_position", "in_position", "in_c", "array"} true;
  free ensures {:io_dependency "out_temp", "in_temp", "in_c", "array"} true;
  free ensures {:io_dependency "cf", "cf", "in_c"} true;
  free ensures {:io_dependency "array", "array", "in_c"} true;
  free ensures {:io_dependency "out_c", "in_c"} true;
  free ensures {:io_dependency "out_position", "in_position", "in_c", "array"} true;
  free ensures {:io_dependency "out_temp", "in_temp", "in_c", "array"} true;
  free ensures _v2.OK ==> old(_v2.OK);
  ensures _houdini_26 ==> in_c <= out_c;
  ensures _houdini_27 ==> out_c <= in_c;
  ensures _houdini_28 ==> in_position <= out_position;
  ensures _houdini_29 ==> out_position <= in_position;
  ensures _houdini_30 ==> in_temp <= out_temp;
  ensures _houdini_31 ==> out_temp <= in_temp;



procedure _v2.Find_loop_anon5_LoopHead(in_position: int, in_d: int) returns (out_position: int, out_d: int);
  modifies _v2.cf;
  free ensures {:io_dependency "cf", "cf", "in_d"} true;
  free ensures {:io_dependency "out_position", "in_position", "in_d", "array"} true;
  free ensures {:io_dependency "out_d", "in_d"} true;
  free ensures {:io_dependency "cf", "cf", "in_d"} true;
  free ensures {:io_dependency "out_position", "in_position", "in_d", "array"} true;
  free ensures {:io_dependency "out_d", "in_d"} true;
  free ensures _v2.OK ==> old(_v2.OK);
  ensures _houdini_62 ==> in_position <= out_position;
  ensures _houdini_63 ==> out_position <= in_position;
  ensures _houdini_64 ==> in_d <= out_d;
  ensures _houdini_65 ==> out_d <= in_d;



implementation _v2.SelectionSort()
{
  var c: int;
  var position: int;
  var temp: int;

  anon0:
    position, temp := 0, 0;
    c := 0;
    goto anon5_LoopHead;

  anon5_LoopHead:
    call c, position, temp := _v2.SelectionSort_loop_anon5_LoopHead(c, position, temp);
    goto anon5_LoopHead_last;

  anon5_LoopHead_last:
    goto anon5_LoopDone, anon5_LoopBody;

  anon5_LoopBody:
    assume {:partition} c < _v2.n - 1;
    _v2.cf := _v2.uif(_v2.cf, 1);
    call position := _v2.Find(c);
    goto anon6_Then, anon6_Else;

  anon6_Else:
    assume {:partition} position == c;
    goto anon3;

  anon3:
    _v2.cf := _v2.uif(_v2.cf, 3);
    c := c + 1;
    goto anon3_dummy;

  anon3_dummy:
    assume false;
    return;

  anon6_Then:
    assume {:partition} position != c;
    _v2.cf := _v2.uif(_v2.cf, 2);
    temp := _v2.array[position];
    _v2.array[position] := _v2.array[c];
    havoc temp;
    _v2.array[c] := temp;
    goto anon3;

  anon5_LoopDone:
    assume {:partition} _v2.n - 1 <= c;
    goto anon4;

  anon4:
    _v2.cf := _v2.uif(_v2.cf, 4);
    return;
}



implementation _v2.Find(c: int) returns (position: int)
{
  var d: int;

  anon0:
    position := c;
    d := c + 1;
    goto anon5_LoopHead;

  anon5_LoopHead:
    call position, d := _v2.Find_loop_anon5_LoopHead(position, d);
    goto anon5_LoopHead_last;

  anon5_LoopHead_last:
    goto anon5_LoopDone, anon5_LoopBody;

  anon5_LoopBody:
    assume {:partition} d < _v2.n;
    _v2.cf := _v2.uif(_v2.cf, 5);
    goto anon6_Then, anon6_Else;

  anon6_Else:
    assume {:partition} _v2.array[d] >= _v2.array[position];
    goto anon3;

  anon3:
    _v2.cf := _v2.uif(_v2.cf, 7);
    d := d + 1;
    goto anon3_dummy;

  anon3_dummy:
    assume false;
    return;

  anon6_Then:
    assume {:partition} _v2.array[position] > _v2.array[d];
    _v2.cf := _v2.uif(_v2.cf, 6);
    position := d;
    goto anon3;

  anon5_LoopDone:
    assume {:partition} _v2.n <= d;
    goto anon4;

  anon4:
    _v2.cf := _v2.uif(_v2.cf, 8);
    return;
}



implementation _v2.SelectionSort_loop_anon5_LoopHead(in_c: int, in_position: int, in_temp: int)
   returns (out_c: int, out_position: int, out_temp: int)
{

  entry:
    out_c, out_position, out_temp := in_c, in_position, in_temp;
    goto anon5_LoopHead;

  anon5_LoopHead:
    goto anon5_LoopDone, anon5_LoopBody;

  anon5_LoopBody:
    assume {:partition} out_c < _v2.n - 1;
    _v2.cf := _v2.uif(_v2.cf, 1);
    call out_position := _v2.Find(out_c);
    goto anon6_Then, anon6_Else;

  anon6_Else:
    assume {:partition} out_position == out_c;
    goto anon3;

  anon3:
    _v2.cf := _v2.uif(_v2.cf, 3);
    out_c := out_c + 1;
    goto anon3_dummy;

  anon3_dummy:
    call out_c, out_position, out_temp := _v2.SelectionSort_loop_anon5_LoopHead(out_c, out_position, out_temp);
    return;

  anon6_Then:
    assume {:partition} out_position != out_c;
    _v2.cf := _v2.uif(_v2.cf, 2);
    out_temp := _v2.array[out_position];
    _v2.array[out_position] := _v2.array[out_c];
    havoc out_temp;
    _v2.array[out_c] := out_temp;
    goto anon3;

  anon5_LoopDone:
    assume {:partition} _v2.n - 1 <= out_c;
    out_c, out_position, out_temp := in_c, in_position, in_temp;
    _v2.cf, _v2.array := old(_v2.cf), old(_v2.array);
    return;
}



implementation _v2.Find_loop_anon5_LoopHead(in_position: int, in_d: int) returns (out_position: int, out_d: int)
{

  entry:
    out_position, out_d := in_position, in_d;
    goto anon5_LoopHead;

  anon5_LoopHead:
    goto anon5_LoopDone, anon5_LoopBody;

  anon5_LoopBody:
    assume {:partition} out_d < _v2.n;
    _v2.cf := _v2.uif(_v2.cf, 5);
    goto anon6_Then, anon6_Else;

  anon6_Else:
    assume {:partition} _v2.array[out_d] >= _v2.array[out_position];
    goto anon3;

  anon3:
    _v2.cf := _v2.uif(_v2.cf, 7);
    out_d := out_d + 1;
    goto anon3_dummy;

  anon3_dummy:
    call out_position, out_d := _v2.Find_loop_anon5_LoopHead(out_position, out_d);
    return;

  anon6_Then:
    assume {:partition} _v2.array[out_position] > _v2.array[out_d];
    _v2.cf := _v2.uif(_v2.cf, 6);
    out_position := out_d;
    goto anon3;

  anon5_LoopDone:
    assume {:partition} _v2.n <= out_d;
    out_position, out_d := in_position, in_d;
    _v2.cf := old(_v2.cf);
    return;
}



var _v2.OK: bool;

var _v1.array: [int]int;

var _v1.cf: int;

const _v1.n: int;

axiom (forall a: [int]int, b: [int]int, i: int :: 
  { _v2.ArrEqAfter(a, b, i): bool } 
  _v2.ArrEqAfter(a, b, i): bool <==> (forall j: int :: j >= i ==> a[j] == b[j]));

procedure _v1.SelectionSort();
  modifies _v1.cf, _v1.array;
  free ensures {:io_dependency "cf", "cf"} true;
  free ensures {:io_dependency "array", "array"} true;
  free ensures {:io_dependency "cf", "cf"} true;
  free ensures {:io_dependency "array", "array"} true;
  free ensures _v1.OK ==> old(_v1.OK);



procedure _v1.Find(c: int) returns (position: int);
  modifies _v1.cf;
  free ensures {:io_dependency "cf", "cf", "c"} true;
  free ensures {:io_dependency "position", "c", "array"} true;
  free ensures {:io_dependency "cf", "cf", "c"} true;
  free ensures {:io_dependency "position", "c", "array"} true;
  free ensures _v1.OK ==> old(_v1.OK);



procedure _v1.SelectionSort_loop_anon5_LoopHead(in_c: int, in_position: int, in_temp: int)
   returns (out_c: int, out_position: int, out_temp: int);
  modifies _v1.cf, _v1.array;
  free ensures {:io_dependency "cf", "cf", "in_c"} true;
  free ensures {:io_dependency "array", "array", "in_c"} true;
  free ensures {:io_dependency "out_c", "in_c"} true;
  free ensures {:io_dependency "out_position", "in_position", "in_c", "array"} true;
  free ensures {:io_dependency "out_temp", "in_temp", "in_c", "array"} true;
  free ensures {:io_dependency "cf", "cf", "in_c"} true;
  free ensures {:io_dependency "array", "array", "in_c"} true;
  free ensures {:io_dependency "out_c", "in_c"} true;
  free ensures {:io_dependency "out_position", "in_position", "in_c", "array"} true;
  free ensures {:io_dependency "out_temp", "in_temp", "in_c", "array"} true;
  free ensures _v1.OK ==> old(_v1.OK);
  ensures _houdini_20 ==> in_c <= out_c;
  ensures _houdini_21 ==> out_c <= in_c;
  ensures _houdini_22 ==> in_position <= out_position;
  ensures _houdini_23 ==> out_position <= in_position;
  ensures _houdini_24 ==> in_temp <= out_temp;
  ensures _houdini_25 ==> out_temp <= in_temp;



procedure _v1.Find_loop_anon5_LoopHead(in_position: int, in_d: int) returns (out_position: int, out_d: int);
  modifies _v1.cf;
  free ensures {:io_dependency "cf", "cf", "in_d"} true;
  free ensures {:io_dependency "out_position", "in_position", "in_d", "array"} true;
  free ensures {:io_dependency "out_d", "in_d"} true;
  free ensures {:io_dependency "cf", "cf", "in_d"} true;
  free ensures {:io_dependency "out_position", "in_position", "in_d", "array"} true;
  free ensures {:io_dependency "out_d", "in_d"} true;
  free ensures _v1.OK ==> old(_v1.OK);
  ensures _houdini_58 ==> in_position <= out_position;
  ensures _houdini_59 ==> out_position <= in_position;
  ensures _houdini_60 ==> in_d <= out_d;
  ensures _houdini_61 ==> out_d <= in_d;



implementation _v1.SelectionSort()
{
  var c: int;
  var position: int;
  var temp: int;

  anon0:
    position, temp := 0, 0;
    c := 0;
    goto anon5_LoopHead;

  anon5_LoopHead:
    call c, position, temp := _v1.SelectionSort_loop_anon5_LoopHead(c, position, temp);
    goto anon5_LoopHead_last;

  anon5_LoopHead_last:
    goto anon5_LoopDone, anon5_LoopBody;

  anon5_LoopBody:
    assume {:partition} c < _v2.n - 1;
    _v1.cf := _v2.uif(_v1.cf, 1);
    call position := _v1.Find(c);
    goto anon6_Then, anon6_Else;

  anon6_Else:
    assume {:partition} position == c;
    goto anon3;

  anon3:
    _v1.cf := _v2.uif(_v1.cf, 3);
    c := c + 1;
    goto anon3_dummy;

  anon3_dummy:
    assume false;
    return;

  anon6_Then:
    assume {:partition} position != c;
    _v1.cf := _v2.uif(_v1.cf, 2);
    temp := _v1.array[position];
    _v1.array[position] := _v1.array[c];
    _v1.array[c] := temp;
    goto anon3;

  anon5_LoopDone:
    assume {:partition} _v2.n - 1 <= c;
    goto anon4;

  anon4:
    _v1.cf := _v2.uif(_v1.cf, 4);
    return;
}



implementation _v1.Find(c: int) returns (position: int)
{
  var d: int;

  anon0:
    position := c;
    d := c + 1;
    goto anon5_LoopHead;

  anon5_LoopHead:
    call position, d := _v1.Find_loop_anon5_LoopHead(position, d);
    goto anon5_LoopHead_last;

  anon5_LoopHead_last:
    goto anon5_LoopDone, anon5_LoopBody;

  anon5_LoopBody:
    assume {:partition} d < _v2.n;
    _v1.cf := _v2.uif(_v1.cf, 5);
    goto anon6_Then, anon6_Else;

  anon6_Else:
    assume {:partition} _v1.array[d] >= _v1.array[position];
    goto anon3;

  anon3:
    _v1.cf := _v2.uif(_v1.cf, 7);
    d := d + 1;
    goto anon3_dummy;

  anon3_dummy:
    assume false;
    return;

  anon6_Then:
    assume {:partition} _v1.array[position] > _v1.array[d];
    _v1.cf := _v2.uif(_v1.cf, 6);
    position := d;
    goto anon3;

  anon5_LoopDone:
    assume {:partition} _v2.n <= d;
    goto anon4;

  anon4:
    _v1.cf := _v2.uif(_v1.cf, 8);
    return;
}



implementation _v1.SelectionSort_loop_anon5_LoopHead(in_c: int, in_position: int, in_temp: int)
   returns (out_c: int, out_position: int, out_temp: int)
{

  entry:
    out_c, out_position, out_temp := in_c, in_position, in_temp;
    goto anon5_LoopHead;

  anon5_LoopHead:
    goto anon5_LoopDone, anon5_LoopBody;

  anon5_LoopBody:
    assume {:partition} out_c < _v2.n - 1;
    _v1.cf := _v2.uif(_v1.cf, 1);
    call out_position := _v1.Find(out_c);
    goto anon6_Then, anon6_Else;

  anon6_Else:
    assume {:partition} out_position == out_c;
    goto anon3;

  anon3:
    _v1.cf := _v2.uif(_v1.cf, 3);
    out_c := out_c + 1;
    goto anon3_dummy;

  anon3_dummy:
    call out_c, out_position, out_temp := _v1.SelectionSort_loop_anon5_LoopHead(out_c, out_position, out_temp);
    return;

  anon6_Then:
    assume {:partition} out_position != out_c;
    _v1.cf := _v2.uif(_v1.cf, 2);
    out_temp := _v1.array[out_position];
    _v1.array[out_position] := _v1.array[out_c];
    _v1.array[out_c] := out_temp;
    goto anon3;

  anon5_LoopDone:
    assume {:partition} _v2.n - 1 <= out_c;
    out_c, out_position, out_temp := in_c, in_position, in_temp;
    _v1.cf, _v1.array := old(_v1.cf), old(_v1.array);
    return;
}



implementation _v1.Find_loop_anon5_LoopHead(in_position: int, in_d: int) returns (out_position: int, out_d: int)
{

  entry:
    out_position, out_d := in_position, in_d;
    goto anon5_LoopHead;

  anon5_LoopHead:
    goto anon5_LoopDone, anon5_LoopBody;

  anon5_LoopBody:
    assume {:partition} out_d < _v2.n;
    _v1.cf := _v2.uif(_v1.cf, 5);
    goto anon6_Then, anon6_Else;

  anon6_Else:
    assume {:partition} _v1.array[out_d] >= _v1.array[out_position];
    goto anon3;

  anon3:
    _v1.cf := _v2.uif(_v1.cf, 7);
    out_d := out_d + 1;
    goto anon3_dummy;

  anon3_dummy:
    call out_position, out_d := _v1.Find_loop_anon5_LoopHead(out_position, out_d);
    return;

  anon6_Then:
    assume {:partition} _v1.array[out_position] > _v1.array[out_d];
    _v1.cf := _v2.uif(_v1.cf, 6);
    out_position := out_d;
    goto anon3;

  anon5_LoopDone:
    assume {:partition} _v2.n <= out_d;
    out_position, out_d := in_position, in_d;
    _v1.cf := old(_v1.cf);
    return;
}



var _v1.OK: bool;

function {:inline true} MS$_v1.SelectionSort$_v2.SelectionSort(_v1.array_old: [int]int, 
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

function {:inline true} MS$_v1.SelectionSort_loop_anon5_LoopHead$_v2.SelectionSort_loop_anon5_LoopHead(_v1.in_c: int, 
    _v1.in_position: int, 
    _v1.in_temp: int, 
    _v1.array_old: [int]int, 
    _v1.cf_old: int, 
    _v1.OK_old: bool, 
    _v1.cf_: int, 
    _v1.array_: [int]int, 
    _v1.out_c: int, 
    _v1.out_position: int, 
    _v1.out_temp: int, 
    _v2.in_c: int, 
    _v2.in_position: int, 
    _v2.in_temp: int, 
    _v2.array_old: [int]int, 
    _v2.cf_old: int, 
    _v2.OK_old: bool, 
    _v2.cf_: int, 
    _v2.array_: [int]int, 
    _v2.out_c: int, 
    _v2.out_position: int, 
    _v2.out_temp: int)
   : bool
{
  _v2.ArrEqAfter(_v1.array_old, _v2.array_old, _v1.in_c)
     && _v1.in_position == _v2.in_position
     && _v1.in_c == _v2.in_c
     && _v1.cf_old == _v2.cf_old
   ==> _v1.cf_ == _v2.cf_
}

function {:inline true} MS$_v1.Find$_v2.Find(_v1.c: int, 
    _v1.array_old: [int]int, 
    _v1.cf_old: int, 
    _v1.OK_old: bool, 
    _v1.cf_: int, 
    _v1.position: int, 
    _v2.c: int, 
    _v2.array_old: [int]int, 
    _v2.cf_old: int, 
    _v2.OK_old: bool, 
    _v2.cf_: int, 
    _v2.position: int)
   : bool
{
  _v2.ArrEqAfter(_v1.array_old, _v2.array_old, _v1.c)
     && _v1.c == _v2.c
     && _v1.cf_old == _v2.cf_old
   ==> _v1.position == _v2.position && _v1.cf_ == _v2.cf_
}

function {:inline true} MS$_v1.Find_loop_anon5_LoopHead$_v2.Find_loop_anon5_LoopHead(_v1.in_position: int, 
    _v1.in_d: int, 
    _v1.array_old: [int]int, 
    _v1.cf_old: int, 
    _v1.OK_old: bool, 
    _v1.cf_: int, 
    _v1.out_position: int, 
    _v1.out_d: int, 
    _v2.in_position: int, 
    _v2.in_d: int, 
    _v2.array_old: [int]int, 
    _v2.cf_old: int, 
    _v2.OK_old: bool, 
    _v2.cf_: int, 
    _v2.out_position: int, 
    _v2.out_d: int)
   : bool
{
  _v2.ArrEqAfter(_v1.array_old, _v2.array_old, _v1.in_d)
     && _v1.array_old[_v1.in_position] == _v2.array_old[_v1.in_position]
     && _v1.in_position == _v2.in_position
     && _v1.cf_old == _v2.cf_old
   ==> _v1.out_position == _v2.out_position
     && _v1.out_d == _v2.out_d
     && _v1.cf_ == _v2.cf_
}

function {:inline true} MS_pre_$_v1.SelectionSort$_v2.SelectionSort(_v1.array_old: [int]int, 
    _v1.cf_old: int, 
    _v1.OK_old: bool, 
    _v2.array_old: [int]int, 
    _v2.cf_old: int, 
    _v2.OK_old: bool)
   : bool
{
  true
}

procedure MS_Check__v1.SelectionSort___v2.SelectionSort();
  requires MS_pre_$_v1.SelectionSort$_v2.SelectionSort(_v1.array, _v1.cf, _v1.OK, _v2.array, _v2.cf, _v2.OK);
  requires _v1.array == _v2.array && _v1.cf == _v2.cf && (_v1.OK <==> _v2.OK);
  modifies _v1.cf, _v1.array, _v2.cf, _v2.array;
  ensures MS$_v1.SelectionSort$_v2.SelectionSort(old(_v1.array), 
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



implementation MS_Check__v1.SelectionSort___v2.SelectionSort()
{
  var inline$_v1.SelectionSort$0$c: int;
  var inline$_v1.SelectionSort$0$position: int;
  var inline$_v1.SelectionSort$0$temp: int;
  var inline$_v1.SelectionSort$0$_v1.cf: int;
  var inline$_v1.SelectionSort$0$_v1.array: [int]int;
  var inline$_v2.SelectionSort$0$c: int;
  var inline$_v2.SelectionSort$0$position: int;
  var inline$_v2.SelectionSort$0$temp: int;
  var inline$_v2.SelectionSort$0$_v2.cf: int;
  var inline$_v2.SelectionSort$0$_v2.array: [int]int;
  var _v1.SelectionSort_loop_anon5_LoopHead_1_done: bool;
  var _v1.SelectionSort_loop_anon5_LoopHead_in_1_0: int;
  var _v1.SelectionSort_loop_anon5_LoopHead_in_1_1: int;
  var _v1.SelectionSort_loop_anon5_LoopHead_in_1_2: int;
  var _v1.SelectionSort_loop_anon5_LoopHead_in_1_3: int;
  var _v1.SelectionSort_loop_anon5_LoopHead_in_1_4: [int]int;
  var _v1.SelectionSort_loop_anon5_LoopHead_out_1_0: int;
  var _v1.SelectionSort_loop_anon5_LoopHead_out_1_1: int;
  var _v1.SelectionSort_loop_anon5_LoopHead_out_1_2: int;
  var _v1.SelectionSort_loop_anon5_LoopHead_out_1_3: int;
  var _v1.SelectionSort_loop_anon5_LoopHead_out_1_4: [int]int;
  var _v1.Find_2_done: bool;
  var _v1.Find_in_2_0: int;
  var _v1.Find_in_2_1: int;
  var _v1.Find_in_2_2: [int]int;
  var _v1.Find_out_2_0: int;
  var _v1.Find_out_2_1: int;
  var _v2.SelectionSort_loop_anon5_LoopHead_3_done: bool;
  var _v2.SelectionSort_loop_anon5_LoopHead_in_3_0: int;
  var _v2.SelectionSort_loop_anon5_LoopHead_in_3_1: int;
  var _v2.SelectionSort_loop_anon5_LoopHead_in_3_2: int;
  var _v2.SelectionSort_loop_anon5_LoopHead_in_3_3: int;
  var _v2.SelectionSort_loop_anon5_LoopHead_in_3_4: [int]int;
  var _v2.SelectionSort_loop_anon5_LoopHead_out_3_0: int;
  var _v2.SelectionSort_loop_anon5_LoopHead_out_3_1: int;
  var _v2.SelectionSort_loop_anon5_LoopHead_out_3_2: int;
  var _v2.SelectionSort_loop_anon5_LoopHead_out_3_3: int;
  var _v2.SelectionSort_loop_anon5_LoopHead_out_3_4: [int]int;
  var _v2.Find_4_done: bool;
  var _v2.Find_in_4_0: int;
  var _v2.Find_in_4_1: int;
  var _v2.Find_in_4_2: [int]int;
  var _v2.Find_out_4_0: int;
  var _v2.Find_out_4_1: int;
  var store__0__v1.cf: int;
  var store__0__v1.array: [int]int;
  var store__0__v2.cf: int;
  var store__0__v2.array: [int]int;
  var out__v1.SelectionSort_loop_anon5_LoopHead_out_1_0_0: int;
  var out__v1.SelectionSort_loop_anon5_LoopHead_out_1_1_0: int;
  var out__v1.SelectionSort_loop_anon5_LoopHead_out_1_2_0: int;
  var out__v2.SelectionSort_loop_anon5_LoopHead_out_3_0_0: int;
  var out__v2.SelectionSort_loop_anon5_LoopHead_out_3_1_0: int;
  var out__v2.SelectionSort_loop_anon5_LoopHead_out_3_2_0: int;
  var store__1__v1.cf: int;
  var store__1__v1.array: [int]int;
  var store__1__v2.cf: int;
  var store__1__v2.array: [int]int;
  var out__v1.Find_out_2_0_1: int;
  var out__v2.Find_out_4_0_1: int;

  START:
    _v1.SelectionSort_loop_anon5_LoopHead_1_done, _v1.Find_2_done, _v2.SelectionSort_loop_anon5_LoopHead_3_done, _v2.Find_4_done := false, false, false, false;
    goto inline$_v1.SelectionSort$0$Entry;

  inline$_v1.SelectionSort$0$Entry:
    havoc inline$_v1.SelectionSort$0$c, inline$_v1.SelectionSort$0$position, inline$_v1.SelectionSort$0$temp;
    inline$_v1.SelectionSort$0$_v1.cf := _v1.cf;
    inline$_v1.SelectionSort$0$_v1.array := _v1.array;
    goto inline$_v1.SelectionSort$0$anon0;

  inline$_v1.SelectionSort$0$anon0:
    inline$_v1.SelectionSort$0$position, inline$_v1.SelectionSort$0$temp := 0, 0;
    inline$_v1.SelectionSort$0$c := 0;
    goto inline$_v1.SelectionSort$0$anon5_LoopHead;

  inline$_v1.SelectionSort$0$anon5_LoopHead:
    _v1.SelectionSort_loop_anon5_LoopHead_in_1_0, _v1.SelectionSort_loop_anon5_LoopHead_in_1_1, _v1.SelectionSort_loop_anon5_LoopHead_in_1_2, _v1.SelectionSort_loop_anon5_LoopHead_in_1_3, _v1.SelectionSort_loop_anon5_LoopHead_in_1_4 := inline$_v1.SelectionSort$0$c, inline$_v1.SelectionSort$0$position, inline$_v1.SelectionSort$0$temp, _v1.cf, _v1.array;
    call inline$_v1.SelectionSort$0$c, inline$_v1.SelectionSort$0$position, inline$_v1.SelectionSort$0$temp := _v1.SelectionSort_loop_anon5_LoopHead(inline$_v1.SelectionSort$0$c, inline$_v1.SelectionSort$0$position, inline$_v1.SelectionSort$0$temp);
    _v1.SelectionSort_loop_anon5_LoopHead_1_done := true;
    _v1.SelectionSort_loop_anon5_LoopHead_out_1_0, _v1.SelectionSort_loop_anon5_LoopHead_out_1_1, _v1.SelectionSort_loop_anon5_LoopHead_out_1_2, _v1.SelectionSort_loop_anon5_LoopHead_out_1_3, _v1.SelectionSort_loop_anon5_LoopHead_out_1_4 := inline$_v1.SelectionSort$0$c, inline$_v1.SelectionSort$0$position, inline$_v1.SelectionSort$0$temp, _v1.cf, _v1.array;
    goto inline$_v1.SelectionSort$0$anon5_LoopHead_last;

  inline$_v1.SelectionSort$0$anon5_LoopHead_last:
    goto inline$_v1.SelectionSort$0$anon5_LoopDone, inline$_v1.SelectionSort$0$anon5_LoopBody;

  inline$_v1.SelectionSort$0$anon5_LoopBody:
    assume {:partition} inline$_v1.SelectionSort$0$c < _v2.n - 1;
    _v1.cf := _v2.uif(_v1.cf, 1);
    _v1.Find_in_2_0, _v1.Find_in_2_1, _v1.Find_in_2_2 := inline$_v1.SelectionSort$0$c, _v1.cf, _v1.array;
    call inline$_v1.SelectionSort$0$position := _v1.Find(inline$_v1.SelectionSort$0$c);
    _v1.Find_2_done := true;
    _v1.Find_out_2_0, _v1.Find_out_2_1 := inline$_v1.SelectionSort$0$position, _v1.cf;
    goto inline$_v1.SelectionSort$0$anon6_Then, inline$_v1.SelectionSort$0$anon6_Else;

  inline$_v1.SelectionSort$0$anon6_Else:
    assume {:partition} inline$_v1.SelectionSort$0$position == inline$_v1.SelectionSort$0$c;
    goto inline$_v1.SelectionSort$0$anon3;

  inline$_v1.SelectionSort$0$anon3:
    _v1.cf := _v2.uif(_v1.cf, 3);
    inline$_v1.SelectionSort$0$c := inline$_v1.SelectionSort$0$c + 1;
    goto inline$_v1.SelectionSort$0$anon3_dummy;

  inline$_v1.SelectionSort$0$anon3_dummy:
    assume false;
    goto inline$_v1.SelectionSort$0$Return;

  inline$_v1.SelectionSort$0$anon6_Then:
    assume {:partition} inline$_v1.SelectionSort$0$position != inline$_v1.SelectionSort$0$c;
    _v1.cf := _v2.uif(_v1.cf, 2);
    inline$_v1.SelectionSort$0$temp := _v1.array[inline$_v1.SelectionSort$0$position];
    _v1.array[inline$_v1.SelectionSort$0$position] := _v1.array[inline$_v1.SelectionSort$0$c];
    _v1.array[inline$_v1.SelectionSort$0$c] := inline$_v1.SelectionSort$0$temp;
    goto inline$_v1.SelectionSort$0$anon3;

  inline$_v1.SelectionSort$0$anon5_LoopDone:
    assume {:partition} _v2.n - 1 <= inline$_v1.SelectionSort$0$c;
    goto inline$_v1.SelectionSort$0$anon4;

  inline$_v1.SelectionSort$0$anon4:
    _v1.cf := _v2.uif(_v1.cf, 4);
    goto inline$_v1.SelectionSort$0$Return;

  inline$_v1.SelectionSort$0$Return:
    assume true;
    assume true;
    assume true;
    assume true;
    assume true;
    goto START$1;

  START$1:
    goto inline$_v2.SelectionSort$0$Entry;

  inline$_v2.SelectionSort$0$Entry:
    havoc inline$_v2.SelectionSort$0$c, inline$_v2.SelectionSort$0$position, inline$_v2.SelectionSort$0$temp;
    inline$_v2.SelectionSort$0$_v2.cf := _v2.cf;
    inline$_v2.SelectionSort$0$_v2.array := _v2.array;
    goto inline$_v2.SelectionSort$0$anon0;

  inline$_v2.SelectionSort$0$anon0:
    inline$_v2.SelectionSort$0$position, inline$_v2.SelectionSort$0$temp := 0, 0;
    inline$_v2.SelectionSort$0$c := 0;
    goto inline$_v2.SelectionSort$0$anon5_LoopHead;

  inline$_v2.SelectionSort$0$anon5_LoopHead:
    _v2.SelectionSort_loop_anon5_LoopHead_in_3_0, _v2.SelectionSort_loop_anon5_LoopHead_in_3_1, _v2.SelectionSort_loop_anon5_LoopHead_in_3_2, _v2.SelectionSort_loop_anon5_LoopHead_in_3_3, _v2.SelectionSort_loop_anon5_LoopHead_in_3_4 := inline$_v2.SelectionSort$0$c, inline$_v2.SelectionSort$0$position, inline$_v2.SelectionSort$0$temp, _v2.cf, _v2.array;
    call inline$_v2.SelectionSort$0$c, inline$_v2.SelectionSort$0$position, inline$_v2.SelectionSort$0$temp := _v2.SelectionSort_loop_anon5_LoopHead(inline$_v2.SelectionSort$0$c, inline$_v2.SelectionSort$0$position, inline$_v2.SelectionSort$0$temp);
    _v2.SelectionSort_loop_anon5_LoopHead_3_done := true;
    _v2.SelectionSort_loop_anon5_LoopHead_out_3_0, _v2.SelectionSort_loop_anon5_LoopHead_out_3_1, _v2.SelectionSort_loop_anon5_LoopHead_out_3_2, _v2.SelectionSort_loop_anon5_LoopHead_out_3_3, _v2.SelectionSort_loop_anon5_LoopHead_out_3_4 := inline$_v2.SelectionSort$0$c, inline$_v2.SelectionSort$0$position, inline$_v2.SelectionSort$0$temp, _v2.cf, _v2.array;
    goto inline$_v2.SelectionSort$0$anon5_LoopHead_last;

  inline$_v2.SelectionSort$0$anon5_LoopHead_last:
    goto inline$_v2.SelectionSort$0$anon5_LoopDone, inline$_v2.SelectionSort$0$anon5_LoopBody;

  inline$_v2.SelectionSort$0$anon5_LoopBody:
    assume {:partition} inline$_v2.SelectionSort$0$c < _v2.n - 1;
    _v2.cf := _v2.uif(_v2.cf, 1);
    _v2.Find_in_4_0, _v2.Find_in_4_1, _v2.Find_in_4_2 := inline$_v2.SelectionSort$0$c, _v2.cf, _v2.array;
    call inline$_v2.SelectionSort$0$position := _v2.Find(inline$_v2.SelectionSort$0$c);
    _v2.Find_4_done := true;
    _v2.Find_out_4_0, _v2.Find_out_4_1 := inline$_v2.SelectionSort$0$position, _v2.cf;
    goto inline$_v2.SelectionSort$0$anon6_Then, inline$_v2.SelectionSort$0$anon6_Else;

  inline$_v2.SelectionSort$0$anon6_Else:
    assume {:partition} inline$_v2.SelectionSort$0$position == inline$_v2.SelectionSort$0$c;
    goto inline$_v2.SelectionSort$0$anon3;

  inline$_v2.SelectionSort$0$anon3:
    _v2.cf := _v2.uif(_v2.cf, 3);
    inline$_v2.SelectionSort$0$c := inline$_v2.SelectionSort$0$c + 1;
    goto inline$_v2.SelectionSort$0$anon3_dummy;

  inline$_v2.SelectionSort$0$anon3_dummy:
    assume false;
    goto inline$_v2.SelectionSort$0$Return;

  inline$_v2.SelectionSort$0$anon6_Then:
    assume {:partition} inline$_v2.SelectionSort$0$position != inline$_v2.SelectionSort$0$c;
    _v2.cf := _v2.uif(_v2.cf, 2);
    inline$_v2.SelectionSort$0$temp := _v2.array[inline$_v2.SelectionSort$0$position];
    _v2.array[inline$_v2.SelectionSort$0$position] := _v2.array[inline$_v2.SelectionSort$0$c];
    havoc inline$_v2.SelectionSort$0$temp;
    _v2.array[inline$_v2.SelectionSort$0$c] := inline$_v2.SelectionSort$0$temp;
    goto inline$_v2.SelectionSort$0$anon3;

  inline$_v2.SelectionSort$0$anon5_LoopDone:
    assume {:partition} _v2.n - 1 <= inline$_v2.SelectionSort$0$c;
    goto inline$_v2.SelectionSort$0$anon4;

  inline$_v2.SelectionSort$0$anon4:
    _v2.cf := _v2.uif(_v2.cf, 4);
    goto inline$_v2.SelectionSort$0$Return;

  inline$_v2.SelectionSort$0$Return:
    assume true;
    assume true;
    assume true;
    assume true;
    assume true;
    goto START$2;

  START$2:
    goto MS_L_0_1;

  MS_L_0_0:
    goto MS_L_taken_0, MS_L_not_taken_0;

  MS_L_taken_0:
    assume _v1.SelectionSort_loop_anon5_LoopHead_1_done
   && _v2.SelectionSort_loop_anon5_LoopHead_3_done;
    store__0__v1.cf, store__0__v1.array := _v1.cf, _v1.array;
    store__0__v2.cf, store__0__v2.array := _v2.cf, _v2.array;
    _v1.cf, _v1.array := _v1.SelectionSort_loop_anon5_LoopHead_in_1_3, _v1.SelectionSort_loop_anon5_LoopHead_in_1_4;
    _v2.cf, _v2.array := _v2.SelectionSort_loop_anon5_LoopHead_in_3_3, _v2.SelectionSort_loop_anon5_LoopHead_in_3_4;
    call out__v1.SelectionSort_loop_anon5_LoopHead_out_1_0_0, out__v1.SelectionSort_loop_anon5_LoopHead_out_1_1_0, out__v1.SelectionSort_loop_anon5_LoopHead_out_1_2_0, out__v2.SelectionSort_loop_anon5_LoopHead_out_3_0_0, out__v2.SelectionSort_loop_anon5_LoopHead_out_3_1_0, out__v2.SelectionSort_loop_anon5_LoopHead_out_3_2_0 := MS_Check__v1.SelectionSort_loop_anon5_LoopHead___v2.SelectionSort_loop_anon5_LoopHead(_v1.SelectionSort_loop_anon5_LoopHead_in_1_0, _v1.SelectionSort_loop_anon5_LoopHead_in_1_1, _v1.SelectionSort_loop_anon5_LoopHead_in_1_2, _v2.SelectionSort_loop_anon5_LoopHead_in_3_0, _v2.SelectionSort_loop_anon5_LoopHead_in_3_1, _v2.SelectionSort_loop_anon5_LoopHead_in_3_2);
    assume _v1.cf == _v1.SelectionSort_loop_anon5_LoopHead_out_1_3
   && _v1.array == _v1.SelectionSort_loop_anon5_LoopHead_out_1_4;
    assume _v2.cf == _v2.SelectionSort_loop_anon5_LoopHead_out_3_3
   && _v2.array == _v2.SelectionSort_loop_anon5_LoopHead_out_3_4;
    assume _v1.SelectionSort_loop_anon5_LoopHead_out_1_0
     == out__v1.SelectionSort_loop_anon5_LoopHead_out_1_0_0
   && _v1.SelectionSort_loop_anon5_LoopHead_out_1_1
     == out__v1.SelectionSort_loop_anon5_LoopHead_out_1_1_0
   && _v1.SelectionSort_loop_anon5_LoopHead_out_1_2
     == out__v1.SelectionSort_loop_anon5_LoopHead_out_1_2_0
   && _v2.SelectionSort_loop_anon5_LoopHead_out_3_0
     == out__v2.SelectionSort_loop_anon5_LoopHead_out_3_0_0
   && _v2.SelectionSort_loop_anon5_LoopHead_out_3_1
     == out__v2.SelectionSort_loop_anon5_LoopHead_out_3_1_0
   && _v2.SelectionSort_loop_anon5_LoopHead_out_3_2
     == out__v2.SelectionSort_loop_anon5_LoopHead_out_3_2_0;
    _v1.cf, _v1.array := store__0__v1.cf, store__0__v1.array;
    _v2.cf, _v2.array := store__0__v2.cf, store__0__v2.array;
    goto MS_L_meet_0;

  MS_L_not_taken_0:
    assume !(_v1.SelectionSort_loop_anon5_LoopHead_1_done
   && _v2.SelectionSort_loop_anon5_LoopHead_3_done);
    goto MS_L_meet_0;

  MS_L_meet_0:
    return;

  MS_L_0_1:
    goto MS_L_taken_1, MS_L_not_taken_1;

  MS_L_taken_1:
    assume _v1.Find_2_done && _v2.Find_4_done;
    store__1__v1.cf, store__1__v1.array := _v1.cf, _v1.array;
    store__1__v2.cf, store__1__v2.array := _v2.cf, _v2.array;
    _v1.cf, _v1.array := _v1.Find_in_2_1, _v1.Find_in_2_2;
    _v2.cf, _v2.array := _v2.Find_in_4_1, _v2.Find_in_4_2;
    call out__v1.Find_out_2_0_1, out__v2.Find_out_4_0_1 := MS_Check__v1.Find___v2.Find(_v1.Find_in_2_0, _v2.Find_in_4_0);
    assume _v1.cf == _v1.Find_out_2_1;
    assume _v2.cf == _v2.Find_out_4_1;
    assume _v1.Find_out_2_0 == out__v1.Find_out_2_0_1
   && _v2.Find_out_4_0 == out__v2.Find_out_4_0_1;
    _v1.cf, _v1.array := store__1__v1.cf, store__1__v1.array;
    _v2.cf, _v2.array := store__1__v2.cf, store__1__v2.array;
    goto MS_L_meet_1;

  MS_L_not_taken_1:
    assume !(_v1.Find_2_done && _v2.Find_4_done);
    goto MS_L_meet_1;

  MS_L_meet_1:
    goto MS_L_0_0;
}



function {:inline true} MS_pre_$_v1.SelectionSort_loop_anon5_LoopHead$_v2.SelectionSort_loop_anon5_LoopHead(_v1.in_c: int, 
    _v1.in_position: int, 
    _v1.in_temp: int, 
    _v1.array_old: [int]int, 
    _v1.cf_old: int, 
    _v1.OK_old: bool, 
    _v2.in_c: int, 
    _v2.in_position: int, 
    _v2.in_temp: int, 
    _v2.array_old: [int]int, 
    _v2.cf_old: int, 
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

const {:existential true} _houdini_27: bool;

const {:existential true} _houdini_28: bool;

const {:existential true} _houdini_29: bool;

const {:existential true} _houdini_30: bool;

const {:existential true} _houdini_31: bool;

procedure MS_Check__v1.SelectionSort_loop_anon5_LoopHead___v2.SelectionSort_loop_anon5_LoopHead(_v1.in_c: int, 
    _v1.in_position: int, 
    _v1.in_temp: int, 
    _v2.in_c: int, 
    _v2.in_position: int, 
    _v2.in_temp: int)
   returns (_v1.out_c: int, 
    _v1.out_position: int, 
    _v1.out_temp: int, 
    _v2.out_c: int, 
    _v2.out_position: int, 
    _v2.out_temp: int);
  requires MS_pre_$_v1.SelectionSort_loop_anon5_LoopHead$_v2.SelectionSort_loop_anon5_LoopHead(_v1.in_c, 
  _v1.in_position, 
  _v1.in_temp, 
  _v1.array, 
  _v1.cf, 
  _v1.OK, 
  _v2.in_c, 
  _v2.in_position, 
  _v2.in_temp, 
  _v2.array, 
  _v2.cf, 
  _v2.OK);
  requires _houdini_9 ==> _v1.in_c <= _v2.in_c;
  requires _houdini_10 ==> _v2.in_c <= _v1.in_c;
  requires _houdini_11 ==> _v1.in_position <= _v2.in_position;
  requires _houdini_12 ==> _v2.in_position <= _v1.in_position;
  requires _houdini_13 ==> _v1.in_temp <= _v2.in_temp;
  requires _houdini_14 ==> _v2.in_temp <= _v1.in_temp;
  requires _houdini_15 ==> _v1.array == _v2.array;
  requires _houdini_16 ==> _v1.cf <= _v2.cf;
  requires _houdini_17 ==> _v2.cf <= _v1.cf;
  requires _houdini_18 ==> _v1.OK ==> _v2.OK;
  requires _houdini_19 ==> _v2.OK ==> _v1.OK;
  modifies _v1.cf, _v1.array, _v2.cf, _v2.array;
  ensures MS$_v1.SelectionSort_loop_anon5_LoopHead$_v2.SelectionSort_loop_anon5_LoopHead(_v1.in_c, 
  _v1.in_position, 
  _v1.in_temp, 
  old(_v1.array), 
  old(_v1.cf), 
  old(_v1.OK), 
  _v1.cf, 
  _v1.array, 
  _v1.out_c, 
  _v1.out_position, 
  _v1.out_temp, 
  _v2.in_c, 
  _v2.in_position, 
  _v2.in_temp, 
  old(_v2.array), 
  old(_v2.cf), 
  old(_v2.OK), 
  _v2.cf, 
  _v2.array, 
  _v2.out_c, 
  _v2.out_position, 
  _v2.out_temp);
  ensures _houdini_0 ==> _v1.out_c <= _v2.out_c;
  ensures _houdini_1 ==> _v2.out_c <= _v1.out_c;
  ensures _houdini_2 ==> _v1.out_position <= _v2.out_position;
  ensures _houdini_3 ==> _v2.out_position <= _v1.out_position;
  ensures _houdini_4 ==> _v1.out_temp <= _v2.out_temp;
  ensures _houdini_5 ==> _v2.out_temp <= _v1.out_temp;
  ensures _houdini_6 ==> _v1.cf <= _v2.cf;
  ensures _houdini_7 ==> _v2.cf <= _v1.cf;
  ensures _houdini_8 ==> _v1.array == _v2.array;



implementation MS_Check__v1.SelectionSort_loop_anon5_LoopHead___v2.SelectionSort_loop_anon5_LoopHead(_v1.in_c: int, 
    _v1.in_position: int, 
    _v1.in_temp: int, 
    _v2.in_c: int, 
    _v2.in_position: int, 
    _v2.in_temp: int)
   returns (_v1.out_c: int, 
    _v1.out_position: int, 
    _v1.out_temp: int, 
    _v2.out_c: int, 
    _v2.out_position: int, 
    _v2.out_temp: int)
{
  var inline$_v1.SelectionSort_loop_anon5_LoopHead$0$in_c: int;
  var inline$_v1.SelectionSort_loop_anon5_LoopHead$0$in_position: int;
  var inline$_v1.SelectionSort_loop_anon5_LoopHead$0$in_temp: int;
  var inline$_v1.SelectionSort_loop_anon5_LoopHead$0$out_c: int;
  var inline$_v1.SelectionSort_loop_anon5_LoopHead$0$out_position: int;
  var inline$_v1.SelectionSort_loop_anon5_LoopHead$0$out_temp: int;
  var inline$_v1.SelectionSort_loop_anon5_LoopHead$0$_v1.cf: int;
  var inline$_v1.SelectionSort_loop_anon5_LoopHead$0$_v1.array: [int]int;
  var inline$_v2.SelectionSort_loop_anon5_LoopHead$0$in_c: int;
  var inline$_v2.SelectionSort_loop_anon5_LoopHead$0$in_position: int;
  var inline$_v2.SelectionSort_loop_anon5_LoopHead$0$in_temp: int;
  var inline$_v2.SelectionSort_loop_anon5_LoopHead$0$out_c: int;
  var inline$_v2.SelectionSort_loop_anon5_LoopHead$0$out_position: int;
  var inline$_v2.SelectionSort_loop_anon5_LoopHead$0$out_temp: int;
  var inline$_v2.SelectionSort_loop_anon5_LoopHead$0$_v2.cf: int;
  var inline$_v2.SelectionSort_loop_anon5_LoopHead$0$_v2.array: [int]int;
  var _v1.Find_1_done: bool;
  var _v1.Find_in_1_0: int;
  var _v1.Find_in_1_1: int;
  var _v1.Find_in_1_2: [int]int;
  var _v1.Find_out_1_0: int;
  var _v1.Find_out_1_1: int;
  var _v1.SelectionSort_loop_anon5_LoopHead_2_done: bool;
  var _v1.SelectionSort_loop_anon5_LoopHead_in_2_0: int;
  var _v1.SelectionSort_loop_anon5_LoopHead_in_2_1: int;
  var _v1.SelectionSort_loop_anon5_LoopHead_in_2_2: int;
  var _v1.SelectionSort_loop_anon5_LoopHead_in_2_3: int;
  var _v1.SelectionSort_loop_anon5_LoopHead_in_2_4: [int]int;
  var _v1.SelectionSort_loop_anon5_LoopHead_out_2_0: int;
  var _v1.SelectionSort_loop_anon5_LoopHead_out_2_1: int;
  var _v1.SelectionSort_loop_anon5_LoopHead_out_2_2: int;
  var _v1.SelectionSort_loop_anon5_LoopHead_out_2_3: int;
  var _v1.SelectionSort_loop_anon5_LoopHead_out_2_4: [int]int;
  var _v2.Find_3_done: bool;
  var _v2.Find_in_3_0: int;
  var _v2.Find_in_3_1: int;
  var _v2.Find_in_3_2: [int]int;
  var _v2.Find_out_3_0: int;
  var _v2.Find_out_3_1: int;
  var _v2.SelectionSort_loop_anon5_LoopHead_4_done: bool;
  var _v2.SelectionSort_loop_anon5_LoopHead_in_4_0: int;
  var _v2.SelectionSort_loop_anon5_LoopHead_in_4_1: int;
  var _v2.SelectionSort_loop_anon5_LoopHead_in_4_2: int;
  var _v2.SelectionSort_loop_anon5_LoopHead_in_4_3: int;
  var _v2.SelectionSort_loop_anon5_LoopHead_in_4_4: [int]int;
  var _v2.SelectionSort_loop_anon5_LoopHead_out_4_0: int;
  var _v2.SelectionSort_loop_anon5_LoopHead_out_4_1: int;
  var _v2.SelectionSort_loop_anon5_LoopHead_out_4_2: int;
  var _v2.SelectionSort_loop_anon5_LoopHead_out_4_3: int;
  var _v2.SelectionSort_loop_anon5_LoopHead_out_4_4: [int]int;
  var store__0__v1.cf: int;
  var store__0__v1.array: [int]int;
  var store__0__v2.cf: int;
  var store__0__v2.array: [int]int;
  var out__v1.Find_out_1_0_0: int;
  var out__v2.Find_out_3_0_0: int;
  var store__1__v1.cf: int;
  var store__1__v1.array: [int]int;
  var store__1__v2.cf: int;
  var store__1__v2.array: [int]int;
  var out__v1.SelectionSort_loop_anon5_LoopHead_out_2_0_1: int;
  var out__v1.SelectionSort_loop_anon5_LoopHead_out_2_1_1: int;
  var out__v1.SelectionSort_loop_anon5_LoopHead_out_2_2_1: int;
  var out__v2.SelectionSort_loop_anon5_LoopHead_out_4_0_1: int;
  var out__v2.SelectionSort_loop_anon5_LoopHead_out_4_1_1: int;
  var out__v2.SelectionSort_loop_anon5_LoopHead_out_4_2_1: int;

  START:
    _v1.Find_1_done, _v1.SelectionSort_loop_anon5_LoopHead_2_done, _v2.Find_3_done, _v2.SelectionSort_loop_anon5_LoopHead_4_done := false, false, false, false;
    goto inline$_v1.SelectionSort_loop_anon5_LoopHead$0$Entry;

  inline$_v1.SelectionSort_loop_anon5_LoopHead$0$Entry:
    inline$_v1.SelectionSort_loop_anon5_LoopHead$0$in_c := _v1.in_c;
    inline$_v1.SelectionSort_loop_anon5_LoopHead$0$in_position := _v1.in_position;
    inline$_v1.SelectionSort_loop_anon5_LoopHead$0$in_temp := _v1.in_temp;
    havoc inline$_v1.SelectionSort_loop_anon5_LoopHead$0$out_c, inline$_v1.SelectionSort_loop_anon5_LoopHead$0$out_position, inline$_v1.SelectionSort_loop_anon5_LoopHead$0$out_temp;
    inline$_v1.SelectionSort_loop_anon5_LoopHead$0$_v1.cf := _v1.cf;
    inline$_v1.SelectionSort_loop_anon5_LoopHead$0$_v1.array := _v1.array;
    goto inline$_v1.SelectionSort_loop_anon5_LoopHead$0$entry;

  inline$_v1.SelectionSort_loop_anon5_LoopHead$0$entry:
    inline$_v1.SelectionSort_loop_anon5_LoopHead$0$out_c, inline$_v1.SelectionSort_loop_anon5_LoopHead$0$out_position, inline$_v1.SelectionSort_loop_anon5_LoopHead$0$out_temp := inline$_v1.SelectionSort_loop_anon5_LoopHead$0$in_c, inline$_v1.SelectionSort_loop_anon5_LoopHead$0$in_position, inline$_v1.SelectionSort_loop_anon5_LoopHead$0$in_temp;
    goto inline$_v1.SelectionSort_loop_anon5_LoopHead$0$anon5_LoopHead;

  inline$_v1.SelectionSort_loop_anon5_LoopHead$0$anon5_LoopHead:
    goto inline$_v1.SelectionSort_loop_anon5_LoopHead$0$anon5_LoopDone, inline$_v1.SelectionSort_loop_anon5_LoopHead$0$anon5_LoopBody;

  inline$_v1.SelectionSort_loop_anon5_LoopHead$0$anon5_LoopBody:
    assume {:partition} inline$_v1.SelectionSort_loop_anon5_LoopHead$0$out_c < _v2.n - 1;
    _v1.cf := _v2.uif(_v1.cf, 1);
    _v1.Find_in_1_0, _v1.Find_in_1_1, _v1.Find_in_1_2 := inline$_v1.SelectionSort_loop_anon5_LoopHead$0$out_c, _v1.cf, _v1.array;
    call inline$_v1.SelectionSort_loop_anon5_LoopHead$0$out_position := _v1.Find(inline$_v1.SelectionSort_loop_anon5_LoopHead$0$out_c);
    _v1.Find_1_done := true;
    _v1.Find_out_1_0, _v1.Find_out_1_1 := inline$_v1.SelectionSort_loop_anon5_LoopHead$0$out_position, _v1.cf;
    goto inline$_v1.SelectionSort_loop_anon5_LoopHead$0$anon6_Then, inline$_v1.SelectionSort_loop_anon5_LoopHead$0$anon6_Else;

  inline$_v1.SelectionSort_loop_anon5_LoopHead$0$anon6_Else:
    assume {:partition} inline$_v1.SelectionSort_loop_anon5_LoopHead$0$out_position
   == inline$_v1.SelectionSort_loop_anon5_LoopHead$0$out_c;
    goto inline$_v1.SelectionSort_loop_anon5_LoopHead$0$anon3;

  inline$_v1.SelectionSort_loop_anon5_LoopHead$0$anon3:
    _v1.cf := _v2.uif(_v1.cf, 3);
    inline$_v1.SelectionSort_loop_anon5_LoopHead$0$out_c := inline$_v1.SelectionSort_loop_anon5_LoopHead$0$out_c + 1;
    goto inline$_v1.SelectionSort_loop_anon5_LoopHead$0$anon3_dummy;

  inline$_v1.SelectionSort_loop_anon5_LoopHead$0$anon3_dummy:
    _v1.SelectionSort_loop_anon5_LoopHead_in_2_0, _v1.SelectionSort_loop_anon5_LoopHead_in_2_1, _v1.SelectionSort_loop_anon5_LoopHead_in_2_2, _v1.SelectionSort_loop_anon5_LoopHead_in_2_3, _v1.SelectionSort_loop_anon5_LoopHead_in_2_4 := inline$_v1.SelectionSort_loop_anon5_LoopHead$0$out_c, inline$_v1.SelectionSort_loop_anon5_LoopHead$0$out_position, inline$_v1.SelectionSort_loop_anon5_LoopHead$0$out_temp, _v1.cf, _v1.array;
    call inline$_v1.SelectionSort_loop_anon5_LoopHead$0$out_c, inline$_v1.SelectionSort_loop_anon5_LoopHead$0$out_position, inline$_v1.SelectionSort_loop_anon5_LoopHead$0$out_temp := _v1.SelectionSort_loop_anon5_LoopHead(inline$_v1.SelectionSort_loop_anon5_LoopHead$0$out_c, inline$_v1.SelectionSort_loop_anon5_LoopHead$0$out_position, inline$_v1.SelectionSort_loop_anon5_LoopHead$0$out_temp);
    _v1.SelectionSort_loop_anon5_LoopHead_2_done := true;
    _v1.SelectionSort_loop_anon5_LoopHead_out_2_0, _v1.SelectionSort_loop_anon5_LoopHead_out_2_1, _v1.SelectionSort_loop_anon5_LoopHead_out_2_2, _v1.SelectionSort_loop_anon5_LoopHead_out_2_3, _v1.SelectionSort_loop_anon5_LoopHead_out_2_4 := inline$_v1.SelectionSort_loop_anon5_LoopHead$0$out_c, inline$_v1.SelectionSort_loop_anon5_LoopHead$0$out_position, inline$_v1.SelectionSort_loop_anon5_LoopHead$0$out_temp, _v1.cf, _v1.array;
    goto inline$_v1.SelectionSort_loop_anon5_LoopHead$0$Return;

  inline$_v1.SelectionSort_loop_anon5_LoopHead$0$anon6_Then:
    assume {:partition} inline$_v1.SelectionSort_loop_anon5_LoopHead$0$out_position
   != inline$_v1.SelectionSort_loop_anon5_LoopHead$0$out_c;
    _v1.cf := _v2.uif(_v1.cf, 2);
    inline$_v1.SelectionSort_loop_anon5_LoopHead$0$out_temp := _v1.array[inline$_v1.SelectionSort_loop_anon5_LoopHead$0$out_position];
    _v1.array[inline$_v1.SelectionSort_loop_anon5_LoopHead$0$out_position] := _v1.array[inline$_v1.SelectionSort_loop_anon5_LoopHead$0$out_c];
    _v1.array[inline$_v1.SelectionSort_loop_anon5_LoopHead$0$out_c] := inline$_v1.SelectionSort_loop_anon5_LoopHead$0$out_temp;
    goto inline$_v1.SelectionSort_loop_anon5_LoopHead$0$anon3;

  inline$_v1.SelectionSort_loop_anon5_LoopHead$0$anon5_LoopDone:
    assume {:partition} _v2.n - 1 <= inline$_v1.SelectionSort_loop_anon5_LoopHead$0$out_c;
    inline$_v1.SelectionSort_loop_anon5_LoopHead$0$out_c, inline$_v1.SelectionSort_loop_anon5_LoopHead$0$out_position, inline$_v1.SelectionSort_loop_anon5_LoopHead$0$out_temp := inline$_v1.SelectionSort_loop_anon5_LoopHead$0$in_c, inline$_v1.SelectionSort_loop_anon5_LoopHead$0$in_position, inline$_v1.SelectionSort_loop_anon5_LoopHead$0$in_temp;
    _v1.cf, _v1.array := inline$_v1.SelectionSort_loop_anon5_LoopHead$0$_v1.cf, inline$_v1.SelectionSort_loop_anon5_LoopHead$0$_v1.array;
    goto inline$_v1.SelectionSort_loop_anon5_LoopHead$0$Return;

  inline$_v1.SelectionSort_loop_anon5_LoopHead$0$Return:
    assume true;
    assume true;
    assume true;
    assume true;
    assume true;
    assume true;
    assume true;
    assume true;
    assume true;
    assume true;
    assume true;
    assert _houdini_20
   ==> inline$_v1.SelectionSort_loop_anon5_LoopHead$0$in_c
     <= inline$_v1.SelectionSort_loop_anon5_LoopHead$0$out_c;
    assert _houdini_21
   ==> inline$_v1.SelectionSort_loop_anon5_LoopHead$0$out_c
     <= inline$_v1.SelectionSort_loop_anon5_LoopHead$0$in_c;
    assert _houdini_22
   ==> inline$_v1.SelectionSort_loop_anon5_LoopHead$0$in_position
     <= inline$_v1.SelectionSort_loop_anon5_LoopHead$0$out_position;
    assert _houdini_23
   ==> inline$_v1.SelectionSort_loop_anon5_LoopHead$0$out_position
     <= inline$_v1.SelectionSort_loop_anon5_LoopHead$0$in_position;
    assert _houdini_24
   ==> inline$_v1.SelectionSort_loop_anon5_LoopHead$0$in_temp
     <= inline$_v1.SelectionSort_loop_anon5_LoopHead$0$out_temp;
    assert _houdini_25
   ==> inline$_v1.SelectionSort_loop_anon5_LoopHead$0$out_temp
     <= inline$_v1.SelectionSort_loop_anon5_LoopHead$0$in_temp;
    _v1.out_c := inline$_v1.SelectionSort_loop_anon5_LoopHead$0$out_c;
    _v1.out_position := inline$_v1.SelectionSort_loop_anon5_LoopHead$0$out_position;
    _v1.out_temp := inline$_v1.SelectionSort_loop_anon5_LoopHead$0$out_temp;
    goto START$1;

  START$1:
    goto inline$_v2.SelectionSort_loop_anon5_LoopHead$0$Entry;

  inline$_v2.SelectionSort_loop_anon5_LoopHead$0$Entry:
    inline$_v2.SelectionSort_loop_anon5_LoopHead$0$in_c := _v2.in_c;
    inline$_v2.SelectionSort_loop_anon5_LoopHead$0$in_position := _v2.in_position;
    inline$_v2.SelectionSort_loop_anon5_LoopHead$0$in_temp := _v2.in_temp;
    havoc inline$_v2.SelectionSort_loop_anon5_LoopHead$0$out_c, inline$_v2.SelectionSort_loop_anon5_LoopHead$0$out_position, inline$_v2.SelectionSort_loop_anon5_LoopHead$0$out_temp;
    inline$_v2.SelectionSort_loop_anon5_LoopHead$0$_v2.cf := _v2.cf;
    inline$_v2.SelectionSort_loop_anon5_LoopHead$0$_v2.array := _v2.array;
    goto inline$_v2.SelectionSort_loop_anon5_LoopHead$0$entry;

  inline$_v2.SelectionSort_loop_anon5_LoopHead$0$entry:
    inline$_v2.SelectionSort_loop_anon5_LoopHead$0$out_c, inline$_v2.SelectionSort_loop_anon5_LoopHead$0$out_position, inline$_v2.SelectionSort_loop_anon5_LoopHead$0$out_temp := inline$_v2.SelectionSort_loop_anon5_LoopHead$0$in_c, inline$_v2.SelectionSort_loop_anon5_LoopHead$0$in_position, inline$_v2.SelectionSort_loop_anon5_LoopHead$0$in_temp;
    goto inline$_v2.SelectionSort_loop_anon5_LoopHead$0$anon5_LoopHead;

  inline$_v2.SelectionSort_loop_anon5_LoopHead$0$anon5_LoopHead:
    goto inline$_v2.SelectionSort_loop_anon5_LoopHead$0$anon5_LoopDone, inline$_v2.SelectionSort_loop_anon5_LoopHead$0$anon5_LoopBody;

  inline$_v2.SelectionSort_loop_anon5_LoopHead$0$anon5_LoopBody:
    assume {:partition} inline$_v2.SelectionSort_loop_anon5_LoopHead$0$out_c < _v2.n - 1;
    _v2.cf := _v2.uif(_v2.cf, 1);
    _v2.Find_in_3_0, _v2.Find_in_3_1, _v2.Find_in_3_2 := inline$_v2.SelectionSort_loop_anon5_LoopHead$0$out_c, _v2.cf, _v2.array;
    call inline$_v2.SelectionSort_loop_anon5_LoopHead$0$out_position := _v2.Find(inline$_v2.SelectionSort_loop_anon5_LoopHead$0$out_c);
    _v2.Find_3_done := true;
    _v2.Find_out_3_0, _v2.Find_out_3_1 := inline$_v2.SelectionSort_loop_anon5_LoopHead$0$out_position, _v2.cf;
    goto inline$_v2.SelectionSort_loop_anon5_LoopHead$0$anon6_Then, inline$_v2.SelectionSort_loop_anon5_LoopHead$0$anon6_Else;

  inline$_v2.SelectionSort_loop_anon5_LoopHead$0$anon6_Else:
    assume {:partition} inline$_v2.SelectionSort_loop_anon5_LoopHead$0$out_position
   == inline$_v2.SelectionSort_loop_anon5_LoopHead$0$out_c;
    goto inline$_v2.SelectionSort_loop_anon5_LoopHead$0$anon3;

  inline$_v2.SelectionSort_loop_anon5_LoopHead$0$anon3:
    _v2.cf := _v2.uif(_v2.cf, 3);
    inline$_v2.SelectionSort_loop_anon5_LoopHead$0$out_c := inline$_v2.SelectionSort_loop_anon5_LoopHead$0$out_c + 1;
    goto inline$_v2.SelectionSort_loop_anon5_LoopHead$0$anon3_dummy;

  inline$_v2.SelectionSort_loop_anon5_LoopHead$0$anon3_dummy:
    _v2.SelectionSort_loop_anon5_LoopHead_in_4_0, _v2.SelectionSort_loop_anon5_LoopHead_in_4_1, _v2.SelectionSort_loop_anon5_LoopHead_in_4_2, _v2.SelectionSort_loop_anon5_LoopHead_in_4_3, _v2.SelectionSort_loop_anon5_LoopHead_in_4_4 := inline$_v2.SelectionSort_loop_anon5_LoopHead$0$out_c, inline$_v2.SelectionSort_loop_anon5_LoopHead$0$out_position, inline$_v2.SelectionSort_loop_anon5_LoopHead$0$out_temp, _v2.cf, _v2.array;
    call inline$_v2.SelectionSort_loop_anon5_LoopHead$0$out_c, inline$_v2.SelectionSort_loop_anon5_LoopHead$0$out_position, inline$_v2.SelectionSort_loop_anon5_LoopHead$0$out_temp := _v2.SelectionSort_loop_anon5_LoopHead(inline$_v2.SelectionSort_loop_anon5_LoopHead$0$out_c, inline$_v2.SelectionSort_loop_anon5_LoopHead$0$out_position, inline$_v2.SelectionSort_loop_anon5_LoopHead$0$out_temp);
    _v2.SelectionSort_loop_anon5_LoopHead_4_done := true;
    _v2.SelectionSort_loop_anon5_LoopHead_out_4_0, _v2.SelectionSort_loop_anon5_LoopHead_out_4_1, _v2.SelectionSort_loop_anon5_LoopHead_out_4_2, _v2.SelectionSort_loop_anon5_LoopHead_out_4_3, _v2.SelectionSort_loop_anon5_LoopHead_out_4_4 := inline$_v2.SelectionSort_loop_anon5_LoopHead$0$out_c, inline$_v2.SelectionSort_loop_anon5_LoopHead$0$out_position, inline$_v2.SelectionSort_loop_anon5_LoopHead$0$out_temp, _v2.cf, _v2.array;
    goto inline$_v2.SelectionSort_loop_anon5_LoopHead$0$Return;

  inline$_v2.SelectionSort_loop_anon5_LoopHead$0$anon6_Then:
    assume {:partition} inline$_v2.SelectionSort_loop_anon5_LoopHead$0$out_position
   != inline$_v2.SelectionSort_loop_anon5_LoopHead$0$out_c;
    _v2.cf := _v2.uif(_v2.cf, 2);
    inline$_v2.SelectionSort_loop_anon5_LoopHead$0$out_temp := _v2.array[inline$_v2.SelectionSort_loop_anon5_LoopHead$0$out_position];
    _v2.array[inline$_v2.SelectionSort_loop_anon5_LoopHead$0$out_position] := _v2.array[inline$_v2.SelectionSort_loop_anon5_LoopHead$0$out_c];
    havoc inline$_v2.SelectionSort_loop_anon5_LoopHead$0$out_temp;
    _v2.array[inline$_v2.SelectionSort_loop_anon5_LoopHead$0$out_c] := inline$_v2.SelectionSort_loop_anon5_LoopHead$0$out_temp;
    goto inline$_v2.SelectionSort_loop_anon5_LoopHead$0$anon3;

  inline$_v2.SelectionSort_loop_anon5_LoopHead$0$anon5_LoopDone:
    assume {:partition} _v2.n - 1 <= inline$_v2.SelectionSort_loop_anon5_LoopHead$0$out_c;
    inline$_v2.SelectionSort_loop_anon5_LoopHead$0$out_c, inline$_v2.SelectionSort_loop_anon5_LoopHead$0$out_position, inline$_v2.SelectionSort_loop_anon5_LoopHead$0$out_temp := inline$_v2.SelectionSort_loop_anon5_LoopHead$0$in_c, inline$_v2.SelectionSort_loop_anon5_LoopHead$0$in_position, inline$_v2.SelectionSort_loop_anon5_LoopHead$0$in_temp;
    _v2.cf, _v2.array := inline$_v2.SelectionSort_loop_anon5_LoopHead$0$_v2.cf, inline$_v2.SelectionSort_loop_anon5_LoopHead$0$_v2.array;
    goto inline$_v2.SelectionSort_loop_anon5_LoopHead$0$Return;

  inline$_v2.SelectionSort_loop_anon5_LoopHead$0$Return:
    assume true;
    assume true;
    assume true;
    assume true;
    assume true;
    assume true;
    assume true;
    assume true;
    assume true;
    assume true;
    assume true;
    assert _houdini_26
   ==> inline$_v2.SelectionSort_loop_anon5_LoopHead$0$in_c
     <= inline$_v2.SelectionSort_loop_anon5_LoopHead$0$out_c;
    assert _houdini_27
   ==> inline$_v2.SelectionSort_loop_anon5_LoopHead$0$out_c
     <= inline$_v2.SelectionSort_loop_anon5_LoopHead$0$in_c;
    assert _houdini_28
   ==> inline$_v2.SelectionSort_loop_anon5_LoopHead$0$in_position
     <= inline$_v2.SelectionSort_loop_anon5_LoopHead$0$out_position;
    assert _houdini_29
   ==> inline$_v2.SelectionSort_loop_anon5_LoopHead$0$out_position
     <= inline$_v2.SelectionSort_loop_anon5_LoopHead$0$in_position;
    assert _houdini_30
   ==> inline$_v2.SelectionSort_loop_anon5_LoopHead$0$in_temp
     <= inline$_v2.SelectionSort_loop_anon5_LoopHead$0$out_temp;
    assert _houdini_31
   ==> inline$_v2.SelectionSort_loop_anon5_LoopHead$0$out_temp
     <= inline$_v2.SelectionSort_loop_anon5_LoopHead$0$in_temp;
    _v2.out_c := inline$_v2.SelectionSort_loop_anon5_LoopHead$0$out_c;
    _v2.out_position := inline$_v2.SelectionSort_loop_anon5_LoopHead$0$out_position;
    _v2.out_temp := inline$_v2.SelectionSort_loop_anon5_LoopHead$0$out_temp;
    goto START$2;

  START$2:
    goto MS_L_0_1;

  MS_L_0_0:
    goto MS_L_taken_0, MS_L_not_taken_0;

  MS_L_taken_0:
    assume _v1.Find_1_done && _v2.Find_3_done;
    store__0__v1.cf, store__0__v1.array := _v1.cf, _v1.array;
    store__0__v2.cf, store__0__v2.array := _v2.cf, _v2.array;
    _v1.cf, _v1.array := _v1.Find_in_1_1, _v1.Find_in_1_2;
    _v2.cf, _v2.array := _v2.Find_in_3_1, _v2.Find_in_3_2;
    call out__v1.Find_out_1_0_0, out__v2.Find_out_3_0_0 := MS_Check__v1.Find___v2.Find(_v1.Find_in_1_0, _v2.Find_in_3_0);
    assume _v1.cf == _v1.Find_out_1_1;
    assume _v2.cf == _v2.Find_out_3_1;
    assume _v1.Find_out_1_0 == out__v1.Find_out_1_0_0
   && _v2.Find_out_3_0 == out__v2.Find_out_3_0_0;
    _v1.cf, _v1.array := store__0__v1.cf, store__0__v1.array;
    _v2.cf, _v2.array := store__0__v2.cf, store__0__v2.array;
    goto MS_L_meet_0;

  MS_L_not_taken_0:
    assume !(_v1.Find_1_done && _v2.Find_3_done);
    goto MS_L_meet_0;

  MS_L_meet_0:
    return;

  MS_L_0_1:
    goto MS_L_taken_1, MS_L_not_taken_1;

  MS_L_taken_1:
    assume _v1.SelectionSort_loop_anon5_LoopHead_2_done
   && _v2.SelectionSort_loop_anon5_LoopHead_4_done;
    store__1__v1.cf, store__1__v1.array := _v1.cf, _v1.array;
    store__1__v2.cf, store__1__v2.array := _v2.cf, _v2.array;
    _v1.cf, _v1.array := _v1.SelectionSort_loop_anon5_LoopHead_in_2_3, _v1.SelectionSort_loop_anon5_LoopHead_in_2_4;
    _v2.cf, _v2.array := _v2.SelectionSort_loop_anon5_LoopHead_in_4_3, _v2.SelectionSort_loop_anon5_LoopHead_in_4_4;
    call out__v1.SelectionSort_loop_anon5_LoopHead_out_2_0_1, out__v1.SelectionSort_loop_anon5_LoopHead_out_2_1_1, out__v1.SelectionSort_loop_anon5_LoopHead_out_2_2_1, out__v2.SelectionSort_loop_anon5_LoopHead_out_4_0_1, out__v2.SelectionSort_loop_anon5_LoopHead_out_4_1_1, out__v2.SelectionSort_loop_anon5_LoopHead_out_4_2_1 := MS_Check__v1.SelectionSort_loop_anon5_LoopHead___v2.SelectionSort_loop_anon5_LoopHead(_v1.SelectionSort_loop_anon5_LoopHead_in_2_0, _v1.SelectionSort_loop_anon5_LoopHead_in_2_1, _v1.SelectionSort_loop_anon5_LoopHead_in_2_2, _v2.SelectionSort_loop_anon5_LoopHead_in_4_0, _v2.SelectionSort_loop_anon5_LoopHead_in_4_1, _v2.SelectionSort_loop_anon5_LoopHead_in_4_2);
    assume _v1.cf == _v1.SelectionSort_loop_anon5_LoopHead_out_2_3
   && _v1.array == _v1.SelectionSort_loop_anon5_LoopHead_out_2_4;
    assume _v2.cf == _v2.SelectionSort_loop_anon5_LoopHead_out_4_3
   && _v2.array == _v2.SelectionSort_loop_anon5_LoopHead_out_4_4;
    assume _v1.SelectionSort_loop_anon5_LoopHead_out_2_0
     == out__v1.SelectionSort_loop_anon5_LoopHead_out_2_0_1
   && _v1.SelectionSort_loop_anon5_LoopHead_out_2_1
     == out__v1.SelectionSort_loop_anon5_LoopHead_out_2_1_1
   && _v1.SelectionSort_loop_anon5_LoopHead_out_2_2
     == out__v1.SelectionSort_loop_anon5_LoopHead_out_2_2_1
   && _v2.SelectionSort_loop_anon5_LoopHead_out_4_0
     == out__v2.SelectionSort_loop_anon5_LoopHead_out_4_0_1
   && _v2.SelectionSort_loop_anon5_LoopHead_out_4_1
     == out__v2.SelectionSort_loop_anon5_LoopHead_out_4_1_1
   && _v2.SelectionSort_loop_anon5_LoopHead_out_4_2
     == out__v2.SelectionSort_loop_anon5_LoopHead_out_4_2_1;
    _v1.cf, _v1.array := store__1__v1.cf, store__1__v1.array;
    _v2.cf, _v2.array := store__1__v2.cf, store__1__v2.array;
    goto MS_L_meet_1;

  MS_L_not_taken_1:
    assume !(_v1.SelectionSort_loop_anon5_LoopHead_2_done
   && _v2.SelectionSort_loop_anon5_LoopHead_4_done);
    goto MS_L_meet_1;

  MS_L_meet_1:
    goto MS_L_0_0;
}



function {:inline true} MS_pre_$_v1.Find$_v2.Find(_v1.c: int, 
    _v1.array_old: [int]int, 
    _v1.cf_old: int, 
    _v1.OK_old: bool, 
    _v2.c: int, 
    _v2.array_old: [int]int, 
    _v2.cf_old: int, 
    _v2.OK_old: bool)
   : bool
{
  true
}

const {:existential true} _houdini_32: bool;

const {:existential true} _houdini_33: bool;

const {:existential true} _houdini_34: bool;

const {:existential true} _houdini_35: bool;

const {:existential true} _houdini_36: bool;

const {:existential true} _houdini_37: bool;

const {:existential true} _houdini_38: bool;

const {:existential true} _houdini_39: bool;

const {:existential true} _houdini_40: bool;

const {:existential true} _houdini_41: bool;

const {:existential true} _houdini_42: bool;

procedure MS_Check__v1.Find___v2.Find(_v1.c: int, _v2.c: int) returns (_v1.position: int, _v2.position: int);
  requires MS_pre_$_v1.Find$_v2.Find(_v1.c, _v1.array, _v1.cf, _v1.OK, _v2.c, _v2.array, _v2.cf, _v2.OK);
  requires _houdini_36 ==> _v1.c <= _v2.c;
  requires _houdini_37 ==> _v2.c <= _v1.c;
  requires _houdini_38 ==> _v1.array == _v2.array;
  requires _houdini_39 ==> _v1.cf <= _v2.cf;
  requires _houdini_40 ==> _v2.cf <= _v1.cf;
  requires _houdini_41 ==> _v1.OK ==> _v2.OK;
  requires _houdini_42 ==> _v2.OK ==> _v1.OK;
  modifies _v1.cf, _v2.cf;
  ensures MS$_v1.Find$_v2.Find(_v1.c, 
  old(_v1.array), 
  old(_v1.cf), 
  old(_v1.OK), 
  _v1.cf, 
  _v1.position, 
  _v2.c, 
  old(_v2.array), 
  old(_v2.cf), 
  old(_v2.OK), 
  _v2.cf, 
  _v2.position);
  ensures _houdini_32 ==> _v1.position <= _v2.position;
  ensures _houdini_33 ==> _v2.position <= _v1.position;
  ensures _houdini_34 ==> _v1.cf <= _v2.cf;
  ensures _houdini_35 ==> _v2.cf <= _v1.cf;



implementation MS_Check__v1.Find___v2.Find(_v1.c: int, _v2.c: int) returns (_v1.position: int, _v2.position: int)
{
  var inline$_v1.Find$0$d: int;
  var inline$_v1.Find$0$c: int;
  var inline$_v1.Find$0$position: int;
  var inline$_v1.Find$0$_v1.cf: int;
  var inline$_v2.Find$0$d: int;
  var inline$_v2.Find$0$c: int;
  var inline$_v2.Find$0$position: int;
  var inline$_v2.Find$0$_v2.cf: int;
  var _v1.Find_loop_anon5_LoopHead_1_done: bool;
  var _v1.Find_loop_anon5_LoopHead_in_1_0: int;
  var _v1.Find_loop_anon5_LoopHead_in_1_1: int;
  var _v1.Find_loop_anon5_LoopHead_in_1_2: int;
  var _v1.Find_loop_anon5_LoopHead_out_1_0: int;
  var _v1.Find_loop_anon5_LoopHead_out_1_1: int;
  var _v1.Find_loop_anon5_LoopHead_out_1_2: int;
  var _v2.Find_loop_anon5_LoopHead_2_done: bool;
  var _v2.Find_loop_anon5_LoopHead_in_2_0: int;
  var _v2.Find_loop_anon5_LoopHead_in_2_1: int;
  var _v2.Find_loop_anon5_LoopHead_in_2_2: int;
  var _v2.Find_loop_anon5_LoopHead_out_2_0: int;
  var _v2.Find_loop_anon5_LoopHead_out_2_1: int;
  var _v2.Find_loop_anon5_LoopHead_out_2_2: int;
  var store__0__v1.cf: int;
  var store__0__v2.cf: int;
  var out__v1.Find_loop_anon5_LoopHead_out_1_0_0: int;
  var out__v1.Find_loop_anon5_LoopHead_out_1_1_0: int;
  var out__v2.Find_loop_anon5_LoopHead_out_2_0_0: int;
  var out__v2.Find_loop_anon5_LoopHead_out_2_1_0: int;

  START:
    _v1.Find_loop_anon5_LoopHead_1_done, _v2.Find_loop_anon5_LoopHead_2_done := false, false;
    goto inline$_v1.Find$0$Entry;

  inline$_v1.Find$0$Entry:
    inline$_v1.Find$0$c := _v1.c;
    havoc inline$_v1.Find$0$d, inline$_v1.Find$0$position;
    inline$_v1.Find$0$_v1.cf := _v1.cf;
    goto inline$_v1.Find$0$anon0;

  inline$_v1.Find$0$anon0:
    inline$_v1.Find$0$position := inline$_v1.Find$0$c;
    inline$_v1.Find$0$d := inline$_v1.Find$0$c + 1;
    goto inline$_v1.Find$0$anon5_LoopHead;

  inline$_v1.Find$0$anon5_LoopHead:
    _v1.Find_loop_anon5_LoopHead_in_1_0, _v1.Find_loop_anon5_LoopHead_in_1_1, _v1.Find_loop_anon5_LoopHead_in_1_2 := inline$_v1.Find$0$position, inline$_v1.Find$0$d, _v1.cf;
    call inline$_v1.Find$0$position, inline$_v1.Find$0$d := _v1.Find_loop_anon5_LoopHead(inline$_v1.Find$0$position, inline$_v1.Find$0$d);
    _v1.Find_loop_anon5_LoopHead_1_done := true;
    _v1.Find_loop_anon5_LoopHead_out_1_0, _v1.Find_loop_anon5_LoopHead_out_1_1, _v1.Find_loop_anon5_LoopHead_out_1_2 := inline$_v1.Find$0$position, inline$_v1.Find$0$d, _v1.cf;
    goto inline$_v1.Find$0$anon5_LoopHead_last;

  inline$_v1.Find$0$anon5_LoopHead_last:
    goto inline$_v1.Find$0$anon5_LoopDone, inline$_v1.Find$0$anon5_LoopBody;

  inline$_v1.Find$0$anon5_LoopBody:
    assume {:partition} inline$_v1.Find$0$d < _v2.n;
    _v1.cf := _v2.uif(_v1.cf, 5);
    goto inline$_v1.Find$0$anon6_Then, inline$_v1.Find$0$anon6_Else;

  inline$_v1.Find$0$anon6_Else:
    assume {:partition} _v1.array[inline$_v1.Find$0$d] >= _v1.array[inline$_v1.Find$0$position];
    goto inline$_v1.Find$0$anon3;

  inline$_v1.Find$0$anon3:
    _v1.cf := _v2.uif(_v1.cf, 7);
    inline$_v1.Find$0$d := inline$_v1.Find$0$d + 1;
    goto inline$_v1.Find$0$anon3_dummy;

  inline$_v1.Find$0$anon3_dummy:
    assume false;
    goto inline$_v1.Find$0$Return;

  inline$_v1.Find$0$anon6_Then:
    assume {:partition} _v1.array[inline$_v1.Find$0$position] > _v1.array[inline$_v1.Find$0$d];
    _v1.cf := _v2.uif(_v1.cf, 6);
    inline$_v1.Find$0$position := inline$_v1.Find$0$d;
    goto inline$_v1.Find$0$anon3;

  inline$_v1.Find$0$anon5_LoopDone:
    assume {:partition} _v2.n <= inline$_v1.Find$0$d;
    goto inline$_v1.Find$0$anon4;

  inline$_v1.Find$0$anon4:
    _v1.cf := _v2.uif(_v1.cf, 8);
    goto inline$_v1.Find$0$Return;

  inline$_v1.Find$0$Return:
    assume true;
    assume true;
    assume true;
    assume true;
    assume true;
    _v1.position := inline$_v1.Find$0$position;
    goto START$1;

  START$1:
    goto inline$_v2.Find$0$Entry;

  inline$_v2.Find$0$Entry:
    inline$_v2.Find$0$c := _v2.c;
    havoc inline$_v2.Find$0$d, inline$_v2.Find$0$position;
    inline$_v2.Find$0$_v2.cf := _v2.cf;
    goto inline$_v2.Find$0$anon0;

  inline$_v2.Find$0$anon0:
    inline$_v2.Find$0$position := inline$_v2.Find$0$c;
    inline$_v2.Find$0$d := inline$_v2.Find$0$c + 1;
    goto inline$_v2.Find$0$anon5_LoopHead;

  inline$_v2.Find$0$anon5_LoopHead:
    _v2.Find_loop_anon5_LoopHead_in_2_0, _v2.Find_loop_anon5_LoopHead_in_2_1, _v2.Find_loop_anon5_LoopHead_in_2_2 := inline$_v2.Find$0$position, inline$_v2.Find$0$d, _v2.cf;
    call inline$_v2.Find$0$position, inline$_v2.Find$0$d := _v2.Find_loop_anon5_LoopHead(inline$_v2.Find$0$position, inline$_v2.Find$0$d);
    _v2.Find_loop_anon5_LoopHead_2_done := true;
    _v2.Find_loop_anon5_LoopHead_out_2_0, _v2.Find_loop_anon5_LoopHead_out_2_1, _v2.Find_loop_anon5_LoopHead_out_2_2 := inline$_v2.Find$0$position, inline$_v2.Find$0$d, _v2.cf;
    goto inline$_v2.Find$0$anon5_LoopHead_last;

  inline$_v2.Find$0$anon5_LoopHead_last:
    goto inline$_v2.Find$0$anon5_LoopDone, inline$_v2.Find$0$anon5_LoopBody;

  inline$_v2.Find$0$anon5_LoopBody:
    assume {:partition} inline$_v2.Find$0$d < _v2.n;
    _v2.cf := _v2.uif(_v2.cf, 5);
    goto inline$_v2.Find$0$anon6_Then, inline$_v2.Find$0$anon6_Else;

  inline$_v2.Find$0$anon6_Else:
    assume {:partition} _v2.array[inline$_v2.Find$0$d] >= _v2.array[inline$_v2.Find$0$position];
    goto inline$_v2.Find$0$anon3;

  inline$_v2.Find$0$anon3:
    _v2.cf := _v2.uif(_v2.cf, 7);
    inline$_v2.Find$0$d := inline$_v2.Find$0$d + 1;
    goto inline$_v2.Find$0$anon3_dummy;

  inline$_v2.Find$0$anon3_dummy:
    assume false;
    goto inline$_v2.Find$0$Return;

  inline$_v2.Find$0$anon6_Then:
    assume {:partition} _v2.array[inline$_v2.Find$0$position] > _v2.array[inline$_v2.Find$0$d];
    _v2.cf := _v2.uif(_v2.cf, 6);
    inline$_v2.Find$0$position := inline$_v2.Find$0$d;
    goto inline$_v2.Find$0$anon3;

  inline$_v2.Find$0$anon5_LoopDone:
    assume {:partition} _v2.n <= inline$_v2.Find$0$d;
    goto inline$_v2.Find$0$anon4;

  inline$_v2.Find$0$anon4:
    _v2.cf := _v2.uif(_v2.cf, 8);
    goto inline$_v2.Find$0$Return;

  inline$_v2.Find$0$Return:
    assume true;
    assume true;
    assume true;
    assume true;
    assume true;
    _v2.position := inline$_v2.Find$0$position;
    goto START$2;

  START$2:
    goto MS_L_0_0;

  MS_L_0_0:
    goto MS_L_taken_0, MS_L_not_taken_0;

  MS_L_taken_0:
    assume _v1.Find_loop_anon5_LoopHead_1_done && _v2.Find_loop_anon5_LoopHead_2_done;
    store__0__v1.cf := _v1.cf;
    store__0__v2.cf := _v2.cf;
    _v1.cf := _v1.Find_loop_anon5_LoopHead_in_1_2;
    _v2.cf := _v2.Find_loop_anon5_LoopHead_in_2_2;
    call out__v1.Find_loop_anon5_LoopHead_out_1_0_0, out__v1.Find_loop_anon5_LoopHead_out_1_1_0, out__v2.Find_loop_anon5_LoopHead_out_2_0_0, out__v2.Find_loop_anon5_LoopHead_out_2_1_0 := MS_Check__v1.Find_loop_anon5_LoopHead___v2.Find_loop_anon5_LoopHead(_v1.Find_loop_anon5_LoopHead_in_1_0, _v1.Find_loop_anon5_LoopHead_in_1_1, _v2.Find_loop_anon5_LoopHead_in_2_0, _v2.Find_loop_anon5_LoopHead_in_2_1);
    assume _v1.cf == _v1.Find_loop_anon5_LoopHead_out_1_2;
    assume _v2.cf == _v2.Find_loop_anon5_LoopHead_out_2_2;
    assume _v1.Find_loop_anon5_LoopHead_out_1_0
     == out__v1.Find_loop_anon5_LoopHead_out_1_0_0
   && _v1.Find_loop_anon5_LoopHead_out_1_1
     == out__v1.Find_loop_anon5_LoopHead_out_1_1_0
   && _v2.Find_loop_anon5_LoopHead_out_2_0
     == out__v2.Find_loop_anon5_LoopHead_out_2_0_0
   && _v2.Find_loop_anon5_LoopHead_out_2_1
     == out__v2.Find_loop_anon5_LoopHead_out_2_1_0;
    _v1.cf := store__0__v1.cf;
    _v2.cf := store__0__v2.cf;
    goto MS_L_meet_0;

  MS_L_not_taken_0:
    assume !(_v1.Find_loop_anon5_LoopHead_1_done && _v2.Find_loop_anon5_LoopHead_2_done);
    goto MS_L_meet_0;

  MS_L_meet_0:
    return;
}



function {:inline true} MS_pre_$_v1.Find_loop_anon5_LoopHead$_v2.Find_loop_anon5_LoopHead(_v1.in_position: int, 
    _v1.in_d: int, 
    _v1.array_old: [int]int, 
    _v1.cf_old: int, 
    _v1.OK_old: bool, 
    _v2.in_position: int, 
    _v2.in_d: int, 
    _v2.array_old: [int]int, 
    _v2.cf_old: int, 
    _v2.OK_old: bool)
   : bool
{
  true
}

const {:existential true} _houdini_43: bool;

const {:existential true} _houdini_44: bool;

const {:existential true} _houdini_45: bool;

const {:existential true} _houdini_46: bool;

const {:existential true} _houdini_47: bool;

const {:existential true} _houdini_48: bool;

const {:existential true} _houdini_49: bool;

const {:existential true} _houdini_50: bool;

const {:existential true} _houdini_51: bool;

const {:existential true} _houdini_52: bool;

const {:existential true} _houdini_53: bool;

const {:existential true} _houdini_54: bool;

const {:existential true} _houdini_55: bool;

const {:existential true} _houdini_56: bool;

const {:existential true} _houdini_57: bool;

const {:existential true} _houdini_58: bool;

const {:existential true} _houdini_59: bool;

const {:existential true} _houdini_60: bool;

const {:existential true} _houdini_61: bool;

const {:existential true} _houdini_62: bool;

const {:existential true} _houdini_63: bool;

const {:existential true} _houdini_64: bool;

const {:existential true} _houdini_65: bool;

procedure MS_Check__v1.Find_loop_anon5_LoopHead___v2.Find_loop_anon5_LoopHead(_v1.in_position: int, _v1.in_d: int, _v2.in_position: int, _v2.in_d: int)
   returns (_v1.out_position: int, _v1.out_d: int, _v2.out_position: int, _v2.out_d: int);
  requires MS_pre_$_v1.Find_loop_anon5_LoopHead$_v2.Find_loop_anon5_LoopHead(_v1.in_position, 
  _v1.in_d, 
  _v1.array, 
  _v1.cf, 
  _v1.OK, 
  _v2.in_position, 
  _v2.in_d, 
  _v2.array, 
  _v2.cf, 
  _v2.OK);
  requires _houdini_49 ==> _v1.in_position <= _v2.in_position;
  requires _houdini_50 ==> _v2.in_position <= _v1.in_position;
  requires _houdini_51 ==> _v1.in_d <= _v2.in_d;
  requires _houdini_52 ==> _v2.in_d <= _v1.in_d;
  requires _houdini_53 ==> _v1.array == _v2.array;
  requires _houdini_54 ==> _v1.cf <= _v2.cf;
  requires _houdini_55 ==> _v2.cf <= _v1.cf;
  requires _houdini_56 ==> _v1.OK ==> _v2.OK;
  requires _houdini_57 ==> _v2.OK ==> _v1.OK;
  modifies _v1.cf, _v2.cf;
  ensures MS$_v1.Find_loop_anon5_LoopHead$_v2.Find_loop_anon5_LoopHead(_v1.in_position, 
  _v1.in_d, 
  old(_v1.array), 
  old(_v1.cf), 
  old(_v1.OK), 
  _v1.cf, 
  _v1.out_position, 
  _v1.out_d, 
  _v2.in_position, 
  _v2.in_d, 
  old(_v2.array), 
  old(_v2.cf), 
  old(_v2.OK), 
  _v2.cf, 
  _v2.out_position, 
  _v2.out_d);
  ensures _houdini_43 ==> _v1.out_position <= _v2.out_position;
  ensures _houdini_44 ==> _v2.out_position <= _v1.out_position;
  ensures _houdini_45 ==> _v1.out_d <= _v2.out_d;
  ensures _houdini_46 ==> _v2.out_d <= _v1.out_d;
  ensures _houdini_47 ==> _v1.cf <= _v2.cf;
  ensures _houdini_48 ==> _v2.cf <= _v1.cf;



implementation MS_Check__v1.Find_loop_anon5_LoopHead___v2.Find_loop_anon5_LoopHead(_v1.in_position: int, _v1.in_d: int, _v2.in_position: int, _v2.in_d: int)
   returns (_v1.out_position: int, _v1.out_d: int, _v2.out_position: int, _v2.out_d: int)
{
  var inline$_v1.Find_loop_anon5_LoopHead$0$in_position: int;
  var inline$_v1.Find_loop_anon5_LoopHead$0$in_d: int;
  var inline$_v1.Find_loop_anon5_LoopHead$0$out_position: int;
  var inline$_v1.Find_loop_anon5_LoopHead$0$out_d: int;
  var inline$_v1.Find_loop_anon5_LoopHead$0$_v1.cf: int;
  var inline$_v2.Find_loop_anon5_LoopHead$0$in_position: int;
  var inline$_v2.Find_loop_anon5_LoopHead$0$in_d: int;
  var inline$_v2.Find_loop_anon5_LoopHead$0$out_position: int;
  var inline$_v2.Find_loop_anon5_LoopHead$0$out_d: int;
  var inline$_v2.Find_loop_anon5_LoopHead$0$_v2.cf: int;
  var _v1.Find_loop_anon5_LoopHead_1_done: bool;
  var _v1.Find_loop_anon5_LoopHead_in_1_0: int;
  var _v1.Find_loop_anon5_LoopHead_in_1_1: int;
  var _v1.Find_loop_anon5_LoopHead_in_1_2: int;
  var _v1.Find_loop_anon5_LoopHead_out_1_0: int;
  var _v1.Find_loop_anon5_LoopHead_out_1_1: int;
  var _v1.Find_loop_anon5_LoopHead_out_1_2: int;
  var _v2.Find_loop_anon5_LoopHead_2_done: bool;
  var _v2.Find_loop_anon5_LoopHead_in_2_0: int;
  var _v2.Find_loop_anon5_LoopHead_in_2_1: int;
  var _v2.Find_loop_anon5_LoopHead_in_2_2: int;
  var _v2.Find_loop_anon5_LoopHead_out_2_0: int;
  var _v2.Find_loop_anon5_LoopHead_out_2_1: int;
  var _v2.Find_loop_anon5_LoopHead_out_2_2: int;
  var store__0__v1.cf: int;
  var store__0__v2.cf: int;
  var out__v1.Find_loop_anon5_LoopHead_out_1_0_0: int;
  var out__v1.Find_loop_anon5_LoopHead_out_1_1_0: int;
  var out__v2.Find_loop_anon5_LoopHead_out_2_0_0: int;
  var out__v2.Find_loop_anon5_LoopHead_out_2_1_0: int;

  START:
    _v1.Find_loop_anon5_LoopHead_1_done, _v2.Find_loop_anon5_LoopHead_2_done := false, false;
    goto inline$_v1.Find_loop_anon5_LoopHead$0$Entry;

  inline$_v1.Find_loop_anon5_LoopHead$0$Entry:
    inline$_v1.Find_loop_anon5_LoopHead$0$in_position := _v1.in_position;
    inline$_v1.Find_loop_anon5_LoopHead$0$in_d := _v1.in_d;
    havoc inline$_v1.Find_loop_anon5_LoopHead$0$out_position, inline$_v1.Find_loop_anon5_LoopHead$0$out_d;
    inline$_v1.Find_loop_anon5_LoopHead$0$_v1.cf := _v1.cf;
    goto inline$_v1.Find_loop_anon5_LoopHead$0$entry;

  inline$_v1.Find_loop_anon5_LoopHead$0$entry:
    inline$_v1.Find_loop_anon5_LoopHead$0$out_position, inline$_v1.Find_loop_anon5_LoopHead$0$out_d := inline$_v1.Find_loop_anon5_LoopHead$0$in_position, inline$_v1.Find_loop_anon5_LoopHead$0$in_d;
    goto inline$_v1.Find_loop_anon5_LoopHead$0$anon5_LoopHead;

  inline$_v1.Find_loop_anon5_LoopHead$0$anon5_LoopHead:
    goto inline$_v1.Find_loop_anon5_LoopHead$0$anon5_LoopDone, inline$_v1.Find_loop_anon5_LoopHead$0$anon5_LoopBody;

  inline$_v1.Find_loop_anon5_LoopHead$0$anon5_LoopBody:
    assume {:partition} inline$_v1.Find_loop_anon5_LoopHead$0$out_d < _v2.n;
    _v1.cf := _v2.uif(_v1.cf, 5);
    goto inline$_v1.Find_loop_anon5_LoopHead$0$anon6_Then, inline$_v1.Find_loop_anon5_LoopHead$0$anon6_Else;

  inline$_v1.Find_loop_anon5_LoopHead$0$anon6_Else:
    assume {:partition} _v1.array[inline$_v1.Find_loop_anon5_LoopHead$0$out_d]
   >= _v1.array[inline$_v1.Find_loop_anon5_LoopHead$0$out_position];
    goto inline$_v1.Find_loop_anon5_LoopHead$0$anon3;

  inline$_v1.Find_loop_anon5_LoopHead$0$anon3:
    _v1.cf := _v2.uif(_v1.cf, 7);
    inline$_v1.Find_loop_anon5_LoopHead$0$out_d := inline$_v1.Find_loop_anon5_LoopHead$0$out_d + 1;
    goto inline$_v1.Find_loop_anon5_LoopHead$0$anon3_dummy;

  inline$_v1.Find_loop_anon5_LoopHead$0$anon3_dummy:
    _v1.Find_loop_anon5_LoopHead_in_1_0, _v1.Find_loop_anon5_LoopHead_in_1_1, _v1.Find_loop_anon5_LoopHead_in_1_2 := inline$_v1.Find_loop_anon5_LoopHead$0$out_position, inline$_v1.Find_loop_anon5_LoopHead$0$out_d, _v1.cf;
    call inline$_v1.Find_loop_anon5_LoopHead$0$out_position, inline$_v1.Find_loop_anon5_LoopHead$0$out_d := _v1.Find_loop_anon5_LoopHead(inline$_v1.Find_loop_anon5_LoopHead$0$out_position, inline$_v1.Find_loop_anon5_LoopHead$0$out_d);
    _v1.Find_loop_anon5_LoopHead_1_done := true;
    _v1.Find_loop_anon5_LoopHead_out_1_0, _v1.Find_loop_anon5_LoopHead_out_1_1, _v1.Find_loop_anon5_LoopHead_out_1_2 := inline$_v1.Find_loop_anon5_LoopHead$0$out_position, inline$_v1.Find_loop_anon5_LoopHead$0$out_d, _v1.cf;
    goto inline$_v1.Find_loop_anon5_LoopHead$0$Return;

  inline$_v1.Find_loop_anon5_LoopHead$0$anon6_Then:
    assume {:partition} _v1.array[inline$_v1.Find_loop_anon5_LoopHead$0$out_position]
   > _v1.array[inline$_v1.Find_loop_anon5_LoopHead$0$out_d];
    _v1.cf := _v2.uif(_v1.cf, 6);
    inline$_v1.Find_loop_anon5_LoopHead$0$out_position := inline$_v1.Find_loop_anon5_LoopHead$0$out_d;
    goto inline$_v1.Find_loop_anon5_LoopHead$0$anon3;

  inline$_v1.Find_loop_anon5_LoopHead$0$anon5_LoopDone:
    assume {:partition} _v2.n <= inline$_v1.Find_loop_anon5_LoopHead$0$out_d;
    inline$_v1.Find_loop_anon5_LoopHead$0$out_position, inline$_v1.Find_loop_anon5_LoopHead$0$out_d := inline$_v1.Find_loop_anon5_LoopHead$0$in_position, inline$_v1.Find_loop_anon5_LoopHead$0$in_d;
    _v1.cf := inline$_v1.Find_loop_anon5_LoopHead$0$_v1.cf;
    goto inline$_v1.Find_loop_anon5_LoopHead$0$Return;

  inline$_v1.Find_loop_anon5_LoopHead$0$Return:
    assume true;
    assume true;
    assume true;
    assume true;
    assume true;
    assume true;
    assume true;
    assert _houdini_58
   ==> inline$_v1.Find_loop_anon5_LoopHead$0$in_position
     <= inline$_v1.Find_loop_anon5_LoopHead$0$out_position;
    assert _houdini_59
   ==> inline$_v1.Find_loop_anon5_LoopHead$0$out_position
     <= inline$_v1.Find_loop_anon5_LoopHead$0$in_position;
    assert _houdini_60
   ==> inline$_v1.Find_loop_anon5_LoopHead$0$in_d
     <= inline$_v1.Find_loop_anon5_LoopHead$0$out_d;
    assert _houdini_61
   ==> inline$_v1.Find_loop_anon5_LoopHead$0$out_d
     <= inline$_v1.Find_loop_anon5_LoopHead$0$in_d;
    _v1.out_position := inline$_v1.Find_loop_anon5_LoopHead$0$out_position;
    _v1.out_d := inline$_v1.Find_loop_anon5_LoopHead$0$out_d;
    goto START$1;

  START$1:
    goto inline$_v2.Find_loop_anon5_LoopHead$0$Entry;

  inline$_v2.Find_loop_anon5_LoopHead$0$Entry:
    inline$_v2.Find_loop_anon5_LoopHead$0$in_position := _v2.in_position;
    inline$_v2.Find_loop_anon5_LoopHead$0$in_d := _v2.in_d;
    havoc inline$_v2.Find_loop_anon5_LoopHead$0$out_position, inline$_v2.Find_loop_anon5_LoopHead$0$out_d;
    inline$_v2.Find_loop_anon5_LoopHead$0$_v2.cf := _v2.cf;
    goto inline$_v2.Find_loop_anon5_LoopHead$0$entry;

  inline$_v2.Find_loop_anon5_LoopHead$0$entry:
    inline$_v2.Find_loop_anon5_LoopHead$0$out_position, inline$_v2.Find_loop_anon5_LoopHead$0$out_d := inline$_v2.Find_loop_anon5_LoopHead$0$in_position, inline$_v2.Find_loop_anon5_LoopHead$0$in_d;
    goto inline$_v2.Find_loop_anon5_LoopHead$0$anon5_LoopHead;

  inline$_v2.Find_loop_anon5_LoopHead$0$anon5_LoopHead:
    goto inline$_v2.Find_loop_anon5_LoopHead$0$anon5_LoopDone, inline$_v2.Find_loop_anon5_LoopHead$0$anon5_LoopBody;

  inline$_v2.Find_loop_anon5_LoopHead$0$anon5_LoopBody:
    assume {:partition} inline$_v2.Find_loop_anon5_LoopHead$0$out_d < _v2.n;
    _v2.cf := _v2.uif(_v2.cf, 5);
    goto inline$_v2.Find_loop_anon5_LoopHead$0$anon6_Then, inline$_v2.Find_loop_anon5_LoopHead$0$anon6_Else;

  inline$_v2.Find_loop_anon5_LoopHead$0$anon6_Else:
    assume {:partition} _v2.array[inline$_v2.Find_loop_anon5_LoopHead$0$out_d]
   >= _v2.array[inline$_v2.Find_loop_anon5_LoopHead$0$out_position];
    goto inline$_v2.Find_loop_anon5_LoopHead$0$anon3;

  inline$_v2.Find_loop_anon5_LoopHead$0$anon3:
    _v2.cf := _v2.uif(_v2.cf, 7);
    inline$_v2.Find_loop_anon5_LoopHead$0$out_d := inline$_v2.Find_loop_anon5_LoopHead$0$out_d + 1;
    goto inline$_v2.Find_loop_anon5_LoopHead$0$anon3_dummy;

  inline$_v2.Find_loop_anon5_LoopHead$0$anon3_dummy:
    _v2.Find_loop_anon5_LoopHead_in_2_0, _v2.Find_loop_anon5_LoopHead_in_2_1, _v2.Find_loop_anon5_LoopHead_in_2_2 := inline$_v2.Find_loop_anon5_LoopHead$0$out_position, inline$_v2.Find_loop_anon5_LoopHead$0$out_d, _v2.cf;
    call inline$_v2.Find_loop_anon5_LoopHead$0$out_position, inline$_v2.Find_loop_anon5_LoopHead$0$out_d := _v2.Find_loop_anon5_LoopHead(inline$_v2.Find_loop_anon5_LoopHead$0$out_position, inline$_v2.Find_loop_anon5_LoopHead$0$out_d);
    _v2.Find_loop_anon5_LoopHead_2_done := true;
    _v2.Find_loop_anon5_LoopHead_out_2_0, _v2.Find_loop_anon5_LoopHead_out_2_1, _v2.Find_loop_anon5_LoopHead_out_2_2 := inline$_v2.Find_loop_anon5_LoopHead$0$out_position, inline$_v2.Find_loop_anon5_LoopHead$0$out_d, _v2.cf;
    goto inline$_v2.Find_loop_anon5_LoopHead$0$Return;

  inline$_v2.Find_loop_anon5_LoopHead$0$anon6_Then:
    assume {:partition} _v2.array[inline$_v2.Find_loop_anon5_LoopHead$0$out_position]
   > _v2.array[inline$_v2.Find_loop_anon5_LoopHead$0$out_d];
    _v2.cf := _v2.uif(_v2.cf, 6);
    inline$_v2.Find_loop_anon5_LoopHead$0$out_position := inline$_v2.Find_loop_anon5_LoopHead$0$out_d;
    goto inline$_v2.Find_loop_anon5_LoopHead$0$anon3;

  inline$_v2.Find_loop_anon5_LoopHead$0$anon5_LoopDone:
    assume {:partition} _v2.n <= inline$_v2.Find_loop_anon5_LoopHead$0$out_d;
    inline$_v2.Find_loop_anon5_LoopHead$0$out_position, inline$_v2.Find_loop_anon5_LoopHead$0$out_d := inline$_v2.Find_loop_anon5_LoopHead$0$in_position, inline$_v2.Find_loop_anon5_LoopHead$0$in_d;
    _v2.cf := inline$_v2.Find_loop_anon5_LoopHead$0$_v2.cf;
    goto inline$_v2.Find_loop_anon5_LoopHead$0$Return;

  inline$_v2.Find_loop_anon5_LoopHead$0$Return:
    assume true;
    assume true;
    assume true;
    assume true;
    assume true;
    assume true;
    assume true;
    assert _houdini_62
   ==> inline$_v2.Find_loop_anon5_LoopHead$0$in_position
     <= inline$_v2.Find_loop_anon5_LoopHead$0$out_position;
    assert _houdini_63
   ==> inline$_v2.Find_loop_anon5_LoopHead$0$out_position
     <= inline$_v2.Find_loop_anon5_LoopHead$0$in_position;
    assert _houdini_64
   ==> inline$_v2.Find_loop_anon5_LoopHead$0$in_d
     <= inline$_v2.Find_loop_anon5_LoopHead$0$out_d;
    assert _houdini_65
   ==> inline$_v2.Find_loop_anon5_LoopHead$0$out_d
     <= inline$_v2.Find_loop_anon5_LoopHead$0$in_d;
    _v2.out_position := inline$_v2.Find_loop_anon5_LoopHead$0$out_position;
    _v2.out_d := inline$_v2.Find_loop_anon5_LoopHead$0$out_d;
    goto START$2;

  START$2:
    goto MS_L_0_0;

  MS_L_0_0:
    goto MS_L_taken_0, MS_L_not_taken_0;

  MS_L_taken_0:
    assume _v1.Find_loop_anon5_LoopHead_1_done && _v2.Find_loop_anon5_LoopHead_2_done;
    store__0__v1.cf := _v1.cf;
    store__0__v2.cf := _v2.cf;
    _v1.cf := _v1.Find_loop_anon5_LoopHead_in_1_2;
    _v2.cf := _v2.Find_loop_anon5_LoopHead_in_2_2;
    call out__v1.Find_loop_anon5_LoopHead_out_1_0_0, out__v1.Find_loop_anon5_LoopHead_out_1_1_0, out__v2.Find_loop_anon5_LoopHead_out_2_0_0, out__v2.Find_loop_anon5_LoopHead_out_2_1_0 := MS_Check__v1.Find_loop_anon5_LoopHead___v2.Find_loop_anon5_LoopHead(_v1.Find_loop_anon5_LoopHead_in_1_0, _v1.Find_loop_anon5_LoopHead_in_1_1, _v2.Find_loop_anon5_LoopHead_in_2_0, _v2.Find_loop_anon5_LoopHead_in_2_1);
    assume _v1.cf == _v1.Find_loop_anon5_LoopHead_out_1_2;
    assume _v2.cf == _v2.Find_loop_anon5_LoopHead_out_2_2;
    assume _v1.Find_loop_anon5_LoopHead_out_1_0
     == out__v1.Find_loop_anon5_LoopHead_out_1_0_0
   && _v1.Find_loop_anon5_LoopHead_out_1_1
     == out__v1.Find_loop_anon5_LoopHead_out_1_1_0
   && _v2.Find_loop_anon5_LoopHead_out_2_0
     == out__v2.Find_loop_anon5_LoopHead_out_2_0_0
   && _v2.Find_loop_anon5_LoopHead_out_2_1
     == out__v2.Find_loop_anon5_LoopHead_out_2_1_0;
    _v1.cf := store__0__v1.cf;
    _v2.cf := store__0__v2.cf;
    goto MS_L_meet_0;

  MS_L_not_taken_0:
    assume !(_v1.Find_loop_anon5_LoopHead_1_done && _v2.Find_loop_anon5_LoopHead_2_done);
    goto MS_L_meet_0;

  MS_L_meet_0:
    return;
}


