package fr.ufc.l3info.mcoo.PDL.expressions;

/**
 * Classe représentant le reste d'une division entière entre deux opérandes.
 * @author Frederic Dadeau - frederic.dadeau@univ-fcomte.fr
 *
 */
public class Modulo extends Calcul {
	
	/**
	 * Constructeur de reste de la division entière.
	 * @param op1 la première opérande
	 * @param op2 la seconde opérande
	 */
	public Modulo(ExpressionValuee op1, ExpressionValuee op2) {
		super(op1,op2);
	}
	
}
