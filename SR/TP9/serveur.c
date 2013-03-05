#include <unistd.h>
#include <stdio.h>
#include <string.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <netdb.h>
#include <time.h>
#include <sys/stat.h> 

enum {BEGGIN, END, NB_STATE};

int getText(char* txtFile, char* fileName) {

}
int main(int argc, char *argv[]) {

	if(argc == 3) {
		int pp,sock,cc;
		unsigned int from_size;
		char buffer[1024];
		struct sockaddr_in serv={AF_INET};
		struct sockaddr_in from;

		int port = atoi(argv[2]);
		char* fileName = argv[1];

		serv.sin_port=port; /* numero de port */

		sock=socket(AF_INET,SOCK_DGRAM,0);
		pp=bind(sock,(struct sockaddr*)&serv,sizeof(serv));
		printf("serveur pret\n");

		from_size=sizeof(from);
    	// creation du fichier
	   	printf("Creation du fichier\n");
    	FILE* fileW = NULL;
    	fileW = fopen(fileName, "w");
		if (fileW != NULL) {
			char buffer[1024];

			// Envoi du fichier
	    	printf("Debut du transfert\n");

	    	recvfrom(sock,buffer,sizeof(buffer),0,(struct sockaddr*)&serv, &from_size);
	    	// Envoi du fichier ligne par ligne en binaire
	    	while(strcmp(buffer,"dlend") != 0) {
	    		fputs(buffer, fileW);
	    		recv(sock, buffer, sizeof(buffer), 0);
	    	}

	    	// Fin d'envoi
	    	fclose(fileW);
			


		} else {
			fprintf(stderr, "Impossible d'ouvrir le fichier: %s\n", fileName);
		}

	    //fermeture de la socket
	    close(sock);

    	return 0;
	} else {
		printf("USAGE: %s Nom_fichier_a_recevoir port\n", argv[0]);
	}
}
