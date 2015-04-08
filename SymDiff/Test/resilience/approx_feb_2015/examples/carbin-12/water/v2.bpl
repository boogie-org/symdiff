var FF: [int]int;
var RS:[int]int;
var K: int;

  
procedure water(len_FF: int, len_RS: int, N: int, gCUT2: int) returns ()
{
  var rand: int;  
  var old_RS:[int]int;
  K := 1;

  old_RS := RS;
  havoc RS;  
  //assume forall i:int :: old_RS[i] >= gCUT2 ==> RS[i] >= gCUT2; 
  
  while (K < N)
  {
      assert (K < len_FF);     //stronger assert (same as Carbin et al.)
      assert (K < len_RS);
      if (RS[K] < gCUT2) {
       //assert (K < len_FF); //Acceptability property (can't be proved)
        havoc rand;
        FF[K] := rand;
      }
      K := K + 1;
  }
}
