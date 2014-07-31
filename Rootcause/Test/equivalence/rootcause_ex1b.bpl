//example from our whiteboard discussion

const Mem1:[int]int;
const Mem2:[int]int;

function  _y.STRB_Stk(int):int;
function  _y.STRB_Mem(int):int;

function f () : int;
function g () : int;
function h (int) : int;
function j (int,int) : int;

var t1:int;
var t2:int;
var t3:int;
var t4:int;

procedure EQ_diff() returns (AA_TEMP : bool);
  ensures (AA_TEMP);
  modifies t1,t2;

implementation EQ_diff() returns (AA_TEMP : bool)
{
  var y1:int;
  var y1_temp:int;
  var y1_temp_temp:int;
  var y2:int;
  var z1:int;
  var z2:int;
  var M1:[int]int;
  var M2:[int]int;
  var p1:int;
  var p2:int;
  var p3:int;
  var p4:int;
  var stack1 : int;
  var mem1 : int;
  var stack2 : int;
  var mem2 : int;

  M1 := Mem1;
  y1 := M1[4];
  y1_temp := y1;
  y1_temp_temp := y1_temp + 2;
  y1_temp_temp := j(y1_temp_temp, y1);
  y1 := M1[4];
  p1, p2 := 1,2;
  stack1, mem1 := _y.STRB_Stk(5), _y.STRB_Mem(5);

  if( y1 == 42) {
      t2 := t2 + t3;
  }
  else {
      t2 := t2 + t4;
  }


  if (y1 == 42) {
       z1 := f();
       t1 := t2;
  } else {
       z1 := g();
  }	

  //this is the marker that is understood by Rootcause
  goto AA_INSTR_EQ_BODY$1;
  AA_INSTR_EQ_BODY$1: 
   

  M2 := Mem1;
  y2 := M2[16];
  p3, p4 := 3,4;
  stack2, mem2 := _y.STRB_Stk(6), _y.STRB_Mem(6);

  if (y2 != 42) {
       z2 := g();
  } else {
       z2 := f();
  }

  goto AA_INSTR_EQ_BODY$2;
  AA_INSTR_EQ_BODY$2: 

  AA_TEMP := (z1 == z2);
  return;
}
