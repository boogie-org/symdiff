// mem_eq.bpl
//
// Example with equivalence checking 
// comparing the entire memory
//


//Identifies the correct rootcause
procedure EQ_B(index:int, h:[int]int) {
  var h1:[int]int, h2:[int]int;
  //Version 1
  h1 := h;
  h1[index] := 1;
  h1[index+1] := 2;

  //this is the marker that is understood by Rootcause
  goto AA_INSTR_EQ_BODY$1;
  AA_INSTR_EQ_BODY$1: 
 
  //Version 2
  h2 := h;
  h2[index+1] := 1;
  h2[index] := 2;
  assert(forall i:int :: h1[i] == h2[i]);
}
