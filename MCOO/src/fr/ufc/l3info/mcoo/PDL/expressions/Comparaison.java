package fr.ufc.l3info.mcoo.PDL.expressions;


/**
 * Classe abstraite représentant une comparaison entre expressions valuées. 
 * @author Frederic Dadeau - frederic.dadeau@univ-fcomte.fr
 *
 */
public abstract class Comparaison extends ExpressionBooleenne {

	/** La première opérande (à gauche de l'opérateur) */
	ExpressionValuee operande1;
	
	/** La seconde opérande (à droite de l'opérateur) */
	ExpressionValuee operande2;
	
	
	/**
	 * Constructeur de calcul (opérateur binaire)
	 * @param op1	la première opérande
	 * @param op2	la seconde opérande
	 */
	public Comparaison(ExpressionValuee op1, ExpressionValuee op2) {
		operande1 = op1;
		operande2 = op2;
	}
	
	
	/**
	 * Renvoie la première opérande (à gauche de l'opérateur)
	 * @return la première opérande
	 */
	public ExpressionValuee getOperande1() {
		return operande1;
	}

	
	/**
	 * Renvoie la seconde opérande (à droite de l'opérateur)
	 * @return la seconde opérande
	 */
	public ExpressionValuee getOperande2() {
		return operande2;
	}
	
}
