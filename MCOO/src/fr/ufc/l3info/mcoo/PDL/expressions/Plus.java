package fr.ufc.l3info.mcoo.PDL.expressions;

/**
 * Classe représentant une addition entre deux opérandes.
 * @author Frederic Dadeau - frederic.dadeau@univ-fcomte.fr
 *
 */
public class Plus extends Calcul {
	
	/**
	 * Constructeur d'addition.
	 * @param op1 la première opérande
	 * @param op2 la seconde opérande
	 */
	public Plus(ExpressionValuee op1, ExpressionValuee op2) {
		super(op1,op2);
	}
	
}
