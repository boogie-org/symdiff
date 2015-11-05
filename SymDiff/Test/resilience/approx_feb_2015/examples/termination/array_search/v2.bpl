var a : [int]int;

procedure Array_search(s : int, e : int, v : int) returns (r: int)
{
  var k1 : int;
  var i : int;
  k1 := a[e];
  i := s;
  r := 0;
  while(a[i] < k1)
  {
    if (a[i] > v) 
    {
      r := 1;
      break;
    }
    i := i + 2;
  }
}

procedure Main(i: int, j:int, k:int)
returns (r : int)
requires i <= j;
{
  //var i : int;
  //var j : int;
  //var k : int;
  //assume i <= j;
  assume sorted(a);
  //havoc k;
  call r := Array_search(i, j, k);
}

function {:inline true} sorted(a: [int]int) returns(bool)
{
  (forall i, j: int :: i <= j ==> a[i] <= a[j])
}
