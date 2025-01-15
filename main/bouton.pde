class Bouton {
  int x, y;
  int largeur, hauteur;
  PImage icone;
  boolean actif=false;

  void init(int w, int h, String image) {
    largeur= w;
    hauteur= h;
    icone=loadImage(image);
    icone.resize(w, h);
  }

  boolean estClique(int posX, int posY) {
    return actif && posX>x && posX<x+largeur && posY>y && posY<y+hauteur;
  }
  void dessin() {
    if (actif) {
      image(icone, x, y);
    }
  }
}
