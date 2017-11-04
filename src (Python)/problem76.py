#!/usr/bin/python2.7

N = 100

cache = []

for k in range(0, N+1):
    cache.append([])
    for n in range(0, N+1):
        cache[k].append(0)

def p(n, m):
    counter = 0

    if n == 0:
        return 1
    elif n < 0:
        return 0

    k = 1
    while k <= m:
        if cache[k][n-k] != 0:
            ctr = cache[k][n-k]
        else:
            ctr = p(n-k, k)
            cache[k][n-k] = ctr

        counter += ctr
        k += 1

    return counter

def countSums(n):
    return p(n, n) - 1

print countSums(N)
