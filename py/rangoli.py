!pip3 install ColabTurtle
import ColabTurtle.Turtle as t


# create rangoli 

def createRangoli():
    for i in range(24):
        createPentagon()
        t.right(15)


def createPentagon():
    for i in range(5):
        t.forward(100)
        t.right(72)

        
t.initializeTurtle()
t.bgcolor(45,21,86)
t.speed(7)
#interior angle of pentagon = 108
#--> exterior is 72

createRangoli()
