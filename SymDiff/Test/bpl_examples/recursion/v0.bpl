var D: [int]int;

const null: int;

procedure Foo(x: int) returns (r: int);

implementation Foo(x: int) returns (r: int)
{
    var t:int;
    t := x;
    call r := Bar(t);
}



procedure Bar(x: int) returns (r: int);
implementation Bar(x: int) returns (r: int)
{
   if (x < 0) {
       r := 0;
       return;
   } else {
       r := 5; //redundant
       call r := Bar(x - 1);
       r := r + x;
       return;
   }
}

