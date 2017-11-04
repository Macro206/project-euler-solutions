#!/usr/bin/python2.7

from fractions import *

def reciprocal(fract):
    return Fraction(fract.denominator, fract.numerator)

def int_add_fraction(theInt, theFract):
    intFractNumerator = theInt * theFract.denominator
    return Fraction(intFractNumerator + theFract.numerator, theFract.denominator)


def calculate_e_convergent(n):
    sequence = [2]
    k = 1

    for i in range(0, (n-1)):
        if i % 3 == 1:
            sequence.append(2*k)
            k += 1
        else:
            sequence.append(1)

    convergent = sequence[n-1]
    i = n-2
    while i >= 0:
        convergent = int_add_fraction(sequence[i], reciprocal(convergent))
        i -= 1

    return convergent


hundredthConvergent = calculate_e_convergent(100)

numeratorString = str(hundredthConvergent.numerator)

answer = 0

for i in range(0, len(numeratorString)):
    answer += int(numeratorString[i])

print answer
