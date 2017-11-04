#!/usr/bin/python2.7

from fractions import gcd
from math import log, ceil

def isPermutation(m, n):
    x = m
    y = n
    lenX = ceil(log(x, 10))
    lenY = ceil(log(x, 10))

    if lenX != lenY:
        return False

    digitQuantitiesX = 0
    digitQuantitiesY = 0

    i = 0
    while i < lenX:
        digitX = x % 10
        digitY = y % 10
        digitQuantitiesX += 10 ** digitX
        digitQuantitiesY += 10 ** digitY

        x /= 10
        y /= 10

        i += 1

    return (digitQuantitiesX == digitQuantitiesY)


N = 10000000

phi = [0, 1]
for n in range(2, N+1):
    phi.append(0)

for n in range(2, N+1):
    if phi[n] == 0:
        phi[n] = n-1

        k = 1
        p = n
        while (p**k) <= N:
            pk = p**k
            phi[pk] = (pk/p) * (p-1)

            m = 2
            while m*pk <= N:
                mpk = m*pk
                if phi[m] != 0 and phi[mpk] == 0 and m != pk:
                    if gcd(m, pk) == 1:
                        phi[mpk] = phi[m] * phi[pk]
                m += 1

            k += 1

print "Totient values computed"

n_min = 0
n_over_phi_min = 10000000

for n in range(2, N+1):
    if isPermutation(n, phi[n]):
        n_over_phi = float(n) / float(phi[n])
        if n_over_phi < n_over_phi_min:
            n_min = n
            n_over_phi_min = n_over_phi

print n_min
