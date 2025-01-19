class Window {
  float x, y, sx, sy;
  float vx = 0;
  float vy = 0;
  int weight = 4;

  Window(int x, int y, int sx, int sy) {
    this.x = x;
    this.y = y;
    this.sx = sx;
    this.sy = sy;
  }


  void swipe(String dest) {
    if (this.x == 0 && this.y == 0) {
      if (dest.equals("UP")) {
        vy = -sqrt(-2 * -(weight) * abs(-(this.y + this.sy) - this.y));
      } else if (dest.equals("DOWN")) {
        vy = sqrt(-2 * -(weight) * abs(height - this.y));
      } else if (dest.equals("RIGHT")) {
        vx = sqrt(-2 * -(weight) * abs(width - this.x));
      } else if (dest.equals("LEFT")) {
        vx = -sqrt(-2 * -(weight) * abs(-(this.x + this.sx) - this.x));
      }
    } else {
      x = 0;
      y = 0;
    }
  }

  void update() {
    if (vx != 0 || vy != 0) {
      x += vx;
      y += vy;

      if ((x + sx)<0) {
        x = -sx;
      } else if (x>width) {
        x = width;
      }
      if ((y + sy)<0) {
        y = -sy;
      } else if (y>height) {
        y = height;
      }

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
    rect(x, y, sx, sy);
  }
}

Edt edt;

void setup() {
  size(1020, 1080);
  fill(125);
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
