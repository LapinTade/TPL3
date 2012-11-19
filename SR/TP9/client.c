#include <stdio.h>
#include <string.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <netdb.h>

/* ce programme s execute sur un client quelconque  */
/*  -- programme tcpc09.c -- Novembre 2009  */
/*               protocole TCP                        */
/* -------------------------------------------------*/

main()
{
  struct sockaddr_in serveur;
  struct hostent *hp;
  char mess_recu[BUFSIZ], mess_envoi[BUFSIZ],tab[128];
  int  sock,cc,errno,i,j,n,l,d_sock;
  int longe,service;

   hp=gethostbyname("127.0.0.1"); /* adresse IP du serveur */
   memcpy(&serveur.sin_addr,hp->h_addr,hp->h_length);
   serveur.sin_port=2010; /* numéro de port */
   serveur.sin_family=AF_INET;
   sock=socket(AF_INET,SOCK_STREAM,0); /* protocole TCP */
   l=connect(sock,(struct sockaddr *)&serveur,sizeof(serveur));
  
/*  envoi du message au serveur*/
   strcpy(mess_envoi,"bonjour");
   cc=write(sock,mess_envoi,sizeof(mess_envoi));
   printf("le  client a  envoye au serveur: %s\n",mess_envoi);

/* reception du message du serveur */
  cc=read(sock,mess_recu,sizeof(mess_recu));
  printf("le client a recu : %s \n",mess_recu);

  close(sock);
}
