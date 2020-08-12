# 自动控制理论

## Dynamic Response

[^1]: FCDS: Franklin, Powell. *Feedback Control of Dynamic Systems*, 7e, Global Edition.
[^2]: 胡寿松: 胡寿松, 自动控制原理（第 7 版）.

证明线性时不变系统之响应等于输入信号与冲激响应之卷积。（FCDS 107-110）

Causal Systems.（FCDS 111）

证明时域卷积等于频域乘积。（FCDS 111-112）

传递函数与单位冲激响应（FCDS 114）

传递函数作为单位冲激响应（FCDS 112, 116）

传递函数极点分布与终值关系、稳定性、终值定理（FCDS, 127-128）

DC Gain 与终值定理（FCDS, 128-129）

自然响应（FCDS, 144）

时间常数（FCDS, 144）

极点分布与响应关系（FCDS, 146）

二阶系统衰减系数、自然振荡频率、阻尼振荡频率、阻尼比等的关系（FCDS, 147-148）

动态性能指标（胡寿松，75）

一阶系统动态性能指标估算（胡寿松，77）

二阶系统特征方程、特征根（胡寿松，80）

欠阻尼二阶系统动态性能指标估算（胡寿松，84-86）

零点的作用（FCDS, 158, 165）

零点作用在时域的解释（FCDS, 159）

BIBO 稳定性（FCDS, 167）

特征方程（FCDS, 168）

极点与稳定性，注意虚轴（FCDS, 169）

劳斯判据（FCDS, 170-171）

劳斯判据，特殊情况（胡寿松, 110）

System Type and Tracking（FCDS, 209-211）

开环增益的实质（FCDS, 210）

二阶与三阶系统的赫尔维茨判据（胡寿松, 107）

标准二阶欠阻尼系统的阶跃响应：

$$
c(t) = 1-\frac{1}{\sqrt{1-\zeta^2}}\mathrm{e}^{-\sigma t}\sin(\omega_d t + \beta)
$$


### 部分分式分解 | Partial Fraction Decomposition

对于各异的 $z_i$，且分母次数高于分子时，

$$
f(z) = \frac{g(z)}{\prod\limits_{i = 1}^{n}(z-z_i)}=\sum_{i=1}^n\frac{k_i}{z-z_i},
$$

其中

$$
k_i = \lim_{z\rightarrow z_i}(z-z_i)f(z).
$$

对有重根的情况，

$$
F(s) = \frac{s+3}{(s+1)(s+2)^2} = \frac{C_1}{s+1} + \frac{C_2}{s+2} + \frac{C_3}{(s+2)^2}.
$$

则

$$
\begin{aligned}
&C_1 = (s+1)F(s)\vert_{s = -1}=2,\\
&C_2 = \frac{\mathrm{d}}{\mathrm{d}s}\big[(s+2)^2F(s)\big]\vert_{s=-2}=-2,\\
&C_3 = (s+2)^2F(s)\vert_{s=-2}=-1.
\end{aligned}
$$

### 单位反馈系统的开环与闭环传递函数

对于单位反馈系统，即反馈增益为 $H(s) = 1$，若前向增益为 $G(s) = \frac{A}{B}$ 的系统，则传递函数

$$
\varPhi(s) = \frac{\cfrac{A}{B}}{1+\cfrac{A}{B}}=\frac{A}{A+B}.
$$


### System Type and Tracking

对开环传递函数为 $G(s)$ 的单位反馈控制系统，其传递函数为 $\varPhi = \frac{G}{1+G}$。现假设其稳定。则有误差

$$
\begin{aligned}
E(s) 
&= R-B \\
&= R-C \\
&= R-\varPhi R \\
&=\frac{1}{1+G}R.
\end{aligned}
$$

若 $G$ 在 $s=0$ 处有 $n$ 阶极点，则称

$$
K = \lim_{s\rightarrow0}s^nG
$$

为开环增益（即约去分母中的 $s$ 因式）。另一种定义的方法是

$$
G = K\cdot\frac{\prod\limits_i(a_is+1)}{\prod\limits_j(b_js+1)}.
$$

由终值定理，有

$$
\begin{aligned}
e_{\mathrm{ss}}
&= \lim_{t\rightarrow+\infty}e(t)\\
&= \lim_{s\rightarrow0}sE(s)\\
&= \lim_{s\rightarrow0}s\frac{1}{1+G}R(s).
\end{aligned}
$$

设 $r(t) = t^k/k!$ 即 $R(s) = 1/s^{k+1}$，则

$$
\begin{aligned}
e_{\mathrm{ss}}
&= \lim_{s\rightarrow0}\cfrac{s}{1+G}\frac{1}{s^{k+1}}\\
&= \lim_{s\rightarrow0}\cfrac{s^n}{s^n+s^nG}\frac{1}{s^k}\\
&= 
\begin{cases}
0&,n > k\\
\frac{1}{1+K}&,n = k = 0\\
\frac{1}{K}&,n = k \ne 0\\
\infty&, n < k
\end{cases}
\end{aligned}
$$

开环增益在 $n = 0, 1, 2$ 时分别为

$$
K = \lim_{s\rightarrow0}G = K_p,\\
K = \lim_{s\rightarrow0}sG = K_v,\\
K = \lim_{s\rightarrow0}s^2G = K_a.
$$


## Root-Locus Method

根轨迹方程、传递函数与特征方程的区别（FCDS, 257, 260）

根轨迹与阻尼系数（FCDS, 258）

根轨迹相角条件（FCDS, 261）

根轨迹绘制规则（FCDS, 262-268）注意起始终止角规则采用 FCDS 版本。

图解法求轨迹某点对应的 $K$（FCDS, 270）
