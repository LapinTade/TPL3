#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/times.h>
struct tms t1, t2;
int n1, n2;
main() {
int i;
n1=times(&t1);
for(i=0;i<25000000;i++);
n2=times(&t2);
fprintf(stderr,"%d : clicks d'horloge reels %d \n",getpid(),n2-n1);
fprintf(stderr,"%d : clicks d'horloge utilisateurs : %d\n%d clicks d'horloge systemes : %d\n",
getpid(), t2.tms_utime - t1.tms_utime,
getpid(), t2.tms_stime - t1.tms_stime);
}

