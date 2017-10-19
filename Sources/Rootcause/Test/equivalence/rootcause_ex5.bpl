// evaleqlocal.bpl
//
// Example with equivalence checking 
//

const unique a:int;
const f:int;
function g(a:int):int; 
 
var a0:int, a1:int, o:int, r:int;

procedure EQ_A(i:int)
modifies r;
{
  var top:int, t0: int, t1: int, tr: int;
  var r0:int, r1:int, r2:int;

  r0 := r;
  //Version 1
  if (o == 1) {
      r := a0 + a1;
  } else if (o == 2) {
      r := a0 - a1; 
  } else {
      r := -1;
  }
  r1 := r;
  
  //this is the marker that is understood by Rootcause
  goto AA_INSTR_EQ_BODY$1;
  AA_INSTR_EQ_BODY$1: 

  r := r0;
  //Version 2
  top := o;
  t0 := a0;
  t1 := a1;
  r := -1;
  if (top == 2) {
      r := t0 - t1;
  } else if (top == 1) {
      r := t0 + t1;
  } else if (top == 3) {
      r := t0 * t1;
  } 
  r2 := r;

  //assert
  assert (r1 == r2);
  
}
