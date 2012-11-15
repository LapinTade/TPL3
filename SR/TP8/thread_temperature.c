/* thread_temperature.c
   utilisation des conditions
   lance 2 threads : le premier simule des temperatures, le deuxieme affiche une alarme lorsque la temperature est > 24 
le programme s'arrete lorsque l'on tape ^C  */

#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <pthread.h>


pthread_cond_t condition_alarme=PTHREAD_COND_INITIALIZER ;
pthread_mutex_t mutex_alarme=PTHREAD_MUTEX_INITIALIZER ;

static void* thread_temperature (void *inutile) ;
static void * thread_alarme (void *inutile) ;


int main(void)
{
int limit=5;
pthread_t thr ;
pthread_create (&thr, NULL, thread_temperature, NULL) ;
pthread_create (&thr, NULL, thread_alarme, NULL) ;
pthread_exit (NULL) ;
}
double aleatoire (const int limit)
{
return (((double)rand() / RAND_MAX)* limit);
}
static void * thread_temperature (void *inutile)
{
int temperature = 20 ;

while (1) {
temperature += aleatoire(5) -2 ;
fprintf(stdout, " Temperature : %d \n ", temperature) ;
if ((temperature < 16 )|| (temperature > 24 )) {
	pthread_mutex_lock (&mutex_alarme) ;
	pthread_cond_signal(&condition_alarme) ;
	pthread_mutex_unlock (&mutex_alarme) ;
		}
sleep(1) ;
}
return (NULL) ;
}
static void * thread_alarme (void * inutile)
{
while (1) {
	pthread_mutex_lock (&mutex_alarme) ;
	pthread_cond_wait (&condition_alarme, &mutex_alarme) ;
	pthread_mutex_unlock (&mutex_alarme) ;
	fprintf(stdout, " ALARME \n ") ;
	}
	return (NULL) ;
}
