# 快速幂

[快速幂取余 - 洛谷](https://www.luogu.com.cn/problem/P1226){:target="_blank"}

快速幂标程：[binexp.cpp](https://github.com/x4Cx58x54/data-structures-and-algorithms/blob/master/mathematics/binexp.cpp)


```cpp
long long binpow(long long a, long long b)
{
    long long res = 1;
    while(b > 0)
    {
        if (b & 1) res *= a;
        a *= a;
        b >>= 1;
    }
    return res;
}
```

若需要取余，则在每一步乘法后取余即可。

```cpp
long long binpow(long long a, long long b, int p)
{
    long long res = 1;
    while(b > 0)
    {
        if (b & 1) res = res * a % p;
        a = a * a % p;
        b >>= 1;
    }
    return res;
}
```
