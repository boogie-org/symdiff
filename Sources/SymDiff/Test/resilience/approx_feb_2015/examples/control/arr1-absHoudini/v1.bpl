var array: [int]int;
const n:int;
const x:int; 
const y:int;

function uif(history:int, block:int) returns (b:int);
var cf:int; 

procedure ReplaceChar()
{  
   call Helper(0);
}

procedure Helper(i:int) {
   var tmp:int;

   if (i < n && array[i] != -1) {
       cf := uif(cf, 1);
       tmp := array[i];
       //havoc tmp; //fault
       array[i] := if (tmp == x) then y else tmp; 
       call Helper(i+1);
   }
   cf := uif(cf, 2);
}



