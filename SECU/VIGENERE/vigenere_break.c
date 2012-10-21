#include <stdio.h>
#include <stdlib.h>

char decrypt(char key, char letter) {
	int i,u;

	int fl = 'A';

	if ((letter - key) < 0)
		return (letter - key + 26)% 26 + fl;
	else
		return (letter - key)% 26 + fl;
}

// @TODO Decrypt du texte
// @TODO Debug du calcul de lindice de coincidence
int main(int argc, char const *argv[]) {
	int fl = 'A';
	int ll = 'Z';
	int lRef = 'E';
	int nbLetters;
	int k;

	FILE* fileR = NULL;
	int currentChar = 0;

	float ci = 0.075;			// Indice coiincidence de reference
	float around = 0.01;		// Approximation autorise
	float currentCI = 0;		// IC courrant
	int size = 1;			// Taille presume de la clef
	int tabOccurence[26];	// Tableau nb occurence de chaque lettre de A a Z

	if (argc == 3) {
		
		// Obentention de la longueur de la clef en calculant l'indice de
		// coincidence toutes les size lettres. Si l'indice est environ egal a
		// 0.075 (IC francais), alors on a probablement trouvé la taille clef.
		while (((currentCI > (ci + around)) || (currentCI < (ci - around))) && (size < 26)) {
			fileR = fopen(argv[1], "r");
			//Reinitialisation des donnees
			for (k=0; k<26;k ++) {
				tabOccurence[k] = 0;
			}
			size += 1;
			nbLetters = 0;
			currentCI = 0;

			if (fileR != NULL) {

				do {
					currentChar = fgetc(fileR);

					// Si on a une lettre compris entre A et Z
					if(currentChar <= ll && currentChar >= fl) {
						// On prends toutes les size lettres
						if(nbLetters % size == 0) {
							currentChar -= fl;
							tabOccurence[currentChar]++;
						}
						nbLetters++;
					}

				} while (currentChar != EOF);
			} else {
			printf("Impossible d'ouvrir le fichier %s\n", fileR);
			return 2;
			}
			fclose(fileR);
			//currentCI *= 10;
			printf("ri: %f -- size: %i\n", currentCI, size);
		}

		// On a donc la cle de taille size On procède donc a une analyse de
		// frequence car toute les lettres espacee de size sont decalee du 
		// meme indice

		int l = 0;
		FILE* fileW = NULL;
		int shift;
		int key[26];
		int highestOc = 0;
		int highestInd = 0;

		for (k=0; k<26;k ++) {
				key[k] = 0;
			}

		for(l=0;l<size;l++) {
			fileR = fopen(argv[1], "r");
			fileW = fopen(argv[2], "w");
			shift = 0;

			//Reinitialisation des donnees
			for (k=0; k<26;k ++) {
				tabOccurence[k] = 0;
			}
			//printf("RESULTAT: %f ==> size: %d\n", currentCI, size);

			if (fileR != NULL && fileW != NULL) {

				// On compte les occurences des lettres toute les size lettres
				do {
					currentChar = fgetc(fileR);

					// Si on a une lettre compris entre A et Z
					if(currentChar <= ll && currentChar >= fl) {
						// On prends toutes les size lettres
						if(nbLetters % size == 0) {
							currentChar -= fl;
							tabOccurence[currentChar]++;
						}
						nbLetters++;
					}

				} while (currentChar != EOF);

				for(k=0; k<26;k ++) {
					if(tabOccurence[k] > highestOc) {
						highestOc = tabOccurence[k];
						highestInd = k;
					}
				}
				//On obtient le decalage grace a la lettre ayant le plus d'occurence et la lettre de reference ici E
				shift = highestInd - (lRef -fl);
				if (shift < 0) shift + 26;

				key[l] = shift;
				fclose(fileR);

				// On re parcourt le fichier pour decripter les lettres
				// Cest un dechiffrement de cesar toutes les sizes lettres

				//TODO

			} else {
				printf("Impossible d'ouvrir le fichier");
				return 2;
			}
		}	
	} else {
 		printf("USAGE: %s fichier_a_decrypter fichier_sortie\n", argv[0]);
 		return 1;
	}

	return 0;
}