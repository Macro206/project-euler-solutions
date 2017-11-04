#!/usr/bin/python2.7

from fractions import Fraction
from decimal import *
from math import floor

D = 1000000

target = (3, 7)

closestPair = (1, 1)
minDelta = 1000000

for d in range(2, D+1):
    n = floor((d/7.0) * 3)

    delta = ((target[0] * d) - (target[1] * n)) / (target[1] * d)

    if delta < minDelta and delta != 0:
        minDelta = delta
        closestPair = (n, d)

closestFract = Fraction(int(closestPair[0]), int(closestPair[1]))

print closestFract.numerator
