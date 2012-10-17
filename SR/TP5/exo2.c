#include <stdio.h>
#include <unistd.h>
#include <string.h>

int main(int argc, char  *argv[]) {
	
	int tube[2];
	int n, nf, nb;
	char c;
	n = pipe(tube);

	nf = fork();
	if (nf != 0) {

		nb = read(0, &c, 1);

		while ( nb != 0) {
			if (c != '\n')
				c = toupper(c);
			close(tube[0]);
			write(tube[1], &c, 1);
			nb = read(0, &c, 1);
		}
		wait(0);
	} else {
		n = read(tube[0], &c, 1);
		while (n != 0) {
			write(1, &c ,1);
			close(tube[1]);
			n = read (tube[0],&c , 1);
		}
	}
}