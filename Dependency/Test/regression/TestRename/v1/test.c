//Example to contain effect of rename
#include<stdlib.h>

typedef struct _A { int f; int g; } A;

int baz(int x) {
	return x;
}

void foo(A *x) {
	int w = 2;
	w = baz(w);
	x->g = w;
}

void bar(A *x, int i) {
	x->f = i;
}

int main(int argc, char** argv) {
	A* x = (A*)malloc(sizeof(A));
	foo(x);
	bar(x, x->g);
}

