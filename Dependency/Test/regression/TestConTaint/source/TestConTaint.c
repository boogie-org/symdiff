int TestConTaint(int x) {
	int y;
	x++;
	if (x > 0) { // change
		y++; // (bottom up) taint
	}
	return y; // (bottom up) taint
}