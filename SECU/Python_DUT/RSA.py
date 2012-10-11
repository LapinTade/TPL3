#-*-Encoding: utf-8-*-
import random
import os
import sys

def temoinMR(x,n):
    d = n-1
    s = 1
    while (d != 0):
        if(d&1 == 1):
            s = (x*s) % n
            d-=1
        else:   
            b = x
            x = (x*x) % n
            if (x==1 and b!=1 and b!=n-1): return True
            d>>=1 
    if(s != 1): return True
    else: return False 

def probPremsMR(n,k):
    """Test de Miller Rabbin k fois
    retourne faux si le nombre n'est pas premier"""
    for i in range(k):
        x = random.randint(2,n-1)
        if (temoinMR(x,n)): return True
    return False
                
def nbPremier(nbBits):
    print "Generation d'un nombre premier de",nbBits,"bits"
    while(1):
        nbPremier = random.randrange(2**(nbBits//2-1) + 1, 2**(nbBits//2), 2)
        if not probPremsMR(nbPremier,100): break
    return nbPremier

def bezout (a,b):
    r=a
    rPrime=b
    u=1
    v=0
    uPrime=0
    vPrime=1
    s=[r,u,v]
    while rPrime!=0:
        q=r/rPrime
        rs=r
        us=u
        vs=v
        r=rPrime
        u=uPrime
        v=vPrime
        rPrime=rs-q*rPrime
        uPrime=us-q*uPrime
        vPrime=v-q*vPrime
        
	k=-1
	while 2>v:
		v=(v-(k*b))
		v-=1    
    
    s=[r,u,v]
    return s
    
def PGCD(a, b):
   while b != 0:
      numRem = a % b
      a = b
      b = numRem
   return a

def genererCle(p,q):
    print "Generation des clés"

    n = p*q

    phi = (p-1)*(q-1)

    c = random.randint(10,50)
    (r,u,v) = bezout(c,phi)
    
    while (r!=1) or (u<2 and r!=1) or (u<2 and r==1):
        c += 1
        (r,u,v) = bezout(c,phi)
        if (r==1) and (u<2):
            c += 1
            (r,u,v) = bezout(c,phi)
        
    print "Clé publique: [",n,",",c,"]"
    print "Clé privée: [",n,",",u,"]"
    
    try:
        with open("rsa_key.pub","w") as fichier_pub:
            print "Clé enregistrée dans rsa_key.pub"
            fichier_pub.writelines(str(n))
            fichier_pub.writelines(str('\n'))
            fichier_pub.writelines(str(c))
            fichier_pub.close()
        with open("rsa_key.priv","w") as fichier_priv:
            print"Clé enregistrée dans rsa_key.priv"
            fichier_priv.write(str(n))
            fichier_priv.write(str('\n'))
            fichier_priv.write(str(u))
            fichier_priv.close()
    except:
        print ">ERREUR<: impossible d'écrire les clés !"
        sys.exit()

    
def puissModulo(msg, puis,mod):
    """Exponentiation modulaire optimisée"""
    result = 1;
    while (puis > 0):
        if (puis & 1 > 0):
            result = (result * msg) % mod;
        puis >>= 1;
        msg = (msg * msg) % mod;
      
    return result;



def crypte(texte,n,c):
	chaine=""
	message=""
	chaineCrypt=[]

	for i in texte :
		ascii=ord(i)
		if 0<ascii<100:
			chaine+="0"+str(ascii)
			message+=str(chaine)
		else:
			message+=str(ascii)
		chaine=""
	print message

	l=len(message)

	
	if l%4==0:
		Message=[message[4*k:4*(k+1)] for k in range (l/4)]
		nb=l/4
	else:
		Message=[message[4*k:4*(k+1)] for k in range (l/4+1)]
		nb=l/4+1

	chaineCrypt = [str(puissModulo(int(Message[k]),c,n)) for k in range (nb)]

	try:
		with open("message_crypte.txt","w") as fichier_mess:
			print "Ecriture du message crypté dans le fichier texte message_crypte.txt"
			for k in range(len(chaineCrypt)) :
				fichier_mess.write(str(chaineCrypt[k])+" ")
	except:
		print "Erreur lors de l'écriture !"
		sys.exit()


def decrypte(x,n,u):
	
	chaineDecrypt = ""
	lettre_decrypt=""
	lettre_decrypt_=""
	
	taille=len(x)
	#print x
	#print taille
	temp=0
	T=0
	
	for y in x:
		if y != '':
			temp+=1
			#print temp
			#print y
			lettre_decrypt = str(puissModulo(long(y),long(u),long(n)))
			#print lettre_decrypt
					
			if len(lettre_decrypt)!=4 and len(lettre_decrypt)!=2 and temp!=taille-1 or temp==taille-1 and T%3==1 and len(lettre_decrypt)==1 :
				lettre_decrypt_+="0"+lettre_decrypt
			elif len(lettre_decrypt)==2 and temp!=taille-1 :
					lettre_decrypt_+="00"+lettre_decrypt
			else:
				lettre_decrypt_+=lettre_decrypt
				
			T+=len(lettre_decrypt)
			#print T	
							
			#print lettre_decrypt_

	l=len(lettre_decrypt_)
	#print l

	if l%3==0:
		Message=[lettre_decrypt_[3*k:3*(k+1)] for k in range (l/3)]
		nb=l/3
	else:
		Message=[lettre_decrypt_[3*k:3*(k+1)] for k in range (l/3+1)]
		nb=l/3+1
	#print Message
	
	mot=""	
	
	for i in range(nb):
		mot+=str(chr(int(Message[i])))
	print mot


if __name__ == '__main__':
    choix = raw_input("Generer paire de clés:g ou Crypter:c ou décrypter: d ---> ")
    if (choix== 'g'):
        taille = input("Choisissez la taille des clés: ")
        p = nbPremier(taille)
        q = nbPremier(taille)    
        genererCle(p,q)
    elif (choix=='c'):
        try:
            with open("rsa_key.pub","r") as fichier_pub:
                print "Leture de la clé publique"
                ligne = fichier_pub.readlines()
                fichier_pub.close()
        except:
            print ">ERREUR<: fichier rsa_key.pub inexistant, pensez a generer les clés avant !"
            sys.exit()
        pub_key = long(ligne[0])
        c_key = long(ligne[1])
        message = raw_input("Entrez votre message a crypter: ")
        crypte(message,pub_key,c_key)
        
    elif (choix=='d'):
        try :
            with open("rsa_key.priv","r") as fichier_priv:
                print "Lecture de la clé privée"
                ligne = fichier_priv.readlines()
                fichier_priv.close()
        except:
            print ">ERREUR<: fichier rsa_key.priv inexistant, pensez a generer les clés avant !"
            sys.exit()
        try:
            with open("message_crypte.txt","r") as fichier_msg:
                print "Lecture du message crypté"
                ligne_crypt = fichier_msg.readlines()
                fichier_msg.close()
        except:
            print ">ERREUR<: fichier message_crypte.txt inexistant, pensez a generer le message avant!"
            sys.exit()
        pub_key = long(ligne[0])
        priv_key = long(ligne[1])
        message = ligne_crypt[0].split(" ")
        decrypte(message,pub_key,priv_key)
    else:
        print "Mauvais choix :p"
    
