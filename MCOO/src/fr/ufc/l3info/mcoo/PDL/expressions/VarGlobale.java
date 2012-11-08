package fr.ufc.l3info.mcoo.PDL.expressions;


/**
 * Classe représentant les variables globales. 
 * @author Frederic Dadeau - frederic.dadeau@univ-comte.fr
 */
public class VarGlobale extends Variable {
	
	/**
	 * Constructeur de variable globale.
	 * @param n	le nom de la variable globale
	 * @param t le type de la variable globale
	 */
	public VarGlobale(String n, Type t) {
		super(n,t);
	}

}
