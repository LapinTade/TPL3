package fr.ufc.l3info.mcoo.PDL.expressions;

/**
 * Classe représentant une vérification de supériorité d'une expression sur une autre. 
 * @author Frederic Dadeau - frederic.dadeau@univ-fcomte.fr
 *
 */
public class Superieur extends Comparaison {

	/**
	 * Constructeur de test de supériorité.
	 * @param op1 la première opérande
	 * @param op2 la seconde opérande
	 */
	public Superieur(ExpressionValuee op1, ExpressionValuee op2) {
		super(op1,op2);
	}
	
}
