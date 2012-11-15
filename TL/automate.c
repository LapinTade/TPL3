#include <stdlib.h>
#include <stdio.h>

// PB AVEC LES STRUCTURES DE LISTES A RESOUDRE

typedef struct s_liste {
        int state;	// Nom de l'etat
        struct s_liste* nxt;	// Etat suivant
} liste;

typedef struct {
         int size;
         int sizeAlpha;
         int* initial;
         int* final;
         liste*** trans;
} automate;

void addToList(liste* tab, int dataToAdd) {
	// Permet l'ajout d'une donnée a la fin d'une liste chainee

	liste* current;
	liste* new;
	new = (liste*) malloc(sizeof(liste));

	current = (liste*) malloc(sizeof(liste));
	current = tab.nxt;

	// On cherche le dernier maillon de la chaine
	while (current != NULL) {
		current = current.nxt;
	}

	// On cree un nouvel etat que l'on ajoute a la suite de la liste
	new.state = dataToAdd;
	current.nxt = new;

	free(new);
	free(current);
}

void ajouteTransition(automate au, int state, int letter,int cible) {
	// Exemple Dans automate au, on ajoute a l'état 2, lettre 1(a), une transition vers 3
	// ajouteTransition(au,2,1,2);
	addToList((liste*) au.trans[state][letter],cible);
}

automate* ConstruitAutomateExemple(int size, int sizeAlpha, int* initial, int* final) {
	automate* au;
	int i,k;

	au = (automate*) malloc(sizeof(automate));

	au.size = size;
	au.sizeAlpha = sizeAlpha;

	au.initial = (int*) malloc(sizeof(int));
	au.initial = initial;

	au.final = (int*) malloc(sizeof(int));
	au.final = final;

	au.trans = (liste***) malloc(sizeof(liste**));

	for (i=1; i<size; i++) {
		// Ajoute les etats
		au.trans = (liste*) malloc(sizeof(liste));

		for (k=0; k<sizeAlpha; k++) {
			// Ajoute les Nom de transitions
			au.trans[i] = (liste*) malloc(sizeof(liste));
		}
	}

	return au;
}

void afficheAutomate(automate au) {
	int j,k;
	int l=0;

	printf("Etat initiaux\n");
	while(au.initial[l] != NULL) {
		printf("%d\n", au.initial[l]);
		l++;
	}

	l=0;
	printf("Etat finaux\n");
	while(au.final[l] != NULL) {
		printf("%d\n", au.final[l]);
		l++;
	}

	printf("Transitions:\n-------------------\n");
	for(l=0; l<au.size; l++) {
		printf("Depuis: %d\n", j);
		for(j=0; j<au.sizeAlpha; j++) {
			printf("Avec: %d\n", j);
			k=0;
			while(au.trans[l][j][k].nxt!=NULL) {
				printf("%d\n", au.trans[l][j][k]);
				k++;
			}
		}
	}
}

int compteTransition(automate au) {
	int nbTransi=0;
	int j,k,l;

	for(l=0; l<au.size; l++) {
		for(j=0; j<au.sizeAlpha; j++) {
			k=0;
			while(au.trans[l][j][k].nxt!=NULL) {
				nbTransi++;
				k++;
			}
		}
	}
	return nbTransi;
}

int main() {
	

	return 0;
}