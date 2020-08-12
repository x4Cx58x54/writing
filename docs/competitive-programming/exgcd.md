# 扩展欧几里得算法、裴蜀定理与线性同余方程 | Extended Euclidean Algorithm, Bézout's Lemma and Linear Congruence Equations

裴蜀定理：

> 对任意 $a, b \in \mathbb{Z}$，关于 $x$ 和 $y$ 的不定方程 $ax+by=c$ 有整数解当且仅当 $c$ 是 $\gcd(a,b)$ 的整数倍。

故求解上述不定方程 $ax+by=c$ 时，只要首先求出 $ax+by = \gcd(a, b)$ 的一组解 $x_0, y_0$，若 $c = k_0\gcd(a, b)$，则 $x = k_0x_0,\ y = k_0y_0$ 即为原方程的一组解（特解）。

下面求方程的通解。设整数 $p, q$ 满足 $a(k_0x_0+p)+b(k_0y_0-q) = c$，可得 $ap = bq$，即 $p$ 与 $a$ 相乘得到 $b$ 的整数倍，同时它又是 $a$ 的整数倍，由此有

$$
p = k\cdot\cfrac{\operatorname{lcm}(a, b)}{a} = k\cdot\cfrac{b}{\gcd(a, b)},\\
q = k\cdot\cfrac{\operatorname{lcm}(a, b)}{b} = k\cdot\cfrac{a}{\gcd(a, b)},
$$

故通解为

$$
\begin{cases}
x = \cfrac{c \cdot x_0}{\gcd(a, b)} + k\cdot\cfrac{b}{\gcd(a, b)}\\
y = \cfrac{c \cdot y_0}{\gcd(a, b)} - k\cdot\cfrac{a}{\gcd(a, b)}
\end{cases},\quad k \in \mathbb{Z}
$$

特别地，$a, b$ 互质时 $x = \dfrac{c \cdot x_0}{\gcd(a, b)} + kb,\ y = \dfrac{c \cdot y_0}{\gcd(a, b)} + ka$ .

如何求出特解 $x_0, y_0$ 呢？

构造两个方程

$$
ax_1+by_1 = \gcd(a, b),\tag{1}
$$

$$
bx_2+(a \operatorname{mod} b)y_2 = \gcd(b, a \operatorname{mod} b),\tag{2}
$$

由欧几里得定理 $\gcd(a, b) = \gcd(b, a \operatorname{mod} b)$，有

$$
\begin{aligned}
ax_1 + by_1 &= bx_2 + \left(a - b\left\lfloor\frac{a}{b}\right\rfloor\right)y_2,\\
&= ay_2 + b \left(x_2 - \left\lfloor\frac{a}{b}\right\rfloor y_2\right)
\end{aligned}
$$

得到递推式

$$
\begin{cases}
x_1 = y_2, \\
y_1 = x_2 - \left\lfloor\dfrac{a}{b}\right\rfloor y_2.
\end{cases}
$$

故方程 $(1)$ 的解可由 $(2)$ 的解推出，又由于 $(2)$ 中的系数比 $(1)$ 中小，并会收敛到 $b = 0$ 的情况，此时 $ax+0y = \gcd(a, 0) = a$ 的解是 $x = 1, y = 0$，故可以递归求解。这就是扩展欧几里得算法的原理。扩展欧几里得接受两个输入 $a$ 和 $b$，得到 $ax+by = \gcd(a, b)$ 的解，并返回 $\gcd(a, b)$.

```cpp
int exgcd(int a, int b, int& x, int& y)
{
    if (!b)
    {
        x = 1;
        y = 0;
        return a;
    }
    int d = exgcd(b, a%b, x, y);
    int t = x;
    x = y;
    y = t - a / b * y;
    return d;
}
```

不定方程 $ax + by = c$ 和线性同余方程 $ax \equiv c \pmod b$ 是等价的。

[同余方程 - 洛谷](https://www.luogu.com.cn/problem/P1082){:target="_blank"}

要求 $ax\equiv 1 \pmod b$ 的最小正整数解，只需要先求出一个特解，再根据通解 $x = x_0 + k' b$ 计算最小的正整数解即可。

```c++
#include <stdio.h>
int main()
{
    int a, b, x, y;
    scanf("%d %d", &a, &b);
    exgcd(a, b, x, y);
    printf("%d", (x % b + b) % b);
    return 0;
}
```
