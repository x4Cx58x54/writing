# 拉格朗日插值 | Lagrange Interpolation

本文原载于 <https://oi-wiki.org/math/poly/lagrange/>，此处节录本人修改部分。

[拉格朗日插值 - 洛谷](https://www.luogu.com.cn/problem/P4781){:target="_blank"}

给出 $n$ 个点 $P_i(x_i,y_i)$ ，将过这 $n$ 个点的最多 $n-1$ 次的多项式记为 $f(x)$ ，求 $f(k)$ 的值。

如图所示，将每一个点 $(x_i, y_i)$ 在 $x$ 轴上的投影 $(x_i, 0)$ 记为 $H_i$。对每一个 $i$，我们选择一个点集 $\lbrace P_i\rbrace \cup \lbrace H_j \vert 1 \le i\le n, j \neq i\rbrace$，作过这 $n$ 个点的至多 $n-1$ 次的线 $g_i(x)$。图中 $f(x)$ 用黑线表示，$g_i(x)$ 用彩色线表示。

![](./img/lagrange-interpolation.png){: width=600px}

这样，我们得到了 $n$ 个 $g_i(x)\;(1 \le i \le n)$，它们都在各自对应的 $x_i$ 处的值为 $y_i$，并且在其它 $x_j\ (j \neq i)$ 处值为 $0$。所以很容易构造出 $g_i(x)$ 的表达式：

$$
g_i(x) = y_i\prod_{j\neq i }\frac{x-x_j}{x_i-x_j}.
$$

很容易通过将每一个 $x_i$ 代入上式以验证此其正确性。最后，我们所求的 $f(x)=\sum_{i=1}^{n}g_i(x)$，即各 $g_i(x)$ 之和。因为对于每一个 $i$，都只有一条 $g_i$ 经过 $P_i$，其余 $g_j$ 都经过 $H_i$，故它们相加后在 $x_i$ 的取值仍为 $y_i$，即最后的和函数总是过所有 $P_i$ 的。

公式整理得：

$$
f(x)=\sum_{i=1}^{n} y_i\prod_{j\neq i }\frac{x-x_j}{x_i-x_j}
$$

如果要将每一项的系数都算出来，时间复杂度仍为 $O(n^2)$，但是本题中只用求出 $f(k)$ 的值，所以在计算上式的过程中直接将 $k$ 代入即可。

$$
f(k)=\sum_{i=1}^{n} y_i\prod_{j\neq i }\frac{k-x_j}{x_i-x_j}
$$

本题中，还需要求解逆元。如果先分别计算出分子和分母，再将分子乘进分母的逆元，累加进最后的答案，时间复杂度的瓶颈就不会在求逆元上，时间复杂度为 $O(n^2)$ 。

### 代码实现

```cpp
#include <stdio.h>
const int mod = 998244353;
int x[2020], y[2020];
inline long long inv(long long a)
{
    int b = mod - 2;
    long long res = 1;
    while(b)
    {
        if (b & 1) res = res * a % mod;
        a = a * a % mod;
        b >>= 1;
    }
    return (res + mod) % mod;
}
int main()
{
    int n, k;
    long long res, ans = 0;
    scanf("%d %d", &n, &k);
    for(int i = 0; i < n; i++)
        scanf("%d %d", &x[i], &y[i]);
    for(int i = 0; i < n; i++)
    {
        if (y[i] == 0)
            continue;
        res = 1;
        for(int j = 0; j < n; j++)
        {
            if (i == j) continue;
            res = res * (k - x[j]) % mod;
            res = res * inv(x[i] - x[j]) % mod;
        }
        res = res * y[i] % mod;
        ans = ((ans + res) % mod + mod) % mod;
    }
    printf("%lld", ans);
    return 0;
}
```
