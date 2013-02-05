package JeuxCarte;

/**
 *
 * @author nroze
 */
public class Carte implements Comparable<Carte> {
    private int couleur;
    private int valeur;
    
    private Carte(int couleur, int valeur) {
        this.couleur = couleur;
        this.valeur = valeur;
    }
    
    public int getCouleur() {
        return this.couleur;
    }
    
    public int getValeur() {
        return this.valeur;
    }
    
    @Override
    public String toString() {
        String s = "";
        
        switch(this.valeur) {
            case 14: s += "As de ";
                break;
            case 13: s += "Roi de ";
                break;
            case 12: s += "Dame de ";
                break;
            case 11: s += "Valet de ";
            default: s += this.valeur + " de ";
        }
        
        switch (this.couleur){
            case 0 : s += "Coeur";
                break;
            case 1 : s += "Pique";
                break;
            case 2 : s += "Carreaux";
                break;
            case 3 : s += "Trèfle";
                break;
        }

        return s;
    }
    
    public static Carte genererCarte(int couleur, int valeur) {
        Carte c = null;
        if(((couleur >= 0) && (couleur <= 3)) && ((valeur >=7) && (valeur <= 14))){
            c = new Carte(couleur, valeur);
        }
        
        return c;
    }
    
    @Override
    public int compareTo(Carte c){
        if(this.valeur < c.getValeur()){
            return -1;
        } else {
            if(this.valeur == c.getValeur()){
                return 0;
            } else {
                return 1;
            }
        }
    }
}
