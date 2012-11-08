package fr.ufc.l3info.mcoo.PDL.expressions;

/**
 * Classe encapsulant une valeur entière.
 * @author Frederic Dadeau - frederic.dadeau@univ-fcomte.fr
 *
 */
public class ValeurEntier extends Valeur {

	/** Valeur entière */
	int valeur;
	
	
	/**
	 * Constructeur de valeur entière.
	 * @param v la valeur de l'entier.
	 */
	public ValeurEntier(int v) {
		valeur = v;
	}
	

	/**
	 * Renvoie la valeur entière. 
	 * @return la valeur de l'entier associé.
	 */
	public int getValeur() {
		return valeur;
	}
	
}
