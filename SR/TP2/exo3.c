#include <stdio.h>
#include <string.h>

int bibi(char * string_nombre) {
    int i;
    int nombre = 0;
    
    for (i=0; i<strlen(string_nombre);i++) {
        nombre = nombre *10 +(string_nombre[i] - '0');
        printf( "Nombre = %d\n", nombre);
        
    }
    return nombre;
}

int main(int argc, char* argv[]) {
    int b;
    b = bibi(argv[1]);
}
