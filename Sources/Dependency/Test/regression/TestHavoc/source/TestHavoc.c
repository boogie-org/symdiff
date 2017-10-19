extern int foo(int);

int goo(int x) {
	int y;
	y = foo(x);
	return y;
}

int doo() {
	return non_det();
	}

