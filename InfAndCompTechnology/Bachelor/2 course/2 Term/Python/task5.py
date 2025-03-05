import math


def main(z, y):
    ans = 0
    n = len(z)
    for i in range(1, n + 1):
        temp = 9 * z[n - i] ** 2
        temp -= 27
        temp -= 52 * y[math.ceil(i / 3) - 1]
        temp **= 6
        temp *= 73
        ans += temp
    ans *= 64
    return ans
