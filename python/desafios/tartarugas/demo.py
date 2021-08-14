#!/usr/bin/env python
# https://docs.python.org/3/library/turtle.html
import turtle

janela = turtle.Screen()

nelson = turtle.Turtle()

nelson.shape("turtle")
nelson.color("black", "green")
nelson.shapesize(2,2,1)
nelson.pensize(3)

for i in range(10):
  nelson.left(90)
  nelson.speed(i)
  nelson.forward(10*i)

print("POSITION:", nelson.position())

print("HEADING:", nelson.heading())

