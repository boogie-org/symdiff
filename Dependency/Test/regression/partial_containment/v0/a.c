

int bar(int x, int y, int z, int t, int* m1, int* m2) {
  if(x>10) {
    m1[0]=2;
    m2[0]=3;
    return 98;
  } else {
    m1[2]=13;
    m2[2]=12;
    return 72;
  }
}

int baz(int* m) {
  if (m) {
    return 1;
  }
  else {
    return 0;
  }
}

int foo(int t) {
  int* x = (int*)malloc(64*sizeof(int));
  int* y = (int*)malloc(64*sizeof(int));
  int result = bar(12,13,23,64,x,y);

  baz(x);
  
  if(result>0)
    return 3;

  return 17;

}


int main(int argc, char** argv) {
  return foo(6);
}
