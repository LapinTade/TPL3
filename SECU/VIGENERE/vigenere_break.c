#include <stdio.h>
#include <stdlib.h>

// Vigenere BREAK

// Declaration des fonctions

float calculIndCoinc(char*, int);
int calculCle(char* nomFich, int longCle, int j);
void dechiffre(char* nomFich, char* cle);

int main(int argc, char *argv[]) {

	int inverseTab = 0;
	char* cle = NULL;
	char* nomFichier = argv[1];
	float ind = 0.0;
	int tailleCle = 0;
	int premierDec;
	int nbIt = 0;	
	/* Appel de la fonction calculIndCoinc qui calcul l'indice de coincidence du texte.
	   Pour commencer le texte est parcouru caractère par caractère, 
	   puis l'espace entre les caractères lu est incrémenté pour en déduire la taille de la clé.
	   Une fois un indice de coincidence élevé trouvé, 
	   le parcour de la boucle s'arrete et nous avons la taille de la clé. */
	while (ind < 0.067) {
		tailleCle ++;
		ind = calculIndCoinc(nomFichier,tailleCle);
		printf("Indice COINCIDENCE : %f           Longueur CLE : %d\n",ind,tailleCle);
	}
	printf("L'indice de coincidence est de : %f, la taille de clé est donc de : %d\n",ind,tailleCle);
	// Allocation dynamique de la taille du tableau servant à stocker la clé.
	cle = malloc(tailleCle * sizeof(int));
	// Appel de la fonction calculCle qui retourne la cle de chiffrement.
	// La clé est retournée dans l'ordre inverse.
	for (nbIt = 0; nbIt < tailleCle;nbIt++) {
		premierDec = calculCle(nomFichier, tailleCle , nbIt+1);
		cle[nbIt] = premierDec+65;
	}
	// On inverse le tableau pour obtenir la clé dans le bon sens.
	for (nbIt = 0; nbIt < tailleCle/2;nbIt++) {
		inverseTab = cle[nbIt];
        cle[nbIt] = cle[tailleCle - nbIt - 1];
        cle[tailleCle - nbIt - 1] = inverseTab;
	}
	// Affichage de la clé utilisée.
	printf("Cle utilisée : ");
	for (nbIt = 0; nbIt < tailleCle;nbIt++) {
		printf("%c",cle[nbIt]);
	}
	printf("\n");
	// Appel de la fonction dechiffre qui va dechiffrer le texte entré en paramètre
	// grace à la clé trouvée auparavant.
	dechiffre(nomFichier,cle);
		
}

/* Fonction calculant l'indice de coincidence.
   Deux paramètres, le nom du fichier et le pas de lecture des caractères
   par exemple une lettre sur deux, trois ...
   La fonction retourne l'indice de coincidence. 
*/

float calculIndCoinc(char* nomFich, int i){
	int caractereActuel = 0;
	int indiceTab = 0;
	int nbLettre = 0;
	int j = i;
	int t = 0;
	float indiceCoin = 0.0;
	FILE* fichier = NULL;
	int tableau[26];
	// Initialisation du tableau
	for (t = 0 ; t < 26 ; t++)
	{
		tableau[t] = 0;
	}	
	// Ouverture du fichier de lecture
	fichier = fopen(nomFich, "r");
	if (fichier != NULL) {
		do
		{
			caractereActuel = fgetc(fichier); // On lit le caractère
			if (j == i) { // Si j est égal à i qui est l'espace entre les caractères lu dans le texte.
				if(caractereActuel < 91 && caractereActuel > 64) { // Si le caractère est compris en A-Z
					nbLettre += 1; // Incrémentation du nombre de caractère lus.
					indiceTab = caractereActuel - 65; // Stockage de la lettre.
					if (indiceTab > -1 && indiceTab < 26) 
						tableau[indiceTab]++;
					j = 0; // Le caractère est lu, remise à de l'espace mis entre les caractères.
					}
				}
				if(caractereActuel < 91 && caractereActuel > 64) {
					j++; // Incrémentation de l'espace entre les caractères.
				}
		 } while (caractereActuel != EOF); // On continue tant que fgetc n'a pas retourné EOF
		// Calcul de l'indice de coincidence.		
		for (t = 0 ; t < 26 ; t++)
		{
			indiceCoin += (tableau[t]*(tableau[t] - 1.0))/(nbLettre * (nbLettre - 1.0));
		}	
		fclose(fichier); // Fermeture des fichiers   
		}
		// On retourne l'indice de coincidence.
		return indiceCoin;
}

/*
Fonction qui calcul la clé.
Elle prend trois paramètres, le nom du fichier à decrypter
la longueur de la clé et le decalage a appliquer sur le texte
cela reprend le même principe de précédement.
*/

int calculCle(char* nomFich, int longCle, int j){
	    
	FILE* fichier = NULL;
    int caractereActuel = 0;
	int indiceTab = 0;
	int tableau[26];
	int grand = 0;
	int grandIndice = 0;
	int decalage = 0;
	int reste = 0;
	int i;
	int depasse = 0;
    fichier = fopen(nomFich, "r");
	for (i = 0 ; i < 26 ; i++)
    {
    	tableau[i] = 0;
    }
    if (fichier != NULL)
    {
        // Boucle de lecture des caractères un à un
        do
        {
            caractereActuel = fgetc(fichier); // On lit le caractère
			if (j == longCle) { 
				if(caractereActuel < 91 && caractereActuel > 64) {
			// Si le caractere est compris entre A-Z on baisse sa valeur ASCII de 0 a 26 pour le placer dans le tableau
					indiceTab = caractereActuel - 65;
					if (indiceTab > -1 && indiceTab < 26) 
						tableau[indiceTab]++;  // On incrémente le contenu du tableau pour l indice indiceTab
					j = 0;
				}
			}
			if(caractereActuel < 91 && caractereActuel > 64) {
				j++;
			}
        } while (caractereActuel != EOF); // On continue tant que fgetc n'a pas retourné EOF (fin de fichier)
 		
        fclose(fichier); // fermeture du fichier
    }
 	
	grand = tableau[0];
	grandIndice = 0;
 	// Ici on compare le contenu de tout les indices du tableau et on garde le plus grand. Il correspondra a la lettre "E"
	for (i = 0 ; i < 26 ; i++)
    {
		if(tableau[i]>grand) {
			grand = tableau[i];
			grandIndice = i;
		}
    }
	decalage = grandIndice - 4; // On en déduit le décalage. 4 correspond a la lettre "E"	

	// C'est a grace a la lettre E que le decalage est calcule car c'est la lettre la plus utilisée en francais.
	// On retourne le decalage césar pour un décalage de j.
	// La fonction sera répétée autant de fois que la longueur que la clé de chiffrement vigenere.
	return decalage;
}

/*
Fonction de dechiffrement Vigenere
Prend deux paramètres le nom du fichier chiffré
ainsi que la clé de chiffrement.
*/

void dechiffre(char* nomFich, char* cleVig){
	FILE* fichier = NULL;
	FILE* fichierbis = NULL;
	int caractereActuel = 0;
	int reste = 0;
	int lettreDecrypt = 0;
	int j = 0;
	// Ouverture du fichier de lecture
	fichier = fopen(nomFich, "r");
	// Ouverture du fichier d ecriture
	fichierbis = fopen("textes/TexteDecrypteVigenere.txt", "w");
	if (fichier != NULL) {
    if (fichierbis != NULL)
    {
        // Boucle de lecture des caractères un à un
        do
        {	//Si la cle est terminee, le compteur j est remis a 0 pour pouvoir reparcourir la cle.
			if(cleVig[j]=='\0') {
				j = 0;
			}
		    caractereActuel = fgetc(fichier); // On lit le caractère
			if(caractereActuel < 91 && caractereActuel > 64) { // Si le caractere est compris en A-Z on affecte le pas.
				lettreDecrypt = 'Z' + (caractereActuel - cleVig[j] - 25 ) % 26; 
				j++; 	// Incrementation de notre position dans la cle			
			}
			else {
				if(caractereActuel != EOF) 
					lettreDecrypt = caractereActuel;
			}
			fputc(lettreDecrypt, fichierbis); // Écriture du caractère 
        } while (caractereActuel != EOF); // On continue tant que fgetc n'a pas retourné EOF

        fclose(fichier); // Fermeture des fichiers
    }
		fclose(fichierbis);
	} 
}
