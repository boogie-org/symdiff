var w: [int]int;
var f: [int]int;

function uif(history:int, block:int) returns (b:int);
var cf:int; 

procedure readCell() returns (r: int)
modifies w;
modifies cf;
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
    cf := uif(cf, 1);
    if (c == 32 || c == 9) {
      cf := uif(cf, 2);
      if (w[0] != 34) {
        cf := uif(cf, 3);
        goto HEAD;
      }
    }
    
    cf := uif(cf, 4);
    if (c == 44 || c == 10) {
      cf := uif(cf, 5);
      if (w[0] != 34) {
        cf := uif(cf, 6);
        goto DONE;
      }
    }

    cf := uif(cf, 7);
    w[i] := c;
    i := i + 1;
    goto HEAD;
  }

  DONE:
  w[i] := 0;
  r := c;
} 
