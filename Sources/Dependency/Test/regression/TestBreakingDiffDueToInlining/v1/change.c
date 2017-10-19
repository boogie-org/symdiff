
int foo(int p, int q) {
  q=q+1;
  foo(q,q);
  return p;
}

int bar() {
  int x = 25;
  int y = 32;
  foo(x,y);
  return 1;
}

int main(int argc, char** argv) {

	return 0;
}
