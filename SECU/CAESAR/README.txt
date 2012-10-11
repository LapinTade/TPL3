Tout les fichiers d'entrée et de sortie sont au format txt (aucun teste ne sera effectuer). Les fichiers d'entrés doivent exister.
NOTE: fichier_a_chiffrer.txt a été obtenu grace au site http://faux-texte.com




gcc caesar_encrypt -o cesar
./cesar indice_decalage fichier_a_chiffrer.txt sortie_chiffree.txt



gcc caesar_decrypt -o uncesar
./uncesar indice_decalage fichier_a_dechiffrer.txt sortie_claire.txt



gcc caesar_break -o break_cesar
./break_cesar fichier_a_decrypter.txt fichier_decrypte.txt