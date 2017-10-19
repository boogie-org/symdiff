var g:int;
procedure F(x:int)
modifies g;
{
  if (x < 100) {
     g := g + 2*x;
     call F(x+1);
  }
}

procedure Main()
modifies g;
{
   call F(0);
}