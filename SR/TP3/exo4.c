#include <stdio.h>
#include <stdlib.h>

int main() {
    int no_fils;
    int status;

    printf("Je suis le père: %d\n", getpid());
    printf("Numero du process gd pere: %d\n", getppid());

    status=fork();

    if(status !=0) {
        printf("Je suis le pere, mon fils a le numero %d\n", status);
    } else {
        //sleep(1);
        printf("Je suis le fils, numéro: %d, PAPA: %d\n", getpid(), getppid(); 
    }

    return 0;
}