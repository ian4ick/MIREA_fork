import math


def main(y):
    if y < 20:
        temp = 58 * y**2 + y**3 + 80
        temp = -37 * math.tan(temp) ** 4
        temp += y**7
        return temp
    elif y < 34:
        temp = 22 * math.log10(y) ** 3
        return temp
    elif y < 45:
        temp = 53 * y**2 - 34 * y**3 - 1
        temp = temp**7
        temp /= 88
        temp += 9 * y**3
        return temp
    elif y < 129:
        temp = (y + y**3 + 0.2) ** 6
        temp -= 71 * y**4
        return temp
    else:
        return 90 * y
