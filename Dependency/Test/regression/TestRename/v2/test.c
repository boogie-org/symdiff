//Example to contain effect of rename

typedef struct _A {int f; int g;} A;

void foo(A *x) {
  int w, v = 2;  //renamed w -> v
  w = baz(v);
  x->g = w;
}

void bar(A *x, int i) {
  x->f = i;
}

void main(A *x) {
  foo(x);
  bar(x, x->g);
}

