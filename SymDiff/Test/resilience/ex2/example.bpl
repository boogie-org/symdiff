function control_UIF(arg_0: int, arg_1: int) : int;

var control_flag: int;

procedure Eval(x: int) returns (result: int);
  modifies control_flag;

implementation Eval(x.1: int) returns (result: int)
{
  var x : int;
  x := x.1;
  result := 0;
  control_flag := 0;
  while(x > 0) {
	control_flag := control_UIF(control_flag, 1);
	result := result + x;
	x := x - 1;
  }
  control_flag := control_UIF(control_flag, 2);
  return;
}


