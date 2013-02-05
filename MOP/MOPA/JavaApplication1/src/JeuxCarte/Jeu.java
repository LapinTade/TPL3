package JeuxCarte;

import java.util.ArrayList;
import java.util.Collections;

/**
 *
 * @author nroze
 */
public class Jeu {
    private ArrayList<Carte> paquet;
    
    public Jeu() {
        this.paquet = new ArrayList<Carte>();
    }
    
    public void remplir() {
        for(int k=7; k<15; k++) {
            for(int j=0; j<4; j++) {
                paquet.add(Carte.genererCarte(k,j));
            }
        }
    }
    
    public void melanger() {
        Collections.shuffle(this.paquet);
    }
    
    @Override
    public String toString() {
        String res = "";
        for(Carte ca: paquet) {
        res += "\n " + ca;
    }
        return res;
    }
    
    public Carte getCarte(int index) {
        return paquet.get(index);
    }
}
