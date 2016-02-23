procedure CubeRoot(x:int) returns(r:int)
{
  r := 1;
  while (r*r*r <= x) { 
    r := r+2;
  }
}
