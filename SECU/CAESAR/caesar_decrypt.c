#include <stdio.h>
#include <stdlib.h>

char decrypt (int shift, char letter) {
    int fl = 'A';       //Première lettre de notre alphabet
    //int ll = 'Z';       //Dernière lettre
    int dl;             //Lettre dechiffree
    dl = (letter - shift) - fl;

    while (dl < 0) {
        dl += 26;
    }
    
    return dl+fl;

}

int main (int argc, char *argv[]) {
    int count;

    int fl = 'A';       //Première lettre de notre alphabet
    int ll = 'Z';       //Dernière lettre

    FILE* fileR = NULL;
    FILE* fileW = NULL;

    int currentChar = 0;

    if (argc == 4) {
        fileR = fopen(argv[2],"r");
        fileW = fopen(argv[3],"w");

        if (fileR != NULL) {

            do {
                currentChar = fgetc(fileR);

                if (currentChar <= ll && currentChar >= fl) {
                    fputc(decrypt(atoi(argv[1]), currentChar), fileW);
                } else {
                    if (currentChar != EOF)
                        fputc(currentChar, fileW);
                }
            } while (currentChar != EOF);
        } else {
            printf("Impossible d'ouvrir le fichier %s\n", fileR);
            return 2;
        }
    } else {
        printf("USAGE: %s indice_decalage fichier_a_dechiffrer fichier_sortie\n", argv[0]);
        return 1;
    }

    return 0;
}