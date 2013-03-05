/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package JeuxCarte;

/**
 *
 * @author nroze
 */
public class Partie {
    private int scoreJ1;
    private int scoreJ2;
    private PaquetJoueur P1;
    private PaquetJoueur P2;
    private Jeu jeuDeCarte;
    
    public Partie() {
        this.scoreJ1 = 0;
        this.scoreJ2 = 0;
        this.P1 = new PaquetJoueur();
        this.P2 = new PaquetJoueur();
        this.jeuDeCarte = new Jeu();
    }
    
    public void distribuer() {
        for(int i=0; i <=32; i++) {
            if(i%2 == 0) {
                P1.ajouterCarte(jeuDeCarte.getCarte(i));
            } else {
                P2.ajouterCarte(jeuDeCarte.getCarte(i));
            }
        }
    }
    
    public void pli() {
        Carte c1;
        Carte c2;
        
    }
}
