---
date:
    created: 2023-03-15
categories:
    - Numerical Analysis
---


# 快速平方根倒数算法，0x5F3759DF

<!-- more -->

## Float32 in IEEE 754

首先介绍 IEEE 754 中规定的 32 位浮点数（float32/binary32）表示法，如下图[^ieee754float]所示：

[^ieee754float]: <https://en.wikipedia.org/wiki/File:Float_example.svg>{: target="_blank"}

![](https://upload.wikimedia.org/wikipedia/commons/d/d2/Float_example.svg)

* 第 31 位为符号位（sign）
* 第 30 至 23 位的 8 位为指数（exponent）
* 第 22 至 0 位的 23 位为尾数（significand/mantissa）

那么这个浮点数的值为（指数非全 0，即规格数的情况下）

$$
(-1)^S \cdot 2^{E-127} \cdot 1.M
$$

!!! Note "Examples"

    * $\texttt{0 01111111 00000000000000000000000} = +2^{127-127} \times 1.0 = +1$
    * $\texttt{1 10000000 00000000000000000000000} = -2^{128-127} \times 1.0 = -2$
    * $\texttt{0 10000000 11111111111111111111111} = +2^{128-127} \times (2.0 - 2^{-23}) \approx 4$
    * $\texttt{0 10111110 01101110101100111011111} \approx +2^{190-127} \times 1.432 \approx 1.321\times 10^{19}$

!!! Info "Normal Numbers and Subnormal Numbers"

    从表示上来说，规格化数的指数位非全 0（也非全 1），对应非规格化数的指数位全为 0. 规格化数表示的是一般的非零数，而非规格化数表示的是绝对值比所有规格化数更小的数，包括 0.

    和规格数不同，非规格数的的指数固定为 -126，而且尾数部分不加上 1：

    $$
    (-1)^S \cdot 2^{-126} \cdot 0.M
    $$

    * 最小的正非规格数为

        $\texttt{0 00000000 00000000000000000000001} = 2^{-126} \times 2^{-23} \approx 1.401\times 10^{-45}$

    * 最大的非规格数为

        $\texttt{0 00000000 11111111111111111111111} = 2^{-126} \times (1 - 2^{-23}) \approx 1.175\times 10^{-38}$

    * 最小的正规格数为

        $\texttt{0 00000001 00000000000000000000000} = 2^{-126} \times 1 \approx 1.175\times 10^{-38}$

    * 最大的规格数为

        $\texttt{0 11111110 11111111111111111111111} = 2^{127} \times (2 - 2^{-23}) \approx 3.403\times 10^{38}$

    * 正负零为

        $\texttt{x 00000000 00000000000000000000000} = \pm 0$

    注意到最大的非规格数与最小的正规格数之间仅差 $2^{-149}$，即这种设计实现了两种数之间的平滑过渡. 最重要的是，非规格数的设计保证了两个不同的浮点数之差不会下溢至零，从而避免被零除的错误.


!!! Info "Non-Numbers"

    IEEE 754 中还规定的无穷大和 NaN 的表示. 当指数位全为 1，尾数位全为 0 时表示数据溢出，为无穷大，由符号位决定正负；当指数位全为 1 且尾数位非全 0 时，表示 NaN.

    * 正无穷为

        $\texttt{0 11111111 00000000000000000000000} = +\infty$

    * 一种可能的 NaN 为

        $\texttt{0 11111111 00000000000000000000001} = \mathrm{NaN}$


??? Info "C Code"

    以下代码用于将 float32 与其存储形式字符串转换：

    ```c
    #include <stdio.h>
    #include <stdint.h>
    void printFloat32Bits(const float x)
    {
        uint32_t bits = *(uint32_t *)&x;
        for (int i = 31; i >= 0; --i)
        {
            printf(((bits >> i) % 2) ? "1" : "0");
            if (i == 31 || i == 23) printf(" ");
        }
        printf(" = %f = %e\n", x, x);
    }
    void printFloat32Bits(const char bits[])
    {
        uint32_t res = 0;
        float fres;
        for (int i = 0; i < 32; ++i)
            if (bits[i] == 0 || (bits[i] != '1' && bits[i] != '0'))
            {
                fprintf(stderr, "ERROR: not a valid float32.\n");
                return;
            }
        if (bits[32] != 0)
        {
            fprintf(stderr, "ERROR: not ending in 32 bits.\n");
            return;
        }
        for (int i = 0; i < 32; ++i)
        {
            printf("%c", bits[i]);
            if (i == 0 || i == 8) printf(" ");
            res <<= 1;
            if (bits[i] == '1') res += 1;
        }
        fres = *(float*) &res;
        printf(" = %f = %e\n", fres, fres);
    }
    int main()
    {
        printFloat32Bits(0.15625f);
        printFloat32Bits("0" "00000000" "00000000000000000000001");
        return 0;
    }
    ```

## 快速平方根倒数算法

这里直接给出算法代码

```c
float fastInvSqrt(float x)
{
    float xhalf = x * 0.5f;
    float y = x;
    int32_t i = *(int32_t*) &y;         // convert to int32
    i = 0x5f3759df - (i >> 1);          // first guess
    y = *(float*) &i;                   // convert back to float32
    y = y * (1.5f - (xhalf * y * y));   // Newton's method, 1st iter
    y = y * (1.5f - (xhalf * y * y));   // optional, 2nd iter
    return y;
}
```

??? Info "Speed and Accuracy Test"

    ```c
    #include <stdio.h>
    #include <stdint.h>
    #include <math.h>
    #include <time.h>
    float fastInvSqrt(float x)
    {
        float xhalf = x * 0.5f;
        float y = x;
        int32_t i = *(int32_t*) &y;         // convert to int32
        i = 0x5f3759df - (i >> 1);          // first guess
        y = *(float*) &i;                   // convert back to float32
        y = y * (1.5f - (xhalf * y * y));   // Newton's method, 1st iter
     // y = y * (1.5f - (xhalf * y * y));   // optional, 2nd iter
        return y;
    }
    float invSqrt(float x)
    {
        return 1.0f/sqrt(x);
    }
    void accuracyTest(float xstart, float xend, float xstep)
    {
        float y, fasty;
        float error, maxerror = 0, minerror = 0;
        for (float x = xstart; x < xend; x += xstep)
        {
            y = invSqrt(x);
            fasty = fastInvSqrt(x);
            printf("invSqrt(%f) = %f, ", x, y);
            printf("fastInvSqrt(%f) = %f, ", x, fasty);
            error = (fasty - y)/y*100.0f;
            if (error > maxerror) maxerror = error;
            if (error < minerror) minerror = error;
            printf("error: %+f%%\n", error);
        }
        printf("max error: %f%%, min error: %f%%\n", maxerror, minerror);
    }
    void speedTest(float xstart, float xend, float xstep, unsigned int repeat)
    {
        clock_t start, end;
        float sec, fastsec;
        start = clock();
        for (unsigned int i = 0; i < repeat; ++i)
        {
            for (float x = xstart; x < xend; x += xstep)
            {
                invSqrt(x);
            }
        }
        end = clock();
        sec = (float) (end - start) / CLOCKS_PER_SEC;

        start = clock();
        for (unsigned int i = 0; i < repeat; ++i)
        {
            for (float x = xstart; x < xend; x += xstep)
            {
                fastInvSqrt(x);
            }
        }
        end = clock();
        fastsec = (float) (end - start) / CLOCKS_PER_SEC;
        printf("vanilla inverse square root takes %f / %u secs on avg.\n", sec, repeat);
        printf("   fast inverse square root takes %f / %u secs on avg, ", fastsec, repeat);
        printf("%.2f%% faster on avg.\n", (sec - fastsec)/sec*100.0f);
    }
    int main()
    {
        accuracyTest(0.1, 1000, 7);
        speedTest(0.1, 1000, 7, 10000);
        return 0;
    }
    ```

## 牛顿法求根

牛顿法（Newton's method / Newton–Raphson method）求方程 $f(x) = 0$ 的解的思想在于先估计一个近似解 $x_n$，然后求 $f(x)$ 在此点上的切线与 $x$ 轴之交点作为下一个估计 $x_{n+1}$，如此迭代求解.

要求 $f(x)$ 在 $x_n$ 处的切线，只需在此做一阶泰勒展开

$$
t_n(x) = f(x_n) + f'(x_n)(x - x_n),
$$

求此切线与 $x$ 轴之交点，即令 $t_n(x_{n+1}) = 0$，得到牛顿法的迭代式：

$$
x_{n+1} = x_n - \frac{f(x_n)}{f'(x_n)}.
$$

<iframe src="https://www.desmos.com/calculator/yr9oynlviw?embed" width="500" height="300" style="border: 1px solid #ccc" frameborder=0></iframe>

求 $y = 1/\sqrt{x}$ 时，相当于解方程 $f(y) = 1/y^2 - x = 0$，根据牛顿法有 $y_{n+1} = y_n(\frac{3}{2} - \frac{1}{2}xy_n^2)$，这对应算法最后两行的迭代. 反推可知 `i = 0x5f3759df - (i >> 1)` 应当能给出一个相当好的初始估计，使得算法仅需后续 1 至 2 步牛顿法迭代即可将误差控制到很小的范围内.

## 0x5F3759DF the Magic Number

现在唯一的疑问在于，为何算法先将 $x$ 的 32 位当作一个整数，右移一位，然后用这个神奇数字减去之，再重新视作浮点数，就可以得到 $\sqrt{x}$ 的初始估计. 这里不尝试寻找此数，而是解释算法的合理性.

根据 float32 表示方法，由于 $x > 0$，符号位一定为 0，故

$$
x = 2^{E-127}\cdot (1+M),
$$

$$
\begin{aligned}
y = \frac{1}{\sqrt{x}} &= 2^{(127-E)/2}\cdot \frac{1}{\sqrt{1+M}} \\
&= 2^{190.5 - E/2 - 127} \cdot \frac{1}{\sqrt{1+M}}.
\end{aligned}
$$

对 `0x5f3759df`，对应指数 $E$ 的 8 位为 `1011 1110`，是十进制的 190；对应尾数 $M$ 的 23 位为 `011 0111 0101 1001 1101 1111`，对应十进制的约 0.432. 那么忽略尾数最后一位产生的误差，讨论 `0x5f3759df - (i >> 1)` 得到的结果：

首先注意右移一位后指数最大值是 127，小于 190，故做减法时指数不会再向上借位.

$E$ 为奇数时：

* 右移，$E$ 末尾的 1 移至 $M$ 的最高位：
    * $E \longrightarrow \frac{E-1}{2}$
    * $M \longrightarrow M/2 + 0.5$
* 减法：
    * $E \longrightarrow 190 - \frac{E-1}{2}$
    * $M \longrightarrow 0.432 - \frac{M}{2} - 0.5$
* 减法之前 $M$ 最高位是从 $E$ 右移而来的 1，而 `0x5f3759df` 对应位上是 0，故一定发生借位. 故修正为
    * $E \longrightarrow 190 - \frac{E-1}{2} - 1$
    * $M \longrightarrow 0.432 - \frac{M}{2} - 0.5 + 1$
* 故在 $M \in [0, 1)$ 有：
* $y_0^\mathrm{odd} = 2^{190.5 - E/2 - 127 - 1}\cdot(1.932-\frac{M}{2}), M \in [0, 1)$
* $y_0^\mathrm{odd}/y = \frac{1}{2}(1.932-\frac{M}{2})\sqrt{1+M}, M \in [0, 1)$

$E$ 为偶数时：

* $E$ 与 $M$ 均各自右移一位：
    * $E \longrightarrow \frac{E}{2}$
    * $M \longrightarrow \frac{M}{2}$
* 当 $\frac{M}{2} < 0.432$，不借位
    * $E \longrightarrow 190 - \frac{E}{2}$
    * $M \longrightarrow 0.432 - \frac{M}{2}$
    * 故在 $M \in [0, 0.864]$ 有：
    * $y_0^\mathrm{even} = 2^{190-E/2-127}\cdot(1.432 - \frac{M}{2})$
    * $y_0^\mathrm{even}/y = \frac{1}{\sqrt{2}}(1.432-\frac{M}{2})\sqrt(1+M)$
* 当 $\frac{M}{2} > 0.432$，借位，做相似修正
    * $E \longrightarrow 190 - \frac{E}{2} - 1$
    * $M \longrightarrow 0.432 - \frac{M}{2} + 1$
    * 故在 $M\in(0.864, 1)$ 有：
    * $y_0^\mathrm{even, c} = 2^{190-E/2-1-127}\cdot(2.432 - \frac{M}{2})$
    * $y_0^\mathrm{even, c}/y = \frac{1}{2\sqrt{2}}(2.432-\frac{M}{2})\sqrt{1+M}$

各情况下 $y_0/y$ 随 $M$ 的变化如下图所示，红色为 $E$ 为奇数情况，蓝色为 $E$ 为偶数且不借位的情况，绿色为 $E$ 为偶数且借位的情况. 可见此比率始终很接近 1，故 `0x5f3759df - (i >> 1)` 确实能得到一个相当好的估计.

<iframe src="https://www.desmos.com/calculator/09exol9hja?embed" width="500" height="360" style="border: 1px solid #ccc" frameborder=0></iframe>

## See Also

* <http://www.lomont.org/papers/2003/InvSqrt.pdf>{: target="_blank"}
