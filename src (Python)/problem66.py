#!/usr/bin/python2.7

from fractions import *

def reciprocal(fract):
    return Fraction(fract.denominator, fract.numerator)

def int_add_fraction(theInt, theFract):
    intFractNumerator = theInt * theFract.denominator
    return Fraction(intFractNumerator + theFract.numerator, theFract.denominator)


def findMinimalX(D):
    if D == (int(D ** 0.5) ** 2):
        return 0

    length = 1
    while 0==0:
        m_n = 0
        d_n = 1
        preciseN = D ** 0.5
        a_n = int(D ** 0.5)

        sequence = [a_n]

        for n in range(1, length):
            m_n_1 = (d_n * a_n) - m_n
            d_n_1 = (D - (m_n_1 ** 2))/d_n
            a_n_1 = int(preciseN + m_n_1)/d_n_1

            m_n = m_n_1
            d_n = d_n_1
            a_n = a_n_1

            sequence.append(a_n)


        convergent = sequence[length-1]
        i = length-2
        while i >= 0:
            convergent = int_add_fraction(sequence[i], reciprocal(convergent))
            i -= 1

        x = convergent.numerator
        y = convergent.denominator

        if (x ** 2) - (D * (y ** 2)) == 1:
            return x

        length += 1

max_X = 0
max_D = 0

for D in range(2, 1001):
    if D == (int(D ** 0.5) ** 2):
        continue

    x = findMinimalX(D)

    if x > max_X:
        max_X = x
        max_D = D

print max_D
