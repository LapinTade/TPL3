package fr.ufc.l3info.mcoo.PDL.expressions;

/**
 * Classe représentant une multiplication entre deux opérandes.
 * @author Frederic Dadeau - frederic.dadeau@univ-fcomte.fr
 *
 */
public class Multiplie extends Calcul {
	
	/**
	 * Constructeur de multiplication.
	 * @param op1 la premiére opérande
	 * @param op2 la seconde opérande
	 */
	public Multiplie(ExpressionValuee op1, ExpressionValuee op2) {
		super(op1,op2);
	}
	
}
