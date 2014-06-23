type ref;

//written/read
var f1  : [ref]ref;
var f2  : [ref]ref;
var f3 : [ref]ref;
var f4 : [ref]ref;
var f5 : [ref]ref;
var f6 : [ref]ref;

//only read
var g1  : [ref]ref;
var g2  : [ref]ref;
var g3 : [ref]ref;
var g4 : [ref]ref;
var g5 : [ref]ref;
var g6 : [ref]ref;

procedure foo(x: ref)
{
    f1[x] := x;
    f1[f2[x]] := g1[x];
    f3[g1[x]] := g2[x];
    f4[g2[g3[x]]] := g4[g5[x]];
    call bar(x);
    f5 := old(f6); //only f5 is restored back
    f6 := old(f6); //only f6 is restored back
}

//not equal
procedure  bar(x: ref)
{
    f5[g5[x]] := x;
    f6[g2[g4[x]]] := f1[f2[g3[g4[x]]]];
}





