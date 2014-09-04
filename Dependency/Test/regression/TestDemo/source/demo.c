int a,b,c,d;
int main() {
	a = before(a);
	b = tainted(b);
	if (b < 0)
		b = 0;
	c = after(b);
	d = alias(d);
	return 0;
}

int leaf(int x) {
	int y = x + 1;
	return y;
}

int before(int x) {
	int i, res = 0;
	for (i = 0; i < 80; ++i)
		res += leaf(x);
	return res;
}

int tainted(int x) {
	int y;
	int *p = &y;
	y = y + 1; // line change
	++*p;
	leaf(y); 
	return y; 
}

int after(int x) {
	if (x < 0)
		return x;
	return 0;
}

int alias(int x) {
	int y;
	int *q = &y;
	*q = 2;
	return y;
}
