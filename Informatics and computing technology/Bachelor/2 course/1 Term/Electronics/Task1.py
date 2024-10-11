import numpy as np
import matplotlib.pyplot as plt


def delta1(i1, i2):
    return my_round(abs(i1 - i2) / min(i1, i2), EPS)


def my_round(x, eps=2):
    return round(x * 10 ** eps) / 10 ** eps


def print_array(x):
    for i in range(len(x)):
        print(f"{x[i]:{OUTPUT_LENGTH}}", end="")
        if i < len(x) - 1:
            print(",", end="")
    print()


def print_graphing(x, y, name_graphing="", name_x="x", name_y="y"):
    x = np.array(x)
    y = np.array(y)

    plt.plot(x, y)
    plt.title(name_graphing)
    plt.xlabel(name_x)
    plt.ylabel(name_y)
    plt.grid(True)
    plt.show()


EPS = 4
OUTPUT_LENGTH = 10


class MyTask:
    def __init__(self):
        # TODO PUT HERE YOUR DATA
        """Input Data"""
        self.E = [-11, 7]
        self.R = [407, 46, 138, 295, 241, 337, 123]

        """Data from experiments"""

        """1.1"""
        self.I1 = [-19.16, 3.91, 5.87]
        self.I2 = [-2.49, 18.29, 6.69]
        self.I3 = [-21.65, 22.22, 12.56]

        """1.2"""
        self.V = np.array([-11, -2.19, 1.52, 2.54, -4.46, -1.73, 0])

        """2"""
        self.Uxx = 1.5
        self.Ikz = 0.00391
        self.R_exp2 = 382.74

        """3"""
        self.Rn = [95, 282.83, 471, 658.5, 846, 1034, 1222]
        self.I = [3.13, 2.25, 1.75, 1.44, 1.22, 1.06, 0.933]
        self.U = [297.55, 635.81, 825.49, 946.31, 1030, 1090, 1140]

    '''Task 1.1'''

    def fill_i(self):
        A = np.array([
            [1, 1, 0],
            [0, 1, 0],
            [1, 0, -1]])

        B = np.array([self.I3[0], self.I3[0] - self.I3[2], -self.I3[1]])
        C = np.linalg.solve(A, B)
        for i in range(3):
            self.I3.append(my_round(C[i], EPS))
        B = np.array([self.I1[0], self.I1[0] - self.I1[2], -self.I1[1]])
        C = np.linalg.solve(A, B)
        for i in range(3):
            self.I1.append(my_round(C[i], EPS))
        B = np.array([self.I2[0], self.I2[0] - self.I2[2], -self.I2[1]])
        C = np.linalg.solve(A, B)
        for i in range(3):
            self.I2.append(my_round(C[i], EPS))

    def _1_1(self):
        print("Task 1.1")

        self.fill_i()
        print("   I1" + " " * OUTPUT_LENGTH + "I2" + " " * OUTPUT_LENGTH + "I3'" + " " * OUTPUT_LENGTH +
              "I3''" + " " * (OUTPUT_LENGTH - 4) + "delta")
        for i in range(6):
            print(
                f"{self.I1[i]:{OUTPUT_LENGTH}}, {self.I2[i]:{OUTPUT_LENGTH}}, {self.I3[i]:{OUTPUT_LENGTH}}, {my_round(self.I1[i] + self.I2[i], EPS):{OUTPUT_LENGTH}},"
                f"{delta1(self.I3[i], self.I1[i] + self.I2[i]):{OUTPUT_LENGTH}}")

    '''Task 1.2'''

    def _1_2(self):
        print("\nTask 1.2")
        dR = np.array([0, self.R[0], self.R[3], self.R[1], 0, self.R[6], self.R[2]])
        sum_dR = dR.copy()
        for i in range(1, len(dR)):
            sum_dR[i] += sum_dR[i - 1]

        print("   A" + " " * OUTPUT_LENGTH + "B" + " " * OUTPUT_LENGTH + "C" + " " * OUTPUT_LENGTH + "D" +
              " " * OUTPUT_LENGTH + "E" + " " * OUTPUT_LENGTH + "F" + " " * OUTPUT_LENGTH + "G")

        print_array(self.V)
        print_array(dR)
        print_array(sum_dR)
        print_graphing(sum_dR, self.V)

    '''Task 2'''

    def _2(self):
        print("\nTask 2")
        Rvh2 = my_round(self.Uxx / self.Ikz, EPS)
        print("R'вх = Uxx/Ikz =", self.Uxx, "/", self.Ikz, "=", Rvh2)
        R15 = my_round(self.R[0]*self.R[4]/(self.R[0]+self.R[4]), EPS)
        print("R15 = R1*R5/(R1+R5)=", R15)
        R1345 = my_round(R15 + self.R[2] + self.R[3], EPS)
        print("R1345 = R15 + R3 + R4 =", R1345)
        R13456 = my_round(R1345 * self.R[5] / (R1345 + self.R[5]), EPS)
        print("R13456 = R1345 * R6 / (R1345 + R6) =", R13456)
        Rvh3 = my_round(R13456 + self.R[1] + self.R[6], EPS)
        print("R'''вх =", Rvh3)
        print("R'вх      R''вх     R'''вх")
        print(Rvh2, self.R_exp2, Rvh3)
        print("R'вх      R''вх")
        print(Rvh2, self.R_exp2)

    '''Task 3'''

    def _3(self):
        print("\nTask 3")
        P = [0.0] * len(self.U)
        for i in range(len(self.U)):
            P[i] = my_round(self.I[i] * self.U[i], EPS)
        print_array(self.I)
        print_array(self.U)
        print_array(P)
        print_graphing(self.I, self.U, "VAC", "I", "U")
        print_graphing(self.Rn, P, "P/Rn", "Rн", "P")

    def print_all(self):
        plt.close('all')
        self._1_1()
        self._1_2()
        self._2()
        self._3()


my = MyTask()
# my.print_all()
