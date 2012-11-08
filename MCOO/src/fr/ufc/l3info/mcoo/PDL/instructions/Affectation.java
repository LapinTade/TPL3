package fr.ufc.l3info.mcoo.PDL.instructions;

import fr.ufc.l3info.mcoo.PDL.expressions.ExpressionValuee;
import fr.ufc.l3info.mcoo.PDL.expressions.Variable;


/**
 * Classe représentant l'affectation d'une expression dans une variable. 
 * @author Frederic Dadeau - frederic.dadeau@univ-fcomte.fr
 *
 */
public class Affectation extends Instruction {

	/** Variable affectée */
	Variable varAffectee;
	
	/** Valeur affectée à la variable */
	ExpressionValuee valeur;
	
	
	/**
	 * Constructeur de saisie. 
	 * @param var La variable concernée par l'affectation
	 */
	public Affectation (Variable var, ExpressionValuee expr) {
		varAffectee = var;
		valeur = expr;
	}

	
	/**
	 * Renvoie la variable concernée par l'affectation.
	 * @return la variable affectée. 
	 */
	public Variable getVarAffectee() {
		return varAffectee;
	}
	
	
	/**
	 * Renvoie l'expression affectée à la variable.
	 * @return l'expression affectée.
	 */
	public ExpressionValuee getValeur() {
		return valeur;
	}
	
}
