int readCell(FILE *fp, char* w) {
	int c;
	int i;

	w[0] = 0;
	for (c = fgetc(fp), i = 0; c != EOF; c = fgetc(fp)) {
		if (c == ' ' || c == '\t') {
			if (w[0] != '\"')
				continue;
		}

		if (c == ',' || c == '\n') {
			if (w[0] != '\"')
				break;
			else if (c == '\"') {
				w[i] = c;
				i++;
				break;
			}
		}

		w[i] = c;
		i++;
	}
	w[i] = 0;

	return c;
}
