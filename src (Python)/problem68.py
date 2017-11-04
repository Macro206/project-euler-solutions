#!/usr/bin/python2.7

from collections import namedtuple

Solution = namedtuple("Solution", "total string")

class N_gon_ring:
    def __init__(self, sides):
        self.outer = []
        self.inner = []
        self.N = sides

    def evaluateSolution(self, fillGaps):
        if fillGaps:
            fixedTotal = self.outer[0] + self.inner[0] + self.inner[1]
            for i in range(1, self.N):
                x2 = self.inner[i]
                if i == self.N - 1:
                    x3 = self.inner[0]
                else:
                    x3 = self.inner[i+1]

                temp = fixedTotal - x2 - x3
                if temp <= 0 or temp > (self.N * 2) or temp < self.outer[0] or temp == x2 or temp == x3:
                    return None
                else:
                    for j in range(0, i):
                        if temp == self.outer[j]:
                            return None
                    for j in range(0, self.N):
                        if temp == self.inner[j]:
                            return None
                    self.outer[i] = temp

        if len(self.outer) != self.N or len(self.inner) != self.N:
            return ""

        solutionString = ""

        commonTotal = 0

        for i in range(0, self.N):
            x1 = self.outer[i]
            x2 = self.inner[i]
            if i == self.N - 1:
                x3 = self.inner[0]
                #solutionString += str(x1) + "," + str(x2) + "," + str(x3)
                solutionString += str(x1) + str(x2) + str(x3)
            else:
                x3 = self.inner[i+1]
                #solutionString += str(x1) + "," + str(x2) + "," + str(x3) + "; "
                solutionString += str(x1) + str(x2) + str(x3)

            total = x1 + x2 + x3
            if i != 0 and total != commonTotal:
                return None
            else:
                commonTotal = total

        commonTotal = total

        return Solution(commonTotal, solutionString)


bitmask = 0x00

maxVal = 0

for x1 in range(1, 11):
    bitmask |= (0x01 << (x1 - 1))
    for x2 in range(1, 11):
        if ((bitmask >> (x2 - 1)) & 1) == 1:
            continue
        bitmask |= (0x01 << (x2 - 1))
        for x3 in range(1, 11):
            if ((bitmask >> (x3 - 1)) & 1) == 1:
                continue
            bitmask |= (0x01 << (x3 - 1))
            for x4 in range(1, 11):
                if ((bitmask >> (x4 - 1)) & 1) == 1:
                    continue
                bitmask |= (0x01 << (x4 - 1))
                for x5 in range(1, 11):
                    if ((bitmask >> (x5 - 1)) & 1) == 1:
                        continue
                    bitmask |= (0x01 << (x5 - 1))

                    for x in range(1, 11):
                        if x not in (x1, x2, x3, x4, x5):
                            ring = N_gon_ring(5)
                            ring.inner = [x1, x2, x3, x4, x5]
                            ring.outer = [x, 0, 0, 0, 0]
                            solution = ring.evaluateSolution(True)
                            if solution != None:
                                val = long(solution.string)
                                if val > maxVal and len(solution.string) == 16:
                                    maxVal = val

                    bitmask &= ~(0x01 << (x5 - 1))

                bitmask &= ~(0x01 << (x4 - 1))

            bitmask &= ~(0x01 << (x3 - 1))

        bitmask &= ~(0x01 << (x2 - 1))

    bitmask &= ~(0x01 << (x1 - 1))

print maxVal
