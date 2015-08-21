int* doSome(int x, int* m) {
  return m+x;
}

int isSmarter(int x, int* m1) {
  //  if (x > 2 && x > 0) {
  if (x > 2) {
    m1 = doSome(x,m1);
    return 1;
  }
  else
    return 0;
}

int bar(int x, int *m) {
  return m[0];
}

int foo(int x) {
  int* m = (int*) malloc(64*sizeof(int));
  if(isSmarter(x, m)){
    bar(x, m);
    return 14;
  }
  return 23;
}


int main(int argc, char** argv) {
  doSome(0,0);
  return foo(121);
}
