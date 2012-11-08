package fr.ufc.l3info.mcoo.PDL.instructions;

import java.util.List;

import fr.ufc.l3info.mcoo.PDL.expressions.ExpressionBooleenne;

/**
 * Classe représentant une instruction de répétition (ou itérative)
 * @author Frederic Dadeau - frederic.dadeau@univ-fcomte.fr
 *
 */
public class Repetition extends Instruction {

	/** Condition de l'instruction alternative */
	ExpressionBooleenne condition;
	
	/** Instructions réalisées lorsque la boucle est itérée */
	List<Instruction> instructions;
	
	
	/**
	 * Constructeur d'instruction itérative. 
	 * @param cond		la condition
	 * @param instrs	les instructions à réaliser si la condition est vraie.
	 */
	public Repetition(ExpressionBooleenne cond, List<Instruction> instrs) {
		condition = cond;
		instructions = instrs;
	}


	/**
	 * Renvoie la condition d'itération.
	 * @return la condition de l'instruction itérative. 
	 */
	public ExpressionBooleenne getCondition() {
		return condition;
	}


	/**
	 * Renvoie les instructions réalisées lors de l'itération. 
	 * @return une liste d'instruction réalisées lorsque la boucle est itérée. 
	 */
	public List<Instruction> getInstructions() {
		return instructions;
	}

}
