
int bar() {
	return 1;
}

int foo(int p) {
	int x = bar();	
	printf("%d", x+p);
	foo(x+p);
	return 1;
}


int main(int argc, char** argv) {

	return 0;
}
