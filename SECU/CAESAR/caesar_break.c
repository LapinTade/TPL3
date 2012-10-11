#include <stdio.h>
#include <stdlib.h>

char decrypt (int shift, char letter) {
    int fl = 'A';       //Première lettre de notre alphabet
    //int ll = 'Z';       //Dernière lettre
    int dl;             //Lettre dechiffree
    dl = (letter - shift) - fl;

    while (dl < 0) {
        dl += 26;
    }
    
    return dl+fl;

}

int main(int argc, char *argv[]) {
    int fl = 'A';       //Première lettre de notre alphabet
    int ll = 'Z';       //Dernière lettre
    int ref = 'E';		//Lettre de reference (la plus presente)
    int shift = 0;

	FILE* fileR = NULL;
	FILE* fileW = NULL;
	int currentChar = 0;
	int highestOc = 0;
	int highestInd = 0;
	int tabOccurence[26];
	int k;
	float sum = 0;

	for (k=0; k<26;k ++) {
		tabOccurence[k] = 0;
	}

	if (argc == 3) {
		//Ouverture du fichier en lecture seulement
		fileR = fopen(argv[1], "r");

		if (fileR != NULL) {

			do {
				currentChar = fgetc(fileR);

				if(currentChar <= ll && currentChar >= fl) {
					currentChar -= fl;
					tabOccurence[currentChar]++;
					sum++;
				}
			} while (currentChar != EOF);
		} else {
			printf("Impossible d'ouvrir le fichier %s\n", fileR);
			return 2;
		}
	} else {
 		printf("USAGE: %s fichier_a_decrypter fichier_sortie\n", argv[0]);
 		return 1;
	}

	//printf("nb Total de lettres: %d \n", sum);
	for(k=0; k<26;k ++) {
		if(tabOccurence[k] > highestOc) {
			highestOc = tabOccurence[k];
			highestInd = k;
		}
	}

	shift = highestInd - (ref -fl);
	if (shift < 0) shift + 26;

	//printf("highestInd: %d === shift: %d\n", highestInd, shift);

	fclose(fileR);
	//Ouverture fichier en ecriture
	fileW = fopen(argv[2], "w");
	fileR = fopen(argv[1], "r");

	if (fileW != NULL) {

		do {
				currentChar = fgetc(fileR);
				if(currentChar <= ll && currentChar >= fl) {
					fputc(decrypt(shift,currentChar), fileW);
					//printf("%c", decrypt(shift,currentChar));
				} else {
					//printf("%c", currentChar);
					if(currentChar != EOF)
						fputc(currentChar, fileW);
				}
			} while (currentChar != EOF);
	} else {
		printf("Impossible d'ouvrir le fichier %s\n", fileW);
		return 1;
	}
	
	fclose(fileR);
	fclose(fileW);
	return 0;
}