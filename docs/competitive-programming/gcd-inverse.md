# 最小公倍数的逆问题 | GCD Inverse

[Hankson 的趣味题 - 洛谷](https://www.luogu.com.cn/problem/P1072){:target="_blank"}

满足 $\gcd(x, a_0) = a_1$ 的 $x$ 必然使得下式成立：

$$
\begin{cases}
x \bmod a_1 = 0\\
a_0 \bmod a_1 = 0\\
\gcd(x, a_0/a_1) = 1
\end{cases}
$$

类似地，$\operatorname{lcm}(x, b_0) = b_1$ 则可以推出

$$
\begin{cases}
b_1 \bmod x = 0\\
b_1 \bmod b_0 = 0\\
\gcd(x, b_1/b_0) = 1
\end{cases}
$$

按照以上条件搜索符合的 $x$ 即可。

```cpp
int main()
{
    int n, a0, a1, b0, b1, ans, a, b, p, q;
    double sqrtb1;
    scanf("%d", &n);
    for(int i = 0; i < n; i++)
    {
        ans = 0;
        scanf("%d %d %d %d", &a0, &a1, &b0, &b1);
        if (a0 % a1 != 0 || b1 % b0 != 0)
        {
            printf("0\n");
            continue;
        }
        a = a0 / a1;
        b = b1 / b0;
        sqrtb1 = sqrt(b1);
        for(int p = 1; p <= sqrtb1; ++p)
        {
            if (b1 % p == 0)
            {
                q = b1/p;
                if (p % a1 == 0 && gcd(q, b) == 1 && gcd(p/a1, a) == 1) ++ans;
                if (q % a1 == 0 && p != q && gcd(p, b) == 1 && gcd(q/a1, a) == 1) ++ans;
            }
        }
        printf("%d\n", ans);
    }
    return 0;
}
```
