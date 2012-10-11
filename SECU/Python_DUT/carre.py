#-*-Coding: utf-8 -*-
"""
note: ne gere pas si on a un v au milieu de w
exemple: decrypt(crypt(wvw)) sera decryper en wwv
"""

def initListe():
    l=[]
    a=ord('a')
    w=ord('w')
    for i in range(5):
        g=[]
        for k in range(5):
            if(a==w):
                a=a+1
                g += chr(a)
            else:
                g += chr(a)
            a=a+1
        l.append(g)
    return l


def crypt(phrase):
    """
    Retourne phrase cryptee par la methode du carre de Polybe
        Gere les espaces et les w
    """
    crypt= ""
    for k in phrase:
        if(k=='w'):
            crypt += "5252"
        if(k==' '):
            crypt += "99"
        for i in range(5):
            for o in range(5):
                if(k==l[o][i]):
                    crypt += str(o+1)+str(i+1)              
    return crypt


def decrypt(phrase):
    """
    Retourne la phrase decryptee
    """

    decrypt=""
    a,b,v = 0,0,0
    ignoreNext = False
    taille = len(phrase)

    for k in range(0,taille,2):
        if ignoreNext:
            ignoreNext = False
            continue
            
        if k != taille :
            a = int(phrase[k])
            
        if (not k+1 >= taille) :
            b = int(phrase[k+1])
        else:
            return decrypt

        if (a == 5 and b == 2):
            if(not k+2 >= taille and not k+3 >= taille):
                if((int(phrase[k+2]) == 5) and (int(phrase[k+3]) == 2)):
                    decrypt += "w"
                    ignoreNext = True
                    continue

            decrypt += "v"
        elif (a == 9 and b == 9):
            decrypt += " "
        else:
            decrypt += l[a-1][b-1]
            
    return decrypt


if __name__ == "__main__":
    
    l = initListe()    
    continuer=1
    
    while(continuer): 
        choix=input("1: Crypter \n2: Decrypter \nEntrez votre choix : ")

        if(choix==1):
            phrase=raw_input("\nEntrez la phrase a crypter: ")
            chaine_crypt = crypt(phrase)
            print chaine_crypt
        
        if(choix==2):
            phrase=raw_input("\nEntrez la phrase a decrypter: ")
            chaine_decrypt = decrypt(phrase)
            print chaine_decrypt

        continuer=input("voulez-vous continuer ? 1 Oui; 0 Non: ")                
