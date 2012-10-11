#include <time.h>
#include <stdio.h>

int main() {
    time_t temps;
    temps = time(&temps);
    printf("Date et heure sur ma machine %s", ctime (&temps));
}
