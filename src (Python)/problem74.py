#!/usr/bin/python2.7

factorials = [1, 1, 2, 6, 24, 120, 720, 5040, 40320, 362880]

def digitFactorialSum(x):
    factSum = 0
    n = x
    while n > 0:
        digit = n % 10
        factSum += factorials[digit]
        n /= 10

    return factSum

N = 1000000

chainLengths = []
for i in range(0, N):
    chainLengths.append(0)

answer = 0

for n in range(1, N):
    length = 1
    chain = [n]
    while length < 61:
        nextElement = digitFactorialSum(chain[-1])
        if nextElement < N and chainLengths[nextElement] != 0:
            length += chainLengths[nextElement]
            break
        if nextElement not in chain:
            chain.append(nextElement)
            length += 1
        else:
            break

    chainLengths[n] = length

    if length == 60:
        answer += 1

print answer
