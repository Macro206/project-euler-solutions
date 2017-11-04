#!/usr/bin/python2.7

import array

triangleNumbers    = array.array('i')
squareNumbers      = array.array('i')
pentagonalNumbers  = array.array('i')
hexagonalNumbers   = array.array('i')
heptagonalNumbers  = array.array('i')
octagonalNumbers   = array.array('i')

n = 1
while n*(n+1)/2 < 10000:
    result = n*(n+1)/2
    if result >= 1000:
        triangleNumbers.append(result)
    n += 1

n = 1
while n**2 < 10000:
    result = n**2
    if result >= 1000:
        squareNumbers.append(result)
    n += 1

n = 1
while n*((3*n)-1)/2 < 10000:
    result = n*((3*n)-1)/2
    if result >= 1000:
        pentagonalNumbers.append(result)
    n += 1

n = 1
while n*((2*n)-1) < 10000:
    result = n*((2*n)-1)
    if result >= 1000:
        hexagonalNumbers.append(result)
    n += 1

n = 1
while n*((5*n)-3)/2 < 10000:
    result = n*((5*n)-3)/2
    if result >= 1000:
        heptagonalNumbers.append(result)
    n += 1

n = 1
while n*((3*n)-2) < 10000:
    result = n*((3*n)-2)
    if result >= 1000:
        octagonalNumbers.append(result)
    n += 1


grandCollection = [triangleNumbers, squareNumbers, pentagonalNumbers, hexagonalNumbers, heptagonalNumbers,
 octagonalNumbers]

pairs = []

index = len(grandCollection)

while index > 1:
    index -= 1
    currentCollection = grandCollection[index]

    for m in currentCollection:
        mString = str(m)

        for collection in grandCollection:
            if collection == currentCollection:
                break

            for n in collection:
                nString = str(n)

                if nString[2:] == mString[:2]:
                    pairs.append(str(n) + "-" + str(grandCollection.index(collection)) + " : " + str(m) + "-" + str(index))
                if nString[:2] == mString[2:]:
                    pairs.append(str(m) + "-" + str(index) + " : " + str(n) + "-" + str(grandCollection.index(collection)))

quartets = []

index = len(pairs)
while index > 1:
    index -= 1
    currentPair = pairs[index]

    for otherPair in pairs:
        if currentPair[5] == otherPair[5] or currentPair[5] == otherPair[14] or currentPair[14] == otherPair[5] or currentPair[14] == otherPair[14]:
            continue

        if currentPair[:2] == otherPair[-4:-2]:
            quartets.append(otherPair + " : " + currentPair)
        if currentPair[-4:-2] == otherPair[:2]:
            quartets.append(currentPair + " : " + otherPair)

possibleSets = []

for quartet in quartets:
    for pair in pairs:
        if pair[5] == quartet[5] or pair[5] == quartet[14] or pair[5] == quartet[23] or pair[5] == quartet[32] or pair[14] == quartet[5] or pair[14] == quartet[14] or pair[14] == quartet[23] or pair[14] == quartet[32]:
            continue

        if quartet[-4:-2] == pair[:2] and quartet[:2] == pair[-4:-2]:
            possibleSets.append(quartet + " : " + pair)

for aSet in possibleSets:
    print aSet

print ""

finalSet = possibleSets[0] # The remaining sets are all cyclically the same

finalSum = 0
for i in range(0, 6):
    finalSum += int(finalSet[(i*9):((i*9)+4)])

print "The sum is: " + str(finalSum) + "\n"
