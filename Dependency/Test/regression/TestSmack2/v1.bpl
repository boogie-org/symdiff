

var M: [int] int;

procedure  foo(x: int, i :int)
  modifies M;
{
$bb0:
  M[i] := x;
  M := M[i := x];
  return;
}
