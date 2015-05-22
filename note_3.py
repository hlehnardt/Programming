class Note():
    notecount = 0
    x=0
    y=0
    #class
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
    
    #method    
    def display(self):
        strokeWeight(1)
        fill(255)
        rect(7+29*self.column,13+15*Note.notecount-180*self.column,27,15)
        fill(0)
        text(self.name,8+29*self.column,25+15*Note.notecount-180*self.column)
        self.notecount = Note.notecount
        Note.notecount+=1
    
    #method
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
     
    #method
    
    def click(self):
        if 6< mouseX-29*self.column <35 and 12+15*self.notecount< mouseY+180*self.column<29+15*self.notecount:
            self.overbox = True
        else:
            
            self.overbox = False

c = Note("C",0,1,0,2,3,-1,0,0)
cm = Note("Cm",3,4,5,5,3,-1,3,0)
db = Note("Db",0,6,6,6,0,-1,4,0)
dbm = Note("Dbm",0,5,6,6,0,-1,4,0)
d = Note("D",2,3,2,0,-1,-1,0,0)
dm = Note("Dm",1,3,2,0,-1,-1,0,0)
eb = Note("Eb",0,8,8,8,0,-1,6,0)
ebm = Note("Ebm",0,7,8,8,0,-1,6,0)
e = Note("E",0,0,1,2,2,0,0,0)
em = Note("Em",0,0,0,2,2,0,0,0)
f = Note("F",0,0,2,3,3,0,1,0)
fm = Note("Fm",0,0,0,3,3,0,1,0)
gb = Note("Gb",0,0,3,4,4,0,2,1)
gbm = Note("Gbm",0,0,0,4,4,0,2,1)
g = Note("G",3,0,0,0,2,3,0,1)
gm = Note("Gm",0,0,0,5,5,0,3,1)
ab = Note("Ab",0,0,5,6,6,0,4,1)
abm = Note("Abm",0,0,0,6,6,0,4,1)
a = Note("A",0,2,2,2,0,-1,0,1)
am = Note("Am",0,1,2,2,0,-1,0,1)
bb = Note("Bb",0,3,3,3,0,-1,1,1)
bbm = Note("Bbm",0,2,3,3,0,-1,1,1)
b = Note("B",0,4,4,4,0,-1,2,1)
bm = Note("Bm",0,3,4,4,0,-1,2,1)


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
    db.display()
    dbm.display()
    d.display()
    dm.display()
    eb.display()
    ebm.display()
    e.display()
    em.display()
    f.display()
    fm.display()
    gb.display()
    gbm.display()
    g.display()
    gm.display()
    ab.display()
    abm.display()
    a.display()
    am.display()
    bb.display()
    bbm.display()
    b.display()
    bm.display()

def draw():
    #mouse press on note
    c.click()
    cm.click()
    db.click()
    dbm.click()
    d.click()
    dm.click()
    eb.click()
    ebm.click()
    e.click()
    em.click()
    f.click()
    fm.click()
    gb.click()
    gbm.click()
    g.click()
    gm.click()
    ab.click()
    abm.click()
    a.click()
    am.click()
    bb.click()
    bbm.click()
    b.click()
    bm.click()
    if mousePressed and c.overbox==True:
        c.play()
    if mousePressed and cm.overbox==True:
        cm.play()
    if mousePressed and db.overbox==True:
        db.play() 
    if mousePressed and dbm.overbox==True:
        dbm.play()
    if mousePressed and d.overbox==True:
        d.play() 
    if mousePressed and dm.overbox==True:
        dm.play() 
    if mousePressed and eb.overbox==True:
        eb.play() 
    if mousePressed and ebm.overbox==True:
        ebm.play() 
    if mousePressed and e.overbox==True:
        e.play() 
    if mousePressed and em.overbox==True:
        em.play() 
    if mousePressed and f.overbox==True:
        f.play() 
    if mousePressed and fm.overbox==True:
        fm.play() 
    if mousePressed and gb.overbox==True:
        gb.play() 
    if mousePressed and gbm.overbox==True:
        gbm.play() 
    if mousePressed and g.overbox==True:
        g.play()                 
    if mousePressed and gm.overbox==True:
        gm.play() 
    if mousePressed and ab.overbox==True:
        ab.play()       
    if mousePressed and abm.overbox==True:
        abm.play()                                                                                    
    if mousePressed and a.overbox==True:
        a.play() 
    if mousePressed and am.overbox==True:
        am.play()                                                                                                                                                                       
    if mousePressed and bb.overbox==True:
        bb.play()
    if mousePressed and bbm.overbox==True:
        bbm.play()                                                                                                                                                                                                                                                        
    if mousePressed and b.overbox==True:
        b.play()                                                                                                                                                                                    
    if mousePressed and bm.overbox==True:
        bm.play()
