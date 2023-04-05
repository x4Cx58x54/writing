# 素数

## 筛法

### 埃氏筛 | Sieve of Eratosthenes

如果要判断 $n$ 以内所有正整数的素性，则使用筛法.

最朴素的想法是用 $i$ 从 2 遍历到 $n$，每次筛去 $i$ 的所有倍数（这里 $i$ 的倍数指的是 $\{ki \le n \mid k \in \mathbb{Z}^+, k \ge 2\}$）.

第一步优化是只筛去质数的倍数. 如果遍历到 $i$ 是合数，那么它的质因数 $p$ 必定小于 $i$，而且 $i$ 的倍数均为 $p$ 的倍数，故已经在遍历至 $p$ 时被筛去了. 此时一个合数会被它的每一质因数筛去.

第二步优化是将 $i$ 遍历的范围缩小至 2 至 $\sqrt{n}$. 对于任一合数 $a$，它的质因数中一定存在不超过 $\sqrt{a}$ 的（暂时称之为“较小质因数”）. 所以 2 至 $\sqrt{n}$ 中必定包括了 $n$ 以内每一合数的较小质因数，已经足够将所有合数筛去.

第三步优化是遍历至质数 $i$ 时，只筛去 $\{ki\mid k \in \mathbb{Z}^+, k \ge i\}$. 合数 $ki$ 会先被更小的质因数筛去. 若 $k<i$，则说明 $ki$ 一定具有不超过 $k$ 的质因数，在遍历至 $i$ 时已经被筛去了.

```cpp
// bool isntprime[], is not prime, default false
isntprime[0] = true;
isntprime[1] = true;
for(int i = 2; i * i <= n; ++i)
    if (!isntprime[i])
        for(int j = i * i; j <= n; j += i)
            isntprime[j] = true;
```

埃氏筛时间复杂度为 $O(n\log\log n)$，还是有少量冗余. 例如 18 在被 2 筛去后还会被 3 筛去一次.

### 线性筛

[线性筛素数 - 洛谷](https://www.luogu.com.cn/problem/P3383){:target="_blank"}

线性筛完全去除了埃氏筛的冗余，其核心在于保证每一合数只被它的最小质因数筛去，将时间复杂度降至 $O(n)$.

和埃氏筛不同的是，遍历至 $i$ 时，维护一个 $i$ 以内的质数表 $P$（这在埃氏筛中一样可以做到），然后筛去 $\{pi\mid p\in P\}$. 对于任意合数 $a = p_a\cdot i_a$，其中 $p_a$ 为 $a$ 的最小质因数，那么 $p_a \le i_a$，所以遍历至 $i$ 时只需要筛去它的 $i$ 以内的质数倍. 也就是说，埃氏筛中每次选一个质数，筛去其倍数；而线性筛中反过来，每次选一个正整数，筛去其质数倍.

接下来优化使得每一合数只被它的最小质因数筛去. 从小到大遍历 $i$ 以内的质数 $p$（对应代码中 `prime[j]`）时，若发现 $p\mid i$（$i$ 被 $p$ 整除，这意味着 $p$ 是 $i$ 的最小质因数），那么无需考虑当前质数表中大于 $p$ 的部分.

证明：对任意 $n$ 以内的合数 $a = p_a \cdot i_a$，$p_a$ 为 $a$ 的最小质因数，进一步分解 $i_a = p_{i_a}\cdot i_{i_a}$，其中 $p_{i_a}$ 是 $i_a$ 的最小质因数. 那么 $p_{i_a}$ 也是 $a$ 的质因数，故 $p_a \le p_{i_a}$. 筛去 $i_a$ 的质数倍时遍历质数表至其最小质因数 $p_{i_a}$ 后停止，那么此时必定已经筛去 $p_a \cdot i_a = a$.

反过来，假设在筛去 $i_a$ 的质数倍时有某合数 $b = i_a \cdot p'$，$p'$ 在当前质数表中但比 $i_a$ 的最小质因数大，所以 $p_{i_a} < p'$. 那么进一步展开 $b = p_{i_a} \cdot i_{i_a} \cdot p'$，记 $i_b = i_{i_a}\cdot p'$，可知 $p_{i_a}$ 是 $b$ 的最小质因数，且 $p_{i_a} \le i_a< i_b$. 那么在未来处理 $i_b$ 时，会在 $p_{i_a}$ 处将 $b$ 筛去.

```cpp
// bool isntprime[], is not prime, default false
// int prime[] / vector<int> prime, list of primes
int nprime = 0;
for (int i = 2; i <= n; ++i)
{
    if (!isntprime[i]) prime[nprime++] = i;
    for (int j = 0; j < nprime && i*prime[j] <= n; ++j)
    {
        isntprime[i*prime[j]] = true;
        if (i % prime[j] == 0) break;
    }
}
```

素数计数函数 $\pi(n)$ 定义为不超过 $n$ 的素数个数. 它和 $\dfrac{n}{\ln n}$ 是同阶的，准确地说，

$$
\pi(n) < \frac{30\ln 113}{113} \cdot \frac{n}{\ln n} < 1.3\cdot\frac{n}{\ln n},\quad n > 1,
$$

$$
\frac{n}{\ln n} < \pi(n), \quad n \ge 17.
$$

可以按以上不等式预先分配素数表空间.

## 质因数分解

对 $a\ (>1)$ 分解质因数，注意不需要先做素性测试：

```cpp
ahalf = a / 2;
for(int i = 2; a > 1 && i <= a; i++)
{
    if (i > ahalf) i = a;   // 常数优化，跳过 a/2+1 至 a-1
    if (a % i == 0)
    {
        q = 0;
        while(a % i == 0 && a > 1)
        {
            a = a / i;
            q++;
        }
        // i, q 即为 a 的质因数及其对应幂数
    }
}
```

若已有质数表，可将复杂度降至 $O(n/\log n)$.
