# 组合数

组合数的定义为

$$
\mathrm{C}_n^k = \frac{n!}{k!\cdot(n-k)!}.
$$

当 $n$ 与 $k$ 较小时，或需要计算组合数表时，可以使用递推公式计算。

但是有时候需要计算非常大的组合数，再对某个数 $p$ 取余。此时可以将除法转化为乘法逆元，使用费马小定理求解。但是要注意到费马小定理成立的条件：$p$ 是素数并且输入值不是 $p$ 的整数倍。故当 $p$ 非常大时，可以直接通过费马小定理直接求解。

若 $p$ 与 $n$、$k$ 较接近，则需要考虑 $k!$ 和 $(n-k)!$ 成为 $p$ 的整数倍的可能性。事实上，由于 $p$ 是质数，只需要满足 $k < p$ 且 $n-k<p$ 时，还是可以直接求逆解决。

若不保证满足上面两式，则需要使用 Lucas 定理进行转化：

[卢卡斯定理 - 洛谷](https://www.luogu.com.cn/problem/P3807){:target="_blank"}

Lucas 定理：

> 当 $p$ 为素数时，
>
> $$
>  \binom{n}{k}\bmod p = \binom{\left\lfloor n/p \right\rfloor}{\left\lfloor k/p\right\rfloor}\cdot\binom{n\bmod p}{k\bmod p}\bmod p .
> $$

由此可以递归实现：

```cpp
// long long f[i] = i! % p;
inline long long inv(long long a, int p)
{
    long long res = 1, b = p - 2;
    while(b)
    {
        if (b & 1) res = res * a % p;
        a = a * a % p;
        b >>= 1;
    }
    return res;
}
inline long long lucas(int n, int m, int p)
{
    long long ans;
    if (m < n) return 0;
    if (p > n && p > m-n)
        return f[m] * inv(f[n]) % p * inv(f[m-n]) % p;
    else
        return lucas(n/p, m/p) * lucas(n%p, m%p) % p;
}
```
