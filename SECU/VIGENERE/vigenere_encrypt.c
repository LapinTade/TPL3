#include <stdio.h>
#include <stdlib.h>

char crypt(char key, char letter) {
	int i,u;

	int fl = 'A';

	//initialisation du tableau
	return (key + letter )% 26 + fl;
}

int main(int argc, char  *argv[]) {
	int fl = 'A';
	int ll = 'Z';
	
	FILE* fileR = NULL;
	FILE* fileW = NULL;
	int currentChar;
	int iterattor = 0;

	if (argc == 4) {

		fileR = fopen(argv[2], "r");
		fileW = fopen(argv[3], "w");

		if (fileR != NULL) {

            do {
                currentChar = fgetc(fileR);

                if (argv[1][iterattor] = '\0') {
                    	iterattor = 0;
                    } else {
                    	iterattor++;
                    }

                if (currentChar <= ll && currentChar >= fl) {
                    fputc(crypt(argv[1][iterattor], currentChar), fileW);
                } else {
                    if (currentChar != EOF)
                    fputc(currentChar, fileW);
                }
            } while (currentChar != EOF);
        } else {
            printf("Impossible d'ouvrir le fichier %s\n", fileR);
            return 2;
        }
	} else {
		printf("USAGE: %s CLE_DECALAGE fichier_a_chiffrer fichier_sortie\n", argv[0]);
		return 1;
	}

	fclose(fileR);
	fclose(fileW);

	return 0;
}