#include <stdio.h>
#include <stdlib.h>

int main() {
	int no_fils;
	int status;

	printf("Je suis le père: %d\n", getpid());
	printf("Numero du process gd pere: %d\n", getppid());

	return 0;
}