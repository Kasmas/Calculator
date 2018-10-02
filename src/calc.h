#ifndef CALC_H
#define CALC_H

int slozhenye(int A, int B) {
	return A + B;
}

int vichitanye(int A, int B) {
	return A - B;
}

int umnozhenye(int A, int B) {
	return A * B;
}

int delenye(int A, int B) {
	if (B == 0) {
		return A;
	}

	return A / B;
}

#endif
