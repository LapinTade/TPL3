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
    
    printf("%s", argv[1]);
    
    stat(nom, &b);
    
    printf("Taille du fichier: %d\n", b.st_size);
    printf("Propriétaire: %d\n", b.st_uid);
    printf("Acces: %o\n", b.st_mode);
}
