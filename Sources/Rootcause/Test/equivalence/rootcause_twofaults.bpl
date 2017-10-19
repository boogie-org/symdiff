//motivating example for 2 faults, but we fix only 1

const Mem1:[int]int;
const Mem2:[int]int;

function f () : [int]int;
function g () : [int]int;

procedure EQ_diff() returns ()
{
  var y1:int;
  var y2:int;
  var z1:int;
  var z2:int;
  var M1:[int]int;
  var M2:[int]int;


  M1 := Mem1;
  y1 := M1[4];

  if (y1 == 42) {
       M1 := f();
  } else {
       M1 := g();
  }	
  z1 := M1[42];

  //this is the marker that is understood by Rootcause
  goto AA_INSTR_EQ_BODY$1;
  AA_INSTR_EQ_BODY$1: 
   

  M2 := Mem1;
  y2 := M2[16];
  //y2 := y1; //FIx1
  if (y2 != 42) {
       M2 := g();
  } else {
       M2 := f();
  }
  z2 := M2[142];
  //z2 := z1; //Fix2
  goto AA_INSTR_EQ_BODY$2;
  AA_INSTR_EQ_BODY$2: 

  assert (z1 == z2 && M1 == M2);
  //assert (z1 == z2);
}
