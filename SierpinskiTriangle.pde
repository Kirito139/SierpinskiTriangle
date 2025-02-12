public int base = 20;
public int vtune = 0;
public int r, g, b;

public void setup() {
    noLoop();
    size(720, 720);
    r = 255;
    g = 255;
    b = 255;
}

public void draw() {
    background(0);
    fill(r, g, b);
    sierpinski(0, 0, width, base, vtune);
    text("base: " + base, width - 60, height - 10);
    text("vtune: " + vtune, width - 60, height - 20);
    text("r: " + r, width - 60, height - 30);
    text("g: " + g, width - 60, height - 40);
    text("b: " + b, width - 60, height - 50);
}

public void keyPressed() {
    if (key == '-' && base > 1) base /= 2;
    if (key == '=') base *= 2;
    if (key == ',') vtune += 1;
    if (key == '.') vtune -= 1;
    if (key == 'r') r = (int)(Math.random()*256);
    if (key == 'g') g = (int)(Math.random()*256);
    if (key == 'b') b = (int)(Math.random()*256);
    if (key == '0') r = g = b = 255;
    redraw();
}

public void sierpinski(int x, int y, int len, int base, int h) {
    if (len <= base) {
        triangle(x, y, x+len, y, x+len/2, y+len-h);
    } else {
        sierpinski(x, y, len/2, base, h);
        sierpinski(x+len/2, y, len/2, base, h);
        sierpinski(x+len/4, y+len/2, len/2, base, h);
    }
}
