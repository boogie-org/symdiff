var M:[int]int;

procedure A(y:int) {
  if (y != 0) {
    M[y] := 4;
  }	
  return;
}

procedure B(x:int, y:int) {
  call A(y);
}

procedure C(z:int) {
  call B(121, z);
  call D(z);
}

procedure D(w:int) {
  M[w] := 55;
}

procedure E(w:int) {
   call C(w);
}
