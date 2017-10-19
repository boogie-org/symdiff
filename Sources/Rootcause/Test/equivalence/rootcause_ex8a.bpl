//func.bpl
//
// Example with equivalence checking 
// comparing the entire memory
//

function g(a:int, b:[int]int):[int]int;

//Verified, no rootcause required
procedure EQ_A(index:int, h:[int]int) {
  var h1:[int]int, h2:[int]int;
  //Version 1
  h1 := h;
  h1 := g(h1[index], h1);

  //this is the marker that is understood by Rootcause
  goto AA_INSTR_EQ_BODY$1;
  AA_INSTR_EQ_BODY$1: 
 
  //Version 2
  h2 := h;
  h2 := g(h2[index], h2);

  assert(forall i:int :: h1[i] == h2[i]);
}
