String filename = "christian_sculpt";
String extfile = ".jpg";
int[] blendmethods = {ADD, SUBTRACT, DARKEST, LIGHTEST, DIFFERENCE, EXCLUSION, MULTIPLY, SCREEN, OVERLAY, HARD_LIGHT, SOFT_LIGHT, DODGE, BURN};
PImage img;
int dsize = 900;
int z1, z2, z3, z4;
int no = 0;
PGraphics pg ;
boolean neg, doblend, doposterize;

void settings(){

  img = loadImage(filename + extfile);

  // calculate window size
  float ratio = (float)img.width/(float)img.height;
  int wdth, hght;
  if(ratio < 1) {
    wdth = (int)(dsize * ratio);
    hght = dsize;
  } else {
    wdth = dsize;
    hght = (int)(dsize / ratio);
  }

  size(wdth,hght); 
}

void setup(){
  pg = createGraphics(img.width,img.height);
  float min = 0.00001; 
  z1 = int (random(min,15));
  z2 = int (random(min,15));
  z3 = int (random(min,8));
  z4 = int (random(min,8));
  neg = random(1) < 0.5 ;
    doblend = random(1)<0.5;
      doposterize = random(1)<0.2;
  sat();
}

void draw(){}

void keyPressed(){
 if (key == 's' || key == 'S') pg.save(filename + "_satured-" + no + ".png");
 no ++;
}

void sat(){
  println("processing image...");
  pg.beginDraw();
  
  for  ( int y = 0; y < img.height ; y++){
    for ( int x = 0 ; x < img.width ; x++){
      color c = img.get(x,y);
      
      float fx = map ( sqrt( getChan(z1, c) * getChan(z3,c)), 0, 1, 0 , 10);
      float fy = map ( sqrt( getChan(z2, c) * getChan(z4,c)), 0, 1, 0, 10);
      
      //println("fx = ", fx, "  fy = ", fy);
      
      int r = abs(int(map (fx   * (z1 /z3 ), 0, 10, 0, 255)));
      int g = abs(int(map (fy * (z2 / z4 ), 0, 10, 0, 255)));
      int b = abs(int(map (fx / fy  * ((z1 + z2)/ (z3 + z4)), 0, 10, 0, 255)));
      
     // print(" r = " , r, "   g = " , g, "   b = " , b);
      
      pg.fill(r,g,b);
      pg.rect(x,y,1,1);
  
    }
    }
    
     if(doblend) pg.blend(img, 0,0,img.width,img.height,0,0,img.width,img.height,blendmethods[(int)random(blendmethods.length)]);   
 //if(doposterize) pg.filter(POSTERIZE,(int)random(3,13));   
 
  pg.endDraw();
  image (pg, 0, 0, width, height);
  println("it's done dude !");
}


float getChan(int n, color c) {
  float t;
  switch(n) {
    case 0: t = red(c); break;
    case 1: t = green(c); break;
    case 2: t = blue(c); break;
    case 3: t = hue(c); break;
    case 4: t = saturation(c); break;
    default: t = brightness(c); break; 
  }
  return neg ? map(t, 0, 255, 1, 0) : map(t, 0, 255, 0, 1);
}
