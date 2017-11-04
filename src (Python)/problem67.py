#!/usr/bin/python2.7


filePath = "/Users/Matteo/Library/Developer/Python/Project Euler/Resources/p067_triangle.txt"
f = open(filePath)

fileContents = f.read()
lines = fileContents.split("\n")

rows = []
dist = []
for line in lines:
    rows.append(line.split(" "))
    dist.append([])
    if len(rows) == 1:
        dist[0].append(int(rows[0][0]))
    else:
        i = len(rows) - 1
        for vertex in rows[-1]:
            dist[i].append(0)


i = 0
while i < len(rows) - 1:
    j = 0
    while j < len(rows[i]):
        item = rows[i][j]
        newDist = dist[i][j] + int(rows[i+1][j])

        if newDist > dist[i+1][j]:
            dist[i+1][j] = newDist

        newDist = dist[i][j] + int(rows[i+1][j+1])

        if newDist > dist[i+1][j+1]:
            dist[i+1][j+1] = newDist

        j += 1
    i += 1


answer = 0

for distance in dist[-1]:
    if distance > answer:
        answer = distance

print answer
