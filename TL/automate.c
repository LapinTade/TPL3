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


void ajouteListe(liste** l,int q){
	liste* ptl ;
	liste* tmp ;
	ptl=*l;
	if(!ptl){
		ptl=(liste*) malloc(sizeof(liste));
		ptl->state=q;
		ptl->nxt=NULL;
		*l=ptl;
		return;
	}
	if(ptl->state == q){
		return;
	}
	if(q< ptl->state){
		tmp=*l;
		*l=(liste*) malloc(sizeof(liste));
		(*l)->state=q;
		(*l)->nxt=tmp;
		return;
	}
	while(ptl->nxt && ptl->nxt->state <q){
		ptl=ptl->nxt;
	}
	if(!ptl->nxt){
		ptl->nxt=(liste*) malloc(sizeof(liste));
		ptl=ptl->nxt;
		ptl->state=q;
		ptl->nxt=NULL;
		return;
	}
	if(ptl->nxt->state==q){
		return;
	}
	tmp=ptl->nxt;
	ptl->nxt=(liste*) malloc(sizeof(liste));
	ptl=ptl->nxt;
	ptl->state=q;
	ptl->nxt=tmp;
}

void ajouteTransition(automate* au, int src, int targ, char alpha){
	if (src >= au->size || src < 0 || targ >= au->size || targ < 0 || ((int)(alpha - 'a') >= au->sizeAlpha)){
		printf("L'Etat ou la lettre n'existe pas. \n");
		return;
	}
	ajouteListe(&(au->trans[src][(int)(alpha -'a')]), targ);	
}

void ConstruitAutomateExemple(automate* au, int size, int sizeAlpha) {
	int i,j,k;
	int targ;
	char tran;

	// Tailles générales de l'automates
	au->size = size;
	au->sizeAlpha = sizeAlpha;

	// Etats initiaux
	au->initial = (int*) malloc(au->size*sizeof(int));
	for(i=0; i<au->size; i++) {
		printf("Etat:%d, Initial? Oui:1 | Non:0\n", i);
		scanf ("%d",&k);
		au->initial[i] = k;
	}
	/*au->initial[0]=1;
	au->initial[1]=0;
	au->initial[2]=1;
	au->initial[3]=0;
	au->initial[4]=0;*/

	// Etats finaux
	au->final = (int*) malloc(au->size*sizeof(int));
	for(i=0; i<au->size; i++) {
		printf("Etat:%d, Final? Oui:1 | Non:0\n", i);
		scanf ("%d",&k);
		au->initial[i] = k;
	}
	/*au->final[0]=0;
	au->final[1]=0;
	au->final[2]=1;
	au->final[3]=0;
	au->final[4]=1;*/

	// Creation/initialisations de transitions vides
	au->trans = (liste***) malloc(au->size*sizeof(liste***));
	for(i=0;i<au->size;i++){
		au->trans[i]=(liste**) malloc(au->sizeAlpha*sizeof(liste*));
		for(k=0;k<au->sizeAlpha;k++){
			au->trans[i][k]=NULL;
		}
	}

	for(i=0;i<au->size;i++) {
		printf("Etat: %d | ", i);
		printf("Combien de transitions voulez vous ajouter\n");
		scanf ("%d",&k);
		for(j=0; j<k; j++) {
			printf("\nEtat cible ? (de 0 à %d: ", au->size-1);
			scanf ("%d",&targ);
			printf("\nPar transition ? (a, ..., %c /!\\ à la valeur !)", au->sizeAlpha+97);
			scanf ("%c",&tran);

			ajouteTransition(au,i,targ,tran);
		}
	}


}

void afficheAutomate(automate au) {
	int i,j;
	unsigned char c;

// affichage des états initiaux
	printf("\nLes etats initiaux\n");
	
	for (i=0; i<au.size; i++){
		if (au.initial[i] == 1){
			printf(" %d",i);
		}
	}

// affichage des états finaux
	printf("\nLes etats finaux\n");
	for (i=0; i<au.size; i++){
		if(au.final[i] == 1){
			printf(" %d",i);
		}
	}

// affichage des transitions
	printf("\nLes Transitions\n");
	
	for (i=0; i<au.size; i++){
	printf(">>>\n");
		printf("\nDepuis l'etat %d",i);
		for (j=0; j<au.sizeAlpha; j++){
			// On affiche la lettre de letat 97 étant 'a'
			printf("\navec la lettre %c :\n", c = (unsigned char) j+97);	
			liste* tmp;
			tmp = au.trans[i][j];

			while (tmp != NULL){
				printf(" %d",tmp->state);
				tmp = tmp->nxt;
			}
			printf("\n");
		}
	}
	printf("\n");
}

int compteTransitions(automate au){
	int nb=0;
	int i,j;
	
	// nb est le nombre de transitions
	for (i=0; i<au.size; i++){
		for (j=0; j<au.sizeAlpha; j++){
			liste* tmp;
			tmp = au.trans[i][j];

			while (tmp != NULL){
				nb++;
				tmp = tmp->nxt;
			}
		}
	}

	return nb;
}

int deterministe(automate au) {
	int i,j;
	int ref = 1;
	int state = 0;

	// On regarde si il n'y a qu'un seul etat initial
	while(state < au.size) {
		if(au.initial[state] ==1) {
			// Au premier état on met la reference a 0. Si il y a un
			// deuxieme etat on retournera directement 0
			if(ref) {
				ref = 0;
			} else {
				return 0;
			}
			state++;
		}
	}

	// On a bien un seul etat initial, on remet la ref a 1
	ref = 1;

	// On regarde si il y a au max une transition par lettre
	for(i=0; i<au.size;i++) {
		for(j=0; j<au.sizeAlpha; j++) {
			// Si pour une lettre on en a UNE seule (il faut qu'elle existe)
			if(au.trans[i][j] != NULL && au.trans[i][j]->nxt != NULL) {
				ref = 0;
			}
		}
	}

	return ref;
}

int complet(automate au) {
	int i,j;
	int nb =0;

	// On regarde si toute les lettres sont utilisees pour chaques etats
	for(i=0; i<au.size;i++) {
		for(j=0; j<au.sizeAlpha; j++) {
			if(au.trans[i][j] != NULL) {
				nb++;
			}
		}
		// On compte les transitions par lettres, si leurs nombres
		// est different de sizeAlpha, l'automate n'est pas complet
		if(nb != au.sizeAlpha) {
			return 1;
		}
		nb = 0;
	}

	return 1;
}

void supprimeTransition(automate* au, int src, int targ, char alpha) {
	liste* tmpTrans;
	liste* lastTmp;
	lastTmp = NULL;

	if (src >= au->size || src < 0 || targ >= au->size || targ < 0 || ((int)(alpha - 'a') >= au->sizeAlpha)){
		printf("L'Etat ou la lettre n'existe pas. \n");
		return;
	}

	tmpTrans = au->trans[src][(int) (alpha - 97)];

	// Si la transition demandee n'existe pas on sort
	if(tmpTrans == NULL) {
		return;
	}

	// On recherche la transition cible. lastTmp est la transition precedent
	// la transition actuelle. On sort de la boucle quand on a notre etat
	while(tmpTrans != NULL && tmpTrans->state != targ) {
		lastTmp = tmpTrans;
		tmpTrans = tmpTrans->nxt;
	}

	// Si la transition n'existe pas (notre cible est la premiere)
	// On met la transition suivant en premier de la liste des transi
	// Sinon on enleve notre element l'element suivant de la transition
	// precedante devient l'element suivant de la transtion  courantesupprimee
	// et on libere l'element courant
	if(lastTmp == NULL) {
		au->trans[src][(int) (alpha - 97)] = tmpTrans->nxt;
	} else {
		lastTmp->nxt = tmpTrans->nxt;
	}

	free(tmpTrans);
}

int main() {
	

	return 0;
}