#include <signal.h>
#include <stdio.h>
void hand (int i)
{
printf("signal recu \n");
printf ("fin de handler\n");

}
main()
{
int n;
char c;
signal(SIGINT,hand);
for(; ; ) { };
}
