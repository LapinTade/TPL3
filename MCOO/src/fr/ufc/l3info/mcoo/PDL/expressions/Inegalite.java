package fr.ufc.l3info.mcoo.PDL.expressions;

/**
 * Classe représentant une vérification de l'inégalité entre deux expressions. 
 * @author Frederic Dadeau - frederic.dadeau@univ-fcomte.fr
 *
 */
public class Inegalite extends Comparaison {

	/**
	 * Constructeur d'inégalité.
	 * @param op1 la première opérande
	 * @param op2 la seconde opérande
	 */
	public Inegalite(ExpressionValuee op1, ExpressionValuee op2) {
		super(op1,op2);
	}
	
}
