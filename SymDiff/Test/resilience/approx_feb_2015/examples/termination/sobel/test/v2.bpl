procedure Test(y:int) returns(r:int)
{
  var x: int;
  x := y;
  while(x < y + 10) {
    x := x + 2;
  }
}
