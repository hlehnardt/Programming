class Note():
    notecount = 0
    
    def __init__(self,name,string1,string2,string3,string4,string5,string6):
        self.string1 = string1
        self.string2 = string2
        self.string3 = string3
        self.string4 = string4
        self.string5 = string5
        self.string6 = string6
        self.name = name
        Note.notecount = Note.notecount + 1
        
    def display(self):
        strokeWeight(1)
        fill(255)
        rect(17,13+15*Note.notecount,15,15)
        fill(0)
        text(self.name,20,25+15*Note.notecount)
        
        
    def play(self):
        ellipse(115+30*self.string1,30,15,15)
        ellipse(115+30*self.string2,60,15,15)
        ellipse(115+30*self.string3,90,15,15)
        ellipse(115+30*self.string4,120,15,15)
        ellipse(115+30*self.string5,150,15,15)
        ellipse(115+30*self.string6,180,15,15)
        
c = Note("C",0,1,0,2,3,-1)

def setup():
    size(400,200)
    
def draw():
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
    #mouse press on note
    
    c.play()
