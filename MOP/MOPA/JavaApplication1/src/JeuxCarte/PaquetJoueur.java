package JeuxCarte;

import java.util.ArrayList;
import java.util.TreeSet;

/**
 *
 * @author nroze
 */
public class PaquetJoueur {
    private ArrayList<TreeSet<Carte>> hand;
    
    public PaquetJoueur() {
        this.hand = new ArrayList<TreeSet<Carte>>();
        for(int i=0; i<4; i++){
            hand.add(new TreeSet<Carte>());
        }
    }

    public void ajouterCarte(Carte c) {
        hand.get(c.getCouleur()).add(c);
    }
    
    public void enleverCarte(Carte c) {
        hand.get(c.getCouleur()).remove(c);
    }
}
