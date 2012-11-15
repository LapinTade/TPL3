#include <stdlib.h>
#include <stdio.h>

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

	liste* current, new;

	current = tab.nxt;

	// On cherche le dernier maillon de la chaine
	while (current != NULL) {
		current = current.nxt;
	}

	// On cree un nouvel etat que l'on ajoute a la suite de la liste
	new.state = dataToAdd;
	current.nxt = new;
}

void ajouteTransition(automate au, int state, int letter) {
	addToList(au.trans[state][letter],letter);
}

void ConstruitAutomateExemple(int size, int sizeAlpha) {
	automate au;
	int i,k;

	au.size = size;
	au.sizeAlpha = sizeAlpha;

	for (i=0; i<size; i++) {
		// Ajoute les etats
		addToList(au.trans, i);

		for (k=0; k<sizeAlpha; k++) {
			// Ajoute les Nom de transitions
			addToList(au.trans[i], k);
		}
	}
}


int main() {
	


	return 0;
}