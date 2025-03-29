def main(x):
    x = bin(int(x[2:], 16))[2:]
    if len(x) < 36:
        x = "0" * (36 - len(x)) + x
    v = []
    v1 = x[-8:]
    v2 = x[-11:-8]
    v3 = x[-21:-11]
    v4 = x[-30:-21]
    v5 = x[-32:-30]
    v6 = x[-36:-32]
    v.append(v1)
    v.append(v2)
    v.append(v3)
    v.append(v4)
    v.append(v5)
    v.append(v6)
    return tuple([str(int(x, 2)) for x in v])
