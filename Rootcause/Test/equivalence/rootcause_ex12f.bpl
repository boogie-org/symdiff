// mem_eq.bpl
//
// Example with equivalence checking 
// comparing the entire memory
//


// Run this through Boogie to see why E fails 
//Debugging E above 
procedure EQ_F(index:int, h:[int]int) {
  var h1:[int]int, h2:[int]int;
  //here is the model
  assume(index == 719 && h[719] == 0); //the model that violates asserttion A1
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
  //assert(forall i:int :: h1[i] == h2[i]); //A1
  assert(exists i:int  :: {h1[i]}{h2[i]} h1[i] != h2[i]); //negation of A1
}
