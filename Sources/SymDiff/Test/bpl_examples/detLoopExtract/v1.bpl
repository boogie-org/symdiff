
var a, b: int;

procedure Foo(x:int, y:int) returns (r:int)
{
   var t:int;
   var g:int, h:int;

   g := 0; h := 0;

   t := x;

   while (t > 0) {
      if (t > y) {
         t := 0;
         h := h + 1;
         goto L0; //continue
      }

      t := t - 1;
      a := 4; //global      

      if (t == 50) {
         g := g - 10; //var only present in break path
         goto L1; //break
      }
 

      b := b + y; //global
L0:   
   }

L1: r := 5;
    return;
}