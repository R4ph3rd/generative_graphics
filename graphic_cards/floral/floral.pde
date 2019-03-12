color[] c = new color[5];
int cves, coef ;

void setup() {
  size(900, 900);
  smooth();
  //translate(width/2, height/2);
  scale(2, 2);
  background(255);
  noStroke();
 // stroke(206, 18, 0);
  //strokeWeight(0.5);
  //fill(206, 18, 0);

  cves = 500 ;
  coef = 68 ;

  c[0] = color(255, 78, 0);
  c[1] = color(142, 166, 4);
  c[2] = color(245, 187, 0);
  c[3] = color(68, 53, 91);
  c[4] = color(191, 49, 0);
  
// blendMode(DARKEST);
}

void draw() {
 // background(255);
 
  translate(random(width/2), random(height/2));
  fill( c[int(random(c.length))]);
  beginShape();
  for ( int p = 0; p < cves; p ++) {
    float x = 100 * ( cos(p * TWO_PI / cves ) + ( sin ( cos ( p * coef ))));
    float y = 100 * ( sin (p * TWO_PI /cves )  + ( cos ( sin ( p * coef ))));
    println("x , y = ", x, "  ", y);
    curveVertex(x, y);
  }
  endShape(CLOSE);
  
  
  // pour éviter d'effectuer toutes les actions sur une seule frame avec une for, et fluidifier le process
  if (frameCount % 5 == 0) {
    saveFrame("floral_form-###.png");
    background(255);
  }
  
  if (frameCount > 26 ) noLoop();
}
