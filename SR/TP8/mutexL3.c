#include <stdio.h>
#include <pthread.h>
/* programme mutexL3.c - mise en evidence de la synchronisation  */
pthread_t pthread_id[2];

pthread_mutex_t mutex1, mutex2;
int status;

void *f_thread_1(void *ptr){
	pthread_mutex_lock(&mutex1);
	printf("je suis le pthread 1 %d\n",pthread_self());
	pthread_exit(0);
}

void *f_thread_2(void *ptr){
	pthread_mutex_lock(&mutex2);
	sleep(3);
	printf("je suis le pthread 2 %d\n",pthread_self());
	pthread_exit(0);
}

main(){

	int i;
	pthread_mutex_init(&mutex1,NULL);
	pthread_mutex_init(&mutex2,NULL);

	// création des 2 threads
	pthread_create(pthread_id,NULL,f_thread_1,(void *)&i);
	pthread_create(pthread_id+1,NULL,f_thread_2,(void *)&i);
	printf("les pthread %d et %d sont creees \n",pthread_id[0],
	pthread_id[1]);
	// on exécute le thread 2
	pthread_mutex_unlock(&mutex1);
	pthread_join(pthread_id[0],NULL);
	printf("la pthread 1 %d est terminee   \n", pthread_id[1]);
	// on exécute le thread 1
	pthread_mutex_unlock(&mutex2);
	pthread_join(pthread_id[1],NULL);
	printf("la pthread 2 %d est terminee \n",pthread_id[0]);

}
