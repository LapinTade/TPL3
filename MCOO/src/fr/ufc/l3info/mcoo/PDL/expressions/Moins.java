package fr.ufc.l3info.mcoo.PDL.expressions;

/**
 * Classe représentant une soustraction entre deux opérandes.
 * @author Frederic Dadeau - frederic.dadeau@univ-fcomte.fr
 *
 */
public class Moins extends Calcul {
	
	/**
	 * Constructeur de soustraction.
	 * @param op1 la première opérande
	 * @param op2 la seconde opérande
	 */
	public Moins(ExpressionValuee op1, ExpressionValuee op2) {
		super(op1,op2);
	}
	
}
