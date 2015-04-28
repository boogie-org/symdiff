var FF: [int]int;
var RS:[int]int;
var K: int;

  
procedure water(len_FF: int, len_RS: int, N: int, gCUT2: int) returns ()
{
  var rand: int;
  K := 1;

  


  while (K < N)
  {
      assert (K < len_FF);   
      assert (K < len_RS);
      if (RS[K] < gCUT2) {
           //assert (K < len_FF); 
           havoc rand;
           FF[K] := rand;
      }
      K := K + 1;
  }
}
