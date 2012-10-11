#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>

int main() {
	if (fork()) {
		execlp("pwd", "pwd", NULL);exit(1);
	} else {
		wait(0);
	}

	if (fork()) {
		execlp("ls", "ls ", "-li", NULL);
		exit(1);
	} else {
		wait(0);
	}

	return(0);
}
