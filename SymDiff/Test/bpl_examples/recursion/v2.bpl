var D: [int]int;

const null: int;

procedure Foo(x: int) returns (r: int);

implementation Foo(x: int) returns (r: int)
{
    call r := Bar(x);
}



procedure Bar(x: int) returns (r: int);
implementation Bar(x: int) returns (r: int)
{

   if (x < 0) {
       r := 0;
       return;
   } else {

         call r := Bar(x);
         r := r + x;
         return;
   }

}
