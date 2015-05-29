def setup():      
     size(400,200)

def draw():
    num = 0
    while num<400:       
        strokeWeight(1)
        line(100,num,400,num)
        num = num+30
        strokeWeight(5)
        line(num+100,0,num+100,400)
        num = num+1 
        
# first fret 115, 2nd 145, 3rd 175, 4th 205, 5th 235, 6th 265
