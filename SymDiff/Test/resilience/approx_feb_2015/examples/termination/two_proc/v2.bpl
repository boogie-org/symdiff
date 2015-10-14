procedure Foo(x:int) returns(r:int)
{
  r := x + 1;
}

procedure Main(x:int) returns(r:int)
{
  var x_in, i : int;
  call x_in := Foo(x);
  i := 0;
  while (i < x_in) {
    i := i + 2;
  }
}
