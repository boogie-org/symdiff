function f_derivative(x: int) returns(int);
function abs(x: int) returns(int) {if x >= 0 then x else (0 - x)}

var precision: int;
procedure gradient_descent(x: int, gamma: int) returns(r: int)
{
  var x_new : int;
  var x_old : int;
  
  x_new := x;
  x_old := x - 1;

  while (abs(x_new - x_old) > precision) {
    x_old := x_new;
    x_new := x_old - gamma * f_derivative(x_old);
  }
}
