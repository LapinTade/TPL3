package fr.ufc.l3info.mcoo.PDL.expressions;

/**
 * Classe encapsulant une valeur de type chaîne.
 * @author Frederic Dadeau - frederic.dadeau@univ-fcomte.fr
 *
 */
public class ValeurChaine extends Valeur {

	/** Valeur chaîne */
	String valeur;
	
	
	/**
	 * Constructeur de valeur de type chaîne.
	 * @param v la valeur de la chaîne.
	 */
	public ValeurChaine(String v) {
		valeur = v;
	}
	

	/**
	 * Renvoie la valeur de la chaîne. 
	 * @return la valeur de la chaîne associée.
	 */
	public String getValeur() {
		return valeur;
	}
	
}
