var w: [int]int;
var f: [int]int;

function uif(history:int, block:int) returns (b:int);
var cf:int; 

//approximation: unreliable memory for w (exception: w[0])
//procedure store(a: [int]int, p: int, c: int) returns (b:[int]int);
//free ensures a[0] == b[0] && ((p == 0) ==> (b[p] == c));

procedure readCell() returns (r: int)
modifies w;
modifies cf;
{
  var c: int;
  var i: int;
  var j: int;
  var w_old: [int]int;

  w[0] := 0;
  i := 0;
  j := 0;
 
  HEAD:
  c := f[j];
  j := j + 1;
  cf := uif(cf, 0);
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
    // approximation
    w_old := w;
    havoc w;
    assume w[0] == w_old[0] && ((i == 0) ==> (w[i] == c));
    //w[i] := c;
    i := i + 1;
    goto HEAD;
  }

  DONE:
  cf := uif(cf, 8);
  // approximation
  w_old := w;
  havoc w;
  assume w[0] == w_old[0] && ((i == 0) ==> (w[i] == c));
  //w[i] := 0;
  r := c;
} 
