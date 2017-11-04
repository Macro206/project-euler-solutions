#!/usr/bin/python2.7

answer = 0

for base in range(1,100):
    for power in range(1,100):
        result = base ** power

        if len(str(result)) == power:
            answer += 1

print answer
