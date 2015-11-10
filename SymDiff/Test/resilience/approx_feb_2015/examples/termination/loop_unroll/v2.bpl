//while(*p != 0)
//{
//  tmp = f(*p);
//  *p = tmp;
//  p++;
//  if (*p == 0)
//  {
//    break;
//  }
//  *p = tmp;
//  p++;
//}
var a: [int]int;
procedure f(x: int) returns (r: int)
{
  r := x + 1;
}

//procedure Iterator(s: int, e: int) returns (r: int)
procedure Iterator(s: int) returns (r: int)
//requires s <= e && isString(a, e) && a[e] == 0;
modifies a;
{
  var i: int;
  var tmp: int;

  i := s; 
  
  while(a[i] != 0) {
    call tmp := f(a[i]);
    a[i] := tmp;
    i := i + 1;
    
    if (a[i] == 0) {
      break;
    }
    a[i] := tmp;
    i := i + 1;
  }
}

//function {:inline true} isString(a: [int]int, e: int) returns(bool)
//{
//  (forall i: int :: {a[i]} i < e ==> a[i] != 0)
//}