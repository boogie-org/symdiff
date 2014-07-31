// mem_eq.bpl
//
// Example with equivalence checking 
// comparing the entire memory
//

//Need this hack
function Q(i:int):int { 0 }
procedure EQ_E(index:int, h:[int]int) {
  var h1:[int]int, h2:[int]int;
  assume (forall a:[int]int,i:int,j:int,v:int::{a[i],a[j:=v]} Q(a[j:=v][i]) == 0);
  //Version 1
  h1 := h;
  h1[index] := 1;
  h1[index+1] := 2;

  //this is the marker that is understood by Rootcause
  goto AA_INSTR_EQ_BODY$1;
  AA_INSTR_EQ_BODY$1: 
   
  //Version 2
  h2 := h;
  h2[index+1] := 2;
  //h2[index] := 1;
  assert(forall i:int :: h1[i] == h2[i]);
}
