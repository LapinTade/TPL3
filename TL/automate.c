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

typedef struct {
	int nb_summit;
	liste** neighbours;
} graphe;


void ajouteListe(liste** l,int q){
	liste* ptl;
	liste* tmp;
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
	ajouteListe(&(au->trans[src][(int)(alpha - 97)]), targ);	
}

void construitAutomateExemple(automate* au, int size, int sizeAlpha) {
	int i,j,k;
	int targ;
	char tran;

	// Tailles générales de l'automates
	au->size = size;
	au->sizeAlpha = sizeAlpha;

	// Etats initiaux
	au->initial = (int*) malloc(au->size*sizeof(int));
	/*
	for(i=0; i<au->size; i++) {
		printf("Etat:%d, Initial? Oui:1 | Non:0\n", i);
		scanf ("%d",&k);
		au->initial[i] = k;
	}//*/
	//*
	au->initial[0]=1;
	au->initial[1]=0;
	au->initial[2]=1;
	au->initial[3]=0;
	au->initial[4]=0;//*/

	// Etats finaux
	au->final = (int*) malloc(au->size*sizeof(int));
	/*
	for(i=0; i<au->size; i++) {
		printf("Etat:%d, Final? Oui:1 | Non:0\n", i);
		scanf ("%d",&k);
		au->initial[i] = k;
	}//*/
	//*
	au->final[0]=0;
	au->final[1]=0;
	au->final[2]=1;
	au->final[3]=0;
	au->final[4]=1; //*/

	// Creation/initialisations de transitions vides
	au->trans = (liste***) malloc(au->size*sizeof(liste***));
	for(i=0;i<au->size;i++){
		au->trans[i]=(liste**) malloc(au->sizeAlpha*sizeof(liste*));
		for(k=0;k<au->sizeAlpha;k++){
			au->trans[i][k]=NULL;
		}
	}

	/*
	for(i=0;i<au->size;i++) {
		printf("Etat: %d | ", i);
		printf("Combien de transitions voulez vous ajouter\n");
		scanf ("%d",&k);
		for(j=0; j<k; j++) {
			printf("\nEtat cible ? (de 0 à %d): ", au->size-1);
			scanf ("%d",&targ);
			printf("\nPar transition ? (a, ..., %c /!\\ à la valeur !)", au->sizeAlpha+96);	// 97:a; -1 pour la taille
			scanf ("%s",&tran);
			printf("%c\n", tran);
			ajouteTransition(au,i,targ,tran);
		}
	}//*/
	//*
	ajouteTransition(au,0,1,'a');
	ajouteTransition(au,0,2,'a');
	ajouteTransition(au,0,3,'a');

	ajouteTransition(au,1,3,'b');

	ajouteTransition(au,2,3,'a');
	ajouteTransition(au,2,4,'b');

	ajouteTransition(au,3,3,'b');
	ajouteTransition(au,3,4,'b');

	ajouteTransition(au,4,4,'a');//*/


}

void afficheAutomate(automate au){
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
	printf("------------------------------\n");
		printf("\nDepuis l'etat %d",i);
		for (j=0; j<au.sizeAlpha; j++){
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

void supprimeTransEtat(automate* au, int state) {
	if(state >= au->size || state < 0) {
		printf("L'etat n'existe pas\n");
		return;
	}

	liste* tmpCurrent;
	int i;

	for(i=0;i<au->sizeAlpha; i++) {
		tmpCurrent = au->trans[state][i];
		while(tmpCurrent != NULL) {
			supprimeTransition(au, state, tmpCurrent->state,(char)('a'+i));
			tmpCurrent = au->trans[state][i];
		}
	}
}

void supprimeEtat(automate* au, int state) {
	int i,j,k;
	int* tmp;
	liste* tmpLst;
	liste*** tmpListeTrans;

	if(state >= au->size || state < 0) {
		printf("L'etat n'existe pas !\n");
		return;
	}

	// Supprime toute les transitions de l'etat state
	for(i=0; i<au->size;i++) {
		if(i == state) {
			supprimeTransEtat(au, state);
		} else {
			for(j=0; j<au->sizeAlpha; j++){
				// Supprime les transitions en direction de state
				supprimeTransition(au, i, state, ((char)('a'+j)));
			}
		}
	}

	//Toutes les transitions en provenance et vers cet état sont enlevées  
	au->size = au->size - 1;
	tmp = au->initial;
	au->initial = (int*) malloc(au->size*sizeof(int));
	j = 0;
	for(i=0; i<=au->size; i++){
		if(i != state){
			au->initial[j] = tmp[i];
			j++;
		}
	}
	free(tmp);
	tmp = au->final;
	au->final = (int*) malloc(au->size*sizeof(int));
	j = 0;
	for(i=0; i<=au->size; i++){
		if(i != state){
			au->final[j] = tmp[i];
			j++;
		}
	}
	free(tmp);

	//Les variables et les deux tableaux de type d'etats sont changés

	tmpListeTrans = au->trans;
	
	au->trans = (liste***) malloc (au->size*sizeof(liste**));

	j = 0;
	for(i=0; i<=au->size; i++){
		if(i != state){
			au->trans[j] = tmpListeTrans[i];
			j++;
		}else{
			free(tmpListeTrans[i]);
			
		}
	}

	free(tmpListeTrans);

	//Le tableau des transitions est changé, il suffit de décrémenter les états

	for(i=0; i<au->size; i++){
		for(j=0; j<au->sizeAlpha; j++){
			tmpLst = au->trans[i][j];
			
			while(tmpLst != NULL){
				if(tmpLst->state > state){
					tmpLst->state = tmpLst->state - 1;
				}
				tmpLst = tmpLst->nxt;
			}

				
		}
	}
}

automate completer(automate au) {
	liste*** tmp = (liste***) malloc((au.size + 1)*sizeof(liste**));
    int* newinit = (int*) malloc((au.size + 1)*sizeof(int));
    int* newfinal = (int*) malloc((au.size + 1)*sizeof(int));

    int i,j,db = au.size;

    for(i=0;i<au.size;i++) {
        tmp[i] = au.trans[i];
        newinit[i] = au.initial[i];
        newfinal[i] = au.final[i];
    }

    tmp[db] =(liste**) malloc(au.sizeAlpha*sizeof(liste*));

    for(j=0;j<au.sizeAlpha;j++) {
        tmp[db][j] = NULL;
    }
    newinit[db] = 0;
    newfinal[db] = 0;

    au.size = db + 1;
    au.trans = tmp;
    au.initial = newinit;
    au.final = newfinal;

    for(i=0;i<au.size;i++) {
        for(j=0;j<au.sizeAlpha;j++) {
            if(au.trans[i][j] == NULL) {
                ajouteTransition(&au,i,db,(char) j + 97);
            }
        }
    }

    return au;
}


void fusionEtats(automate* au, int etat1, int etat2){
	int i,j;
	liste* tmpLst;

	if (etat1 >= au->size || etat1 < 0 || etat2 >= au->size || etat2 < 0 ){
		printf("L'Etat ou la lettre n'existe pas. \n");
		return;
	}
	
	

	// on met les transitions de l'état 2 dans l'état 1
	for(i=0; i<au->size; i++){
		for(j=0; j<au->sizeAlpha; j++){
			tmpLst = au->trans[i][j];
			while(tmpLst != NULL){
				if(i==etat2){
					if(tmpLst->state == etat2){
						ajouteTransition(au,etat1,etat1,('a'+j));
					}else{
						ajouteTransition(au,etat1,tmpLst->state,('a'+j));
					}
				}
				if(tmpLst->state == etat2){
					ajouteTransition(au,i,etat1,('a'+j));
				}
				tmpLst = tmpLst->nxt;	
			}
		}
	}

// on met à jour les tableaux d'états initiaux et finaux

	if(au->initial[etat2] == 1){
		au->initial[etat1] = 1;
	}
	if(au->final[etat2] == 1){
		au->final[etat1] = 1;
	}

	supprimeEtat(au,etat2);	
}


///////////////////////// PARTIE DU VIDE / GRAPHE

//fonction de parcour en profondeur
void parcour(graphe* au, int p, int** tab){
	int* color = *tab;

	color[p] = 1;
	liste* tmp = (au->neighbours)[p];
	while(tmp != NULL){
		if(color[tmp->state] == 0){
			parcour(au, tmp->state, tab);
		}
		tmp = tmp->nxt;
	}
}

int chemin(graphe* gr,int p, int q){
	int i;
	int ** color;
	int *tmp;
	int res = 0;
	color = (int **) malloc (sizeof(int*));
	*color = (int*) malloc((gr->nb_summit)*sizeof(int));
	for(i=0; i<gr->nb_summit; i++){
		(*color)[i] = 0;
	}

	for(i=0; i<(gr->nb_summit); i++){
		parcour(gr,p,color);
	}

		
	tmp = (*color);
	res = tmp[q];
	free(*color);
	free(color);
	return res;	
}

void automateToGraphe(automate* au, graphe* gr){
	int i,j;
	liste* tmp;

	// initialisation du graphe avec la taille 
	gr->nb_summit = au->size;

	// création de la liste des voisins
	gr->neighbours = (liste**)malloc(gr->nb_summit*sizeof(liste*));
	for(i=0; i<gr->nb_summit; i++){
		gr->neighbours[i] = NULL;
	}
	// ajout des neighbours suivant les transitions présentes dans l'automate
	for(i=0;i<au->size;i++){
		for(j=0;j<au->sizeAlpha;j++){
			tmp = au->trans[i][j];
			while(tmp != NULL){
				ajouteListe(&(gr->neighbours[i]),tmp->state);
				tmp = tmp->nxt; 
			}
		}
	}

}


void afficheGraphe(graphe G){
	int i;
	liste* tmp;

	printf("---> Graphe <---\n");
	for(i=0 ; i<G.nb_summit ; i++){
		tmp = G.neighbours[i];
		printf("%d : ",i);

		while(tmp != NULL){
			printf(" %d,",tmp->state);
			tmp = tmp->nxt; 
		}

		printf("\n");
	}
	
}


void supprimeGraphe(graphe* gr){
	int i;
	liste* tmp_current;
	liste* tmp_delete;

	// Ici on supprime les voisins de chaques sommets
	for(i=0 ; i<gr->nb_summit ; i++){
		tmp_current = gr->neighbours[i];
		while(tmp_current != NULL){
			tmp_delete = tmp_current;
			tmp_current = tmp_current->nxt;
			free(tmp_delete);
		}
	}

	// libération de la mémoire
	free(gr->neighbours);
	free(gr);
	gr = NULL;
}


int langageVide(automate* au){
	int i,k;
	int sum = 0;

	graphe* gr = (graphe*)malloc(sizeof(graphe));

	automateToGraphe(au, gr);

	// On verifie si à partir de chaque état initial on a un chemin.
	// Si la sum == 0; alors aucun chemin ne part des états initials
	// Le langage est donc vide.

	for(i=0 ; i<au->size ; i++){
		if(au->initial[i] == 1){
			for(k=0 ; k<au->size ; k++){
				if(au->final[k] == 1){
					sum = sum + chemin(gr,i,k);
				}
			}
		}
	}

	supprimeGraphe(gr);
	
	if(sum == 0){
		return 1;
	}else{
		return 0;
	}
}


void supprimeNonCoAccessibles(automate* au){
	int i, k, sum, size;
	graphe* gr = (graphe*)malloc(sizeof(graphe));
	i = 0;
	size = au->size;
	int toDelete[size];

	for(k=0; k<size; k++){
		toDelete[k] = 0;
	}

	automateToGraphe(au, gr);
	afficheGraphe(*gr);

	// Recherche des états non coaccessible
	// Pour chaque état on compte le nombre de chemin qui y parte
	// Si cette sum == 0 alors l'état est non coaccessible
	// On l'ajoute alors dans la liste des états a supprimer
	for(i=0; i<gr->nb_summit; i++){
		sum = 0;
		for(k=0; k < size; k++){
			if(au->final[k] == 1){
				sum += chemin(gr,i,k);
			}
		}
		if(sum == 0){
			toDelete[i] = 1;
		}
	}

	// supression des états
	sum = 0;
	for(k=0; k < size; k++){
		if(toDelete[k] == 1){
			supprimeEtat(au,(k - sum));
			sum++;
		}
	}
	supprimeGraphe(gr);

}


void supprimeNonAccessibles(automate* au){
	int i, k, sum, size;
	graphe* gr = (graphe*)malloc(sizeof(graphe));
	i = 0;
	size = au->size;
	int toDelete[size];

	for(k=0; k<size; k++){
		toDelete[k] = 0;
	}

	automateToGraphe(au, gr);
	afficheGraphe(*gr);

	// Recherche des états non accessible
	// Pour chaque état on compte le nombre de chemin qui y mène
	// Si cette sum == 0 alors l'état est non accessible
	// On l'ajoute alors dans la liste des états a supprimer
	for(i=0; i<gr->nb_summit; i++){
		sum = 0;
		for(k=0; k < size; k++){
			if(au->final[k] == 1){
				sum += chemin(gr,k,i);
			}
		}
		if(sum == 0){
			toDelete[i] = 1;
		}
	}

	// supression des états
	sum = 0;
	for(k=0; k < size; k++){
		if(toDelete[k] == 1){
			supprimeEtat(au,(k - sum));
			sum++;
		}
	}
	supprimeGraphe(gr);

}


void produit(automate* au1, automate* au2, automate* prod){
	int m,i,j;
	int taille, currentSizeAlpha;
	automate* petit;
	automate* grand;
	liste* tmpPetit;
	liste* tmpGrand;

	// La taille de l'automate sous produit est celle du plus petit automate

	if(au1->size >= au2->size){
		m = au1->size;
		grand = au1;
		petit = au2;
	}else{
		m = au2->size;
		grand = au2;
		petit = au1;
	}

	taille = m * petit->size;
	
	if(au1->sizeAlpha >= au2->sizeAlpha){
		currentSizeAlpha = au2->sizeAlpha;
	}else{
		currentSizeAlpha = au1->sizeAlpha;
	}

// initialisation du nouvel automate

	prod->size = taille;
	prod->sizeAlpha = currentSizeAlpha;

	
	prod->initial=(int*) malloc(taille*sizeof(int));
	prod->final=(int*) malloc(taille*sizeof(int));

// gestion états initiaux/finaux

	for(i=0; i<taille; i++){
		if(petit->initial[i/m] == 1 && grand->initial[i%m] == 1){
			prod->initial[i] = 1;
		}else{
			prod->initial[i] = 0;
		}


		if(petit->final[i/m] == 1 && grand->final[i%m] == 1){
			prod->final[i] = 1;
		}else{
			prod->final[i] = 0;
		}
	}

	
// création de la liste des transition
	prod->trans=(liste***) malloc(taille*sizeof(liste**));
	for(i=0;i<taille;i++){
		prod->trans[i]=(liste**) malloc(currentSizeAlpha*sizeof(liste*));
		for(j=0;j<currentSizeAlpha;j++){
			prod->trans[i][j]=NULL;
		}
	}


// ajout des transitions d'après le modèle mathématique proposé

	for(i=0; i<taille; i++){
		for(j=0; j<currentSizeAlpha; j++){
			tmpGrand = grand->trans[i%m][j] ;
			tmpPetit = petit->trans[i/m][j] ;


			while(tmpPetit != NULL){
				
				while(tmpGrand != NULL){
					
					ajouteTransition(prod,i,((tmpPetit->state * m)+tmpGrand->state),(char)('a' + j));
					tmpGrand = tmpGrand->nxt;
				}
				tmpPetit = tmpPetit->nxt;
				tmpGrand = grand->trans[i%m][j] ;
			}

		}
	}
	
	
}



int intersectionVide(automate* au1, automate* au2){
	automate* tmp = (automate*)malloc(sizeof(automate));
	int res = 0;

	// On effectue le produit des deux automates
	// Le langage est vide si l'intersection est vide

	produit(au1, au2, tmp);

	res = langageVide(tmp);	

	//supprimeAutomate(tmp);

	// REtour 1 si l'intersection est vide, et 0 le contraire
	return res;
	
}



int main() {
   	int continuer = 1;
   	int continuer2 = 1;
	automate* au = (automate*) malloc(sizeof(automate));
    int choix = 0;
    int size, sizeAlpha;
    int i, k, j;
    int targ;
	char tran;

    while(continuer) {
    	printf("Voulez-vous utiliser un automate exemple ? (1: Oui; 2 Non)\n");
    	scanf("%i", &choix);
    	switch(choix) {
    		case 1:
    			construitAutomateExemple(au, 6, 3);
    			afficheAutomate(*au);
    			break;
    		case 2:
    			printf("Taille?(size): \n");
    			scanf("%i", &size);
    			printf("Taille Alpha?(sizeAlpha: \n");
    			scanf("%i", &sizeAlpha);

    			au->size = size;
				au->sizeAlpha = sizeAlpha;

				au->initial = (int*) malloc(au->size*sizeof(int));

				for(i=0; i<au->size; i++) {
					printf("Etat:%d, Initial? Oui:1 | Non:0\n", i);
					scanf("%d",&k);
					au->initial[i] = k;
				}

				au->final = (int*) malloc(au->size*sizeof(int));

				for(i=0; i<au->size; i++) {
					printf("Etat:%d, Final? Oui:1 | Non:0\n", i);
					scanf ("%d",&k);
					au->initial[i] = k;
				}

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
						printf("\nEtat cible ? (de 0 à %d): ", au->size-1);
						scanf ("%d",&targ);
						printf("\nPar transition ? (a, ..., %c /!\\ à la valeur !)", au->sizeAlpha+96); // 97:a; -1 pour la taille
						scanf ("%s",&tran);
						printf("%c\n", tran);
						ajouteTransition(au,i,targ,tran);
					}
				}
				afficheAutomate(*au);

    			break;
    	}

    	int selection1, selection2;
    	char trans;
    	while(continuer2) {
    		printf("\n>1. Afficher l'automate\n>2. Completer l'automate\n>3. L'automate est-il complet ?\n>4. L'automate est-il deterministe?\n>5. Supprimer un etat de l'automate\n>6. Fusionner 2 etats de l'automate\n>7. Supprimer une transition de l'automate\n>8. Ajouter une transition a l'automate\n>9. Arreter programme\n> Choix : ");
			scanf("%i", &choix);

			switch(choix) {
				case 1:
					afficheAutomate(*au);
					break;
				case 2:
					printf("Completition:\n");
					*au = completer(*au);
					break;
				case 3:
					if(complet(*au))
                        printf("\nL'automate est complet.");
                    else
                        printf("\nL'automate n'est pas complet.");
                    break;
                case 4:
                	if(deterministe(*au))
                        printf("\nL'automate est deterministe.");
                    else
                        printf("\nL'automate n'est pas deterministe.");
                    break;
                case 5:
                	printf("\nEntrer le numero de l'etat : ");
                    scanf("%i", &selection1);
                    supprimeEtat(au,selection1);
                    break;
                case 6:
                	printf("Fonction bug, segmentation error\n");
                	printf("\nEntrer le numero du premier etat : ");
                    scanf("%i",&selection1);
                    printf("\nEntrer le numero du second etat : ");
                    scanf("%i",&selection2);
					fusionEtats(au,selection1,selection2);
					break;
				case 7:
					printf("\nEntrer le numero de l'etat depart : ");
                    scanf("%d",&selection1);
                    printf("\nEntrer le numero de l'etat d'arrivee : ");
                    scanf("%d",&selection2);
                    printf("\nEntrer la lettre de la transition : ");
                    scanf("%c",&trans);
                    scanf("%c",&trans);
                    supprimeTransition(au,selection1,selection2,trans);
                    break;
                case 8:
                	printf("\nEntrer le numero de l'etat depart : ");
                    scanf("%d",&selection1);
                    printf("\nEntrer le numero de l'etat d'arrivee : ");
                    scanf("%d",&selection2);
                    printf("\nEntrer la lettre de la transition : ");
                    scanf("%c",&trans);
                    scanf("%c",&trans);
                    ajouteTransition(au,selection1,selection2,trans);
                    break;
                case 9:
                	continuer = 0;
                	continuer2 = 0;
                	break;
                default:
                	printf("Mauvaise entrée\n");
			}
    	}
    }


	return 0;
}
