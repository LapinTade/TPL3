#include <stdlib.h>
#include <stdio.h>
#include <string.h>

int stringSize(char* str) {
	/****
	*	Retourne la taille (int) de la chaine str
	*****/

	int size = 0;

	// Parcourt lettre par lettre str, size compte chaque lettre
	while (*str != '\0') {
		size++;
		str++;
	}
	
	return size;
}

char* stringConcat(char* str1, char* str2) {
	/****
	*	Retourne la concatenation de str1 et str2
	*****/

	char* tmp = malloc(24*sizeof(char));
	int k=0 ,i=0, o=0;

	// On remplit tmp avec str1 puis str2, i et o sont leurs iterrateurs
	for (k=0; k < (stringSize(str1)+stringSize(str2)); k++) {
		if (k < stringSize(str1)) {
			tmp[k] = str1[i];
			i++;
		} else {
			tmp[k] = str2[o];
			o++;
		}
	}

	return tmp;
}

char* concatAvecStringH(char* str1, char* str2) {
	/****
	*	Retourne la concatenation str1 et str2, la plus petite est en premier
	*	AVEC <string.h>
	*****/

	// Test de longueur pour savoir quel str sera en premier
	if (strlen(str1) > strlen(str2)) {
		return strcat(str2,str1);
	} else {
		return strcat(str1,str2);
	}
}

char* concatSansStringH(char* str1, char* str2) {
	/****
	*	Retourne la concatenation str1 et str2, la plus petite est en premier
	*	SANS <string.h>
	*****/

	// Test de longueur pour savoir quel str sera en premier
	if (stringSize(str1) > stringSize(str2)) {
		return stringConcat(str2,str1);
	} else {
		return stringConcat(str1,str2);
	}
}

int main() {
	
	// Session de tests des fonctions

	char* str1 = malloc(12*sizeof(char));
	char* str2 = malloc(12*sizeof(char));
	char* str3 = malloc(12*sizeof(char));
	char* str4 = malloc(12*sizeof(char));

	scanf("%s",str1);
	scanf("%s",str2);

	printf("\nAvec String H\n");
	printf("%s\n\n", concatAvecStringH(str1,str2));

	scanf("%s",str3);
	scanf("%s",str4);

	printf("\nSans String H\n");
	printf("%s\n\n", concatSansStringH(str3,str4));

	return 0;
}