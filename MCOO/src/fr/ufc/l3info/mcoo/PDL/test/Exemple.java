package fr.ufc.l3info.mcoo.PDL.test;

import java.util.List;
import java.util.ArrayList;

import fr.ufc.l3info.mcoo.PDL.*;
import fr.ufc.l3info.mcoo.PDL.expressions.*;
import fr.ufc.l3info.mcoo.PDL.instructions.*;


/**
 * Classe servant de test pour la représentation du langage PDL.
 * @author Frederic Dadeau - frederic.dadeau@univ-fcomte.fr
 *
 */
public class Exemple {

	
	public static void main(String[] args) {
	
		Programme test = getProgrammeTest();
		
		prettyPrint(test,"");
		
	}
	
	
	
	public static void prettyPrint(EntitePDL e, String prefix) {
		if (e instanceof Programme) {
			Programme p = (Programme) e;
			System.out.println("Programme " + p.getNom() + "\n");
			System.out.println("Variables");
			for (VarGlobale var : p.getVarGlobales()) {
				System.out.println("\t" + var.getNom() + " : " + getStr(var.getType()));				
			}
			for (Procedure pr : p.getProcedures()) {
				System.out.print("\nProcedure " + pr.getNom() + "(");
				int i=0;
				for (Parametre pa : pr.getParametres()) {
					if (i > 0) {
						System.out.print(", ");
					}
					i++;
					System.out.print(getStr(pa.getGenre()) + " " + pa.getNom() + " : " + getStr(pa.getType()));
				}
				System.out.println(")");
				if (pr.getVarLocales().size() > 0) {
					System.out.println("Variables");
					for (VarLocale var : pr.getVarLocales()) {
						System.out.println("\t" + var.getNom() + " : " + getStr(var.getType()));				
					}					
				}
				System.out.println("Debut");
				for (Instruction in : pr.getInstructions()) {
					prettyPrint(in,"\t");
				}
				System.out.println("Fin");
			}
			return;
		}
		if (e instanceof Instruction) {
			System.out.print(prefix);
			if (e instanceof Saisie) {
				Saisie s = (Saisie) e;
				System.out.println(s.getVarAffectee().getNom() + " := lire();");
				return;
			}
			if (e instanceof Affichage) {
				Affichage a = (Affichage) e;
				System.out.print("afficher(");
				int i=0;
				for (ExpressionValuee ex : a.getExpressionsAffichees()) {
					if (i > 0) {
						System.out.print(", ");
					}
					i++;
					prettyPrint(ex,prefix);
				}
				System.out.println(");");
			}
			if (e instanceof Appel) {
				Appel a = (Appel) e;
				System.out.print(a.getProcedureAppelee().getNom() + "(");
				int i=0;
				for (ExpressionValuee ex : a.getValeursParametres()) {
					if (i > 0) {
						System.out.print(", ");
					}
					i++;
					prettyPrint(ex,prefix);
				}
				System.out.println(");");
			}
			if (e instanceof Affectation) {
				Affectation a = (Affectation) e;
				System.out.print(a.getVarAffectee().getNom() + " := ");
				prettyPrint(a.getValeur(),prefix);
				System.out.println(";");
			}
			if (e instanceof Repetition) {
				Repetition r = (Repetition) e;
				System.out.print("tant que ");
				prettyPrint(r.getCondition(),"");
				System.out.println(" faire");
				for (Instruction in : r.getInstructions()) {
					prettyPrint(in,prefix + "\t");
				}
				System.out.println(prefix + "fait");
			}
			if (e instanceof Conditionnelle) {
				Conditionnelle c = (Conditionnelle) e;
				System.out.print("si ");
				prettyPrint(c.getCondition(),"");
				System.out.println(" alors");
				for (Instruction in : c.getInstructionsSi()) {
					prettyPrint(in,prefix + "\t");
				}
				if (c.getInstructionsSinon().size() > 0) {
					System.out.println(prefix + "sinon");
					for (Instruction in : c.getInstructionsSinon()) {
						prettyPrint(in, prefix + "\t");
					}
				}
				System.out.println(prefix + "fsi");				
			}
		}
		
		if (e instanceof ValeurChaine) {
			System.out.print("\"" + ((ValeurChaine)e).getValeur() + "\"");
		}

		if (e instanceof ValeurEntier) {
			System.out.print("" + ((ValeurEntier)e).getValeur());
		}
		
		if (e instanceof Variable) {
			System.out.print(((Variable) e).getNom());
		}
		
		if (e instanceof Calcul) {
			prettyPrint(((Calcul) e).getOperande1(),"");
			if (e instanceof Plus) { System.out.print("+"); }
			else if (e instanceof Moins) { System.out.print("-"); }
			else if (e instanceof Multiplie) { System.out.print("*"); }
			else if (e instanceof Divise) { System.out.print("/"); }
			else if (e instanceof Modulo) { System.out.print("%"); }
			prettyPrint(((Calcul) e).getOperande2(),"");
		}
		
		if (e instanceof Comparaison) {
			prettyPrint(((Comparaison) e).getOperande1(),"");
			if (e instanceof Egalite) { System.out.print("="); }
			else if (e instanceof Inegalite) { System.out.print("!="); }
			else if (e instanceof Superieur) { System.out.print(">"); }
			else if (e instanceof SuperieurOuEgal) { System.out.print(">="); }
			else if (e instanceof Inferieur) { System.out.print("<"); }
			else if (e instanceof InferieurOuEgal) { System.out.print("<="); }
			prettyPrint(((Comparaison) e).getOperande2(),"");
		}
		
		if (e instanceof Et) {
			prettyPrint(((Et) e).getOperande1(),"");
			System.out.print(" et ");
			prettyPrint(((Et) e).getOperande2(),"");			
		}

		if (e instanceof Ou) {
			prettyPrint(((Ou) e).getOperande1(),"");
			System.out.print(" ou ");
			prettyPrint(((Ou) e).getOperande2(),"");			
		}
		
		if (e instanceof Non) {
			System.out.print("non(");
			prettyPrint(((Non) e).getOperande(),"");			
			System.out.print(")");
		}

	}
	
	
	public static String getStr(Type t) {
		if (t == Type.CHAINE) {
			return "chaine";
		}
		if (t == Type.ENTIER) {
			return "entier";
		}
		return "?";
	}
	
	public static String getStr(Genre g) {
		if (g == Genre.IN) {
			return "in";
		}
		if (g == Genre.OUT) {
			return "out";
		}
		if (g == Genre.INOUT) {
			return "inout";
		}
		return "?";
	}
	
	
	public static Programme getProgrammeTest() {
		
		/* programme test;
		 * 
		 * variables
		 * 		verdict : chaine;
		 */

		Programme test = new Programme("test");
		VarGlobale verdict = new VarGlobale("verdict", Type.CHAINE);
		test.addVarGlobale(verdict);
		Procedure fact1 = new Procedure("factorielle1");
		Procedure fact2 = new Procedure("factorielle2");
		Procedure principale = new Procedure("principale");
		test.addProcedure(principale);
		test.addProcedure(fact1);
		test.addProcedure(fact2);
		
		
		/* procedure principale() 
		 * variables 
		 * 		x, y, z : entier;
		 * debut	
		 * 		afficher("Saisir un nombre entier");
		 * 		z := lire();
		 * 		factorielle1(z,x);
		 * 		factorielle2(z,y);
		 * 		si (x = y) alors
		 * 			verdict = ":-)";
		 * 		sinon
		 * 			verdict = ":-(";
		 * 		fsi
		 * 		afficher("factorielle1(", z, ") =?= factorielle2(", z, ") --> " + verdict);
		 * fin
		 */		
		{
			VarLocale x = new VarLocale("x",Type.ENTIER);
			VarLocale y = new VarLocale("y",Type.ENTIER);
			VarLocale z = new VarLocale("z",Type.ENTIER);
			principale.addVarLocale(x);
			principale.addVarLocale(y);
			principale.addVarLocale(z);
			
			List<ExpressionValuee> aff1 = new ArrayList<ExpressionValuee>();
			aff1.add(new ValeurChaine("Saisir un nombre entier"));
			principale.addInstruction(new Affichage(aff1));
			
			principale.addInstruction(new Saisie(z));
			
			List<ExpressionValuee> params1 = new ArrayList<ExpressionValuee>();
			params1.add(z);
			params1.add(x);
			principale.addInstruction(new Appel(fact1,params1));
			
			List<ExpressionValuee> params2 = new ArrayList<ExpressionValuee>();
			params2.add(z);
			params2.add(y);
			principale.addInstruction(new Appel(fact2,params2));
			
			List<Instruction> si = new ArrayList<Instruction>();
			si.add(new Affectation(verdict, new ValeurChaine(":-)")));
			List<Instruction> sinon = new ArrayList<Instruction>();
			sinon.add(new Affectation(verdict, new ValeurChaine(":-(")));
			principale.addInstruction(new Conditionnelle(new Egalite(x,y),si,sinon));
			
			List<ExpressionValuee> aff2 = new ArrayList<ExpressionValuee>();
			aff2.add(new ValeurChaine("factorielle1("));
			aff2.add(z);
			aff2.add(new ValeurChaine(") =?= factorielle2("));
			aff2.add(z);
			aff2.add(new Plus(new ValeurChaine(") --> "),verdict));
			principale.addInstruction(new Affichage(aff2));
			
		}

		
		/* 
		 * procedure factorielle1(in x : entier, out res : entier)
		 * debut
		 * 		si x = 0 ou x = 1 alors 
		 *			res := x;
		 * 		sinon 
		 * 			factorielle1(x-1, res);
		 * 		fsi
		 * fin
		 * 
		 */ 
		{
			Parametre x = new Parametre("x",Type.ENTIER,Genre.IN);
			Parametre res = new Parametre("res",Type.ENTIER,Genre.OUT);
			fact1.addParametre(x);
			fact1.addParametre(res);
			
			ExpressionBooleenne cond1 = new Ou(new Egalite(x, new ValeurEntier(0)), new Egalite(x, new ValeurEntier(1)));
			List<Instruction> si1 = new ArrayList<Instruction>();
			si1.add(new Affectation(res, x));
			
			List<Instruction> sinon1 = new ArrayList<Instruction>();
			List<ExpressionValuee> params = new ArrayList<ExpressionValuee>();
			params.add(new Moins(x,new ValeurEntier(1)));
			params.add(res);
			sinon1.add(new Appel(fact1,params));

			fact1.addInstruction(new Conditionnelle(cond1, si1, sinon1));
		}
		
		
		
		/* procedure factorielle2(in x : entier, out res : entier)
		 * debut
		 * 		si x = 0 alors
		 * 			res := 0;
		 * 		sinon 
		 * 			res := 1;
		 * 			tant que x > 0 faire
		 * 				res := res * x;
		 * 				x := x - 1;
		 * 			fait
		 * 		fait
		 * fin
		 */
		{
			Parametre x = new Parametre("x",Type.ENTIER,Genre.IN);
			Parametre res = new Parametre("res",Type.ENTIER,Genre.OUT);
			fact2.addParametre(x);
			fact2.addParametre(res);
			
			List<Instruction> si = new ArrayList<Instruction>();
			si.add(new Affectation(res, new ValeurEntier(0)));
			
			List<Instruction> sinon = new ArrayList<Instruction>();
			sinon.add(new Affectation(res, new ValeurEntier(1)));
			List<Instruction> tq = new ArrayList<Instruction>();
			tq.add(new Affectation(res, new Multiplie(res,x)));
			tq.add(new Affectation(x, new Moins(x, new ValeurEntier(1))));
			sinon.add(new Repetition(new Superieur(x,new ValeurEntier(0)),tq));
			
			fact2.addInstruction(new Conditionnelle(new Egalite(x, new ValeurEntier(0)),si,sinon));
		}
		
	return test;
	}
	
}