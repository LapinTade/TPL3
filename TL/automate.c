#include <stdlib.h>
#include <stdio.h>

typedef struct s_liste {
        int state;
        struct s_liste* nxt;
} liste;

typedef struct {
         int size;
         int sizealpha;
         int* initial;
         int* final;
         liste*** trans;
} automate;

void addList(int* tab, int stateToAdd) {
	liste current, new;

	current = au.trans[state][lettre].nxt;

	while (current != NULL) {
		current = current.nxt;
	}

	new.state = stateToAdd;
	current.nxt = new;
}

void ajouteTransition(automate au, int state, int letter) {
	addList(au.trans[state][lettre],letter);
}


int main() {
	


	return 0;
}