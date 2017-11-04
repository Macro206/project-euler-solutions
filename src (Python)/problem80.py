#!/usr/bin/python2.7

from decimal import *

getcontext().prec = 120

rt2 = Decimal(2) ** Decimal(0.5)

cumulativeSum = 0

for n in range(1, 101):
    if n not in [1, 4, 9, 16, 25, 36, 49, 64, 81, 100]:
        root = str(Decimal(n) ** Decimal(0.5))
        for i in range(0, 101):
            if root[i] != ".":
                cumulativeSum += int(root[i])

print cumulativeSum
