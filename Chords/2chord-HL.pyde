class Note():
    notecount = 0
    x=0
    y=0
    def __init__(self,name,string1,string2,string3,string4,string5,string6,bar,column):
        self.string1 = string1
        self.string2 = string2
        self.string3 = string3
        self.string4 = string4
        self.string5 = string5
        self.string6 = string6
        self.name = name
        self.bar = bar
        self.column = column
            
    def display(self):
        strokeWeight(1)
        fill(255)
        rect(7+29*self.column,13+15*Note.notecount-165*self.column,27,15)
        fill(0)
        text(self.name,10+29*self.column,25+15*Note.notecount-165*self.column)
        self.notecount = Note.notecount
        Note.notecount+=1
    
    def play(self):
        fill(255)
        rect(70,0,330,200)
        num = 0
        while (num<400):       
            strokeWeight(1)
            line(130,num,400,num)
            strokeWeight(5)
            line(num+100,0,num+100,400)
            num = num+30
        #black out strings not fingered
        fill(0)
        rect(100,0,30,200)
        #do not strum box
        strokeWeight(2)
        line(70,0,70,200)
        fill(255,50,50)
        rect(70,0,30,200)
        fill(0)
        pushMatrix();
        translate(90,195);
        rotate(3*PI/2);
        text("DO NOT STRUM DO NOT STRUM",0,0);
        popMatrix();
        ellipse(115+30*self.string1,30,15,15)
        ellipse(115+30*self.string2,60,15,15)
        ellipse(115+30*self.string3,90,15,15)
        ellipse(115+30*self.string4,120,15,15)
        ellipse(115+30*self.string5,150,15,15)
        ellipse(115+30*self.string6,180,15,15)
        rect(105+30*self.bar,15,20,175,15)
        
    def click(self):
        if 6< mouseX-29*self.column <35 and 12+15*self.notecount< mouseY+self.column*165 <29+15*self.notecount:
            self.overbox = True
        else:
            self.overbox = False

c = Note("C",0,1,0,2,3,-1,0,0)
cm = Note("Cm",3,4,5,5,3,-1,3,1)


def setup():
    size(400,200)
    background(250)
    #make grid for frets
    num = 0
    while (num<400):       
        strokeWeight(1)
        line(130,num,400,num)
        strokeWeight(5)
        line(num+100,0,num+100,400)
        num = num+30
    #black out strings not fingered
    fill(0)
    rect(100,0,30,200)
    #do not strum box
    strokeWeight(2)
    line(70,0,70,200)
    fill(255,50,50)
    rect(70,0,30,200)
    fill(0)
    pushMatrix();
    translate(90,195);
    rotate(3*PI/2);
    text("DO NOT STRUM DO NOT STRUM",0,0);
    popMatrix();
    c.display()
    cm.display()

def draw():
    #mouse press on note
    c.click()
    cm.click()
    if mousePressed and c.overbox==True:
        c.play()
    if mousePressed and cm.overbox==True:
        cm.play()
