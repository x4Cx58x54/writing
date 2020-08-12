# 素数

## 埃氏筛 | Sieve of Eratosthenes

```cpp
// isprime = false, is not prime
isnp[0] = false;
isnp[1] = false;
for(int i = 2; i * i <= n; ++i)
    if (isnp[i])
        for(int j = i * i; j <= n; j += i)
            isnp[j] = false;
```

## 线性筛素数

[线性筛素数 - 洛谷](https://www.luogu.com.cn/problem/P3383){:target="_blank"}

线性筛中加入了一个素数表，每次只筛 $i$ 与当前素数表中的数的乘积，并且保证每个数只被其最小因子筛去。

```cpp
// int pri[], 第 i 个素数
int cnt = 0;
for(int i = 2; i <= n; ++i)
{
    if (!isnp[i]) pri[cnt++] = i;
    for(int j = 0; j < cnt && i*pri[j] <= n; ++j)
    {
        isnp[i*pri[j]] = true;
        if (i % pri[j] == 0) break;
    }
}
```

使用素数筛还可以求出欧拉函数 $\varphi(i)$。

## 质因数分解

对 $a\ (>1)$ 分解质因数，注意不需要先做素性测试：

```cpp
aa = a / 2;
for(int i = 2; a > 1 && i <= a; i++)
{
    if (i > aa) i = a;      // 跳过 a/2 至 a 之间的数
    if (a % i == 0)
    {
        p = i;
        q = 0;
        while(a % i == 0 && a > 1)
        {
            a = a / i;
            q++;
        }
        // p, q 即为 a 的质因子及其对应幂数
    }
}
```
