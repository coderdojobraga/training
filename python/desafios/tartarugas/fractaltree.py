#!/usr/bin/env python

import turtle

turtle.speed(200000)

def branch(x, y, length = 100, direction = 90):
    if length < 10:
        return

    turtle.up()
    turtle.goto(x,y)
    turtle.down()

    turtle.seth(direction)
    turtle.forward(length)

    px, py = turtle.xcor(), turtle.ycor()
    branch(px, py, length * 0.7, direction + 45)
    branch(px, py, length * 0.7, direction - 45)

branch(0, 0, 100, 90)
