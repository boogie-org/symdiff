//scalar_func.bpl
//
// Example with equivalence checking 
// All functions are over scalars
//

function g(a:int, b:int):int;

//
procedure EQ_A(index:int, h:[int]int) {
  var h1:[int]int, h2:[int]int;
  //Version 1
  h1 := h;
  h1[index] := g(h1[index],1);


  //this is the marker that is understood by Rootcause
  goto AA_INSTR_EQ_BODY$1;
  AA_INSTR_EQ_BODY$1: 
   

  //Version 2
  h2 := h;
  h2[index] := g(h2[index+1],1);

  assert(forall i:int :: h1[i] == h2[i]);
}

