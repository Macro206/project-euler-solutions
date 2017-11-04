#!/usr/bin/python2.7

from fractions import gcd

N = 1000000

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

totientSum = -1

for t in phi:
    totientSum += t

print totientSum
