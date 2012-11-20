#include <stdlib.h>
#include <stdio.h>
#include <string.h>

int FL = 'A';
int LL = 'Z';
int DL = 'a';

char unsubsti(char* key, char letter) {
	int i;
	for(i=0;i<26;i++){
		if(letter == key[i]) {
			return (i +FL);
		}
	}
}

char* makeKey(char key_clean[25], char* inputedKey) {
	int nbNoValid=0;
	int i;
	int j=0;
	int sizeKeyInputed = strlen(inputedKey);
	int sizeRealKey = 0;

	char currentChar;
	char tabOccur[26];

	for(i=0;i<26;i++) {
		key_clean[i] = DL;
		tabOccur[i] = 0;
	}

	for(i=0; i<sizeKeyInputed;i++) {
		currentChar = inputedKey[i]; 
		if(tabOccur[(int) (currentChar % FL)] == 0) {
			key_clean[i - nbNoValid] = currentChar;
			sizeRealKey++;
		} else {
			nbNoValid++;
		}
		tabOccur[(int) (currentChar % FL)]++;
	}

	// On remplit la cle du reste des lettres
	j = 0;
	for(i=sizeRealKey; i<26;i++) {
		while(tabOccur[j] != 0) {
			j++;
		}
		key_clean[i] = j + FL;
		j++;
	}
}


int main(int argc, char  *argv[]) {

	FILE* fileR = NULL;
	FILE* fileW = NULL;
	
	char currentChar;
	char tabOccur[26];
	char key_clean[26];
	
	
	if (argc == 4) {

		fileR = fopen(argv[2], "r");
		fileW = fopen(argv[3], "w");

		if (fileR != NULL) {
			makeKey(key_clean, argv[1]);
            do {
            	currentChar = fgetc(fileR);
            	if(currentChar <= LL && currentChar >= FL) {
            		fputc(unsubsti(key_clean, currentChar), fileW);
            	} else {
            		fputc(currentChar, fileW);
            	}
            } while (currentChar != EOF);
        } else {
            printf("Impossible d'ouvrir le fichier %s\n", fileR);
            return 2;
        }
	} else {
		printf("USAGE: %s CLE_CHIFFREMENT fichier_a_dechiffrer fichier_sortie\n", argv[0]);
		return 1;
	}

	return 0;
}