float speed = 0.0008;
float[] spi = new float [10];
void setup(){
  size(900,900);
  background(0);
  colorMode(HSB);
  
  for (int i = 2 ; i < spi.length; i ++){
   spi[i] = random(TWO_PI); 
  }
  noFill();
  stroke(255);
  strokeWeight(2);
}

void draw(){
  fill(0,10);
  rect(0, 0, width, height);
  
   /* noFill();
  stroke(255);
  strokeWeight(1);*/
  noStroke();
  translate(width / 2, height / 2);
  
  pushMatrix();
  
  // density of spirograph
  for (int i = 2 ; i < spi.length ; i++){
    rotate(spi[i]);
    float radius = height / (10 * (i + 1.3 )) ;
    println("radius = " , radius);
    translate(0, radius);
  //  ellipse(0,0,5,5);
    
    // calculate pos & ang
     for (int p = 0 ; p < spi.length ; p++){
       float g = 150;
        float x = ((p + 5) * 10) * cos(p) ;
        float y = ((p + 5) * 10) * sin(p);
        rotate(cos(i));
        int rad = int(p * i) ;
        
        //draw shapes + gradient
        for (int k = rad ; k > 0 ; k--){
          fill(g, 150, 150);
          arc(x, y, k, k, 0, PI);
          g ++;
        }
     }
    spi[i] = (spi[i] + (speed + speed * i )) % TWO_PI;
  }
  popMatrix();
}
