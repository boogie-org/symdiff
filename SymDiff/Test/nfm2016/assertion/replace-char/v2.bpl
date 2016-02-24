var array: [int]int;
const n:int;
const x:int; 
const y:int;


procedure ReplaceChar()
{  
   call Helper(0);
}

procedure Helper(i:int) {
   var tmp:int;

   assert(i < n);
   if (array[i] != -1) {
       assert(i < n);
       tmp := array[i];
       havoc tmp; //fault
       assert(i < n);
       array[i] := if (tmp == x) then y else tmp; 
       call Helper(i+1);
   }
}

function {:inline true} ArrEqAfter(a: [int]int, b: [int]int, i: int) : bool
{
  (forall j: int :: { a[j] } { b[j] } j >= i ==> a[j] == b[j])
}
function {:inline true} ArrEqBefore(a: [int]int, b: [int]int, i: int) : bool
{
  (forall j: int :: { a[j] } { b[j] } j <= i ==> a[j] == b[j])
}
