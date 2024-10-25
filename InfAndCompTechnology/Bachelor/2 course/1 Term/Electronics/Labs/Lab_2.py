import numpy as np
import math 
import matplotlib.pyplot as plt
 
print("Lab 2")
print("-" * 20)
 
f = np.array([5.4, 10.8, 21.6, 32.4, 43.2, 54])
f_re_const = 20.85
f_re = np.array([0.0] * 9)
control = 3
for i in range (0, 4):
  f_re[i] = (f_re_const * control / 10.0)
  control += 2
f_re[4] = (f_re_const)
f_re[5]= (f_re_const * 1.1)
f_re[6] = (f_re_const * 1.2)
f_re[7] = (f_re_const * 1.5)
f_re[8] = (f_re_const * 2.0)
L = 0.56
C = 0.000104
 
print("First part")
print("-" * 20)
 
Ul = np.array([86.43, 170.96, 327.86, 461.74, 570.19, 655.33])
time = np.array([2.55, 2.55, 2.47, 2.37, 2.25, 2.11])
 
fi = np.array([0.0] * f.size)
x = np.array([0] * f.size)
for i in range (f.size):
  fi[i] = (f[i] * 360 * time[i] / 1000)
  x[i] = (f[i] * 2 * math.pi * L)
print(fi)
print("-" * 20)
plt.plot(f, fi, marker='o', markersize=7)
plt.xlabel('Ось f') 
plt.ylabel('Ось fi') 
plt.title('График фи')
plt.show()
print("-" * 20)
 
print(x)
print("-" * 20)
plt.plot(f, x, marker='o', markersize=7)
plt.xlabel('Ось f') 
plt.ylabel('Ось X') 
plt.title('График сопротивления')
plt.show()
 
print("-" * 20)
print("Second part")
print("-" * 20)
 
Uc = np.array([791.27, 543.23, 307.8, 210.83, 159.68, 128.33])
time = np.array([-26.77, -8.42, -2.29, -1.04, -0.59, -0.39])
 
fi = np.array([0.0] * f.size)
x = np.array([0.0] * f.size)
for i in range (f.size):
  fi[i] = (f[i] * 360 * time[i] / 1000)
  x[i] = (1.0 / (f[i] * 2 * math.pi * C))
print(fi)
print("-" * 20)
plt.plot(f, fi, marker='o', markersize=7)
plt.xlabel('Ось f') 
plt.ylabel('Ось fi') 
plt.title('График фи')
plt.show()
print("-" * 20)
 
print(x)
print("-" * 20)
plt.plot(f, x, marker='o', markersize=7)
plt.xlabel('Ось f') 
plt.ylabel('Ось X') 
plt.title('График сопротивления')
plt.show()
 
print("-" * 20)
print("Third part")
print("-" * 20)
 
U = 1000.0
Ul = np.array([70.47, 149.64, 227.79, 300.73, 334.99, 367.74, 398.99, 483.99, 598.67])
Uc = np.array([783.4, 598.86, 465.11, 371.45, 336.15, 304.06, 277.21, 215.21, 149.74])
Ur = np.array([701.24, 893.42, 971.43, 997.5, 1000.0, 997.97, 992.56, 963.2, 893.57])
I = np.array([3.2, 4.08, 4.44, 4.55, 4.57, 4.56, 4.53, 4.4, 4.0])
time = np.array([-20.06, -7.05, -2.59, -0.59, 0.0, 0.45, 0.79, 1.4, 1.79])
 
fi = np.array([0.0] * f_re.size)
Z = np.array([0.0] * f_re.size)
print(f_re)
for i in range (f_re.size):
  fi[i] = (f_re[i] * 360 * time[i] / 1000)
  Z[i] = (U / I[i])
print(fi)
print("-" * 20)
plt.plot(f_re, fi, marker='o', markersize=7)
plt.xlabel('Ось f') 
plt.ylabel('Ось fi') 
plt.title('График фи')
plt.show()
print("-" * 20)
 
print(Z)
print("-" * 20)
plt.plot(f_re, Z, marker='o', markersize=7)
plt.xlabel('Ось f') 
plt.ylabel('Ось Z') 
plt.title('График сопротивления')
plt.show()
 
print("-" * 20)
print(" " * 20)
print("-" * 20)
plt.plot(f_re, Ul, marker='o', markersize=7)
plt.xlabel('Ось f') 
plt.ylabel('Ось Ul') 
plt.title('График напряжения катушки')
plt.plot(f_re, Uc, color="green", marker='o', markersize=7)
plt.xlabel('Ось f') 
plt.ylabel('Ось Uc') 
plt.title('График напряжения конденсатора')
plt.plot(f_re, Ur, color="red", marker='o', markersize=7)
plt.xlabel('Ось f') 
plt.ylabel('Ось Ur') 
plt.title('График напряжения резистора')
plt.show()