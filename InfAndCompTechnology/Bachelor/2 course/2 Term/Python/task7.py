def f01(x):
    if x[1] == 2017:
        return 0
    if x[1] == 2006:
        return 1
    return None


def f39(x, bias):
    if x[3] == 2019:
        return 3 + bias
    if x[3] == 1963:
        return 4 + bias
    if x[3] == 1977:
        return 5 + bias
    return None


def f4(x):
    if x[4] == "PONY":
        return f01(x)
    if x[4] == "D":
        return 2
    if x[4] == "CSV":
        return f39(x, 0)
    return None


def f1(x):
    if x[1] == 2017:
        return 6
    if x[1] == 2006:
        return f39(x, 4)
    return None


def main(x):
    if x[0] == "CLEAN":
        return 11
    if x[0] == "RUBY":
        return 12
    if x[0] == "VOLT":
        if x[2] == 2014:
            return f4(x)
        if x[2] == 2002:
            return f1(x)
        if x[2] == 2001:
            return 10
    return None


print(main(["CLEAN", 2006, 2014, 2019, "PONY"]))
print(main(["RUBY", 2017, 2014, 1977, "PONY"]))
print(main(["VOLT", 2017, 2001, 1963, "D"]))
print(main(["VOLT", 2006, 2014, 2019, "CSV"]))
print(main(["VOLT", 2006, 2002, 2019, "CSV"]))
