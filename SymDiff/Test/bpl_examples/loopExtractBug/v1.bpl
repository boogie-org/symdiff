//The bug fix for http://symdiff.codeplex.com/workitem/4


var i, j : int;

procedure {:entrypoint} Main() returns(r:int)
modifies i, j;
{ 
  var b : bool;
  i := 0;
  j := 0;
  while(i<3)
  {
      i := i + 1;
  }
}