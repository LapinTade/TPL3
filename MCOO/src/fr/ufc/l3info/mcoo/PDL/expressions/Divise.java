package fr.ufc.l3info.mcoo.PDL.expressions;

/**
 * Classe représentant une division entre deux opérandes.
 * @author Frederic Dadeau - frederic.dadeau@univ-fcomte.fr
 *
 */
public class Divise extends Calcul {
	
	/**
	 * Constructeur de division.
	 * @param op1 la première opérande
	 * @param op2 la seconde opérande
	 */
	public Divise(ExpressionValuee op1, ExpressionValuee op2) {
		super(op1,op2);
	}
	
}
