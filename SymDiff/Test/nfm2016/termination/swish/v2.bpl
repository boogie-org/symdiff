function {:inline true} RelaxedEq(x: int, y:int) returns (b:bool)
{
   (x <= 10 && x == y) || (x > 10 && y >= 10 && x >= y)
}

procedure swish(max_r: int, N: int) returns (num_r: int);
  
implementation swish(max_r_1: int, N: int) returns (num_r: int)
{
  
  var max_r: int;
  max_r := max_r_1;

  havoc max_r;
  assume RelaxedEq(max_r_1, max_r);
  
  num_r := 0;
  while(num_r < max_r && num_r < N) {
    num_r := num_r + 1;
  }
  return;
}
