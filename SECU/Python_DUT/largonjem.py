n=raw_input('Entrer une phrase : \n')

voyelles='aeiouyAEIOUY'
mots=n.split()

#print mots
phrase = ""

for mot in mots:
    #test si le mot est traduisible en largonjem
    if mot[0] in voyelles:
        phrase = phrase + " " + mot
    #############################################
    else :
        n = len(mot)
        m = ""

        for i in range(n):
            if i != n-1 :
                m = m + mot[i+1]
        phrase = phrase + " " + "l" + m + mot[0] + "em" 

print "\n Resultat : \n"+str(phrase)
