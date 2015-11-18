var str: [int]int;

procedure hash() returns(r:int)
{
  var i: int;
  var hash: int;
  
  i := 0;
  hash := 0;
  while (str[i] != 0) {
    hash := hash + str[i];
    i := i + 1;
    //approximation: loop perforation
    if (str[i] == 0) {
      break;
    }
    i := i + 1;
  }
}
