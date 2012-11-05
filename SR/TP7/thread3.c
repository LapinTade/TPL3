/* programme thread3.c  */
#define _REENTRANT
#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>
pthread_t pthread_id[3];
void *f_thread(void *i) {
int j=0, k=0;

for(j=0;j<3;j++){
    for(k=0;k<1000000000;k++);

  printf("je suis la pthread avec le numero %d, j=%d \n"
            ,pthread_self(),j);}
}
main(){
int i;
pthread_attr_t attr;
pthread_attr_init(&attr);
for(i=0;i<3;i++)
    if(pthread_create(&pthread_id[i],NULL,f_thread,(void *)i)==-1){
     fprintf(stderr,"Erreur creation pthread numero %d\n",i);exit(2);}
 for ( i = 0; i < 3; i++)
                  pthread_join(pthread_id[i], NULL);

printf("je suis la pthread initiale avec le numero %d \n", pthread_self());
sleep(3);
printf(" pthread initiale et me termine \n");
}
