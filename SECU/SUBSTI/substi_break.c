#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int FL = 'A';
int LL = 'Z';

/*
* Analyse Frequentiel sur des lettres doubles
*/
void dualLetterFreq(FILE* fileR) {
	int i;
	char prev;
	prev = '&';
	int iter[26];
	char currentChar;

	for ( i = 0; i<26; i++){
		iter[i]=0;
	}

	do {
		currentChar = fgetc(fileR);

		if(currentChar > LL && (((char)i) == prev)) {
			iter[i - FL]++;
		}
	} while(currentChar != EOF);

	printf("Lettres doubles : Nombre\n");
	for(i=0;i<26;i++) {
		printf("%c:%d,",((char)(i+65)),iter[i]);
	}
	printf("\n");
}

/*
*	Analyse frequentiel des mots de deux lettres
*/
void doubleLetterFreq(FILE* fileR) {
	int i,j;
	int mat[26][26];

	char currentChar;

	char prev, prev1, prev2;
	prev = ' ';
	prev1 = ' ';
	prev2 = ' ';
	
	for(i=0; i<26; i++){
		for(j=0; j<26; j++){
			mat[i][j] = 0;
		}
	}

	while ((currentChar = fgetc(stdin)) != EOF) {
		if (((int)prev)< LL && ((int)prev)>LL && ((int)prev1)< LL && ((int)prev1)>64 && (prev2==' ' || prev2=='\'' || prev2=='-') && (((char)i)==' ' || ((char)i)=='.')){
			mat[((int)prev1)-LL][((int)prev)-LL]++;
		}
		prev2 = prev1;
		prev1 = prev;
		prev = ((char) currentChar);
	}

	for(i=0; i<26; i++){
		for(j=0; j<26; j++){
			printf(" %d ",mat[i][j]);
		}
		printf("\n");
	}
}

/*
* Prends en paramètre un fichier.
* afficher l'indice de la lettre la plus présente (en general e).
*/
void freqAnalysis(FILE* fileR) {
	int currentChar;
	int tabOccurence[26];
	int sum=0;
	int highestInd=0;
	int highestOc=0;
	int k;


	for(k=0; k<26;k++) {
		tabOccurence[k] = 0;
	}

	// Parcourt fichier. Remplit tableau des occurences. Compte nb total lettre.
	do {
		currentChar = fgetc(fileR);

		if(currentChar <= LL && currentChar >= FL) {
			tabOccurence[currentChar - FL]++;
			sum++;
		}
	} while (currentChar != EOF);

	// Recherche de l'indice le plus élevé.
	for(k=0; k<26;k ++) {
		if(tabOccurence[k] > highestOc) {
			highestOc = tabOccurence[k];
			highestInd = k;
		}
	}

	printf("Lettre la plus presente: %c\n", (highestInd+FL));
}

/*
* Fonction qui fait une analyse frequentiel 
*/
void aloneLetterFreq(FILE* fileR) {
	int currentChar;
	int iter[26];
	char prev = ' ';
	char prev2 = ' ';
	int i;

	for ( i = 0; i<26; i++){
		iter[i]=0;
	}

	do {
		currentChar = fgetc(fileR);

		if(((int) prev) < LL && ((int) prev) > FL && (((char) i) == ' ') && prev2 == ' ') {
			iter[((int)prev)- FL]++;	
		}

		prev2 = prev;
		prev = ((char) i);

	} while(currentChar != EOF);

	// Cas une lettre seul à la fin du fichier
	if((((int)prev) < LL) && ((int)prev) > FL && prev2 == ' ') {
		iter[((int)prev) - FL]++;
	}

	printf("Lettre Seule : Nombre\n");
	for(i=0; i<26; i++){
		printf("%c:%d,",((char)(i+65)),iter[i]);
	}	
	printf("\n");
}

void letterBeforeQuoteFreq(FILE* fileR) {
	int i;
	char prev,prev2;
	prev = ' ';
	prev2 = ' ';
	int iter[26];
	char currentChar;

	for ( i = 0; i<26; i++){
		iter[i]=0;
	}

	do {
		currentChar = fgetc(fileR);

		if (((int)prev)<LL && ((int)prev)>FL && (((char) currentChar)=='\'') && prev2==' '){
			iter[((int)prev)-65]++;
		}
		prev2 = prev;
		prev = ((char) currentChar);

	} while(currentChar != EOF);

	if (((int)prev) < LL && ((int)prev) > FL && prev2==' '){
		iter[((int)prev)-65]++;
	}

	printf("Lettre avant quote : Nombre\n");
	for(i=0; i<26; i++){
		printf("%c:%d,",((char)(i+65)),iter[i]);
	}	
	printf("\n");
}

void twoLetterFreq(FILE* fileR) {

}

int main(int argc, char const *argv[]) {
	FILE* fileR;
	FILE* fileW;
	
	if (argc == 3) {

		fileR = fopen(argv[1], "r");
		fileW = fopen(argv[2], "w");

		if (fileR != NULL) {

			freqAnalysis(fileR);
		}
	} else {
		printf("USAGE: %s fichier_a_dechiffrer fichier_sortie\n", argv[0]);
		return 1;
	}

	return 0;
}