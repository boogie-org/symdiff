var w: [int]int;
var f: [int]int;

const N: int;

procedure readCell() returns (r: int)
modifies w;
{
  var c: int;
  var i: int;
  var j: int;

  w[0] := 0;
  i := 0;
  j := 0;
 
  HEAD:
  c := f[j];
  j := j + 1;
  if (c != -1) {
    if (c == 32 || c == 9) {
      if (w[0] != 34) {
        goto HEAD;
      }
    }
    
    if (c == 44 || c == 10) {
      if (w[0] != 34) {
        goto DONE;
      }
    }
    
    assert i < N;
    w[i] := c;
    i := i + 1;
    goto HEAD;
  }

  DONE:
  assert i < N;
  w[i] := 0;
  r := c;
} 
