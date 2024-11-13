import numpy as np


A1 = np.array([
    [5., 5., 5.],
    [4., 1., 3.],
    [7., 7., 3.]
])
A2 = np.array([
    [4., 1., 1.],
    [2., 1., 4.],
    [1., 1., 5.]
])
B1 = np.array([
    0., -4., -1.
])
B2 = np.array([
    -1., 4., 6.
])
C1 = np.linalg.solve(A1, B1)
C2 = np.linalg.solve(A2, B2)
print(C1, C2, sep='\n')


def gauss(A, B):
    n = A.shape[0]
    for k in range(n):
        for i in range(k, n):
            ak = A[k, k]
            ai = A[i, k]
            for j in range(k, n):
                if i == k:
                    A[i, j] = A[i, j] / ak
                else:
                    A[i, j] -= ai * A[k, j] / ak
            if i == k:
                B[i] = B[i] / ak
            else:
                B[i] -= ai * B[k] / ak
        print(A, "\n", B)
    answers = list(B[i] for i in range(n))
    for i in range(n - 1, -1, -1):
        for j in range(i + 1, n):
            answers[i] -= A[i, j] * answers[j]
    print(*answers)

#gauss(A1, B1)
#gauss(A2, B2)

A1 = np.array([
    [5, 5, 5],
    [7, 7, 3],
    [4, 1, 3]
])
A2 = np.array([
    [4, 1, 1],
    [2, 1, 4],
    [1, 1, 5]
])
A1 = A1.transpose()
A2 = A2.transpose()
print(A1, A2)