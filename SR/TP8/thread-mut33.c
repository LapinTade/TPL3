/* programme thread-mut33.c
écrit N valeurs et les lit l'une après l'autre  */

#include <stdio.h>
#include <pthread.h>
#include <stdlib.h>

pthread_t thread1, thread2;

static pthread_mutex_t verrou1, verrou2;
int var=5, N=10, i=1,j=1;

void *lire(void *nom_du_thread) {
	pthread_mutex_lock(&verrou1);
	printf(">lire variable = %d\n",var);
	for (i=0;i<N-1;i++) {
		pthread_mutex_unlock(&verrou2);
		pthread_mutex_lock(&verrou1);
		printf(">lire variable = %d\n",var);
	}
	pthread_exit(0);
}

void *ecrire(void *nom_du_thread)
{
	for( j=0;j<N-1;j++){
		printf("ecriture %d dans variable \n",var);
		sleep(1);
		pthread_mutex_unlock(&verrou1);
		pthread_mutex_lock(&verrou2);
		var=var+1;
	}
	printf("ecriture %d dans variable \n",var);
	pthread_mutex_unlock(&verrou1);
	pthread_exit(0);
}

int main()
{
	pthread_mutex_init(&verrou1,NULL);
	pthread_mutex_init(&verrou2,NULL);
	pthread_mutex_lock(&verrou1);
	pthread_mutex_lock(&verrou2);

	pthread_create(&thread1,NULL,lire,NULL);
	pthread_create(&thread2,NULL,ecrire,NULL);

	pthread_join(thread1,NULL);
	pthread_join(thread2,NULL);  
}
