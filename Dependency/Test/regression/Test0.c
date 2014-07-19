// result <- {}
int TestCallDominationDependancyCalleeConst(void) {
	return 0;
}

// global1 <- {global1}
// result <- {}
int global1;
void TestCallDominationDependancyCalleeGlobals(void) {
	global1++;
}

// global1 <- {global1,y}
// result <- {}
int TestCallDominationDependancyGlobals(int y, int z) {
	int w;
	if (y) {
		TestCallDominationDependancyCalleeGlobals();
	}
	return w;
}

// result <- {y}
int TestCallDominationDependancyReturns(int y, int z) {
	int w;
	if (y) {
		w = TestCallDominationDependancyCalleeConst();
	}
	return w;
}

// result <- {y} (but not z!)
int TestSimpleDominationDependancy(int y, int z) {
	int x = y + 1, w;
	if (x) {
		x = z;
		w = 2;
	}
	return w;
}

// result <- {} (due to no termination)
int TestEmptyRecursion(int x) {
	return TestEmptyRecursion(x);
}

int global2;
// global2 <- {global2,x}
// result <- {}
int TestGlobalRecursion(int x) {
	global2 += x;
	return TestGlobalRecursion(x);
}

// result <- {x}
int TestRecursion(int x) {
	if (x < 0)
		return 0;
	return TestRecursion(x);
}

double global3;
int global4;
char global5;
// result <- {x,w}
// global3 <- {x,w}
// global4 <- {}
// global5 <- {x}
int TestReturnDomination(int x, int w) {
	int y,z,p;
	z++; 
	global4++; 
	if (x>0) {
		if (w>0) 
			return 0;
	}
	else
		global5++; 
	y++; 
	global3 = 0; 
	return 2;
}

// result <- {}
int TestSimpleExit(int x) {
	exit(0);
	return x;
}

// result <- {x}
int TestCondExit(int x) {
	if (x>0)
		return 0;
	exit(0);
	return 1;
}