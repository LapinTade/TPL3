from math import *

n = input('N : ')

taille = n-1
liste=range(2,n+1,1)
N=sqrt(n)
i=2

#Recherche nombres premiers
for i in liste:
    for j in liste:
        if j%i==0:
            liste.remove(j)
	if i>N:
	    break
print "La liste des nombres premiers entre 2 et "+str(n)+" est :\n"+str(liste)

#Recherche nombres premiers jumeaux
print "et les premiers jumeaux :" 
for k in range(1,len(liste)-1):
    if liste[k+1]==liste[k]+2:
        print str(liste[k])+" "+str(liste[k+1])

  
