
#include <stdio.h>
#include <string.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <netdb.h>

int main()
{
struct sockaddr_in serveur, serv,from;
struct hostent *hp;

char mess_recu[128], mess_envoi[128],tab[128];
int  sock,cc;
unsigned int serv_size;
   
   hp=gethostbyname("127.0.0.1"); /* numero IP du serveur distant */

   memcpy((char*)&serveur.sin_addr,hp->h_addr,hp->h_length);

   sock=socket(AF_INET,SOCK_DGRAM,0); /* socket UDP */
   
   serveur.sin_family=AF_INET; /* domaine  */

   serveur.sin_port=2000; /* numero de port */

   mess_envoi[1]='A';

/*  envoi du tableau au   serveur*/

cc=sendto(sock,mess_envoi,sizeof(mess_envoi),0,(struct sockaddr*)&serveur,
             sizeof(serveur));

printf("le  client a  envoye au serveur: %s\n",mess_envoi;

/* reception du tableau du  serveur */

cc=recvfrom(sock,mess_recu,sizeof(mess_recu),0,(struct sockaddr*)&serv,
             &serv_size);
printf("le client  a recu : %s\n",mess_recu);
}
