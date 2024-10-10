import math
import numpy as np

k = 3.6
l = 2.0
a = (k - l) / 2
b = k + l


def f(function_x):
    return (function_x + l) / (function_x ** 2 + function_x + k)


def F(x):
    return math.log(x ** 2 + x + k, math.e) / 2 + (l - 0.5) * math.atan((x + 0.5) / (k - 0.25) ** 0.5) / (
                k - 0.25) ** 0.5


def I():
    return F(b) - F(a)


def trapezoid(n):
    h = (b - a) / n
    Itr = (f(a) + f(b)) / 2
    for i in range(1, n):
        Itr += f(a + i * h)
    Itr *= h
    return Itr


def simpson(n):
    h = (b - a) / (2 * n)
    Ip = f(a) + f(b)
    for i in range(1, 2 * n):
        Ip += f(a + i * h) * ((i % 2) * 2 + 2)
    Ip *= h / 3
    return Ip


def gauss(n):
    match n:
        case 4:
            ita = [[-0.861136, 0.347854],
                   [-0.339981, 0.652145],
                   [0.339981, 0.652145],
                   [0.861136, 0.347854]]
        case 6:
            ita = [[-0.932464, 0.171324],
                   [-0.661209, 0.360761],
                   [-0.238619, 0.467913],
                   [0.932464, 0.171324],
                   [0.661209, 0.360761],
                   [0.238619, 0.467913]]
        case 8:
            ita = [[-0.960289, 0.101228],
                   [-0.796666, 0.222381],
                   [-0.525532, 0.313706],
                   [-0.183434, 0.362683],
                   [0.960289, 0.101228],
                   [0.796666, 0.222381],
                   [0.525532, 0.313706],
                   [0.183434, 0.362683]]

    Ig = 0
    for i in range(n):
        Ig += ita[i][1] * f((a + b) / 2 + (b - a) * ita[i][0] / 2)
    Ig *= (b - a) / 2
    return Ig


def _1():
    print("Trapezoid")
    print(trapezoid(4))
    print(trapezoid(6))
    print(trapezoid(8))
    print("-----------------------------")


def _2():
    print("Parabolic")
    print(simpson(4))
    print(simpson(6))
    print(simpson(8))
    print("-----------------------------")


def _3():
    print("Gauss")
    print(gauss(4))
    print(gauss(6))
    print(gauss(8))


print("K =", k)
print("L =", l)
print("a =", a)
print("b =", b)
print("I =", I())
print("-----------------------------")
_1()
_2()
_3()
