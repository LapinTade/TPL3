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
	int nombre_sommets;
	liste** voisins;
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
	liste* tmp = (au->voisins)[p];
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
	*color = (int*) malloc((gr->nombre_sommets)*sizeof(int));
	for(i=0; i<gr->nombre_sommets; i++){
		(*color)[i] = 0;
	}

	for(i=0; i<(gr->nombre_sommets); i++){
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
	gr->nombre_sommets = au->size;

	// création de la liste des voisins
	gr->voisins = (liste**)malloc(gr->nombre_sommets*sizeof(liste*));
	for(i=0; i<gr->nombre_sommets; i++){
		gr->voisins[i] = NULL;
	}
	// ajout des voisins suivant les transitions présentes dans l'automate
	for(i=0;i<au->size;i++){
		for(j=0;j<au->sizeAlpha;j++){
			tmp = au->trans[i][j];
			while(tmp != NULL){
				ajouteListe(&(gr->voisins[i]),tmp->state);
				tmp = tmp->nxt; 
			}
		}
	}

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
