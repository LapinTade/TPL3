package fr.ufc.l3info.mcoo.PDL.expressions;

/**
 * Classe représentant une vérification de l'égalité entre deux expressions. 
 * @author Frederic Dadeau - frederic.dadeau@univ-fcomte.fr
 *
 */
public class Egalite extends Comparaison {

	/**
	 * Constructeur d'égalité.
	 * @param op1 la première opérande
	 * @param op2 la seconde opérande
	 */
	public Egalite(ExpressionValuee op1, ExpressionValuee op2) {
		super(op1,op2);
	}
	
}
