// evaleqlocuifgood.bpl
//
// Example with equivalence checking 
//

const unique a:int;
const f:int;
function g(a:int):int; 
 
function {:uninterpreted} PLUS(t:int,t1:int):int;
function {:uninterpreted} MINUS(t:int,t1:int):int;
function {:uninterpreted} MULT(t:int,t1:int):int;

function IP(ip:int, b:bool):int { 0 }

var a0:int, a1:int, o:int, r:int;

procedure EQ_A(i:int)
modifies r;
{
  var top:int, t0: int, t1: int, tr: int;
  var r0:int, r1:int, r2:int;
  var ipx#NO_PRED:int, ipy#NO_PRED:int;	

  ipx#NO_PRED := 0;
  ipy#NO_PRED := 0;



  r0 := r;
  //Version 1
  ipx#NO_PRED := IP(ipx#NO_PRED, o == 1);
  if (o == 1) {
      r1 := PLUS(a0, a1);
  } else { 
      ipx#NO_PRED := IP(ipx#NO_PRED, o == 2);
    if (o == 2) {
      r1 := MINUS(a0, a1); 
  } else {
      r1 := -1;
  } }
  //r1 := r;
  
  //this is the marker that is understood by Rootcause
  goto AA_INSTR_EQ_BODY$1;
  AA_INSTR_EQ_BODY$1: 

  r := r0;
  //Version 2
  top := o;
  t0 := a0;
  t1 := a1;
  r := -1;
  ipy#NO_PRED := IP(ipy#NO_PRED, top == 1);
  if (top == 1) {
      r2 := PLUS(t0,t1);
  } else {
      ipy#NO_PRED := IP(ipy#NO_PRED, top == 2);
      if (top == 2) {
      r2 := MINUS(t0,t1);
  } else {
       ipy#NO_PRED := IP(ipy#NO_PRED, top == 3);
       if (top == 3) {
           r2 := MULT(t0,t1);
       }
  }} 
  //r2 := r;

  //assert
  assert (r1 == r2 && ipx#NO_PRED == ipy#NO_PRED);
  
}
