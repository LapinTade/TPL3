#include <stdio.h>
#include <unistd.h>
#include <string.h>

int main(int argc, char  *argv[]) {
	
	int p[2];
	char msg[256] = "Je suis le message envoyé par le fils au père";
	char msg2[256] = " ";

	pipe(p);
	switch (fork()) {
		case -1:
			fprintf(stderr, "ECHEC du fork: %s\n");
			break;

		case 0:
		// Dans le fils
			close(p[0]);
			write(p[1], msg, strlen(msg));
			break;

		default:
		// Dans le père
			close(p[1]);
			read(p[0], msg2, 256);
			printf("Le message est: %s\n", msg2);
	}

	return 0;
}