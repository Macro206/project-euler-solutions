#!/usr/bin/python2.7

N = 100

def primes_upto(limit):
    is_prime = [False] * 2 + [True] * (limit - 1)
    for n in range(int(limit**0.5 + 1.5)): # stop at ``sqrt(limit)``
        if is_prime[n]:
            for i in range(n*n, limit+1, n):
                is_prime[i] = False
    return [i for i, prime in enumerate(is_prime) if prime]


primes = primes_upto(N)

sopf = [0, 0]
for n in range(2, N+1):
    m = n
    factors = []

    while m > 1:
        j = 0
        while primes[j] <= m:
            p = primes[j]
            if m % p == 0:
                m /= p
                if (p not in factors):
                    factors.append(p)
                break
            j += 1

    cumulativeSum = 0
    for f in factors:
        cumulativeSum += f

    sopf.append(cumulativeSum)

k = [0, 0]
for n in range(2, N+1):
    cumulativeSum = 0
    j = 1
    while j <= n-1:
        cumulativeSum += sopf[j] * k[n-j]
        j += 1

    kappa = (sopf[n] + cumulativeSum) / n
    k.append(kappa)


for n in range(0, N+1):
    if k[n] > 5000:
        print n
        break
