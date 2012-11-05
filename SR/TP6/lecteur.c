#include <stdlib.h>
#include <stdio.h>
#include <sys/types.h>
#include <sys/ipc.h>
#include <sys/shm.h>
#define SHMKEY	75
#define K	1024

int main() {
	int i;
	int shmid;

	char *pint;
	shmid = shmget(205,4,0777);
	pint = (char*) shmat(shmid,0,0);
	printf("%c\n", *pint++);
	printf("%c\n", *pint++);
	printf("%c\n", *pint++);
	printf("%c\n", *pint++);
}