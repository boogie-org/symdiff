int global1;
// result <- {x}
// global1 <- {}
int TestIfDomination(int x) {
	int y;
	if (x>0)
		y = 1;
	global1 = 2;
	return y;
}

// result <- {x}
// global1 <- {x}
int TestIfElseDomination(int x) {
	int y;
	if (x>0)
		y = 1;
	else 
		global1 = 2;
	return y;
}

int global2;
int global3;
// result <- {x,z}
// global1 <- {x}
// global2 <- {x}
// global3 <- {}
int TestNestedIfDomination(int x, int z) {
	int y;
	if (x>0) {
		if (z>0)
			y = 1;
		global2 = 1;
	} else {
		global1 = 2;	
	}
	global3 = 3;
	return y;
}


// result <- {}
// global1 <- {x, global1}
int TestWhileDomination(int x) {
	int y;
	while (x>0) {
		global1++;
		x--;
	}
	y = 3;
	return y;
}