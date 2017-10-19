var array: [int]int;
const n:int;

function uif(history:int, block:int) returns (b:int);
var cf:int; 

procedure SelectionSort()
{
  var c:int, position:int, temp:int;
  
  position, temp := 0, 0; //initialize to avoid non-det for now

  c := 0; 
  while(c < ( n - 1 )) {
    cf := uif(cf, 1);
    
    call position := Find(c);
    
    if ( position != c ) {
      cf := uif(cf, 2);
      temp := array[position];
      array[position] := array[c];
      havoc temp; //fault
      array[c] := temp; 
    }

    cf := uif(cf, 3);
    c := c + 1;
  }
  cf := uif(cf, 4);
}


procedure Find(c:int) returns (position:int)
{
    var d:int;

    position := c;
    d := c  + 1;

    while (d < n) {
      cf := uif(cf, 5);
      if (array[position] > array[d] ) {
           cf := uif(cf, 6);
           position := d;
      }
      cf := uif(cf, 7);
      d := d + 1;
    }
    cf := uif(cf, 8);
}


function {:inline true} ArrEqAfter(a:[int]int, b:[int]int, i:int) : bool
{
  (forall j:int :: {a[j]}{b[j]} j >= i ==> a[j] == b[j])
}
