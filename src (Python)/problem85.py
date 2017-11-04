#!/usr/bin/python2.7

def closest_count(count1, count2):
    d1 = abs(2000000 - count1)
    d2 = abs(2000000 - count2)

    if min(d1,d2) == d1:
        return count1
    else:
        return count2


def count_rectangles(width, height):
    return height * (height+1) * width * (width+1) / 4


width  = 1
height = 1

current_closest = 0
current_closest_area = 0

while True:
    while True:
        current_count = count_rectangles(width, height)

        current_closest = closest_count(current_count, current_closest)

        if current_closest == current_count:
            current_closest_area = width * height

        if current_count >= 2000000:
            height = width
            break

        height += 1

    if count_rectangles(width,height) >= 2000000:
        break

    width += 1


print current_closest_area
