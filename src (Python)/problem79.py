#!/usr/bin/python2.7

triplets = open("/Users/Matteo/Library/Developer/Python/Project Euler/Resources/p079_keylog.txt").read().split("\n")

guess = []

for t in triplets:
    for c in t:
        if int(c) not in guess:
            guess.append(int(c))

for t in triplets:
    i0 = guess.index(int(t[0]))
    i1 = guess.index(int(t[1]))
    i2 = guess.index(int(t[2]))

    if i1 < i0:
        guess.remove(int(t[0]))
        guess.insert(i1, int(t[0]))

    if i2 < i1:
        guess.remove(int(t[1]))
        guess.insert(i2, int(t[1]))


print guess
