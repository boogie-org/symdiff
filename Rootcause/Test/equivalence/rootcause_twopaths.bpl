//example from our whiteboard discussion

const Mem1:[int]int;
const Mem2:[int]int;

//axiom (forall x: int :: Mem1[x] == Mem2[x]);

function f () : int;
function g () : int;

//There are two faults on two paths



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
       z1 := f() + 1;
  } else {
       z1 := g() - 1;
  }	

  //this is the marker that is understood by Rootcause
  goto AA_INSTR_EQ_BODY$1;
  AA_INSTR_EQ_BODY$1: 
   

  M2 := Mem1;
  y2 := M2[4];
  if (y2 != 42) {
       z2 := g() + 1;
  } else {
       z2 := f() - 1;
  }

  goto AA_INSTR_EQ_BODY$2;
  AA_INSTR_EQ_BODY$2: 

  assert (z1 == z2);
}
