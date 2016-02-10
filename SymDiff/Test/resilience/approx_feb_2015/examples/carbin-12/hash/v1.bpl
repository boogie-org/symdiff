//unsigned long hash(unsigned char *str)
//{
//	unsigned int hash = 0;
//	int c;
//
//	while (c = *str++)
//		hash += c;
//
//	return hash;
//}

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
    assert i < N;
  }
  r := hash;
}
