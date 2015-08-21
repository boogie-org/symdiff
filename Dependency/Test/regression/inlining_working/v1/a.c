#include<stdlib.h>

int* bar(int *s) {
  if (s) {
   *s=12;
  }
  return s;
}

int* foo(int* s) {
  //if (s) {
    bar(s);
  //}
  return s;
}

int main(int argc, char** argv) {
  int *m = (int*)malloc(64*sizeof(int));
  foo(m);
  return 0;
}
