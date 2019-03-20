float speed = 0.0008;
int nb = 13;
float[] spi = new float [nb];
PVector[] pos = new PVector[nb];
void setup() {
  size(900, 900);
  background(0);
  colorMode(HSB);

  for (int i = 2; i < spi.length; i ++) {
    spi[i] = random(TWO_PI); 
    pos[i] = new PVector(random(width), random(height));
  }
  /*  noFill();
   stroke(255);
   strokeWeight(2);*/
  noStroke();
}

void draw() {
  fill(0, 10);
  rect(0, 0, width, height);
  
  strokeWeight(50);
  stroke(43,90,5);
  line(200,0,200,height);
  line(0,600,width,550);
  line(0,200,width,400);
   noStroke();

  // density of spirograph
  for (int i = 4; i < spi.length; i++) {
    pushMatrix();
    translate(pos[i].x, pos[i].y);


    rotate(spi[i]);
    float radius = height / (10 * (i + 1.3 )) ;
   // println("radius = ", radius);
    translate(0, radius);
    //  ellipse(0,0,5,5);

    // calculate pos & ang
    for (int p = 0; p < spi.length; p++) {
      float g = 150;
      float x = ((p + 5) * 10) * cos(p) ;
      float y = ((p + 5) * 10) * sin(p);
      rotate(cos(i));
      int rad = int(p * i) ;

      //draw shapes + gradient
      for (int k = rad; k > 0; k--) {
        fill(g, 150, 150);
        arc(x, y, k, k, 0, PI);
        g ++;
      }
    }
    spi[i] = (spi[i] + (speed + speed * i )) % TWO_PI;
    popMatrix();
  }
}

void keyPressed(){
 if (key =='s' || key == 'S') saveFrame("arcs_gradient-###.png"); 
}
