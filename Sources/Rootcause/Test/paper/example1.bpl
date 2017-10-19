function f1 ([int]int, int) returns ([int]int);
function f2 ([int]int, int) returns (int);
function g1 ([int]int, int) returns ([int]int);
function g2 ([int]int, int) returns (int);

const M:[int]int;
const x:int;
procedure EQ_diff() returns (){  var M1 : [int]int;
  var M2 : [int]int;
  var r1 : int;
  var r2 : int;
  var r5 : int;
  var r6 : int;
  M1 := M;
  r5 := M1[x];
  M1,r1 := f1(M1,r5), f2(M1,r5);
  r1 := r5;
  M1,r1 := g1(M1,r1), g2(M1,r1);
  //this is the marker that is understood by Rootcause  goto AA_INSTR_EQ_BODY$1;
  AA_INSTR_EQ_BODY$1:   
  M2 := M;
  r6 := M2[x];
  M2,r2 := f1(M2,r6), f2(M2,r6);
  r2 := M2[x];
  M2,r2 := g1(M2,r2), g2(M2,r2);
  goto AA_INSTR_EQ_BODY$2;
  AA_INSTR_EQ_BODY$2:   assert (r1 == r2 && M1 == M2);
}