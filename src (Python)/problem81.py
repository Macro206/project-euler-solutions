#!/usr/bin/python2.7

lines = open("/Users/Matteo/Library/Developer/Python/Project Euler/Resources/p081_matrix.txt").read().split("\n")

rows = []
dist = []

def checkNeighbours(r, c):
    if r == 0:
        minDist = dist[r][c-1]
    elif c == 0:
        minDist = dist[r-1][c]
    else:
        dist1 = dist[r][c-1]
        dist2 = dist[r-1][c]

        if dist1 < dist2:
            minDist = dist1
        else:
            minDist = dist2

    dist[r][c] = minDist + int(rows[r][c])


for l in lines:
    rows.append(l.split(","))

for r in rows:
    dist.append([])
    for x in r:
        dist[-1].append(0)


dist[0][0] = int(rows[0][0])

row = 1
col = 1

while row < len(rows):
    r = 0
    c = 0
    while r < row:
        checkNeighbours(r, col)
        r += 1

    while c <= col:
        checkNeighbours(row, c)
        c += 1

    row += 1
    col += 1

print dist[len(rows)-1][len(rows)-1]
