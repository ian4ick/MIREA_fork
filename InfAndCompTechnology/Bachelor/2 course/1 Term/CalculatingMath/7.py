K = 3.6
L = 2.0
h = 0.5


def f(x, y):
    return x**2 + (K-1)*y/2


def euler_method():
    print("\n--------------------------------------------------------\nEULER METHOD:")
    x0 = 0
    y0 = L
    print(f"x0 = {x0}, y0 = {y0}")
    for i in range(4):
        print(f"x{i+1} = {x0} + {x0 + h} = {x0 + h}")
        print(f"y{i+1} = {y0} + {h} * {f(x0, y0)} = {y0 + h * f(x0, y0)}")
        y0 += h * f(x0, y0)
        x0 += h


def trapezoid_temp(t_h, t_x, t_y):
    return t_h / 2 * (f(t_x, t_y) + f(t_x + t_h, t_y + t_h * f(t_x, t_y)))



def trapezoid_method():
    print("\n--------------------------------------------------------\nTRAPEZIOID METHOD:")
    x0 = 0
    y0 = L
    print(f"x0 = {x0}, y0 = {y0}")
    for i in range(4):
        print(f"x{i + 1} = {x0} + {x0 + h} = {x0 + h}")
        print(f"y{i + 1} = {y0} + {h/2} * ({f(x0, y0)} + {f(x0 + h, y0 + h * f(x0, y0))}) = {y0 + trapezoid_temp(h, x0, y0)}")
        y0 += trapezoid_temp(h, x0, y0)
        x0 += h


def runge_kutta_temp(y0, k1, k2, k3, k4):
    return y0 + h / 6 * (k1 + 2 * k2 + 2 * k3 + k4)


def runge_kutta_method():
    print("\n--------------------------------------------------------\nRUNGE-KUTTA METHOD:")
    x0 = 0
    y0 = L
    print(f"x0 = {x0}, y0 = {y0}")
    for i in range(4):
        k1 = f(x0, y0)
        k2 = f(x0 + h/2, y0 + h * k1 / 2)
        k3 = f(x0 + h / 2, y0 + h * k2 / 2)
        k4 = f(x0 + h, y0 + h * k3)
        print(f"x{i + 1} = {x0} + {x0 + h} = {x0 + h}")
        print(f"k1{i} = {k1}")
        print(f"k2{i} = {k2}")
        print(f"k3{i} = {k3}")
        print(f"k4{i} = {k4}")
        print(f"y{i + 1} = {y0} + {h/6} * ({k1} + 2 * {k2} + 2 * {k3} + {k4}) = {runge_kutta_temp(y0, k1, k2, k3, k4)}")
        y0 = runge_kutta_temp(y0, k1, k2, k3, k4)
        x0 += h


euler_method()
trapezoid_method()
runge_kutta_method()
