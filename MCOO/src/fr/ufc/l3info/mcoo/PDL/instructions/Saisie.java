package fr.ufc.l3info.mcoo.PDL.instructions;

import fr.ufc.l3info.mcoo.PDL.expressions.Variable;

/**
 * Classe représentant la saisie d'une valeur au clavier et son stockage dans une variable. 
 * @author Frederic Dadeau - frederic.dadeau@univ-fcomte.fr
 *
 */
public class Saisie extends Instruction {

	/** Variable affectée par la saisie au clavier */
	Variable varAffectee;
	
	
	/**
	 * Constructeur de saisie. 
	 * @param var La variable concernée par la saisie.
	 */
	public Saisie (Variable var) {
		varAffectee = var;
	}
	

	/**
	 * Renvoie la variable concernée par la saisie.
	 * @return la variable affectée. 
	 */
	public Variable getVarAffectee() {
		return varAffectee;
	}
	
}
