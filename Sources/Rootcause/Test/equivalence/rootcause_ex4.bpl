// evaleq.bpl
//
// Example with equivalence checking 
//

var a0:[int]int, a1:[int]int, o:[int]int, r:[int]int;

procedure EQ_A(i:int)
modifies r;
{
  var top:int, t0: int, t1: int, tr: int;
  var r0:[int]int, r1:[int]int, r2:[int]int;

  r0 := r;
  //Version 1
  if (o[i] == 1) {
      r[i] := a0[i] + a1[i];
  } else if (o[i] == 2) {
      r[i] := a0[i] - a1[i]; 
  } else {
      r[i] := -1;
  }
  r1 := r;
  
  //this is the marker that is understood by Rootcause
  goto AA_INSTR_EQ_BODY$1;
  AA_INSTR_EQ_BODY$1: 

  r := r0;
  //Version 2
  top := o[i];
  t0 := a0[i];
  t1 := a1[i];
  r[i] := -1;
  if (top == 2) {
      r[i] := t0 - t1;
  } else if (top == 1) {
      r[i] := t0 + t1;
  } else if (top == 3) {
      r[i] := t0 * t1;
  } 
  r2 := r;

  //assert
  assert (r1[i] == r2[i]);
  
}
