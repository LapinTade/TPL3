/* programme thread-mut22.c  */

#include <stdio.h>
#include <pthread.h>
#include <stdlib.h>

pthread_t thread1, thread2;

static pthread_mutex_t verrou1, verrou2;
int var1, var2, var3;


void *lire(void *nom_du_thread)
{
	pthread_mutex_lock(&verrou1);
	printf("lire variable 1 = %d\n",var1);
	printf("lire variable 2 = %d\n",var2);
	printf("lire variable 3 = %d\n",var3);

	pthread_exit(0);
}
void *ecrire(void *nom_du_thread)
{
	pthread_mutex_lock(&verrou2);
	var1=20;
	var2=1;
	var3=16;
	printf("ecriture %d dans variable 1 \n",var1);
	printf("ecriture %d dans variable 2 \n",var2);
	printf("ecriture %d dans variable 3 \n",var3);
	sleep(1);

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
	pthread_mutex_unlock(&verrou2);
	pthread_join(thread2,NULL);

	pthread_mutex_unlock(&verrou1);
	pthread_join(thread1,NULL);


   
}
