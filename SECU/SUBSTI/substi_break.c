#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int FL = 'A';
int LL = 'Z';

/*
* Analyse Frequentiel sur des lettres doubles
*/
void dualLetterFreq(const char* nomFile) {
	int i;
	char prev;
	prev = '&';
	int iter[26];
	char currentChar;

	for ( i = 0; i<26; i++){
		iter[i]=0;
	}

	FILE* fileR = fopen(nomFile, "r");
	do {
		currentChar = fgetc(fileR);

		if(currentChar > LL && (((char)currentChar) == prev)) {
			iter[currentChar - FL]++;
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
void doubleLetterFreq(const char* nomFile) {
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
	FILE* fileR = fopen(nomFile, "r");

	do {
		currentChar = fgetc(fileR);
		if (((int)prev)< LL && ((int)prev)>FL && ((int)prev1)< LL && ((int)prev1)>FL && (prev2==' ' || prev2=='\'' || prev2=='-') && (((char)currentChar)==' ' || ((char)currentChar)=='.')){
			mat[((int)prev1)-FL][((int)prev)-FL]++;
		}
		prev2 = prev1;
		prev1 = prev;
		prev = ((char) currentChar);
	} while(currentChar != EOF);

	printf("Freq des mots de deux lettres: format de tableau a,b,...,z par a,b,...,z:\n");
	printf(" ");
	for(i=0; i<26; i++) {
		printf(" %c ", i + FL);
	}
	printf("\n");
	for(i=0; i<26; i++){
		printf("%c", i + FL);
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
void freqAnalysis(const char* nomFile) {
	char currentChar;
	int tabOccurence[26];
	int sum=0;
	int highestInd=0;
	int highestOc=0;
	int k;

	FILE* fileR = fopen(nomFile, "r");
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
void aloneLetterFreq(const char* nomFile) {
	char currentChar;
	int iter[26];
	char prev = ' ';
	char prev2 = ' ';
	int i;

	for ( i = 0; i<26; i++){
		iter[i]=0;
	}
	FILE* fileR = fopen(nomFile, "r");

	do {
		currentChar = fgetc(fileR);

		if(((int) prev) < LL && ((int) prev) > FL && (((char) currentChar) == ' ') && prev2 == ' ') {
			iter[((int)prev)- FL]++;	
		}

		prev2 = prev;
		prev = ((char) currentChar);

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

void letterBeforeQuoteFreq(const char* nomFile) {
	int i;
	char prev,prev2;
	prev = ' ';
	prev2 = ' ';
	int iter[26];
	char currentChar;

	for ( i = 0; i<26; i++){
		iter[i]=0;
	}
	FILE* fileR = fopen(nomFile, "r");

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

int main(int argc, char const *argv[]) {
	FILE* fileR;
	FILE* fileW;
	char currentChar;

	if (argc == 3) {

		printf("%s\n",argv[1] );
		//fileR = fopen(argv[1], "r");
		//fileW = fopen(argv[2], "w");

		if (fileR != NULL) {
			freqAnalysis(argv[1]);
			("\nOrdre frequence lettre seule avant apostrophe : T, S, D, J, L, M, C ou N\n");
			aloneLetterFreq(argv[1]);
			dualLetterFreq(argv[1]);
			("\nOrdre frequence lettre des mots de deux lettres: E, M, L, N, F, T et C\n")
			doubleLetterFreq(argv[1]);
			letterBeforeQuoteFreq(argv[1]);
		}
	} else {
		printf("USAGE: %s fichier_a_dechiffrer fichier_sortie\n", argv[0]);
		return 1;
	}

	return 0;
}