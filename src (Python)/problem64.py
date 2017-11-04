#!/usr/bin/python2.7

def intCeil(x, d):
    if x % d == 0:
        return x / d
    else:
        return (x/d) + 1

def calculateSquareRootSequence(x):
    m_n = 0
    d_n = 1
    preciseN = x ** 0.5
    a_n = int(x ** 0.5)
    if preciseN - a_n == 0:
        return

    a_n_array = [a_n]

    #print "a_0 = " + str(a_n)

    for n in range(1, 500):
        m_n_1 = (d_n * a_n) - m_n
        d_n_1 = (x - (m_n_1 ** 2))/d_n
        a_n_1 = int(preciseN + m_n_1)/d_n_1

        m_n = m_n_1
        d_n = d_n_1
        a_n = a_n_1

        a_n_array.append(a_n)

        #print "a_" + str(n) + " = " + str(a_n)

    return a_n_array


def detectPeriod(array):
    repeatingArray = array[1:]

    for length in range(1, 250):
        periodChunk = repeatingArray[0:length]

        n = intCeil(len(repeatingArray), length)

        found = True

        for i in range(0, n):
            offset = length * (i+1)
            if (offset + length - 1) >= len(repeatingArray):
                testChunk = repeatingArray[offset:]
                if periodChunk[0:len(testChunk)] != testChunk:
                    found = False
                    break
            else:
                testChunk = repeatingArray[offset:(offset+length)]
                if periodChunk != testChunk:
                    found = False
                    break

        if found == True:
            return length

    return 0


answer = 0

for n in range(2, 10001):
    if n == (int(n ** 0.5) ** 2):
        continue

    squareRootSequence = calculateSquareRootSequence(n)

    length = detectPeriod(squareRootSequence)

    if length % 2 != 0:
        answer += 1

print answer
