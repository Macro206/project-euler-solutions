#!/usr/bin/python2.7

import sys

def freshArray():
    theArray = []
    for i in range(0,10):
        theArray.append(0)
    return theArray

def digitQuantitiesAreEqual(q1, q2):
    result = True
    for i in range(0,10):
        if q1[i] != q2[i]:
            result = False
            break
    return result

digitQuantitiesSet = []

for n in range(0,10000):
    nCubed = n ** 3
    nCubedString = str(nCubed)
    digitQuantities = freshArray()
    for c in nCubedString:
        digitQuantities[int(c)] = digitQuantities[int(c)] + 1

    digitQuantitiesSet.append(digitQuantities)

    index = 0
    count = 1
    sameDigitQuantityCubes = []
    while index < len(digitQuantitiesSet) - 1:
        if digitQuantitiesAreEqual(digitQuantities, digitQuantitiesSet[index]):
            count += 1
            sameDigitQuantityCubes.append(index)

        index += 1

    if count == 5:
        for c in sameDigitQuantityCubes:
            print c

        print n
        break
