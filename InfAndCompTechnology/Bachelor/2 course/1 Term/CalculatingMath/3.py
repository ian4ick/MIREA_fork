a = 1
b = 4.74


def f(function_x):
    return a * function_x ** 3 + b * a * function_x ** 2 - a * function_x - b * a


def error_f(function_x, epsilon=0.001):
    return f(function_x - epsilon) * f(function_x + epsilon)


def df(function_x):
    return a * 3 * function_x ** 2 + 2 * a * b * function_x - a


def simple_iteration():
    alpha = 0.06
    x = -3
    i = 0
    while error_f(x) > 0:
        print(i, x, f(x), error_f(x))
        x -= alpha * f(x)
        i += 1
    print(i, x, f(x), error_f(x))
    return


def chord():
    x1 = -b + 0.5
    x2 = -0.5
    i = 0
    while error_f(x1) > 0:
        print(i, x1, f(x1), error_f(x1))
        k = (f(x2) - f(x1)) / (x2 - x1)
        x1 = x1 - f(x1) / k
        i += 1
    print(i, x1, f(x1), error_f(x1))
    return


def tangent():
    x = 2
    for i in range(7):
        print(i, x, df(x), f(x),error_f(x))
        x -= f(x) / df(x)


tangent()
