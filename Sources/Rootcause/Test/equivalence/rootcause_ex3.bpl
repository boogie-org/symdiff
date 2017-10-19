//eq.bpl

procedure EQ_A(index:int, tmp:int, h:[int]int) {

  var t1:int, i1:int;
  var t2:int, i2:int;

  //i1 := tmp; //redundant 
  t1 := index;
  
  if (t1 != 1) {
       t1 := 2; 
  } else {
       t1 := t1 + 2;
  }	
  i1 := t1;

  //this is the marker that is understood by Rootcause
  goto AA_INSTR_EQ_BODY$1;
  AA_INSTR_EQ_BODY$1:

  t2 := index;
  
  if (t2 != 1) {
       t2 := 2; 
  } else {
       t2 := t2 + 2;
       t2 := t2 + 1; //change
  }	
  i2 := t2;

  assert(i1 == i2); 

}
