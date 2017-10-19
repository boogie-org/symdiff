var g:int;
procedure A(x:int,y:int) returns (r:int)
modifies g;
{
    g := x;
    r := 1;
    g := r;
    g := x;
    return;
}