var g:int;
procedure F(x:int)
requires x >= 0; //manual
modifies g;
{
  if (x < 100) {
     g := g + x;
     call F(x+1);
  }
}

procedure Main()
modifies g;
{
   call F(0);
}