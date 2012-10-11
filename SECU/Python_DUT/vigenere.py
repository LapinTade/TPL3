#!/usr/bin/python
# -*- coding: utf-8 -*-
import sys
import math


"""def creerTab():
    ligne = []
    carre = []
    for k in range(26):
        for l in range(26):
            ligne.append(chr(97+(l+k)%26))
        carre.append(ligne)
        ligne=[]
    return carre"""
    

def crypter(message, cle):
    """
    Crype message grâce a la clé cle
    On applique la formule: y=(z+x)%26
        soit: y la lettre chiffré, z la lettre message et x la lettre de la clé
        On utlise les valeurs ASCII pour la valeur des lettres
        
    Retourne: chaine de caratère du message chiffré
    """
    print("___________Chiffrement du message______________")
    lstMaj = [chr(k+65) for k in range(26)]
    #lstMin = [chr(k+97) for k in range(26)]
    
    cle = [k.upper() for k in cle]
    message = [ k.upper() for k in message]
    
    msgCrypt = ""
    tailleCle = len(cle)
    current = 0
    for lettre in message:
        if current == tailleCle:
            current = 0
        if ord(lettre) == 32:
            msgCrypt += " "
        else:
            msgCrypt += lstMaj[(ord(lettre)-65 + ord(cle[current])-65) % 26]
            current = current + 1
        """else:
            lstUsed = lstMin
            msgCrypt += lstMin[(ord(lettre)-97 + ord(cle[current])-97) % 26]
            current = current + 1"""
        
    return msgCrypt


def decrypter(message, cle):
    """
    Dérype message grâce a la clé cle
    On applique la formule:
        si x > y alors  z=  (26-x) + y
        sinon z = y - x 
        soit: y la lettre chiffré, z la lettre message et x la lettre de la clé
            On utlise les valeurs ASCII pour la valeur des lettres
        
    Retourne: chaine de caratère du message déchiffré
    
    """
    print("___________Decryptage du message______________")
    lstMaj = [chr(k+65) for k in range(26)]
    
    cle = [k.upper() for k in cle]
    message = [ k.upper() for k in message]
    
    msgDecrypt = ""
    tailleCle = len(cle)
    current = 0
    for lettre in message:
        if current == tailleCle:
            current = 0
        if ord(lettre) == 32:
            msgDecrypt += " "
        elif (ord(cle[current]) > ord(lettre)):
            msgDecrypt += lstMaj[(26 - ord(cle[current]) + ord(lettre))]
            current += 1
        else:
            msgDecrypt += lstMaj[ord(lettre) - ord(cle[current])]
            current += 1
    return msgDecrypt

if __name__ == "__main__":
    loop = True
    cle = raw_input("Entrez votre clé de chiffrement: ")
    while(loop):    
        choix = input("1. Chiffrer une phrase   2. Déchiffrer une phrase    3. Changer de clé   Autre. Quitter\n")
        if choix == 1:
            message = raw_input("Entrez le message à chiffrer: ")
            print crypter(message, cle)
        elif choix == 2:
            message_crypte = raw_input("Entrez le message à décrypter: ")
            print decrypter(message_crypte, cle)
        elif choix == 3:
            cle = raw_input("Entrez votre clé de chiffrement: ")
        else:
            loop = False
