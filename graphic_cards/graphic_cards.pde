float curvs;
float ra, divis;
float x, y, tx, ty, tw;
PVector amp;
color[] c = new color[5];

void setup() {
  size(900, 900);
  curvs = 200;
  divis = 2.5;
  smooth();
  tx=0;
  ty=1000;
  tw = 0;
  c[0] = color(255,78,0);
  c[1] = color(142,166,4);
  c[2] = color(245,187,0);
  c[3] = color(68,53,91);
  c[4] = color(191,49,0);
  
  randomSeed(12345);
  
      noFill();

}

void draw() {
 

    background(0);
    translate(width/2, height/2);
    
    float ra = random(900);  
    amp = new PVector(ra, ra);
    
    scale(0.4,0.4);
    //random walk
    x = map(noise(tx), 0, 1, - width * 2, width * 2);
    y = map(noise(ty), 0, 1, - height * 2, height * 2);

    tx += random(0.03);
    ty += random(0.01);
    tw += random(0.06);



    // visible random walker
    //  fill(255);
    //  ellipse(x,y,10,10);
    //  stroke(255);
    //  line(-width*4,y,width*4,y);
    //  line(x,-height*4,x,height*4);

    for (float i = 0; i < curvs; i++) {
      float p1 = cos(i * (TWO_PI/curvs)) * amp.x / 2; 
      float p2 = sin(i * (TWO_PI/curvs)) * amp.x / 2;
      float p3 = cos((i+1) * (TWO_PI/curvs)) * amp.x / 4;
      float p4 = sin((i+1) * (TWO_PI/curvs)) * amp.x / 4;
      rotate(PI * i / divis);
      //blendMode(ADD);
      stroke(c[int(random(c.length))]);
      
      curve(
      map(y, 0, width, -6000, 6000),
      p1,
      -width/2,
      map(y, 0, height, -height/2, height/2),
      width/2,
      p4,
      width,
      map(x, 0, height, -4000, 4000));
      
      //stroke(c[int(random(c.length))]);
      
      curve(
      map(p1, 0, width, -6000, 6000),
      x,
      -width/2,
      map(x, 0, height, -height/2, height/2),
      width/2,
      p3,
      width,
      map(y, 0, height, -4000, 4000));   
      
      stroke(c[int(random(c.length))]);
      
      curve(x,
      map(p1, 0, width, -200, 6000),
      -width/2, 
      map(x, 0, height, -height/2, height/2),
      width/2, 
      p2, 
      width, 
      map(y, 0, height, -20, 20));
        blendMode(LIGHTEST);
      
      saveFrame("graphic_card-###.png");  
    }
  
  if (frameCount > 10 ) noLoop();
}
