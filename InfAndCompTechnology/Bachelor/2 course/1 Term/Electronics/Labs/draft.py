s = "0"
for i in range(1,500):
    s += str((((i-1) // 151) + 1) % 2)
s = s[::-1]
print(hex(int(s, 2)), len(s))
