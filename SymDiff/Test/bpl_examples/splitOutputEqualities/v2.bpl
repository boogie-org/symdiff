
var g:int;

procedure foo(x:int, y:int) returns (r1:int, r2:int)
{
   r1 := x + y;
   r2 := x - y; //change
   g  := r1 - r2;
}
