package fr.ufc.l3info.mcoo.PDL.expressions;

/**
 * Classe représentant les variables globales.  
 * @author Frederic Dadeau - frederic.dadeau@univ-comte.fr
 */
public class Parametre extends Variable {
	
	/** Genre du paramètre */
	Genre genre;
	
	
	/**
	 * Constructeur de paramètre.
	 * @param n	le nom du paramètre
	 * @param t	le type du paramètre
	 * @param g	le genre du paramètre
	 */
	public Parametre(String n, Type t, Genre g) {
		super(n,t);
		genre = g;
	}
	
	
	/**
	 * Renvoie le genre du paramètre
	 * @return le genre du paramètre
	 */
	public Genre getGenre() {
		return genre;
	}

}
