
int foo(int p, int q) {
  q=q+1;
  foo(q,q);
  return p;
}

int bar() {
  foo(23,32);
  return 1;
}

int main(int argc, char** argv) {

	return 0;
}
