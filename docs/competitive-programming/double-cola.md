# Double Cola

[Double Cola \| 5 kyu \| Codewars](https://www.codewars.com/kata/double-cola){:target="_blank"}

### 数值方法

通过推导易得

```c
#include <math.h>
const char *who_is_next(long long n, size_t length, const char *const a[length]) {
    double k = pow(2, ceil(log2(1 + (double)n/length))-1);
    return a[(long long)ceil((n - (k - 1) * length) / k) - 1];
}
```

### 模拟方法

```c
const char *who_is_next(long long n, size_t length, const char *const a[length]) {
  for (n -= 1; n >= length; n -= length, n /= 2);
  return a[n];
}
```
