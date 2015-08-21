int isDiv(int x) {
  if (x % 4 == 0)
    return 1;
  else
    return 0;
}

int bar(int x) {
  return x;
}

int foo(int x) {
  if(isDiv(x)){
    bar(x);
    return 14;
  }
  return 23;
}


int main(int argc, char** argv) {
  return foo(121);
}
