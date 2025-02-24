import math


def main(n):
    if n == 0:
        return -0.45
    return math.sin(0.01 + 21 * main(n - 1) ** 3) ** 2 - 1
