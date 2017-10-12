PImage bg;
PImage ks;
PImage ks2;
PImage ks3;
float x1, y1, x2, y2;
float a1, b1, a2, b2;
float c1, d1, c2, d2;
float e1, f1, e2, f2;
float g1, h1, g2, h2;
float i1, j1, i2, j2;
float k1, l1, k2, l2;
float m1, n1, m2, n2;
float o1, p1, o2, p2;
float easing =  0.05;
float easing1 =  0.25;
float easing2 =  0.10;
float easing3 =  0.08;
float easing4 =  0.03;
float easing5 =  0.01;

void setup() {
  size(1080, 1080);

  bg = loadImage("pt_reyes_golden.jpg");
  ks = loadImage("ks.png");
  ks2 = loadImage("ks.png");
  ks3 = loadImage("ks.png");
}

void draw() {
    
   if (mousePressed) {
    background(0, 0, 0);  // black 
    
    ks2.resize(247, 285); //resize ks2
    ks3.resize(214, 247); //resize ks3
    
    x2 = (mouseX-ks.width/2) - x1; 
    y2 = (mouseY-ks.width/5) - y1;
    x1 += x2 * easing;
    y1 += y2 * easing;
    x2 = x1;
    y2 = y1;
    tint(255, 85); //low opacity
    image(ks, x1, y1); 
 
    a2 = (mouseX-ks.width/10) - a1; //different placement/movement
    b2 = (mouseY-ks.width/-3) - b1;
    a1 += a2 * easing1; //different easing
    b1 += b2 * easing1;
    a2 = a1;
    b2 = b1; 
    tint(255, 120); // half opacity 
    image(ks, a1, b1); // ks_image

    c2 = (mouseX-ks.width/-2) - c1; 
    d2 = (mouseY-ks.width/-1) - d1;
    c1 += c2 * easing2; //more different easing
    d1 += d2 * easing2;
    c2 = c1;
    d2 = d1;
    tint(255, 90); //lower opacity
    image(ks3, c1, d1); // ks3_image

    e2 = (mouseX-ks.width/25) - e1; 
    f2 = (mouseY-ks.width/2) - f1;
    e1 += e2 * easing3; //more more different easing
    f1 += f2 * easing3;
    e2 = e1;
    f2 = f1; 
    tint(255, 80); // low opacity 
    image(ks2, e1, f1); // ks2_image

    g2 = (mouseX-ks.width/-2) - g1; 
    h2 = (mouseY-ks.width/-2) - h1;
    g1 += g2 * easing4; //even more different easing
    h1 += h2 * easing4;
    g2 = g1;
    h2 = h1;
    tint(255, 100); // halfish opacity 
    image(ks3, g1, h1); // ks3_image
    
    i2 = (mouseX-ks.width/-15) - i1; 
    j2 = (mouseY-ks.width/-1) - j1;
    i1 += i2 * easing5; //still different easing
    j1 += j2 * easing5;
    i2 = i1;
    j2 = j1;
    tint(255, 100); // halfish opacity
    image(ks2, i1, j1); // ks2_image 
    
    k2 = (mouseX-ks.width/-15) - k1; 
    l2 = (mouseY-ks.width/-15) - l1;
    k1 += k2 * easing3;
    l1 += l2 * easing3;
    k2 = k1;
    l2 = l1;
    tint(255, 80); 
    image(ks3, k1, l1); //ks3_image
    
    m2 = (mouseX-ks.width/-12) - m1; 
    n2 = (mouseY-ks.width/-12) - n1;
    m1 += m2 * easing2;
    n1 += n2 * easing2;
    m2 = m1;
    n2 = n1;
    tint(255, 80); 
    image(ks, m1, n1); //ks_image
    
    o2 = (mouseX-ks.width/-2) - o1; 
    p2 = (mouseY-ks.width/-15) - p1;
    o1 += o2 * easing;
    p1 += p2 * easing;
    o2 = o1;
    p2 = p1;
    tint(255, 80); 
    image(ks2, p1, o1);
    
  } 
  else {
    background(bg);  // pt_reyes
    float offset = 0; // sets image offset 
    float dx = (mouseX-bg.width/2) - offset; // defines variable dx as a float that's equal to the mouse's x axis minus half the width of the image
    offset += dx * easing;  // adds and assigns dx * easing to offset
    tint(255, 127);  // Display at half opacity
    image(bg, offset, 0);

 }
}