type ref;

var Op  : [ref]int;
var D   : [ref]int;
var Op1 : [ref]int;
var Op2 : [ref]int;

procedure {:inline 1} ProcAdd(x:ref);
modifies D;
implementation  ProcAdd(x: ref)
{
  D[x] := Op1[x] + Op2[x];
}

procedure {:inline 1} ProcSub(x:ref);
modifies D;
implementation  ProcSub(x: ref)
{
  D[x] := Op1[x] - Op2[x];
}

procedure Eval(x: ref)
modifies D, Op, Op1, Op2;
{

  goto THEN1, ELSE1;

THEN1:
  assume (Op[x] == 1);
  call ProcAdd(x);
  goto JOIN1;

ELSE1:  
  assume (!(Op[x] == 1));
  goto THEN2, ELSE2;

THEN2:
  assume (Op[x] == 2);
  call ProcSub(x);
  goto JOIN2; 

ELSE2:
  assume (!(Op[x] == 2));
  D[x] := 0;
  goto JOIN2;

JOIN2:
  goto JOIN1;
 
JOIN1:
  return; 

}




