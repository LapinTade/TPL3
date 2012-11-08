package fr.ufc.l3info.mcoo.PDL.instructions;

import java.util.List; 

import fr.ufc.l3info.mcoo.PDL.Procedure;
import fr.ufc.l3info.mcoo.PDL.expressions.ExpressionValuee;


/**
 * Classe représentant les appels de procédure. 
 * @author Frederic Dadeau - frederic.dadeau@univ-fcomte.fr
 *
 */
public class Appel extends Instruction {
	
	/** La procédure appelée */
	Procedure procedureAppelee;
	
	/** Instanciation des paramètres */
	List<ExpressionValuee> valeursParametres; 
	
	
	/**
	 * Constructeur d'appel de procédure.
	 * @param p	la procédure appelée
	 * @param vals les valeurs des paramétres dans l'ordre. 
	 */
	public Appel(Procedure p, List<ExpressionValuee> vals) {
		procedureAppelee = p;
		valeursParametres = vals;
	}


	/**
	 * Renvoie la procédure appelée.
	 * @return la procédure appelée. 
	 */
	public Procedure getProcedureAppelee() {
		return procedureAppelee;
	}


	/**
	 * Renvoie les paramètres et leurs valeurs. 
	 * @return une liste de valeur de parametres.
	 */
	public List<ExpressionValuee> getValeursParametres() {
		return valeursParametres;
	}

}
