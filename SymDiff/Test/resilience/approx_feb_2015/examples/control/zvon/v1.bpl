var x:int;
var n:int;

var cf:int;
function trackCF(a:int, b:int):int;

procedure foo() returns (r:int){
  var y:int;

L0:
  cf := trackCF(cf, 1);
  y := x + 3;
  // havoc y
  y := y * y;
  x := x * y;
  r := 0;

  while (0 < n && n < 1000) {
    cf := trackCF(cf, 2);
    if (x > 0) {
      cf := trackCF(cf, 3);
      n := n + 1;
      r := r + n;
    } else {
      cf := trackCF(cf, 4);
      n := n - 1;
      r := r - n;
    }
  }
  cf := trackCF(cf, 5);
  return ;
}

