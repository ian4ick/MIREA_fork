import numpy as np

A1 = np.array([
    [5., 5., 5.],
    [7., 7., 3.],
    [4., 1., 3.]
])
B1 = np.array([
    0., -4., -1.
])
C1 = np.linalg.solve(A1, B1)
print(C1)
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
    0., -1., -4.
])
B2 = np.array([
    -1., 4., 6.
])
C1 = np.linalg.solve(A1, B1)
C2 = np.linalg.solve(A2, B2)
print("True answers")
print(C1, C2, sep='\n')
print("Solution")


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


gauss(A1, B1)
gauss(A2, B2)

print('\n' + '-' * 100 + '\n')


def orthogonal(R, A, B):
    T = np.zeros((2, 2))
    T[0, 0] = np.dot(R[0], A[1]) / np.dot(R[0], R[0])
    print(np.dot(R[0], A[1]), np.dot(R[0], R[0]), T[0, 0])
    R[1] -= T[0, 0] * R[0]
    T[0, 1] = np.dot(R[0], A[2]) / np.dot(R[0], R[0])
    print(np.dot(R[0], A[2]), np.dot(R[0], R[0]), T[0, 1])
    T[1, 1] = np.dot(R[1], A[2]) / np.dot(R[1], R[1])
    print(np.dot(R[1], A[2]), np.dot(R[1], R[1]), T[1, 1])
    R[2] -= T[0, 1] * R[0] + T[1, 1] * R[1]
    R = R.transpose()
    print(R)
    print(T)
    R = R.transpose()
    X = np.zeros(3)
    X[2] = np.dot(R[2], B) / np.dot(R[2], A[2])
    print(np.dot(R[2], B), np.dot(R[2], A[2]), X[2])
    B -= X[2] * A[2]
    print(X[2] * A[2], B)
    X[1] = np.dot(R[1], B) / np.dot(R[1], A[1])
    print(np.dot(R[1], B), np.dot(R[1], A[1]), X[1])
    B -= X[1] * A[1]
    print(X[1] * A[1], B)
    X[0] = np.dot(R[0], B) / np.dot(R[0], A[0])
    print(np.dot(R[0], B), np.dot(R[0], A[0]), X[0])
    return X


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
    0., -1., -4.
])
B2 = np.array([
    -1., 4., 6.
])
C1 = orthogonal(A1.transpose().copy(), A1.transpose(), B1)
print("Answer", C1)
C2 = orthogonal(A2.transpose().copy(), A2.transpose(), B2)
print("Answer", C2)
