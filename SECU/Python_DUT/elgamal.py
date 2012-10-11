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

def factPremier(p):
    if p==1:
       	return set([])
    else:
        for k in range(2,p+1):
            if p%k==0:
                L=factPremier(p/k)
                return L.union([k])

def cle(p,g,a):
	A=puissModulo(g,a,p)
	pub=(p,g,A)
	return pub

def racine_primitive(l, phi_p,p):
    temp=1
    for m in l :
        for i in range(0,len(l)):            
            puiss = puissModulo(m,(phi_p/l[i]),p)
            if ( puiss != 1):
                temp=temp+1
            if (temp == len(l)):
                return m
        temp=1
    
def puissModulo(msg, puis,mod):
    """Exponentiation modulaire"""
    result = 1;
    while (puis > 0):
        if (puis & 1 > 0):
            result = (result * msg) % mod;
        puis >>= 1;
        msg = (msg * msg) % mod;
      
    return result

def chiffre(message,pub_key,b):

     (p,g,A)=pub_key
     B= puissModulo(g,b,p)
     message_c=[]
     for lettre in message:
        c=ord(lettre)*A**b%p
        message_c.append(c)
     return (B,message_c)

def dechiffre(message,pub_key,a):
    
    (p,g,A) = pub_key
    (B,message_c)=message
    message_d=""
    for i in message_c:
        message_d+=chr(B**(p-1-a)*i%p)
    return message_d


if __name__ == '__main__':

    p = nbPremier(40)
    print p
    phi_p=p-1
    l= list(factPremier(phi_p))
    g=racine_primitive(l,phi_p,p)
    a=random.randint(1,p-1)
    pub_key=cle(p,g,a)
    print "clé publique :"+str(pub_key)+"\nClé privée:"+str(a)
    message = raw_input("\nMessage à chiffrer: ")
    b=random.randint(1,p-1)
    (B,res)=chiffre(message,pub_key,b)
    crypt=""
    for i in range(0,len(res)) :
        crypt+=str(res[i])
    print "Message crypter "+ str(crypt)
    message_d=dechiffre((B,res),pub_key,a)
    print "Message decrypter "+ str(message_d)
	
