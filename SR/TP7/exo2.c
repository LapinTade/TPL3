#include <pthread.h>
#include <stdio.h>
#include <stdlib.h>

pthread_t pthread_id[3];
int n=0;

void *f_thread(void *num) {
	printf("Je suis le thread numero %d\n", pthread_self());
	n++;
	printf("n=%d\n", n);
}

int main() {
	int i;

	for(i=0; i<3; i++) {
		pthread_create(&pthread_id[i], NULL, f_thread, (void*)i);
	}

	for(i=0; i<3; i++) {
		pthread_join(pthread_id[i], NULL);
	}
}