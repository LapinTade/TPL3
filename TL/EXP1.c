#include <stdlib.h>
#include <stdio.h>
#include <string.h>

int main(){
		// Creation chaine dynamique a partir d'un tableau alloué dynamiquement
        char* ch = malloc (12*sizeof(char));
        
        // Input de caractères => stockées dans ch
        scanf("%s",ch);

        // On écrit le contenu de ch
        printf("vous avez tap\'e : %s\n",ch);

		// On décompose ch, lettres par lettres et on les affiches
        while(*ch != '\0'){
                printf("%c\n",*ch);
                ch++;
        }
}