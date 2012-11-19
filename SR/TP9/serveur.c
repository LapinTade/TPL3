#include <stdio.h>
#include <string.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netdb.h>
#include <netinet/in.h>

/* ce programme s execute sur le serveur     */
/*  -- programme tcps09.c -- Novembre 2009  */
/*               protocole TCP             */
/* -------------------------------------------------*/

int main()
{

 char mess_recu[BUFSIZ],mess_envoi[BUFSIZ];
 int  pp,d_sock,cc,l;
 int longe,service;
 char tab[128];
 
  struct sockaddr_in serveur = {AF_INET};
  struct sockaddr_in client;

  serveur.sin_port=2010; /* numero de port */
  serveur.sin_family=AF_INET;
  serveur.sin_addr.s_addr=INADDR_ANY;
  d_sock=socket(AF_INET,SOCK_STREAM,0); /* procole TCP */
 
  pp=bind(d_sock,(struct sockaddr*)&serveur,sizeof(serveur));
  printf("serveur pret\n");
 
  l=listen(d_sock,1);
  longe=sizeof(struct sockaddr_in);
  service=accept(d_sock,(struct sockaddr *)&client,&longe);
  printf("accept= %d\n",service);

/* reception du message */
  read(service,mess_recu,sizeof(mess_recu));
  printf("le serveur a recu : %s\n",mess_recu);

/* envoi du message */
  strcpy(mess_envoi,"bonsoir");
write(service,mess_envoi,sizeof(mess_envoi));
  printf("le serveur a envoye au client : %s\n",mess_envoi);
  close(d_sock);
}
