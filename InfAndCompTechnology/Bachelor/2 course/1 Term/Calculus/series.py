import numpy as np
import math


def count_sum(func: callable(int), start_i: int = 1, end_i: int = 100) -> float:
    """
    Count the sum from start index to end index, where each index calculates via function f
    :param func: function that calculates value of element with number n
    :param start_i: start index
    :param end_i: end index
    :return: sum of elements
    """
    res = 0
    for i in range(start_i, end_i):
        res += func(i)
    return res


class Function:
    def __init__(self, choice: str = None, **kwargs) -> None:
        """
        Initialize the function class with the given choice
        :param choice: one of the predefined functions
        """
        match choice:
            case "Harmonic":
                self.function = self.harmonic
            case "Power":
                if not kwargs.__contains__("power"):
                    raise "You must give a power to power series"
                else:
                    self.power = kwargs["power"]
                self.function = self.power_series
            case "Geometric":
                if not kwargs.__contains__("value"):
                    raise "You must give a base value to work with geometric sequence"
                else:
                    self.value = kwargs["value"]
                self.function = self.geometric
            case "Taylor":
                if not kwargs.__contains__("x") or not kwargs.__contains__("f"):
                    raise "You must give an x and function name to work with taylor series"
                self.x = kwargs["x"]
                self.f = kwargs["f"]
                self.function = self.taylor_series
            case _:
                self.function = self.custom_series

    def taylor_series(self, n: int) -> float:
        match self.f:
            case "e":
                return math.pow(self.x, n) / math.factorial(n)

    @staticmethod
    def custom_series(n: int) -> float:
        res = 3 ** n * ((6*n+7)/(6*n+4))**n**2
        return res

    def geometric(self, n: int) -> float:
        return 1 / (self.value ** n)

    def power_series(self, n: int) -> float:
        return 1 / (n ** self.power)

    @staticmethod
    def harmonic(n: int) -> float:
        return 1 / n

    def __call__(self, n: int) -> float:
        return self.function(n)


function = Function("Taylor", x=-1, f='e')
print(count_sum(function.__call__, start_i=0))
