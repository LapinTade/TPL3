package fr.ufc.l3info.mcoo.PDL.expressions;

/**
 * Classe représentant une vérification d'infériorité ou d'égalité d'une expression sur une autre. 
 * @author Frederic Dadeau - frederic.dadeau@univ-fcomte.fr
 *
 */
public class InferieurOuEgal extends Comparaison {

	/**
	 * Constructeur de test d'infériorité ou d'égalité.
	 * @param op1 la première opérande
	 * @param op2 la seconde opérande
	 */
	public InferieurOuEgal(ExpressionValuee op1, ExpressionValuee op2) {
		super(op1,op2);
	}
	
}
