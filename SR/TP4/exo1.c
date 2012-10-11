#include <stdio.h>
#include <stdlib.h>

int main() {

	int no_fils;
	int status;

	printf("Je suis le processus PERE %d\n", getpid());
	printf("No du grand-pere %d\n", getppid());

	if ((no_fils=fork() == 1)) {
		printf("Je suis le PERE impossible de creer le fils\n");
		exit(1);
	}

	if (no_fils !=1) {
		printf("Nous sommes chez le PERE: la creation du fils a reussis\n");
		printf("Je suis le PERE, le no du fils est %d\n", no_fils);
		printf("Je suis le PERE j'attends la fin de mon fils\n");
		wait(&status);
		printf("Je suis le PERE; fin du fils avec status %x\n", status);
		printf("Je suis le PERE; fin du processus pere\n");
	} else {
		int no_proc, pere_proc;
		no_proc = getpid();
		pere_proc = getppid();
		printf("Nous sommes chez le fils\n");
		printf("Nous sommes chez le fils; mon num est %d\n", no_proc);
		printf("Nous sommes chez le fils; num de mon pere %d\n", pere_proc);
		sleep(5);

		printf("Nous sommes chez le fils; fin du process\n");

		exit(no_proc);
	}

	return 0;
}