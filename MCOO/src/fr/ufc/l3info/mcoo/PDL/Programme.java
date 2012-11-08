package fr.ufc.l3info.mcoo.PDL;

import java.util.HashSet;
import java.util.Set;

import fr.ufc.l3info.mcoo.PDL.expressions.VarGlobale;

/**
 * Classe représentant les programmes PDL. 
 * @author Frederic Dadeau - frederic.dadeau@univ-comte.fr
 */
public class Programme implements EntitePDL {

	/** Nom du programme */
	String nom;
	
	/** Variables globales du programme */
	Set<VarGlobale> varGlobales;
	
	/** Procedures du programme */
	Set<Procedure> procedures;
		

	/** 
	 * Constructeur de Programme.
	 * @param n	Le nom du programme. 
	 */
	public Programme(String n) {
		nom = n;
		varGlobales = new HashSet<VarGlobale>();
		procedures = new HashSet<Procedure>();
	}
	
	
	/**
	 * Renvoie le nom du programme.
	 * @return le nom du programme.
	 */
	public String getNom() {
		return nom;
	}
	
	
	/**
	 * Renvoie l'ensemble de variables globales du programme.
	 * @return l'ensemble de variables globales.
	 */
	public Set<VarGlobale> getVarGlobales() {
		return varGlobales;
	}


	/**
	 * Ajoute une variable globale au programme.
	 * @param vg la variable globales à ajouter.
	 */
	public void addVarGlobale(VarGlobale vg) {
		varGlobales.add(vg);
	}


	/**
	 * Renvoie l'ensemble de procédures du programme.
	 * @return l'ensemble de procédures.
	 */
	public Set<Procedure> getProcedures() {
		return procedures;
	}


	/**
	 * Ajoute une procédure au programme. 
	 * @param proc la procédure à ajouter. 
	 */
	public void addProcedure(Procedure proc) {
		procedures.add(proc);
	}
	
}
