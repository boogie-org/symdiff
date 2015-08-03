procedure Foo(x: int) returns (r: int)
{
  r := x  + 1;
  return;
}



procedure Bar(x: int) returns (r: int)
{
   if (x >= 0) {
       call r := Foo(1); 
   } else {
       call r := Foo(0);
   }
}

