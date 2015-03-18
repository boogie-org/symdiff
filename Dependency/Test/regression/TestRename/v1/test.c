//Example to contain effect of rename

typedef struct _A {int f; int g;} A;

void foo(A *x) {
  int w = 2;
  w = baz(w);
  x->g = w;
}

void bar(A *x, int i) {
  x->f = i;
}

void main(A *x) {
  foo(x);
  bar(x, x->g);
}

