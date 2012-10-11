#include <stdlib.h>
#include <unistd.h>
#include <stdio.h>
#include <sys/types.h>
#include <sys/stat.h>

int main(int argc, char* argv[]) {
    char nom[20];
    struct stat b;
    
    printf("Nom du fichier ?\n");
    scanf("%s", nom);
    
    if (access(nom,00) == -1)
        printf("Le fichier n'existe pas\n");
    else
        printf("Le fichier existe bien\n");
        
    if (access(nom,01) == 0) {
        printf("Le fichier est executable\n");
        printf("Le fichier est effacé\n");
        unlink(nom);   
    }
        
}
