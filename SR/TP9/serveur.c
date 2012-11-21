#include <stdio.h>
#include <string.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netdb.h>
#include <netinet/in.h>

int main()
{

 char mess_recu[128], mess_envoi[128];
 int  pp,d_sock,cc;
unsigned int from_size;
 char tab[128];
    struct sockaddr_in serv={AF_INET};
struct sockaddr_in from;

serv.sin_port=2000; /* numero de port */
   
d_sock=socket(AF_INET,SOCK_DGRAM,0);
pp=bind(d_sock,(struct sockaddr*)&serv,sizeof(serv));
       printf("serveur pret\n");

from_size=sizeof(from);

/* reception du tableau du  client */
cc=recvfrom(d_sock,mess_recu,sizeof(mess_recu),0,(struct sockaddr*)&from,
             &from_size);
printf("le serveur a recu : %s\n",mess_recu);


/*  envoi du tableau au client*/
mess_envoi[0]='B';
mess_envoi[1]='I';
mess_envoi[2]='C';
mess_envoi[3]='\0';
cc=sendto(d_sock,mess_envoi,sizeof(mess_envoi),0,(struct sockaddr*)&from,
             sizeof(from));

printf("le  serveur a  envoye au client: %s\n",mess_envoi);


}
