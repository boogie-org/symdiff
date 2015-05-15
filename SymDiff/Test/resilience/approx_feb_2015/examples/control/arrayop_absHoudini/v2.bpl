var array: [int]int;
const n:int;

function uif(history:int, block:int) returns (b:int);
var cf:int;

procedure max_of(x : int, y : int) returns (r : int)
{
  	cf := uif(cf, 0);
	if(x > y) {
    		cf := uif(cf, 1);
    		r := 1;
		return;
        } 
	if(x == y) {
    		cf := uif(cf, 2);
    		r := 0;
		return;
    	} 
	cf := uif(cf, 3);
  	r := -1;
  	return;
}

procedure modify_each_element(value : int) {
	var i, tmp : int;
  	i, tmp := 0, 0;
	cf := uif(cf, 4);
	while (i < n)
	{
	  cf := uif(cf, 5);
	  call tmp := max_of(array[i], value);
          havoc tmp;
	  array[i] := tmp;
          i := i + 1;
	}	
        cf := uif(cf, 6);
}

function {:inline true} ArrEqAfter(a:[int]int, b:[int]int, i:int) : bool
{
	(forall j: int :: { a[j] } { b[j] } j >= i ==> a[j] == b[j])
}

