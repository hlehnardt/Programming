
CalcButton[] numButtons = new CalcButton[10];
CalcButton[] opButtons = new CalcButton[10];
CalcButton[] spButtons = new CalcButton[1];

String displayValue = "0";
String valueToCompute = ""; //string value left of the operator
String valueToCompute2 = "";//string value right of the operator
float valueToComputeI = 0; //float value left of operator
float valueToComputeI2 = 0; //float value right of operator
float result = 0;
char opValue;
boolean firstNum;
void setup() {
  size(260, 480);
  background(200);

  numButtons[0] = new CalcButton(20, 360).asNumber(0, 40, 40);
  numButtons[1] = new CalcButton(20, 300).asNumber(1, 40, 40);
  numButtons[2] = new CalcButton(80, 300).asNumber(2, 40, 40);
  numButtons[3] = new CalcButton(140, 300).asNumber(3, 40, 40);
  numButtons[4] = new CalcButton(20, 240).asNumber(4, 40, 40);
  numButtons[5] = new CalcButton(80, 240).asNumber(5, 40, 40);
  numButtons[6] = new CalcButton(140, 240).asNumber(6, 40, 40);
  numButtons[7] = new CalcButton(20, 180).asNumber(7, 40, 40);
  numButtons[8] = new CalcButton(80, 180).asNumber(8, 40, 40);
  numButtons[9] = new CalcButton(140, 180).asNumber(9, 40, 40);

  //operators
  opButtons[0] = new CalcButton(80, 360).asOperator(" +", 40, 40);
  opButtons[1] = new CalcButton(140, 360).asOperator(" -", 40, 40);
  opButtons[2] = new CalcButton(200, 180).asOperator(" *", 40, 40);
  opButtons[3] = new CalcButton(200, 240).asOperator(" /", 40, 40);
  opButtons[4] = new CalcButton(200, 300).asOperator(" ±", 40, 40);
  opButtons[5] = new CalcButton(20, 420).asOperator(" CLEAR", 100, 40);
  opButtons[6] = new CalcButton(140, 420).asOperator(" ENTER", 100, 40);
  opButtons[7] = new CalcButton(20, 120).asOperator("sin", 40, 40);
  opButtons[8] = new CalcButton(80, 120).asOperator("cos", 40, 40);
  opButtons[9] = new CalcButton(140, 120).asOperator("tan", 40, 40);

  //special buttons
  spButtons[0] = new CalcButton(200, 360).asSpecial(".");

  firstNum = true;
}

void draw() {
  for (int i=0; i<numButtons.length; i++) {
    CalcButton inumButton = numButtons[i];
    inumButton.display();
  }
  for (int i=0; i<opButtons.length; i++) {
    CalcButton iopButton = opButtons[i];
    iopButton.display();
  }
  for (int i=0; i<spButtons.length; i++) {
    CalcButton ispButton = spButtons[i];
    ispButton.display();
  }
  updateDisplay();
}

void mousePressed() {
  for (int i=0; i<numButtons.length; i++) {
    CalcButton inumButton = numButtons[i];
    inumButton.click();
    if (inumButton.overBox) {
      if (firstNum) {
        valueToCompute += int(inumButton.numButtonValue);
        displayValue = valueToCompute;
      } else {
        valueToCompute2 += int(inumButton.numButtonValue);
        displayValue = valueToCompute2;
      }
    }
  }
  for (int i=0; i<opButtons.length; i++) {
    CalcButton iOpButton = opButtons[i];
    iOpButton.click();
    if (iOpButton.overBox) {
      if (iOpButton.opButtonValue == " +") {
        if (result !=0) {
          opValue = '+';
          valueToCompute2 = "";
          firstNum = false;
          displayValue = "+";
        } else {
          opValue = '+';
          firstNum=false;
          displayValue = "+";
        }
      } else if (iOpButton.opButtonValue == " -") {
        if (result !=0) {
          opValue = '-';
          valueToCompute2 = "";
          firstNum = false;
          displayValue = "-";
        } else {
          opValue = '-';
          firstNum=false;
          displayValue = "-";
        }
      } else if (iOpButton.opButtonValue == " *") {
        if (result !=0) {
          opValue = '*';
          valueToCompute2 = "";
          firstNum = false;
          displayValue = "*";
        } else {
          opValue = '*';
          firstNum=false;
          displayValue = "*";
        }
      } else if (iOpButton.opButtonValue == " /") {
        if (result !=0) {
          opValue = '/';
          valueToCompute2 = "";
          firstNum = false;
          displayValue = "/";
        } else {
          opValue = '/';
          firstNum=false;
          displayValue = "/";
        }
      } else if (iOpButton.opButtonValue == "sin") {
        if (result !=0) {
          opValue = 's';
          valueToCompute2 = "";
          firstNum = false;
          displayValue = "sin";
        } else {
          opValue = 's';
          firstNum=false;
          displayValue = "sin";
        }
      } else if (iOpButton.opButtonValue == "cos") {
        if (result !=0) {
          opValue = 'o';
          valueToCompute2 = "";
          firstNum = false;
          displayValue = "cos";
        } else {
          opValue = 'o';
          firstNum=false;
          displayValue = "cos";
        }
      } else if (iOpButton.opButtonValue == "tan") {
        if (result !=0) {
          opValue = 't';
          valueToCompute2 = "";
          firstNum = false;
          displayValue = "tan";
        } else {
          opValue = 't';
          firstNum=false;
          displayValue = "tan";
        }
      } else if (iOpButton.opButtonValue == " CLEAR") {
        displayValue = "0";
        opValue = 'C';
        valueToCompute = "";
        valueToCompute2 = "";
        valueToComputeI = 0;
        valueToComputeI2 = 0;
        result = 0;
        firstNum = true;
      } else if (iOpButton.opButtonValue == " ±") {
        opValue = 'n';
        performCalculation();
      } else if (iOpButton.opButtonValue == " ENTER") {
        //Perform Calculation
        firstNum = true;
        performCalculation();
      }
    }
  }
  for (int i=0; i<spButtons.length; i++) {
    CalcButton iSpButton = spButtons[i];
    iSpButton.click();
    if (iSpButton.overBox) {
      if (iSpButton.spButtonValue == ".") {
        //concantenate the values clicked on
        if (iSpButton.overBox && firstNum == true) {
          valueToCompute += iSpButton.spButtonValue;
          displayValue = valueToCompute;
        } else if (iSpButton.overBox && firstNum == false) {
          valueToCompute2 += iSpButton.spButtonValue;
          displayValue = valueToCompute2;
        }
      }
    }
  }
}

void keyPressed() {
  if (key == '1') {
    handleKeyPressNum("1");
  } else if (key == '2') {
    handleKeyPressNum("2");
  } else if (key == '3') {
    handleKeyPressNum("3");
  } else if (key == '4') {
    handleKeyPressNum("4");
  } else if (key == '5') {
    handleKeyPressNum("5");
  } else if (key == '6') {
    handleKeyPressNum("6");
  } else if (key == '7') {
    handleKeyPressNum("7");
  } else if (key == '8') {
    handleKeyPressNum("8");
  } else if (key == '9') {
    handleKeyPressNum("9");
  } else if (key == '0') {
    handleKeyPressNum("0");
  }
}

void handleKeyPressNum(String keyPress) {
  if (firstNum) {
    valueToCompute  += keyPress;
    displayValue = valueToCompute;
  } else {
    valueToCompute2 += keyPress;
    displayValue = valueToCompute2;
  }
}

void performCalculation() {
  //set string values to integers
  valueToComputeI = float(valueToCompute);
  valueToComputeI2 = float(valueToCompute2);

  //use operator
  if (opValue == '+') {
    result = valueToComputeI + valueToComputeI2;
    displayValue = str(result);
  } else if (opValue == '-') {
    result = valueToComputeI - valueToComputeI2;
    displayValue = str(result);
  } else if (opValue == '*') {
    result = valueToComputeI * valueToComputeI2;
    displayValue = str(result);
  } else if (opValue == '/') {
    result = valueToComputeI / valueToComputeI2;
    displayValue = str(result);
  } else if (opValue == 'n') {
    if (firstNum) {
      valueToComputeI = valueToComputeI*-1;
      displayValue = str(valueToComputeI);
    } else {
      valueToComputeI2 = valueToComputeI2*-1;
      displayValue = str(valueToComputeI);
    }
  } else if (opValue == 's') {
    if (firstNum) {
      valueToComputeI = sin(valueToComputeI/57.2957795);
      displayValue = str(valueToComputeI);
    } else {
      valueToComputeI2 = sin(valueToComputeI2/57.2957795);
      displayValue = str(valueToComputeI);
    }
  } else if (opValue == 'o') {
    if (firstNum) {
      valueToComputeI = cos(valueToComputeI/57.2957795);
      displayValue = str(valueToComputeI);
    } else {
      valueToComputeI2 = cos(valueToComputeI2/57.2957795);
      displayValue = str(valueToComputeI);
    }
  } else if (opValue == 't') {
    if (firstNum) {
      valueToComputeI = tan(valueToComputeI/57.2957795);
      displayValue = str(valueToComputeI);
    } else {
      valueToComputeI2 = tan(valueToComputeI2/57.2957795);
      displayValue = str(valueToComputeI);
    }
  }
  if (firstNum) {
    valueToCompute = displayValue;
  } else {
    valueToCompute = displayValue;
    valueToCompute2 = "";
  }
}

void updateDisplay() {
  fill(200, 200, 150);
  rect(20, 20, 220, 30, 7);
  fill(0);
  textSize(25);
  text(displayValue, 25, 45);
  fill(50, 55, 55);
  noStroke();
  rect(20, 54, 100, 54);
  fill(255);
  textSize(11);
  text("Val 1: " + valueToCompute, 25, 65);
  text("Val 2: " + valueToCompute2, 25, 78);
  text("Result: " + result, 25, 91);
  text("Operator: " + opValue, 25, 104);
}


class CalcButton {
  //Class variables
  boolean isNumber;
  boolean isSpecial;
  boolean isOperator;
  float numButtonValue;
  String opButtonValue;
  String spButtonValue;
  float xpos;
  float ypos;
  int boxSize = 40;
  int buttonW = 40;
  int buttonH = 40;
  boolean overBox = false;

  //Constructor
  CalcButton(float tempXpos, float tempYpos) {
    xpos = tempXpos;
    ypos = tempYpos;
  }
  CalcButton asNumber(float tempNumButtonValue, 
  int tempW, int tempH) {
    isNumber = true;
    numButtonValue = tempNumButtonValue;
    buttonW = tempW;
    buttonH = tempH;
    return this;
  }
  CalcButton asOperator(String tempOpButtonValue, 
  int tempW, int tempH) {
    isOperator = true;
    opButtonValue = tempOpButtonValue;
    buttonW = tempW;
    buttonH = tempH;
    return this;
  }
  CalcButton asSpecial(String buttonValue) {
    isSpecial = true;
    spButtonValue = buttonValue;
    return this;
  }
  //Draw the button
  void display() {
    if (isNumber) {
      fill(20, 100, 255);
      stroke(0);
      strokeWeight(2);
      rect(xpos, ypos, buttonW, buttonH, 10);
      fill(255);
      textSize(20);
      text(int(numButtonValue), xpos+14, ypos+28);
    } else if (isSpecial) {
      fill(133);
      stroke(0);
      strokeWeight(2);
      rect(xpos, ypos, boxSize, boxSize, 10);
      fill(0);
      textSize(24);
      text(spButtonValue, xpos+15, ypos+30);
    } else if (isOperator) {
      fill(133);
      stroke(0);
      strokeWeight(2);
      rect(xpos, ypos, buttonW, buttonH, 10);
      fill(0);
      textSize(24);
      text(opButtonValue, xpos+3, ypos+30);
    } else {
      fill(133);
      stroke(0);
      strokeWeight(2);
      rect(xpos, ypos, boxSize, boxSize, 10);
      fill(0);
      textSize(24);
      text(opButtonValue, xpos+15, ypos+30);
    }
  }
  //handle mouse actions
  void click() {
    overBox = mouseX > xpos && mouseX < xpos+buttonW
      && mouseY > ypos && mouseY < ypos+buttonH;
  }
}


