a = 1
b = 4.74


def f(function_x):
    return a * function_x ** 3 + b * a * function_x ** 2 - a * function_x - b * a


def df(function_x):
    return a * 3 * function_x ** 2 + 2 * a * b * function_x - a


def simple_iteration():
    alpha = -0.05
    x = -5.74
    for i in range(6):
        print(i + 1, x, round(f(x) * 100000) / 100000)
        x += alpha * round(f(x) * 100000) / 100000
    return


def chord():
    x1 = -b + 0.5
    x2 = -0.5
    for i in range(7):
        print(i + 1, x1, f(x1))
        k = (f(x2) - f(x1)) / (x2 - x1)
        x1 = x1 - f(x1) / k
    return


def tangent():
    x = 2
    for i in range(7):
        print(i+1, x, f(x))
        x -= f(x)/df(x)


tangent()