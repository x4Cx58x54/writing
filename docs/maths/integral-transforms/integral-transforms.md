# 积分变换

## Fourier 傅里叶变换

### Fourier 级数

在 $[-\frac{T}{2}, \frac{T}{2}]$ 上满足 Dirichlet 条件的周期函数 $f_T(t)$ 在其连续点处的 **Fourier 级数三角形式**为

$$
f_T(t) = \frac{a_0}{2} + \sum_{n=1}^\infty\left(a_n\cos n\omega t + b_n\sin n\omega t\right)\quad(n\in\mathbb{Z^+}),
$$

其中

$$
\begin{aligned}
\omega& = \frac{2\pi}{T},\\
a_0 &= \frac{2}{T}\int_{-\frac{T}{2}}^{\frac{T}{2}}f_T(t)\mathrm{d}t,\\
a_n &= \frac{2}{T}\int_{-\frac{T}{2}}^{\frac{T}{2}}f_T(t)\cos n\omega t\mathrm{d}t,\\
b_n &= \frac{2}{T}\int_{-\frac{T}{2}}^{\frac{T}{2}}f_T(t)\sin n\omega t\mathrm{d}t.
\end{aligned}
$$

由欧拉公式，得

$$
\begin{aligned}
f_T(t) &= \frac{a_0}{2}+\sum_{n=1}^\infty\left(a_n\frac{\mathrm{e}^{in\omega t}+\mathrm{e}^{-in\omega t}}{2} + b_n\frac{\mathrm{e}^{in\omega t}-\mathrm{e}^{-in\omega t}}{2i}\right)\\
&=\frac{a_0}{2}+\sum_{n=1}^\infty\left(\frac{a_n-ib_n}{2}\mathrm{e}^{in\omega t}+\frac{a_n+ib_n}{2}\mathrm{e}^{-in\omega t}\right).
\end{aligned}
$$

令

$$
\begin{aligned}
c_0 &= \frac{a_0}{2} = \frac{1}{T}\int_{-\frac{T}{2}}^{\frac{T}{2}}f_T(t)\mathrm{d}t,\\
\\
c_n &= \frac{a_n-ib_n}{2}\\
&= \frac{1}{T}\int_{-\frac{T}{2}}^{\frac{T}{2}}f_T(t)\left(\cos n\omega t-i\sin n\omega t\right)\mathrm{d}t\\
&=\frac{1}{T}\int_{-\frac{T}{2}}^{\frac{T}{2}}f_T(t)\mathrm{e}^{-in\omega t}\mathrm{d}t\quad(n\in\mathbb{Z^+}),\\
\\
c_{-n} &= \frac{a_n+ib_n}{2}\\
&= \frac{1}{T}\int_{-\frac{T}{2}}^{\frac{T}{2}}f_T(t)\left(\cos n\omega t+i\sin n\omega t\right)\mathrm{d}t\\
&=\frac{1}{T}\int_{-\frac{T}{2}}^{\frac{T}{2}}f_T(t)\mathrm{e}^{in\omega t}\mathrm{d}t\quad(n\in\mathbb{Z^+}),\\
\end{aligned}
$$

则可合写为一个式子

$$
c_n = \frac{1}{T}\int_{-\frac{T}{2}}^{\frac{T}{2}}f_T(t)\mathrm{e}^{-in\omega t}\mathrm{d}t\quad(n\in \mathbb{Z}).
$$

故

$$
f_T(t) = \sum_{n=-\infty}^{+\infty}c_n\mathrm{e}^{i\omega_n t},
$$

即 **Fourier 级数的复指数形式**

$$
f_T(t) = \frac{1}{T}\sum_{n=-\infty}^{+\infty}\left[\int_{-\frac{T}{2}}^{\frac{T}{2}}f_T(\tau)\mathrm{e}^{-i\omega_n\tau}\mathrm{d}\tau\right]\mathrm{e}^{i\omega_n t}.
$$

### Fourier 积分

下面讨论非周期函数的展开，令 $T\rightarrow+\infty$，此时 $\omega_n$ 均匀分布在整个数轴上，且 $\Delta\omega = \omega_n - \omega_{n-1} = \omega$，$\Delta\omega\rightarrow 0$. 于是有

$$
\begin{aligned}
f(t) &= \lim_{\Delta\omega\rightarrow 0}\frac{\Delta\omega}{2\pi}\sum_{n=-\infty}^{+\infty}\left[\int_{-\frac{T}{2}}^{\frac{T}{2}}f_T(\tau)\mathrm{e}^{-i\omega_n\tau}\mathrm{d}\tau\right]\mathrm{e}^{i\omega_n t}\\
&=\frac{1}{2\pi}\int_{-\infty}^{+\infty}\left[\int_{-\infty}^{+\infty}f(t)\mathrm{e}^{-i\omega\tau}\mathrm{d}\tau\right]\mathrm{e}^{i\omega t}\mathrm{d}\omega,
\end{aligned}
$$

这便是 **Fourier 积分公式的复数形式**，在任意有限区间满足 Dirichlet 条件且在 $\mathbb{R}$ 上绝对可积的函数，各间断点用左右极限之均值代替后满足上述公式.

利用欧拉公式，有

$$
\begin{aligned}
f(t) &= \frac{1}{2\pi}\int_{-\infty}^{+\infty}\left[\int_{-\infty}^{+\infty}f(t)\mathrm{e}^{-i\omega\tau}\mathrm{d}\tau\right]\mathrm{e}^{i\omega t}\mathrm{d}\omega\\
&= \frac{1}{2\pi}\int_{-\infty}^{+\infty}\left[\int_{-\infty}^{+\infty}f(t)\mathrm{e}^{i\omega(t-\tau)}\mathrm{d}\tau\right]\mathrm{d}\omega\\
&=\frac{1}{2\pi}\int_{-\infty}^{+\infty}\bigg[\int_{-\infty}^{+\infty}f(t)\cos\omega(t-\tau)\mathrm{d}\tau\\&\quad\quad+i\int_{-\infty}^{+\infty}f(t)\sin\omega(t-\tau)\mathrm{d}\tau\bigg]\mathrm{d}\omega.
\end{aligned}
$$

由于 $\int_{-\infty}^{+\infty}f(t)\sin\omega(t-\tau)\mathrm{d}\tau$ 是 $\omega$ 的奇函数，$\int_{-\infty}^{+\infty}f(t)\cos\omega(t-\tau)\mathrm{d}\tau$ 是 $\omega$ 的偶函数，故

$$
f(t)=\frac{1}{\pi}\int_0^{+\infty}\bigg[\int_{-\infty}^{+\infty}f(t)\cos\omega(t-\tau)\mathrm{d}\tau\bigg]\mathrm{d}\omega,
$$

即 **Fourier 积分公式的三角形式**.

将三角函数展开，当 $f(t)$ 是奇函数时，得

$$
f(t) = \frac{2}{\pi}\int_0^{+\infty}\left[\int_0^{+\infty}f(t)\sin\omega\tau\mathrm{d}\tau\right]\sin\omega t\mathrm{d}\omega,
$$

当 $f(t)$ 是偶函数时，得

$$
f(t) = \frac{2}{\pi}\int_0^{+\infty}\left[\int_0^{+\infty}f(t)\cos\omega\tau\mathrm{d}\tau\right]\cos\omega t\mathrm{d}\omega,
$$

分别称为 **Fourier 正弦积分公式** 和 **Fourier 余弦积分公式**.

### Fourier 变换

称函数

$$
\mathscr{F}\left[f(t)\right] = F(\omega) = \int_{-\infty}^{+\infty}f(t)\mathrm{e}^{-i\omega t}\mathrm{d}t
$$

为 $f(t)$ 的 **Fourier 变换**，

$$
\mathscr{F}^{-1}\left[f(t)\right] = f(t) = \frac{1}{2\pi}\int_{-\infty}^{+\infty}F(\omega)\mathrm{e}^{i\omega t}\mathrm{d}\omega
$$

为 $F(\omega)$ 的 **Fourier 逆变换**.

当 $f(t)$ 为奇函数时，

$$
\mathscr{F}_s[f(t)] = F_s(\omega) = \int_0^{+\infty}f(t)\sin\omega t\mathrm{d}t
$$

称为 $f(t)$ 的 **Fourier 正弦变换**，

$$
\mathscr{F}_s^{-1}[F_s(\omega)] = f(t) = \frac{2}{\pi}\int_0^{+\infty}F_s(\omega)\sin\omega t\mathrm{d}\omega
$$

称为 $F(\omega)$ 的 **Fourier 正弦逆变换**；

当 $f(t)$ 为奇函数时，

$$
\mathscr{F}_c[f(t)] = F_c(\omega) = \int_0^{+\infty}f(t)\cos\omega t\mathrm{d}t
$$

称为 $f(t)$ 的 **Fourier 余弦变换**，

$$
\mathscr{F}_c^{-1}[F_c(\omega)] = f(t) = \frac{2}{\pi}\int_0^{+\infty}F_c(\omega)\cos\omega t\mathrm{d}\omega
$$

称为 $F(\omega)$ 的 **Fourier 余弦逆变换**.

当满足条件时，$F(\omega) = -2iF_s(\omega)$、$F(\omega) = 2F_c(\omega)$ 分别成立.

### Fourier 变换的性质

#### 线性性质

$$
\mathscr{F}[\alpha f(t) + \beta g(t)] = \alpha\mathscr{F}[f(t)]+\beta\mathscr{F}[g(t)]
$$

$$
\mathscr{F}^{-1}[\alpha F(\omega) + \beta G(\omega)] = \alpha\mathscr{F}^{-1}[F(\omega)]+\beta\mathscr{F}^{-1}[G(\omega)]
$$

#### 位移性质

$$
\mathscr{F}[f(t\pm t_0)]=\mathrm{e}^{\pm i\omega t_0}\mathscr{F}[f(t)]
$$

$$
\mathscr{F}^{-1}[F(\omega\pm\omega_0)]=\mathrm{e}^{\mp i\omega_0t}\mathscr{F}^{-1}[F(\omega)]
$$

#### 微分性质

$$
\mathscr{F}[f'(t)] = i\omega\mathscr{F}[f(t)]\\
\mathscr{F}[f^{(n)}(t)] = (i\omega)^n\mathscr{F}[f(t)]
$$

$$
\frac{\mathrm{d}}{\mathrm{d}\omega}F(\omega) = \mathscr{F}[-itf(t)]
$$

$$
\frac{\mathrm{d}^n}{\mathrm{d}\omega^n}F(\omega) = (-i)^n\mathscr{F}[t^nf(t)]
$$

#### 积分性质

$$
\mathscr{F}\left[\int_{-\infty}^tf(t)\mathrm{d}t\right]=\frac{1}{i\omega}\mathscr{F}[f(t)]
$$

### 卷积

$f(t)$ 与 $g(t)$ 的卷积定义为

$$
f(t)*g(t)=\int_{-\infty}^{+\infty}f(\tau)g(t-\tau)\mathrm{d}\tau.
$$

卷积运算满足交换律、结合律、对加法的分配律、以及

$$
a[f(t)*g(t)]=[af(t)]*g(t)=f(t)*[ag(t)],
$$

$$
\frac{\mathrm{d}}{\mathrm{d}t}[f(t)*g(t)]=\left[\frac{\mathrm{d}}{\mathrm{d}t}f(t)\right]*g(t)=f(t)*\left[\frac{\mathrm{d}}{\mathrm{d}t}g(t)\right],
$$

$$
\int_{-\infty}^t[f(t)*g(t)]\mathrm{d}t=\left[\int_{-\infty}^tf(t)\mathrm{d}t\right]*g(t)=f(t)*\left[\int_{-\infty}^tg(t)\mathrm{d}t\right].
$$

对满足 Fourier 积分定理的条件的函数有

$$
\mathscr{F}[f(t)*g(t)]=F(\omega)\cdot G(\omega),
$$

称为**卷积定理**.

相同地，有

$$
\mathscr{F}[f(t)\cdot g(t)]=\frac{1}{2\pi}F(\omega)*G(\omega).
$$

### 常用 Fourier 变换

| |象原函数 $f(t)$ | 象函数 $F(\omega)$
:---:|:---: | :---:
矩形脉冲 | $\begin{cases}E, &\vert t\vert\le\dfrac{\tau}{2},\\\\ 0, &\mathrm{otherwise}\end{cases}$ | $2E\ \cfrac{\sin\dfrac{\omega\tau}{2}}{\omega}$
指数衰减 | $\begin{cases}0, &t<0,\\\\ \mathrm{e}^{-\beta t}, &t\ge0\ (\beta>0)\end{cases}$ | $\cfrac{1}{\beta+i\omega}$
钟形脉冲 | $A\mathrm{e}^{-\beta t^2}\ (\beta>0)$ | $\sqrt{\dfrac{\pi}{\beta}}A\mathrm{e}^{-\frac{\omega^2}{4\beta}}$
Fourier 核 | $\cfrac{\sin\omega_0t}{\pi t}$ | $\begin{cases}1, &\vert\omega\vert\le\omega_0,\\\\ 0, &\mathrm{otherwise}\end{cases}$
单位脉冲 | $\delta(t)$ | $1$
单位阶跃 | $u(t)$ | $\cfrac{1}{i\omega}+\pi\delta(\omega)$
复指数脉冲 | $\mathrm{e}^{a\vert t\vert},\ \Re(a)<0$ | $\cfrac{-2a}{\omega^2+a^2}$
余弦函数 | $\cos\omega_0t$ | $\pi[\delta(\omega+\omega_0)+\delta(\omega-\omega_0)]$
正弦函数 | $\sin\omega_0t$ | $i\pi[\delta(\omega+\omega_0)-\delta(\omega-\omega_0)]$
常数函数 | $1$ | $2\pi\delta(\omega)$
符号函数 | $\operatorname{sgn}t$ | $\cfrac{2}{i\omega}$


## Laplace 拉普拉斯变换

### Laplace 变换

对一个函数 $\varphi(t)$，乘上 $u(t)\mathrm{e}^{-\beta t}(\beta>0)$，再取 Fourier 变换，就得到了 Laplace 变换，即

$$
\varPhi(\omega) = \int_{-\infty}^{+\infty}\varphi(t)u(t)\mathrm{e}^{-\beta t}\mathrm{e}^{-i\omega t}\mathrm{d}t,
$$

令

$$
s=\beta + i\omega,\quad f(t)=\varphi(t)u(t),\quad F(s)=\varPhi\left(\frac{s-\beta}{i}\right),
$$

则有

$$
F(s) = \int_0^{+\infty}f(t)\mathrm{e}^{-st}\mathrm{d}t,
$$

若 $f(t)$ 在 $t\ge0$ 时有定义，且此式在复平面 $s$ 的某一区域内收敛，则此式称为 $f(t)$ 的 **Laplace 变换**，记作

$$
F(s) = \mathscr{L}[f(t)].
$$

象原函数 $f(t)$ | 象函数 $F(s)$ | 象原函数 $f(t)$ | 象函数 $F(s)$
:---: | :---: | :---: | :---:
$\delta(t)$ | $1$  | $\delta^{(n)}(t)$ | $s^n$
$1$ | $\cfrac{1}{s}$ | $t$ | $\cfrac{1}{s^2}$
$\dfrac{t^2}{2!}$ | $\dfrac{1}{s^3}$ | $\dfrac{t^{n-1}}{(n-1)!}$ | $\dfrac{1}{s^n}$
$\sin \omega t$ | $\cfrac{\omega}{s^2+\omega^2}$ | $\cos \omega t$ | $\cfrac{s}{s^2+\omega^2}$
$\sinh \omega t$ | $\cfrac{\omega}{s^2-\omega^2}$ | $\cosh \omega t$ | $\cfrac{s}{s^2-\omega^2}$
$t\sin \omega t$ | $\cfrac{2\omega s}{(s^2+\omega^2)^2}$ | $t\cos \omega t$ | $\cfrac{s^2-\omega^2}{(s^2+\omega^2)^2}$
$\mathrm{e}^{-at}$ | $\cfrac{1}{s+a}$ | $t\mathrm{e}^{-at}$ | $\cfrac{1}{(s+a)^2}$
$(1-at)\mathrm{e}^{-at}$ | $\cfrac{s}{(s+a)^2}$ | $1-\mathrm{e}^{-at}$ | $\cfrac{a}{s(s+a)}$


### Laplace 变换的性质

#### 线性性质

Laplace 正逆变换均具有线性性质.

#### 微分性质

在时域微分：

$$
\mathscr{L}\big[f'(t)\big] = sF(s)-f(0).
$$

在频域微分：

$$
\frac{\mathrm{d}}{\mathrm{d}s}F(s) = -\mathscr{L}\big[tf(t)\big].
$$

#### 积分性质

在时域积分：

$$
\mathscr{L}\left[\int_0^tf(t)\mathrm{d}t\right]=\frac{1}{s}F(s).
$$

在频域积分：

$$
\int_s^\infty F(s)\mathrm{d}s =  \mathscr{L}\left[\frac{f(t)}{t}\right].
$$

#### 位移性质（频移）

$$
\mathscr{L}\big[\mathrm{e}^{at}f(t)\big]=F(s-a),
$$

含 $a$ 项在两边异号.

#### 延迟性质（时移）

若 $t<0$ 时 $f(t)=0$，且 $\tau\ge0$，

$$
\mathscr{L}\big[f(t-\tau)\big]=\mathrm{e}^{-s\tau}F(s),
$$

含 $\tau$ 项在两边同号.

#### 初值定理

若下式有意义，则

$$
f(0) = \lim_{s\rightarrow\infty}sF(s).
$$

#### 终值定理

若 $sF(s)$ 的所有奇点都在复平面左半部，则

$$
f(+\infty) = \lim_{s\rightarrow0}sF(s).
$$

#### 卷积定理

卷积定理对 Laplace 变换亦成立，

$$
\mathscr{L}\big[f(t)*g(t)\big]=F(s)\cdot G(s),
$$

$$
\mathscr{L}\big[f(t)\cdot g(t)\big] = \frac{1}{2\pi j}F(s)*G(s).
$$
