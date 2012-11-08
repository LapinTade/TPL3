package fr.ufc.l3info.mcoo.PDL;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import fr.ufc.l3info.mcoo.PDL.expressions.Parametre;
import fr.ufc.l3info.mcoo.PDL.expressions.VarLocale;
import fr.ufc.l3info.mcoo.PDL.instructions.Instruction;


/**
 * Classe représentant les procédures dans les programmes.  
 * @author Frederic Dadeau - frederic.dadeau@univ-fcomte.fr
 */
public class Procedure implements EntitePDL {
	
	/** Le nom de la procédure */
	String nom;
	
	/** Liste des paramètres */
	List<Parametre> parametres;
	
	/** Ensemble de variables locales */
	Set<VarLocale> varLocales;
	
	/** Liste des instructions */
	List<Instruction> instructions;

	
	/**
	 * Constructeur de procedure.
	 * @param n	Le nom donné à la procédure.
	 */
	public Procedure(String n) {
		nom = n;
		parametres = new ArrayList<Parametre>();
		varLocales = new HashSet<VarLocale>();
		instructions = new ArrayList<Instruction>();		
	}

	
	/**
	 * Renvoie le nom de la procédure.
	 * @return le nom de la procédure.
	 */
	public String getNom() {
		return nom;
	}

	
	
	/**
	 * Renvoie les paramètres de la procédure.
	 * @return La liste des paramètres de la procédure.
	 */
	public List<Parametre> getParametres() {
		return parametres;
	}


	/**
	 * Ajoute un paramètre à la procédure.
	 * @param param le paramètre à ajouter à la procédure.
	 */
	public void addParametre(Parametre param) {
		parametres.add(param);
	}


	/** 
	 * Renvoie l'ensemble des variables locales
	 * @return les variables locales à la procédure.
	 */
	public Set<VarLocale> getVarLocales() {
		return varLocales;
	}


	/**
	 * Ajoute une variables locales à la procédure.
	 * @param var la variable à déclarer dans la procédure.
	 */
	public void addVarLocale(VarLocale var) {
		varLocales.add(var);
	}



	/**
	 * Renvoie la liste d'instructions composant la procédure.
	 * @return Les instructions composant la procédure.
	 */
	public List<Instruction> getInstructions() {
		return instructions;
	}


	/**
	 * Ajoute une instruction à la procédure.
	 * @param instr l'instruction à ajouter à la procédure.
	 */
	public void addInstruction(Instruction instr) {
		instructions.add(instr);
	}
	
	
	
}
