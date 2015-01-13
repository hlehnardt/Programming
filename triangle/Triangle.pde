void setup() {
size(400,450);
}

void draw() {
background(255);
int area = areaFinder(mouseX-25,425-mouseY);
int bottom = mouseX-25;
int side = 425-mouseY;
fill(mouseX*51/80,(mouseX*(450-mouseY))*.0024,255-(mouseY*17/30));
triangle(25,425,mouseX,425,25,mouseY);
rect(25,381+mouseY/10,mouseX/10,(450-mouseY)/10);
fill(0);
textSize(20);
text("Area Of A Right Triangle",110, 20);
textSize(12);
text("Area",205,195);
text(area,205,210);
text("Base =",25,440);
text(bottom,65,440);
pushMatrix();
translate(15,415);
rotate(-PI/2); 
text("Height =",0,0);
popMatrix();
pushMatrix();
translate(15,362);
rotate(-PI/2); 
text(side,0,0); 
popMatrix();
textSize(8);
text("HL",389,448);
}

int areaFinder(int bottom, int side){
  int area = bottom*side/2;
  return area;
}

