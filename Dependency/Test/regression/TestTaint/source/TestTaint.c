int TestTaintBottom(int x) {
	int y;
	y = x; 
	return y;
}

int TestTaintMiddle(int x) {
	int y;
	y++; // line change
	TestTaintBottom(y);
	return y;
}

int TestTaintTop(int x) {
	int y;
	y = TestTaintMiddle(x); 
	return y;
}