
function A(arg_0: int, arg_1:int):int;

procedure lu(column: int, N: int, max_1:int) returns (max: int)
{
  var i: int;
  var a: int;
  
  
  i := column + 1;
  max := max_1;

  while(i < N){
    a := A(i, column);






    if(a > max){
	  max := a;
     }
     i := i + 1;
  }
  return;
}
