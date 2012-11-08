package fr.ufc.l3info.mcoo.PDL.instructions;


import java.util.List; 

import fr.ufc.l3info.mcoo.PDL.expressions.ExpressionValuee;


/**
 * Classe représentant les instructions d'affichage. 
 * @author Frederic Dadeau - frederic.dadeau@univ-fcomte.fr
 *
 */
public class Affichage extends Instruction {
	
	/** Liste des expressions à afficher */
	List<ExpressionValuee> aAfficher;
	
	
	/**
	 * Constructeur d'instruction d'affichage
	 * @param exprs Liste des expressions à afficher.
	 */
	public Affichage(List<ExpressionValuee> exprs) {
		aAfficher = exprs;
	}


	/**
	 * Renvoie les expressions à afficher.
	 * @return les expressions à afficher.
	 */
	public List<ExpressionValuee> getExpressionsAffichees() {
		return aAfficher;
	}
	
}
