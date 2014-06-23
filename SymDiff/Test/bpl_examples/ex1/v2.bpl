type ref;

var Op  : [ref]int;
var D   : [ref]int;
var Op1 : [ref]int;
var Op2 : [ref]int;

procedure Eval(x: ref)
modifies D, Op, Op1, Op2;
{
  var t1 : int;
  var t2 : int;
  var t3 : int;
  var t4 : int;
  t1 := Op1[x];
  t2 := Op2[x];
  t3 := Op[x];
  t4 := 0;

  goto THEN1, ELSE1;

THEN1:
  assume (t3 == 1);
  t4 := t1 + t2;
  goto JOIN1;

ELSE1:  
  assume (!(t3 == 1));
  goto THEN2, ELSE2;

THEN2:
  assume (t3 == 2);
  t4 := t1 - t2;
  goto JOIN2; 

ELSE2:
  assume (!(t3 == 2));
  goto JOIN2;

JOIN2:
  goto JOIN1;
 
JOIN1:
  D[x] := t4;
  return; 

}

