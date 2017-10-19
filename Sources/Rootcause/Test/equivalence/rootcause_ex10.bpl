//func_uninterp.bpl

//Testing functions over uninterpreted types

type ref;

function g(a:ref, b:[int]ref):[int]ref;

procedure EQ_C(index:int, h:[int]ref, m:[int][ref]ref, n:[int,ref]ref) {
  var h1:[int]ref, h2:[int]ref;
  //Version 1
  h1 := h;
  h1 := g(h1[index], h1);

  //this is the marker that is understood by Rootcause
  goto AA_INSTR_EQ_BODY$1;
  AA_INSTR_EQ_BODY$1:   

  //Version 2
  h2 := h;
  h2 := g(h2[index+1], h2);

  //h2[index] := n[1, h2[index]];

  assert(h1[index] == h2[index]);
}
