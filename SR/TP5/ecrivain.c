#include <stdio.h>
#include <unistd.h>
#include <string.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>

int main(int argc, char  *argv[]) {
	
	int p;

	mknod("v1",S_IRUSR | S_IWUSR,0);
	p = open("v1", O_WRONLY);
	write(p, "Hello", 6);
	printf("Hello est écrit dans le tube\n");

	return 0;
}