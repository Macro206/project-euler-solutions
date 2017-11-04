#!/usr/bin/python2.7

from fractions import gcd

N = 12000

answer = 0

for d in range(2, N+1):
    n = (d/3) + 1

    while (2*n) < d:
        if (3*n) > d and gcd(n, d) == 1:
            answer += 1
        n += 1

print answer
