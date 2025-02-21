def main(m, b, p):
    temp = 0.0
    for i in range(1, b + 1):
        for k in range(1, m + 1):
            temp += 0.2 + i + (89 * p**3 - 89 * k**2 - 40 * i) ** 4
    return temp
