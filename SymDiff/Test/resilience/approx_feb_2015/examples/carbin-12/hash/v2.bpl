var str: [int]int;
const N: int;

procedure hash() returns(r:int)
{
  var i: int;
  var hash: int;
  
  i := 0;
  hash := 0;
  assert i < N;
  while (str[i] != 0) {
    hash := hash + str[i];
    i := i + 1;
    //approximation: loop perforation
    assert i < N;
    if (str[i] == 0) {
      break;
    }
    i := i + 1;
    //assert i < N;
  }
}
