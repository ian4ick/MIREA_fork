import math


def main(z, y, x):
    a = 27 * (z - x**2) - math.exp(y**2 + x**3)**5
    b = 13 * abs(41*z**2 + y**3/45 + y)**5
    b += (z**3/19 - x)**3
    a /= b
    a += (y + z**2 + 56 * x**3)**3
    a += (1 - 27 * z**3)**6
    return a
