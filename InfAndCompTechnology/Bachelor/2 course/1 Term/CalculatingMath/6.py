import numpy as np
import cardano_method as cm
import cmath
import math


def execute(A, Y0):
    print("="*40)
    print(Y0)
    if A.shape[0] == 3:
        Y1 = A @ Y0
        Y2 = A @ Y1
        Y3 = A @ Y2
        print(Y1, Y2, Y3, end="\n")
        B = np.array([
            Y2,
            Y1,
            Y0
        ])
        print(B.transpose())
        C = np.linalg.solve(B.transpose(), -Y3)
        print(C)
        a = cm.CubicEquation([1, C[0], C[1], C[2]])
        print(a, a.answers)
        alphas = a.answers
        """for alpha in alphas:
            if abs(alpha.imag) > 0.01:
                return -1
        """
        X = []
        for alpha in alphas:
            q1 = 1
            q2 = alpha * q1 + C[0] * q1
            q3 = alpha * q2 + C[1] * q1
            X.append(q1 * Y2 + q2 * Y1 + q3 * Y0)
            print(q1, q2, q3, alpha)
        print(X)
        return 0


A = np.array([
    [1, 4, -1],
    [-1, 1, 1],
    [0, 0, -2]
])

Y0 = np.array([
    1, 1, 1
])

ans = execute(A, Y0)

A = np.array([
    [-1, -2, 12],
    [0, 4, 3],
    [0, 5, 6]
])

Y0 = np.array([
    1, 1, 1
])

execute(A, Y0)
exit(0)
while True:
    try:
        ans = execute(A, Y0)
        if ans != -1:
            exit(0)
        raise Exception
    except Exception:
        Y0 = np.random.randint(low=-200,high=201,size=(1, 3))
        Y0 = Y0 / 10
