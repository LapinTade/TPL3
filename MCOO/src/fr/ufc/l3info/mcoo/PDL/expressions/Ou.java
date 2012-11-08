package fr.ufc.l3info.mcoo.PDL.expressions;

/**
 * Classe représentant une disjonction entre deux opérandes booleennes.
 * @author Frederic Dadeau - frederic.dadeau@univ-fcomte.fr
 *
 */
public class Ou extends ExpressionBooleenne {
	
	/** La première opérande (à gauche de l'opérateur) */
	ExpressionBooleenne operande1;
	
	/** La seconde opérande (à droite de l'opérateur) */
	ExpressionBooleenne operande2;
	
	
	/**
	 * Constructeur de disjonction.
	 * @param op1 la première opérande
	 * @param op2 la seconde opérande
	 */
	public Ou(ExpressionBooleenne op1, ExpressionBooleenne op2) {
		operande1 = op1;
		operande2 = op2;
	}
	
	
	/**
	 * Renvoie la première opérande (à gauche de l'opérateur)
	 * @return la première opérande
	 */
	public ExpressionBooleenne getOperande1() {
		return operande1;
	}

	
	/**
	 * Renvoie la seconde opérande (à droite de l'opérateur)
	 * @return la seconde opérande
	 */
	public ExpressionBooleenne getOperande2() {
		return operande2;
	}
	
	
}
