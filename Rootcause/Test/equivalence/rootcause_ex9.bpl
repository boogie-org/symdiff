// func_Eq.bpl
//
// Example with equivalence checking 
//

const unique a:int;

function f(h:[int]int, i:int): bool;
function fa(h:[int]int, i:int): [int]int;
function fb(h:[int]int, i:int): [int]int;

procedure EQ_A(index:int, tmp:int, h:[int]int) {

  //Version 1
  var t1:bool, i1:int;
  var t2:bool, i2:int;
  var h1:[int]int, h2:[int]int;

  t1 := f(h, index);
  
  if (t1) {
       h1 := fa(h, index);
  } else {
       h1 := fb(h, index);
  }	

  //this is the marker that is understood by Rootcause
  goto AA_INSTR_EQ_BODY$1;
  AA_INSTR_EQ_BODY$1: 
   
  //Version 2

  t2 := f(h, index + 1);
  
  if (t2) {
       h2 := fa(h, index);
  } else {
       h2 := fb(h, index);
  }	


  assert (h1 == h2);
}
