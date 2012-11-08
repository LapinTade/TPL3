package fr.ufc.l3info.mcoo.PDL.expressions;

/**
 * Classe représentant une vérification de supériorité ou d'égalité d'une expression sur une autre. 
 * @author Frederic Dadeau - frederic.dadeau@univ-fcomte.fr
 *
 */
public class SuperieurOuEgal extends Comparaison {

	/**
	 * Constructeur de test de supériorité ou d'égalité.
	 * @param op1 la première opérande
	 * @param op2 la seconde opérande
	 */
	public SuperieurOuEgal(ExpressionValuee op1, ExpressionValuee op2) {
		super(op1,op2);
	}
	
}
