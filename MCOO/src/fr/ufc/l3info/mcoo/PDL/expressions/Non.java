package fr.ufc.l3info.mcoo.PDL.expressions;

/**
 * Classe représentant la négation d'une opérandes booléenne.
 * @author Frederic Dadeau - frederic.dadeau@univ-fcomte.fr
 *
 */
public class Non extends ExpressionBooleenne {
	
	/** La opérande niée */
	ExpressionBooleenne operande;
	
	
	/**
	 * Constructeur de négation.
	 * @param op l'opérande niée
	 */
	public Non(ExpressionBooleenne op) {
		operande = op;
	}
	
	
	/**
	 * Renvoie l'opérande niée
	 * @return l'opérande de la négation
	 */
	public ExpressionBooleenne getOperande() {
		return operande;
	}
	
}
