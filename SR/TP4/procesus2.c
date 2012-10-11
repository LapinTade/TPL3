#include <stdio.h>
main()
{
	int fich,fi,a,b,x,y,z,w;
	a=4;
	b=5;
	int no_fils;

	fich=creat("fichier",0777);
	 
	no_fils=fork();
	   
	if (no_fils !=0)
	   { 
		sleep(2);
		     
		printf(" ------------chez le PERE \n");

		x=a*a;
		printf("a*a=%d\n",x);
		fich=open("fichier",0);
		read(fich,&w,sizeof(w));
		printf("==%d\n",w);
		printf(" TOTAL chez le PERE \n");
		z=x+w;
		printf("total a.a+b.b=%d\n",z);
		    
	   }


	else { 
		       
		printf("--------- chez le fils  \n");

		y=b*b;
		write(fich,&y,sizeof(y));
		close(fich);

		printf("b*b=%d\n",y);

	     }
}

       

