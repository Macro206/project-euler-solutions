#!/usr/bin/python2.7

from __future__ import print_function

lines = open("/Users/Matteo/Library/Developer/Python/Project Euler/Resources/p082_matrix.txt").read().split("\n")

minimumDistance = 1000000000

D = len(lines)

rows = []
dist = []
visi = []

def printMatrix():
    for r in visi:
        for v in r:
            if v == True:
                print('1', end="")
            else:
                print('0', end="")

        print('')

    print('\n')


rowStrings = []
rows = []
dist = []
visi = []

for l in lines:
    rowStrings.append(l.split(","))

for row in rowStrings:
    rows.append([])
    for r in row:
        rows[-1].append(int(r))

for r in rows:
    dist.append([])
    visi.append([])
    for x in r:
        dist[-1].append(1000000000)
        visi[-1].append(False)


minDist = 1000000001
currentNode = (0, 0)

r = 0
while r < D:
    dist[r][0] = rows[r][0]
    if dist[r][0] < minDist:
        minDist = dist[r][0]
        currentNode = (r, 0)
    r += 1


visited = 0

while visited < (D*D):
    r = currentNode[0]
    c = currentNode[1]

    if r != 0 and visi[r-1][c] == False:
        newDist = dist[r][c] + rows[r-1][c]
        if newDist < dist[r-1][c]:
            dist[r-1][c] = newDist
    if r != (D - 1) and visi[r+1][c] == False:
        newDist = dist[r][c] + rows[r+1][c]
        if newDist < dist[r+1][c]:
            dist[r+1][c] = newDist
    if c != (D - 1) and visi[r][c+1] == False:
        newDist = dist[r][c] + rows[r][c+1]
        if newDist < dist[r][c+1]:
            dist[r][c+1] = newDist

    visi[r][c] = True
    visited += 1

    minDist = 1000000001
    minNode = (0, 0)

    for r in range(0, D):
        for c in range(0, D):
            if visi[r][c] == False and dist[r][c] < minDist:
                minDist = dist[r][c]
                minNode = (r, c)

    currentNode = minNode

for r in dist:
    if r[-1] < minimumDistance:
        minimumDistance = r[-1]

print(minimumDistance)
