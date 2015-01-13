Car[] myCars = new Car[100];
void setup() {
  size(960,850);
  background(255);
 
  for (int i = 0; i< myCars.length; i++) {
    float j = random(height);
  myCars[i] = new Car(random(width),j,
  10*random(-10,10)/abs((height/2)-j),
  color(random(255),random(255),random(255)));
  }
}


void draw() {
background(255);
rectMode(CENTER);
fill(150);
rect(0,height/2,width*2,40);
stroke(255,255,0);
line(0,(height/2)+1,width, (height/2)+1);
line(0,(height/2)-1,width, (height/2)-1);
stroke(0);

//draw cars
for(int i = 0; i<myCars.length; i++) {
  Car iCar = myCars[i];
  iCar.display();
  iCar.drive();
}
}
class Car {
// member variable
int cLength, cHeight, cWeight;
color cColor;
float xpos, ypos, cSpeed;

// constructor #1
Car (float tempX, float tempY) {
  xpos = tempX;
  ypos = tempY;
  cSpeed = 5;
  cColor = color(255,0,0);
}

// constructor #2
Car (float tempX, float tempY, float tempSpeed, color tempColor) {
xpos = tempX;
ypos = tempY;
cSpeed = tempSpeed;
cColor = tempColor;
}

// member methods
void display() {
  rectMode(CENTER);
  fill(cColor);
  rect(xpos,ypos,30,10);
  fill(0);
  rect(xpos-9,ypos-6,8,2);
  rect(xpos-9,ypos+6,8,2);
  rect(xpos+9,ypos-6,8,2);
  rect(xpos+9,ypos+6,8,2);
  fill(230,230,255);
  rect(xpos,ypos,15,8);
}

void drive(){
 xpos = xpos + cSpeed;
  if (xpos > width) {
  xpos = 0;
  }
  else if (xpos<0) {
    xpos = width;
  }
}

}




