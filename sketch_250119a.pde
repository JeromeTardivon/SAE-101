class Window {
  float x, y, sx, sy;
  float vx = 0;
  float vy = 0;
  int destx, desty;
  int weight = 4;

  Window(int x, int y, int sx, int sy) {
    this.x = x;
    this.y = y;
    this.sx = sx;
    this.sy = sy;
  }


  void swipe(String dest) {
    if (dest.equals("UP")) {
      vy = -sqrt(-2 * -(weight) * abs(-(this.y - this.sy) - this.y));
      desty -= (int)(this.sy);
      destx = 0;
    } else if (dest.equals("DOWN")) {
      vy = sqrt(-2 * -(weight) * abs(-(this.y + this.sy) - this.y));
      desty += (int)(this.sy);
      destx = 0;
    } else if (dest.equals("RIGHT")) {
      vx = sqrt(-2 * -(weight) * abs(-(this.x + this.sx) - this.x));
      desty = 0;
      destx += (int)(this.sx);
    } else if (dest.equals("LEFT")) {
      vx = -sqrt(-2 * -(weight) * abs(-(this.x - this.sx) - this.x));
      desty = 0;
      destx -= (int)(this.sx);
    }
  }

  void update() {
    if (vx != 0 || vy != 0) {
      x += vx;
      y += vy;

      if (vx > 0) {
        vx -= weight;
        if (vx < 0) vx = 0;
      } else if (vx < 0) {
        vx += weight;
        if (vx > 0) vx = 0;
      }

      if (vy > 0) {
        vy -= weight;
        if (vy < 0) vy = 0;
      } else if (vy < 0) {
        vy += weight;
        if (vy > 0) vy = 0;
      }
    } else {
      this.x = this.destx;
      this.y = this.desty;
    }
  }
}

class Edt extends Window {
  String start, stop;

  Edt(String start, String stop, int x, int y, int sx, int sy) {
    super(x, y, sx, sy);
    this.start = start;
    this.stop = stop;
  }

  void display() {
    fill(125);
    rect(x, y, sx, sy);
    fill(0);
    text("Random text", x, y + 128);
    fill(color((int)random(255), (int)random(255), (int)random(255)));
    rect((int)random(x, x + 600), (int)random(y, y + 500), (int)random(0, 200), (int)random(0, 100));
    fill(color((int)random(255), (int)random(255), (int)random(255)));
    rect((int)random(x, x + 600), (int)random(y, y + 500), (int)random(0, 200), (int)random(0, 100));
    fill(color((int)random(255), (int)random(255), (int)random(255)));
    rect((int)random(x, x + 600), (int)random(y, y + 500), (int)random(0, 200), (int)random(0, 100));
  }
}

Edt edt;
PFont font;

void setup() {
  size(800, 600);
  font = createFont("Noto Sans", 128);
  textFont(font);
  edt = new Edt("Start", "Stop", 0, 0, 800, 600);
}

void draw() {
  background(255);
  edt.update();
  edt.display();
}

void keyPressed() {
  if (key == 'z') {
    edt.swipe("UP");
  } else if (key == 's') {
    edt.swipe("DOWN");
  } else if (key == 'q') {
    edt.swipe("LEFT");
  } else if (key == 'd') {
    edt.swipe("RIGHT");
  }
}
