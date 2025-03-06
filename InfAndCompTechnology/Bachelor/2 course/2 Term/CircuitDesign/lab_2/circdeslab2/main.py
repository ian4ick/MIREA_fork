import random
from typing import List


def main(n: int, arr: List[float]) -> List[float]:
    if n < 1 and isinstance(n, int):
        raise ValueError("n может быть только натуральным числом")
    for x in arr:
        if not isinstance(x, float):
            raise ValueError("элементы массива не могут быть не вещественными")
    for i in range(1, n):
        j = i
        x = arr[i]
        while j > 0 and arr[j - 1] > x:
            arr[j] = arr[j - 1]
            j -= 1
        arr[j] = x
    return arr


ref_arr = [1., 2., 3., 4., 5.]
tmp_arr = ref_arr.copy()
for _ in range(10):
    random.shuffle(tmp_arr)
    tmp_arr = main(len(tmp_arr), tmp_arr)
    assert tmp_arr == ref_arr, "Отсортированный массив должен совпадать с требуемым"

print("Первичные тесты пройдены")

tmp_arr = [5., 4., 3., 2., 1.]
tmp_arr = main(5, tmp_arr)
assert tmp_arr == ref_arr, "Первый тест не пройден"

ref_arr = [1., 2., 2., 2., 2.]
tmp_arr = [2., 2., 2., 1., 2.]
tmp_arr = main(5, tmp_arr)
assert tmp_arr == ref_arr, "Второй тест не пройден"

try:
    main(-1, tmp_arr)
    print("Третий тест не пройден")
    raise ValueError
except ValueError:
    pass

try:
    main(2, [1, 2])
    print("Третий тест не пройден")
    raise ValueError
except ValueError:
    pass

print("Все тесты пройдены")
