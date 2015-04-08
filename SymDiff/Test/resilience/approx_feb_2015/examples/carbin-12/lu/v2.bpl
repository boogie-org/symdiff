function A(arg_0: int, arg_1:int):int;
function RelaxedEq(x:int, y:int) returns (bool) {
     x <= y + e &&
     y <= x + e 
}

const e:int;
axiom e >= 0;

  
procedure lu(column: int, N: int, max_1:int) returns (max: int)
{
  var i: int;
  var a: int;
  var old_a: int;
  
  i := column + 1;
  max := max_1;

  while(i < N) {
    a := A(i, column);
    
    old_a := a;
    havoc a; 
    assume (RelaxedEq(old_a, a));
	
    if(a > max) {
	  max := a;
     }
      i := i + 1;
   }
   return;
}
