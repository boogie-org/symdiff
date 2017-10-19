

var arr : [int]int;

procedure EQ_InsertSort(size: int) 
modifies arr;
{

 var arr0 : [int]int, arr1 : [int]int;
 var i:int, j:int, key: int; 

 arr0 := arr;

 //Good program
 
 j := 1;
 while (j < size) {
   key := arr[j];
   i := j - 1;
   while (i >= 0 && arr[i] < key) {
      arr[i+1] := arr[i];
      i := i - 1; 
   }
   arr[i+1] := key;
   j := j + 1;
 }

 arr1 := arr;


  //this is the marker that is understood by Rootcause
  goto AA_INSTR_EQ_BODY$1;
  AA_INSTR_EQ_BODY$1: 

 arr := arr0;

 //Good program
 
 j := 2; //CHANGE
 while (j < size) {
   key := arr[j];
   i := j - 1;
   while (i >= 0 && arr[i] < key) {
      arr[i+1] := arr[i];
      i := i - 1; 
   }
   arr[i+1] := key;
   j := j + 1;
 }

 assert (arr[size-1] == arr1[size-1]);

}

