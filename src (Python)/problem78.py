#!/usr/bin/python2.7

N = 60000

cache = [1]

for k in range(1, N+1):
    cache.append(0)

def p(N):
    for k in range(1, N+1):
        m = 1
        cumulativeSum = 0
        while m * (3*m - 1) / 2 <= k:
            pent1 = m * (3*m - 1) / 2
            cumulativeSum += ((-1) ** (m-1)) * cache[k-pent1]
            pent2 = (-m) * ((-3*m) - 1) / 2
            if pent2 <= k:
                cumulativeSum += ((-1) ** (m-1)) * cache[k-pent2]

            m += 1

        cache[k] = cumulativeSum

    return cache[N]


p(N)

for i in range(0, N+1):
    if cache[i] % 1000000 == 0:
        print i
        break
