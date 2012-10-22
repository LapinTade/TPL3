#include <sys/types.h>
#include <sys/ipc.h>
#include <sys/shm.h>
#define SHMKEY	75
#define K	1024
int shmid;

int main() {
	int i;

	char *pint;
	shmid = shmget(75,1,0777|IPC_CREAT);
	pint = (char*) shmat(shmid,0,0);
	*pint = 'x';
}