#include <stdio.h>
#include <unistd.h>
#include <string.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>

int main(int argc, char  *argv[]) {
	
	int p;

	char t[6];
	p = open("v1", O_RDONLY);
	read(p, t, 6);
	printf("%s\n", t);
	return 0;
}