#1. Quelles sont les personnes ayant emprunté le livre “Recueil Examens BD” ?
SELECT e.Personne FROM Emprunt e, Retard r
WHERE e.Personne=r.Personne
AND r.Livre="Recueil Examens BD";
#2. Quelles sont les personnes n’ayant jamais rendu de livre en retard ?
SELECT e.Personne FROM Emprunt e, Retard r
WHERE e.Personne=r.Personne
AND (SELECT * FROM Retard r2 WHERE r2.Personne=e.Personne)=NULL;
#3. Quelles sont les personnes ayant emprunté tous les livres (empruntés au moins une fois) ?
# On compte le nombre de livres différents emprunté et on compte le nombre total de livre. Si ces nombres coincide, cela veut dire
# que la personne a tout emprunté.
SELECT e.Personne FROM Emprunt e
WHERE(SELECT COUNT(e2.Livre) FROM Emprunt e2 WHERE e2.Personne=e.Personne GROUP BY e2.Livre)=(SELECT COUNT(Livre) FROM Emprunt GROUP BY Livre);
#4. Quels sont les livres ayant été empruntés par tout le monde (i.e. tous les emprunteurs) ?
# Idem de precedement mais a propos des Personnes
SELECT e.Livre FROM Emprunt e
WHERE (SELECT COUNT(e2.Personne) FROM Emprunt e2 WHERE e2.Livre=e.Livre GROUP BY e2.Personne)=(SELECT COUNT(Personne) FROM Emprunt GROUP BY Personne);
#5. Quelles sont les personnes ayant toujours rendu en retard les livres qu’elles ont empruntés ?
# On compte le nombre de livre emprunté et le nombre de livre en retard. Si les deux nombres sont égaux, tous les livres ont été rendu en retard.
SELECT e.Personne FROM Emprunt e
WHERE (SELECT COUNT(e2.Livre) FROM Emprunt e2 WHERE e2.Personne=e.Personne)=(SELECT COUNT(r.Livre) FROM Retard WHERE r.Personne=e.Personne);