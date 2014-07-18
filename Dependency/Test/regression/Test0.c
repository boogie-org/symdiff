// empty
int TestCallDominationDependancyCalleeConst(void) {
	return 0;
}

// global1 <- {global1}
int global1;
void TestCallDominationDependancyCalleeGlobals(void) {
	global1++;
}

// global1 <- {global1,y
int TestCallDominationDependancyGlobals(int y, int z) {
	int w;
	if (y) {
		TestCallDominationDependancyCalleeGlobals();
	}
	return w;
}

// result should be tainted by y
int TestCallDominationDependancyReturns(int y, int z) {
	int w;
	if (y) {
		w = TestCallDominationDependancyCalleeConst();
	}
	return w;
}

// w <- {y} (but not z!)
int TestSimpleDominationDependancy(int y, int z) {
	int x = y + 1, w;
	if (x) {
		x = z;
		w = 2;
	}
	return w;
}

// empty (due to no termination)
int TestEmptyRecursion(int x) {
	return TestEmptyRecursion(x);
}

int global2;
// global2 <- {global2,x}
int TestGlobalRecursion(int x) {
	global2 += x;
	return TestGlobalRecursion(x);
}

// the return <- {x}
int TestRecursion(int x) {
	if (x < 0)
		return 0;
	return TestRecursion(x);
}

double global3;
int global4;
char global5;
int TestReturnDomination(int x, int w) {
	int y,z,p;
	z++; // not dominated
	global4++; // not dominated
	if (x>0) {
		if (w>0) 
			return 0;
	}
	else
		global5++; // dominated by x alone!
	y++; // y dominated by x,w
	global3 = 0; // global3 dominated by x,w
	return 2;
}