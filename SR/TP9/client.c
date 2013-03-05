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

	if(argc == 4) {
		int port = atoi(argv[3]);
		char* adresse_ip = argv[2];
		char* fileName = argv[1];

		struct hostent *hp;
	    struct sockaddr_in serveur;
	    int sock;

	    // Var pour les temps exec, transfert, transfert data
	    time_t timeExec[NB_STATE];
	    time_t timeDL[NB_STATE];
	    time_t timeServCon[NB_STATE];

	    // Début réel du programme => Temps exec
	    time(&timeExec[BEGGIN]);
	    printf("Lancement du client\n");

	    // Lancement de la connexion
	    hp = gethostbyname(adresse_ip);
	    memcpy((char*)&serveur.sin_addr,hp->h_addr,hp->h_length);

	    // Creation Sockets
	    sock = socket(AF_INET,SOCK_DGRAM,0);
    	serveur.sin_family = AF_INET;
    	serveur.sin_port = port;

    	if(sock == -1) {
    		fprintf(stderr, "Impossible de creer socket\n" );
    		return -1;
    	}

    	printf("Creation des sockets reussis\n");

    	// Debut de la connexion au serveur
    	time(&timeServCon[BEGGIN]);
    	
    	// Connection au serveur
    	int valRet;
		/*
    	valRet = connect(sock, (struct sockaddr *)&serveur, sizeof(serveur));
    	if(valRet == -1) {
    		fprintf(stderr, "Connexion impossible\n");
    		return -1;
    	}*/

    	// Ouverture et vérification du fichier
    	printf("Ouverture du fichier\n");
    	FILE* fileR = NULL;
    	fileR = fopen(fileName, "r");
		if (fileR != NULL) {
			char buffer[1024];
			int k;
			for(k=0; k< 1024; k++){
				buffer[k] = ' ';
			}

			// Envoi du fichier
	    	time(&timeDL[BEGGIN]);
	    	printf("Debut du transfert\n");
	    	fgets(buffer, sizeof(buffer), fileR);
	    	printf("%s\n", buffer);
	    	//bytesSent = write(sock, txtFi	e, strlen(txtFile));

	    	sendto(sock,buffer,sizeof(buffer),0,(struct sockaddr*)&serveur,sizeof(serveur));
	    	// Envoi du fichier ligne par ligne en binaire
	    	while(fgets(buffer, sizeof(buffer), fileR) != NULL) {
	    		valRet = send(sock, buffer, sizeof(buffer), 0);
	    		if(valRet == -1) {
		    		fprintf(stderr, "Erreur d'envoi\n");
		    		return -1;
		    	}
	    	}
	    	// Envoi d'un signal de fin
	    	send (sock, "dlend", sizeof ("dlend"), 0); 
			
	    	// Fin d'envoi
	    	time(&timeDL[END]);
	    	fclose(fileR);
			
		} else {
			fprintf(stderr, "Impossible d'ouvrir le fichier: %s\n", fileName);
		}

    	time(&timeServCon[END]);


    	// Affichage des stats
    	time(&timeExec[END]);
	    printf("\n");

	    printf("\n");
	    printf("Temps de transfert du fichier : %ld sec\n", timeDL[END] - timeDL[BEGGIN]);
	    printf("Temps de Connexion : %ld sec\n", timeServCon[END] - timeServCon[BEGGIN]);
	    printf("Temps d'exécution totale : %ld sec\n", timeExec[END] - timeExec[BEGGIN]);

	    //fermeture de la socket
	    close(sock);

    	return 0;
	} else {
		printf("USAGE: %s Nom_fichier_a_recevoir Adresse_ip port\n", argv[0]);
	}
}
