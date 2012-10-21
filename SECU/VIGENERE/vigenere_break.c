#include <stdio.h>
#include <stdlib.h>

char decrypt(char key, char letter) {
	int i,u;

	int fl = 'A';

	return (key - letter )% 26 + fl;
}

int main(int argc, char const *argv[]) {
	
	printf("COUCOU\n");

	return 0;
}