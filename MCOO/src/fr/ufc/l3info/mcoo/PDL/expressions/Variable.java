package fr.ufc.l3info.mcoo.PDL.expressions;


/**
 *	Classe représentant les variables du programme au sens large :
 *	variables globales, variables locales, constantes 
 */
public abstract class Variable extends ExpressionValuee {
	
	/** Le nom de la variable */
	String nom; 

	/** Le type de la variable */
	Type type;
	
	
	/**
	 * Constructeur de variable
	 * @param n	le nom de la variable
	 * @param t	le type de la variable
	 */
	public Variable(String n, Type t) {
		nom = n;
		type = t;
	}


	/**
	 * Renvoie le nom de la variable.
	 * @return le nom de la variable.
	 */
	public String getNom() {
		return nom;
	}


	/**
	 * Renvoie le type de la variable.
	 * @return le type de la variable.
	 */
	public Type getType() {
		return type;
	}

}
