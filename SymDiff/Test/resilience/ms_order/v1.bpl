procedure Bar(x:int) returns (r:int) {
   r := x + 1;
}

procedure Baz(x:int) returns (r:int) {
   r := x + 2;
}

procedure Foo(x:int) returns (r:int) {
  var t:int;

  call t :=  Bar(x);
  call r :=  Baz(t); 
}