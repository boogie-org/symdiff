
int bar() {
	return 1;
}

int foo(int p) {
	int x = bar();
	x = x + p;
	printf("%d", x);
	foo(x);
	return x;
}


int main(int argc, char** argv) {

	return 0;
}
