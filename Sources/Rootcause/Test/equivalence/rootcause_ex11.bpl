//a.bpl

axiom (forall m: [int]int, i, x: int :: { m[i := x] } m[i := x][i] == x);
axiom (forall m: [int]int, i, x, j: int :: { m[i := x][j] } j != i ==> m[i := x][j] == m[j]);


procedure EQ_Fat(index:int, h:[int]int) {
  var h1:[int]int, h2:[int]int;
  var tmp : int;
  var j: int;
  //here is the model
  assume(index == 719 && h[719] == 0 && j > 719 && j <= 720); //the model that violates asserttion A1
  //Version 1
  h1 := h;
  h1[index] := 1; /*assert (h1[index] == 1); tmp := h1[index];*/ 
  h1[j] := 2; /*assert (h1[index+1] == 2); tmp := h1[index+1];*/ /* need this term */ //tmp := h1[index];

  //this is the marker that is understood by Rootcause
  goto AA_INSTR_EQ_BODY$1;
  AA_INSTR_EQ_BODY$1: 
   

  //Version 2
  h2 := h;
  h2[j] := 2; /*assert (h2[index+1] == 2); tmp := h2[index+1];*/ //tmp := h2[index];
  //h2[index] := 1;
  //assert(forall i:int :: h1[i] == h2[i]); //A1
  assert(exists i:int  :: {h1[i]}{h2[i]} h1[i] != h2[i]); //negation of A1
}
