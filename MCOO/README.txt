MARTIN Jordy
ROZE Nicolas
T1PA
Sujet 3

CHOIX D'IMPLEMENTATION

		Concernant l'implémentation nous avons choisi de créer une interface 
	VisiteurExpr, qui contient notre méthode accept qui va nous permettre de 
	parcourir les classes soumises au visiteur.
		Nous avons également une interface TraducteurVisiteur qui contient les 
	visiteurs que nous allons utiliser pour créer notre traducteur et notre 
	prettyprinter. Deux classes ont été créées PrettyPrinteurVisiteur et 
	VisitTraducteur.
		La classe VisitTraducteur est un traducteur. Nous avons choisi 
	d'implémenter un traducteur PDL vers Java.
		A l'intérieur de chacune d'elle nous avons instancié un singleton afin 
	de ne permettre	de créer qu'un seul objet des ses classes à la fois.
		En ce qui concerne les méthodes accept et visit nous avons choisit de 
	etourner une valeur	Object afin de pouvoir récupérer les informations 
	transmisses par certaines classes pour	pouvoir les afficher. C'est pour 
	cela que nous méthodes visit retournent parfois des valeurs nulles.
		La classe FactoryVisitor est une fabrique. On passe en paramètre le
	programme voulu: "PrettyPrint" ou "Traducteur".
		
UTILISATION:

		Concernant le main de notre application, nous l'avons placé dans la 
	classe Exemple.java fournie de base	dans notre projet.
		Il faut donc creer un nouveau projet java. On fait glisser le dossier
	src dans le nouveau projet et les sources s'ajoutent automatiquement Il n'y
	a plus qu'a selectionner Exemple.java et cliquer sur le bouton "run", si une
	fenetre demande il faut executer ce fichier en tant que "Java Application"
