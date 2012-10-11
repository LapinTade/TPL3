#include <stdlib.h>
#include <stdio.h>
#include <fcntl.h>

int main(int argc, char  *argv[]) {
	
	int p[2], d1, d2, n;

	char ch[10];
	ch[0] = 'x';
	ch[1] = 'y';

	d1 = creat("f", 0666);
	if (fork() != 0) {
		sleep(1);
		printf("Lancement du processus\n");
		write(d1, "AB", 2);
		sleep(2);
		write(d1, ch, 2);
		exit(0);
	} else {
		ch[0] = 'w';
		ch[1] = 'z';
		printf("Lancement process 2\n");
		sleep(2);
		write(d1, ch, 2);
		exit(0);
	}

	return 0;
}