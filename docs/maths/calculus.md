# Calculus

## 极限

*1*  
求极限

$$
\lim_{x\rightarrow 0}\frac{\sqrt[3]{1+x}-\sqrt[3]{1-x}}{x}.
$$

??? note "Hint"
    利用立方差公式 $a^3-b^3 = (a-b)(a^2+ab+b^2)$，先将无理式有理化，消去零因子，再利用极限的四则运算法则进行计算.

    $$
    \lim_{x\rightarrow 0}\frac{(1+x)-(1-x)}{\left[
    \left(\sqrt[3]{1+x}\right)^2+
    \left(\sqrt[3]{1+x}\right)
    \left(\sqrt[3]{1-x}\right)+
    \left(\sqrt[3]{1-x}\right)^2
    \right]} = \frac{2}{3}
    $$

*2*  
已知

$$
\lim_{x\rightarrow\infty}\left(\frac{x^2}{1+x}-ax-b\right)=0,
$$

求常数 $a$、$b$.

??? note "Hint"
    解法一：

    由已知极限存在且 $\lim\limits_{x\rightarrow\infty} x\left(\cfrac{\cfrac{x^2}{1+x}}{x}-a-\cfrac{b}{x}\right) = 0$ 知 $\lim\limits_{x\rightarrow\infty} x\left(\cfrac{\cfrac{x^2}{1+x}}{x}-a-\cfrac{b}{x}\right) = 0$，故

    $$
    a = \lim_{x\rightarrow\infty} \cfrac{\cfrac{x^2}{1+x}}{x} = \lim_{x\rightarrow\infty} \cfrac{x}{1+x} = 1,
    $$

    $$
    b = \lim_{x\rightarrow\infty} \left(\cfrac{x^2}{1+x}-x\right) = \lim_{x\rightarrow\infty} \cfrac{-x}{1+x} = -1.
    $$

    解法二：

    $$
    \lim_{x\rightarrow\infty} \left[\cfrac{x^2 - a(1+x)x - b(1+x)}{1+x}\right] = \lim_{x\rightarrow\infty} \left[\cfrac{(1-a)x^2 - (a+b)x - b}{1+x}\right] = 0,
    $$

    故 $\begin{cases}1-a = 0, \\ a+b = 0, \end{cases}$, 即 $\begin{cases}a = 1, \\ b = -1. \end{cases}$


*3*  
求 $x\rightarrow 0$ 时，$4x\tan^3x$ 和 $\tan x - \sin x$ 的无穷小阶数.

??? note "Hint"
    由于 $\lim\limits_{x\rightarrow 0}\cfrac{4x\tan^3x}{x^4} = 4\lim\limits_{x\rightarrow 0}\left(\cfrac{\tan x}{x}\right)^3 = 4$，当 $x\rightarrow 0$ 时，$4x\tan^3x$ 为 $x$ 的四阶无穷小. 而 $\lim\limits_{x\rightarrow 0}\cfrac{\tan x-\sin x}{x^3} = \lim\limits_{x\rightarrow 0}\left(\cfrac{\tan x}{x} \cdot \cfrac{1-\cos x}{x^2}\right) = \cfrac{1}{2}$，所以 $\tan x - \sin x$ 为 $x$ 的三阶无穷小.

*4*  
设 $f(x)=x(x-1)(x-2)\cdots(x-100)$，求 $f'(50).$

??? note "Hint"
    令 $g(x) = x(x-1)(x-1)\cdots(x-49)(x-51)\cdots(x-100)$，则

    $$
    f(x) = (x-50)g(x).
    $$

    因此

    $$
    f'(x) = g(x) + (x-50)g'(x),
    $$

    $$
    f'(50) = g(50) = (50!)(-1)^{50}(50!) = (50!)^2.
    $$

## 单变量微分

*1*  
求 $\lim\limits_{x\rightarrow0^+}\left(\cos\sqrt{x}\right)^{1/x}$

??? note "Hint"
    $$
    \begin{aligned}
    & \lim_{x\rightarrow0^+}\left(\cos\sqrt{x}\right)^{1/x}\\
    =& \lim_{x\rightarrow0^+}\left(1+\cos\sqrt{x}-1\right)^{\frac{1}{\cos\sqrt{x}-1}\cdot\frac{\cos\sqrt{x}-1}{x}}\\
    =&\ \mathrm{e}^{-1/2}
    \end{aligned}
    $$

*2*  
试用拉格朗日中值定理证明：

1. 若 $0 < b \le a$，则 $\cfrac{a-b}{a} \le \ln\cfrac{a}{b} \le \cfrac{a-b}{b}$;
2. 若 $a > b > 0$，$n > 1$，则 $nb^{n-1}(a-b)<a^n-b^n<ba^{a-1}<na^{n-1}(a-b)$;
3. $\cfrac{1}{n+1} < \ln \left( 1 + \cfrac{1}{n} \right) < \cfrac{1}{n}$;
4. 当 $x > 1$ 时，$\mathrm{e}^x > \mathrm{e}x$.

??? note "Hint"
    1. 设函数 $f(x) = \ln x$，当 $a = b$ 时，不等式中等号自然成立；当 $0 < b < a$ 时，其在闭区间 $[b, a]$ 上连续，在开区间 $(b, a)$ 内可导，由拉格朗日中值定理知，在 $\xi \in (b, a)$, 使得 $f'(\xi) = \cfrac{1}{\xi} = \cfrac{\ln a - \ln b}{a - b}$. 又因为 $b < \xi < a$，故得 $\cfrac{a-b}{a} < \ln\cfrac{a}{b} < \cfrac{a-b}{b}$. 综上得证.
    2. 设函数 $f(x) = x^n$，其在闭区间 $[b, a]$ 上连续，在开区间 $(b, a)$ 内可导，由拉格朗日中值定理知，存在 $\xi \in (b, a)$，使得 $f'(\xi) = n\xi^{n-1}=\cfrac{a^n-b^n}{a-b}$. 又因为 $b < \xi < a,\ n > 1$，故得 $nb^{n-1}(a-b)<a^n-b^n<ba^{a-1}<na^{n-1}(a-b)$.
    3. 设函数 $f(t) = \ln(1+t)$，其在闭区间 $[0, x]$ 上连续，在开区间 $(0, x)$ 内可导，由拉格朗日中值定理知，存在 $\xi \in (0, x)$，使得 $f'(\xi) = \cfrac{1}{1+\xi}=\cfrac{\ln(1+x)-\ln 1}{x - 0}$. 又因为 $0 < \xi < x$，故得 $\cfrac{x}{1+x} < \ln (1+x) < x$. 取 $x = \cfrac{1}{n}$，则结论自然成立.
    4. 设函数 $f(t) = \mathrm{e}^t$，其在闭区间 $[1, x]$ 上连续，在开区间 $(1, x)$ 内可导，由拉格朗日中值定理知，存在 $\xi \in (1, x)$，使得 $f'(\xi) = \mathrm{e}^\xi = \cfrac{\mathrm{e}^x-\mathrm{e}}{x - 1}$. 又因为 $1 < \xi < x$，故 $\mathrm{e}^\xi = \cfrac{\mathrm{e}^x-\mathrm{e}}{x - 1} > \mathrm{e}$，整理得所证不等式.

