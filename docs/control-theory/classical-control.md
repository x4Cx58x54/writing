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


## MATLAB 命令

### 多项式

使用系数行向量表示。如 $p(x) = x^2 + 4x + 4$ 表示为
```
p = [1 4 4]
```
将 $x_0$ 代入求值
```
val = polyval(p, x0)
```

求解 $p(x) = 0$
```
r = roots(p)    % r = [-2; -2]
```
由这些根重新构造多项式
```
p = poly(r)
```

多项式相乘（卷积）
```
conv(p1, p2)
```

部分分式展开
```
[r, p, k] = residue(num, den)
```
`p` 为展开后各分式极点，`r` 为各分式在极点上的留数（分子），`k` 为余下的常数项。反过来，也可以将部分分式合并
```
[num, den] = residue(r, p, k)
```

化简分式（零极点对消）
```
sys0 = minreal(sys)
```

求极限
```
Ess = limit(s*E, s, 0)
```

拉普拉斯变换
```
sys_s = laplace(sys_t_sym, t, s)
```
相似地有 `ilaplace` 函数。函数接受的都是 `syms` 表达式。

极大值与极大值点
```
y_max = max(y)
[y_max, t_p] = max(y)
```

符号表达式代值（使用 `eval` 求值）
```
y_dynamic = eval(subs(res, [omega_n, zeta], [sqrt(21), 2/2/sqrt(21)]))
y_infty = eval(subs(y_dynamic, t, 1e8))
```

### 传递函数

若传递函数有上述多项式形式的分子 `num` 与 分母 `den`，则系统为
```
sys = tf(num, den)
```
此系统之零点与极点分别为
```
z = zero(sys)
p = pole(sys)
```

绘制零极点分布图
```
pzmap(sys)
```

以零点、极点、增益来描述模型
```
sys = zpk(z, p, k)
```

这两种描述系统的方式可以互相转换
```
[num, den] = zp2tf(z, p, k)
[z, p, k] = tf2zp(num, den)
```

各系统之串联、并联、反馈连接
```
sys = series(G1, G2)
sys = parallel(G1, G2)
sys = feedback(G1, H1, sign)
```

阶跃稳态值（low-frequency gain）
```
y = dcgain(sys)
```

阶跃响应
```
step(sys)
% or
t = 0:0.1:10
y = step(sys, t)
plot(t, y)
```
相似地有 `impulse` 函数。

求任意输入信号的响应
```
t = 0:0.1:10
r = t
y = lsim(sys, r, t)
plot(y, t)
```

传递函数转多项式
```
[num, den] = tfdata(sys, 'v')
```

多项式转符号表达式
```
syms s
sys_sym = poly2sym(num, s)/poly2sym(den, s)
```


### 其它

显示空行
```
disp(newline)
```

字符串格式化
```
disp(sprintf('Overshoot = %.2f%%', overshoot*100))
```

四舍五入至 $10^{-n}$ 位
```
x = round(x, n)
```

调整图位置
```
figure(1)
...
set(figure(1),'Position',[100,50,1200,900])
```
其中参数分别为左间距、下间距、宽、高的像素值。

图中显示字符
```
text(t_p - 0.06, y_p + 0.02, 'Peak')
```

显示水平/竖直线
```
xline(t_p, '--', 'Peak time', 'LabelVerticalAlignment', 'bottom')
yline(y_p, '--', 'Peak response', 'LabelVerticalAlignment', 'bottom')
```
