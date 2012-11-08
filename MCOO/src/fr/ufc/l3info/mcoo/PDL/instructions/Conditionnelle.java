package fr.ufc.l3info.mcoo.PDL.instructions;

import java.util.List;

import fr.ufc.l3info.mcoo.PDL.expressions.ExpressionBooleenne;

/**
 * Classe représentant une instruction conditionnelle (ou alternative)
 * @author Frederic Dadeau - frederic.dadeau@univ-fcomte.fr
 *
 */
public class Conditionnelle extends Instruction {

	/** Condition de l'instruction alternative */
	ExpressionBooleenne condition;
	
	/** Instructions réalisées lorsque la condition est vraie */
	List<Instruction> instructionsSi;
	
	/** Instructions réalisées lorsque la condition est fausse */
	List<Instruction> instructionsSinon;

	
	/**
	 * Constructeur d'instruction conditionnelle. 
	 * @param cond	la condition
	 * @param si	les instructions à réaliser si la condition est vraie.
	 * @param sinon	les instructions à réaliser si la condition est fausse. 
	 */
	public Conditionnelle(ExpressionBooleenne cond, List<Instruction> si, List<Instruction> sinon) {
		condition = cond;
		instructionsSi = si;
		instructionsSinon = sinon;
	}


	/**
	 * Renvoie la condition de l'instruction alternative.
	 * @return la condition considérée. 
	 */
	public ExpressionBooleenne getCondition() {
		return condition;
	}


	/**
	 * Renvoie les instructions réalisées si la condition est vraie. 
	 * @return une liste d'instruction réalisées si la condition est vraie. 
	 */
	public List<Instruction> getInstructionsSi() {
		return instructionsSi;
	}


	/**
	 * Renvoie les instructions réalisées si la condition est fausse. 
	 * @return une liste d'instruction réalisées si la condition est fausse. 
	 */
	public List<Instruction> getInstructionsSinon() {
		return instructionsSinon;
	}

}
