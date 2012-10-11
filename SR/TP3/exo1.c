#include <stdio.h>

int main () {
    int i,j;
    double s=0.0;
    
    printf("Processus 1: Debut\n");
    for (i=0; i<4; i++) {
        for (j=0;j<100000000;j++) {
            s+=1.0/i;
            if (j==0) printf("Processus 1\n");
        }
    }
    
    return 0;
}
