var M:[int]int;

procedure A(y:int) {
  M[y] := 4;
  return;
}

procedure B(x:int, y:int) {
  if (y != 0) {
    call A(y);
  }
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
