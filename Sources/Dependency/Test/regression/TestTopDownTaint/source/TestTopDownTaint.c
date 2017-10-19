void f1(int, int);
void f2(int, int);
void f3(int, int);
void f4(int, int);
void f5(int, int);
void f6(int, int);
void f7(int, int);
void f8(int, int);
void f9(int, int);
void f10(int, int);
extern int nd(void);

int f0(void) {
	f1(1,2);
	return 0;
}

void f1(int x, int y) {
	if (nd()) {
		f2(x,0);
	}
	else {
		f2(0,y);
	}
}

void f2(int x, int y) {
	if (nd()) {
		f3(x,0);
	}
	else {
		f3(0,y);
	}
}

void f3(int x, int y) {
	if (nd()) {
		f4(x, 0);
	}
	else {
		f4(0, y);
	}
}


void f4(int x, int y) {
	if (nd()) {
		f5(x,0);
	}
	else {
		f5(0,y);
	}
}

void f5(int x, int y) {
	if (nd()) {
		f6(x,0);
	}
	else {
		f6(0,y);
	}
}

void f6(int x, int y) {
	if (nd()) {
		f7(x,0);
	}
	else {
		f7(0,y);
	}
}

void f7(int x, int y) {
	if (nd()) {
		f8(x,0);
	}
	else {
		f8(0,y);
	}
}

void f8(int x, int y) {
	if (nd()) {
		f9(x,0);
	}
	else {
		f9(0,y);
	}
}

void f9(int x, int y) {
	if (nd()) {
		f10(x,0);
	}
	else {
		f10(0,y);
	}
}

void f10(int x, int y) {
	
}