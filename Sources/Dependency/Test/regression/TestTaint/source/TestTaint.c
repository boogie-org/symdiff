int TestTaintOther(int x) {
	int y;
	y = TestTaintBottom(y); // no taint!
	return y;
}

int TestTaintBottom(int x) {
	int y;
	y = x; // (top down) taint
	return y; // (top down) taint
}

int TestTaintMiddle(int x) {
	int y;
	y++; // line change
	TestTaintBottom(y); // taint
	return y; // taint
}

int TestTaintTop(int x) {
	int y;
	y = TestTaintMiddle(x); // (bottom up) taint
	return y; // (bottom up) taint
}
