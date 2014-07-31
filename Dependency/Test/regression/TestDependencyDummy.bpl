
///////////////////////////
// This is the input procedure
// Simplicity: no procedure calls 
//////////////////////////
procedure {:inline 1} Foo(i1:int, i2:int, i3:int) returns (o1:int, o2:int, o3:int, o4:int)
{
    if (i1 < 0) {
       o1 := 5;
       o2 := 22;
    } else {
       o1 := 6;
       o2 := 22; 
    }
   
    havoc o3; //non-det
    o4 := o1 + o2;
    return;
}


//////////////////////////
// This is the program we will generate for our check
// Ignoring globals in inputs and outputs for simplicity
//////////////////////////

const {:guardOutputs} bo1: bool;
const {:guardOutputs} bo2: bool;
const {:guardOutputs} bo3: bool;
const {:guardOutputs} bo4: bool;

const {:guardInputs} bi1: bool;
const {:guardInputs} bi2: bool;
const {:guardInputs} bi3: bool;



procedure {:checkDependency} CheckDependency_Foo() returns (eq1:bool, eq2:bool, eq3:bool, eq4:bool)
ensures bo1 ==> eq1;
ensures bo2 ==> eq2;
ensures bo3 ==> eq3;
ensures bo4 ==> eq4;
{
   var i1:int;
   var i2:int;
   var i3:int;

   var i11:int, i21:int, i31:int;
   var i12:int, i22:int, i32:int;

   var o11:int;
   var o21:int;
   var o31:int;
   var o41:int;

   var o12:int;
   var o22:int;
   var o32:int;
   var o42:int;

   ////First side /////////
   havoc i1, i2, i3;
   i11, i21, i31 := i1, i2, i3;
   call o11,o21,o31,o41 := Foo(i1,i2,i3); //inline attribute will inline Foo
  
   ////Second side ///////// 
   havoc i1, i2, i3;
   i12, i22, i32 := i1, i2, i3;
   call o12,o22,o32,o42 := Foo(i1,i2,i3); //inline attribute will inline Foo

   /// Assumptions 
   assume (bi1 ==> i11 == i12);
   assume (bi2 ==> i21 == i22);
   assume (bi3 ==> i31 == i32);

   /// Checks
   eq1 := o11 == o12;
   eq2 := o21 == o22;
   eq3 := o31 == o32;
   eq4 := o41 == o42;
  
   return;
}