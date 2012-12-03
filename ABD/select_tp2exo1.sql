# TP2 Exo1.3
# 1. Liste de tous les étudiants
SELECT NOM FROM Etudiant;
# 2 Liste de tous les étudiants trié par ordre alphabatique inverse
SELECT NOM FROM  Etudiant
ORDER BY NOM DESC;
# 3. Libellé et coefficient de chaque matiere
SELECT LIBELLE, ROUND(COEF*100,0) AS "Pourcent" FROM Matiere;
# 4 Nom et prénom de tous les étudiants
SELECT NOM, PRENOM FROM Etudiant;
# 5. Nom et Prenom de tous les étudiants domicilié à Lyon
SELECT NOM, PRENOM FROM Etudiant
WHERE VILLE="Lyon";
# 6. Liste des notes superieurs a 10
SELECT NOTE FROM Notation
WHERE NOTE>10;
# 7. Liste des épreuves dont la date se situe entre le 1er janvier et le 30 juin 2004.
SELECT CODEMAT FROM Epreuve
WHERE DATEPREUVE > '2004-01-01'
AND DATEPREUVE < '2004-06-30';
# 8. Nom, prénom et ville des étudiants dont la ville contient la chaîne "ll".
SELECT NOM, PRENOM, VILLE FROM Etudiant
WHERE VILLE LIKE "%ll%";
# 9. Prénoms des étudiants de nom Dupont, Durand ou Martin.
SELECT PRENOM FROM Etudiant
WHERE NOM='Dupond' OR NOM='Durand' OR NOM='Martin';
# 10. Somme des coefficients de toutes les matières.
SELECT ROUND(SUM(COEF),2) FROM Matiere;
# 11. Nombre total d’épreuves.
SELECT COUNT(NUMEPREUVE) FROM Epreuve;
# 12. Nombre de notes indéterminées (NULL).
SELECT COUNT(NUMETU) FROM Notation
WHERE NOTE IS NULL;
# 13. Liste des épreuves (numéro, date et lieu) incluant le libellé de la matière.
SELECT e.NUMEPREUVE, e.DATEPREUVE, e.LIEU, m.LIBELLE FROM Epreuve e, Matiere m
WHERE e.CODEMAT=m.CODEMAT;
# 14. Liste des notes en précisant pour chacune le nom et le prénom de l’étudiant qui l’a obtenue.
SELECT n.NOTE, e.NOM, e.PRENOM FROM Notation n, Etudiant e
WHERE n.NUMETU=e.NUMETU
ORDER BY e.NOM;
# 15. Liste des notes en précisant pour chacune le nom et le prénom de l’étudiant qui l’a obtenue et le
#    libellé de la matière concernée.#####
SELECT n.NOTE, e.NOM, e.PRENOM, m.Libelle FROM Notation n, Etudiant e, Matiere m, Epreuve ep
WHERE n.NUMETU=e.NUMETU
AND n.NUMEPREUVE=ep.NUMEPREUVE
AND ep.CODEMAT=m.CODEMAT
ORDER BY e.NOM;
# 16. Nom et prénom des étudiants qui ont obtenu au moins une note égale à 20.
SELECT DISTINCT e.NOM, e.PRENOM FROM Etudiant e, Notation n
WHERE e.NUMETU=n.NUMETU
AND n.NOTE=20;
# 17. Moyennes des notes de chaque étudiant (indiquer le nom et le prénom) sans prendre en compte,
#     puis en prenant en compte les coefficients.
# Sans Coef
SELECT  AVG(n.NOTE) AS MOYENNE, e.NOM, e.PRENOM FROM Notation n, Etudiant e
WHERE e.NUMETU=n.NUMETU
GROUP BY e.NOM;
# Avec Coef
SELECT (SUM(n.NOTE*m.COEF))/(SUM(m.COEF)) AS MOYENNE, e.NOM, e.PRENOM FROM Notation n, Etudiant e, Matiere m, Epreuve ep
WHERE e.NUMETU=n.NUMETU
AND n.NUMEPREUVE=ep.NUMEPREUVE
AND ep.CODEMAT=m.CODEMAT
GROUP BY e.NOM;
# 18. Mêmes requêtes avec les moyennes classées de la meilleure à la moins bonne.
# On ne peux pas faire un ORDER BY sur un ALIAS, on est obliger de réécrire l'expression voulue
# Sans Coef
SELECT  AVG(n.NOTE) AS MOYENNE, e.NOM, e.PRENOM FROM Notation n, Etudiant e
WHERE e.NUMETU=n.NUMETU
AND n.NOTE IS NOT NULL
GROUP BY e.NOM
ORDER BY AVG(n.NOTE) DESC;
# Avec Coef
SELECT SUM(n.NOTE*m.COEF)/SUM(m.COEF) AS MOYENNE, e.NOM, e.PRENOM FROM Notation n, Etudiant e, Matiere m, Epreuve ep
WHERE n.NOTE IS NOT NULL
AND n.NUMEPREUVE=ep.NUMEPREUVE
AND e.NUMETU=n.NUMETU
AND ep.CODEMAT=m.CODEMAT
GROUP BY e.NOM, e.PRENOM
ORDER BY (MOYENNE) DESC;
# 19. Liste des étudiants dont la moyenne est supérieure à 12.
# Avec Coef
SELECT (SUM(n.NOTE*m.COEF))/(SUM(m.COEF)) AS MOYENNE, e.NOM, e.PRENOM FROM Notation n, Etudiant e, Matiere m, Epreuve ep
WHERE e.NUMETU=n.NUMETU
AND n.NUMEPREUVE=ep.NUMEPREUVE
AND ep.CODEMAT=m.CODEMAT
GROUP BY e.NOM
HAVING (MOYENNE)>12
ORDER BY (MOYENNE) DESC;
# 20. Moyennes des notes pour les matières (indiquer le libellé) comportant plus d’une épreuve.
SELECT  AVG(n.NOTE) AS MOYENNE, m.Libelle FROM Notation n, Etudiant e, Matiere m, Epreuve ep
WHERE n.NUMEPREUVE=ep.NUMEPREUVE
AND ep.CODEMAT=m.CODEMAT
GROUP BY m.Libelle
HAVING (COUNT(DISTINCT n.NUMEPREUVE))>1;
# 21. Moyennes des notes obtenues aux épreuves (indiquer le numéro d’épreuve) où moins de 6 étudiants
#     ont été notés.
SELECT AVG(n.NOTE) AS MOYENNE, n.NUMEPREUVE FROM Notation n, Matiere m, Epreuve ep
WHERE n.NUMEPREUVE=ep.NUMEPREUVE
AND ep.CODEMAT=m.CODEMAT
AND n.NOTE IS NOT NULL
GROUP BY n.NUMEPREUVE
HAVING COUNT(*)<6;