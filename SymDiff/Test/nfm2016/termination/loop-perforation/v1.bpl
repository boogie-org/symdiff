const N:int;

procedure Main() returns(r:int)
{
  var x:int;
  x := 0;
  while (x < N) {
    x := x + 1;
  }
}

axiom(N > 0);
