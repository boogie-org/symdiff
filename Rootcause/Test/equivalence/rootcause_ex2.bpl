//running examples from the Error Invariants paper by Ermis, Schail, and Wies.

const a_in:int;
const b_in:int;
const x_in:int;


procedure EQ_foo() returns ()
{

  var x1:int;
  var y1:int;
  var x2:int;
  var y2:int;

  x1 := x_in;
  y1 := 0;
  x1 := x1 + a_in;
  x1 := x1 + b_in;
  y1 := y1 + a_in;

  //this is the marker that is understood by Rootcause
  goto AA_INSTR_EQ_BODY$1;
  AA_INSTR_EQ_BODY$1:

  x2 := x_in;
  y2 := 0;
  x2 := x2 + a_in;
  x2 := x2 * b_in;
  y2 := y2 + a_in;

  goto AA_INSTR_EQ_BODY$2;
  AA_INSTR_EQ_BODY$2:

  assert ((x1 == x2) && (y1 == y2));
}
