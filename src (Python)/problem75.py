#!/usr/bin/python2.7

from fractions import gcd

def tripleSum(m, n):
    return (2 * (m**2)) + (2*m*n)


N = 1500000

trianglesFromLength = []

for i in range(0, N+1):
    trianglesFromLength.append(0)

for m in range(2, N+1):
    for n in range(1, m):
        if (m - n) % 2 == 0 or gcd(m, n) != 1:
            continue

        length = tripleSum(m, n)

        if length > N:
            break

        k = 1
        while (k * length) <= N:
            klength = k * length
            trianglesFromLength[klength] = trianglesFromLength[klength] + 1
            k += 1

    if (2 * (m**2)) > N:
        break

answer = 0

for n in range(0, N+1):
    if trianglesFromLength[n] == 1:
        answer += 1

print answer
