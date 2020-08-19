# Complex Analysis

## 复变函数

### 一些公式

$$
\sqrt{z}=\pm \sqrt{z}
$$

$$
\overline{\mathrm{e}^z}=\mathrm{e}^{\overline{z}}
$$

$$
\bar{i}=\frac{1}{i}=-i
$$

$$
\operatorname{ch} iy=\cos y
$$

$$
\operatorname{sh} iy = i\sin y
$$

单位圆上，有
$$
\overline{z}=\frac{1}{z}
$$

$$
\int\frac{1}{z}\mathrm{d}z=\operatorname{Ln}z+c'=\ln z+c
$$

### 初等函数

指数函数

$$
\exp z = \mathrm{e}^x(\cos y + i\sin y)
$$

对数函数

$$
\operatorname{Ln}z = \ln |z| + i \operatorname{Arg}z
$$

对数函数主值

$$
\ln z = \ln |z| + i \arg z
$$

幂

$$
a^b = \mathrm{e}^{b\operatorname{Ln}a}
$$

三角函数

$$
\cos z = \frac{\mathrm{e}^{iz} + \mathrm{e}^{-iz}}{2}
$$

$$
\sin z = \frac{\mathrm{e}^{iz} - \mathrm{e}^{-iz}}{2i}
$$


反三角函数和反双曲函数

$$
\operatorname{Arcsin}z=-i\operatorname{Ln}\left(iz+\sqrt{1-z^2}\right)\\
\operatorname{Arccos}z=-i\operatorname{Ln}\left(z+\sqrt{z^2-1}\right)\\
\operatorname{Arctan}z=-\cfrac{i}{2}\operatorname{Ln}\frac{1+iz}{1-iz}
$$

$$
\operatorname{Arsh}z=\operatorname{Ln}\left(z+\sqrt{z^2+1}\right)\\
\operatorname{Arch}z=\operatorname{Ln}\left(z+\sqrt{z^2-1}\right)\\
\operatorname{Arth}z=\cfrac{i}{2}\operatorname{Ln}\frac{1+z}{1-z}
$$

欧拉公式的证明：令 $f(x) = \cfrac{\mathrm{e}^{i\theta}}{\cos\theta+i\sin\theta}$，易证 $f(x)$ 恒为零，而 $f(0) = 1$，由此得证.

### 光滑曲线

$x'(t)$ 与 $y'(t)$ 均连续，且不同时为零.

### 简单曲线

无重点的曲线，即 $\forall t_1, t_2, t_1\neq t_2, z(t_1) \neq z(t_2)$.


## 解析函数

### 解析函数

若 $f(z)$ 在 $z_0$ 及其邻域内处处可导，则称 $f(z)$ 在 $z_0$ 解析.

### 柯西-黎曼方程

若 $f(x+iy) = u(x, y) + iv(x, y)$ 在 $(x, y)$ 可微，且满足 C-R 方程

$$
\frac{\partial u}{\partial x} = \frac{\partial v}{\partial y}, \quad
\frac{\partial u}{\partial y} = -\frac{\partial v}{\partial x},
$$

则 $f$ 在 $(x, y)$ 解析. 反之亦成立.

由此可以推出导数公式

$$
f'(z) = \frac{\partial u}{\partial x} + i\frac{\partial v}{\partial x} = \frac{1}{i} \frac{\partial u}{\partial y} + \frac{\partial v}{\partial y}.
$$


#### 柯西-黎曼方程的极坐标形式

$$
\frac{\partial u}{\partial r}= \frac{1}{r}\frac{\partial v}{\partial \theta},\\ \ \\
\frac{\partial v}{\partial r}= -\frac{1}{r}\frac{\partial u}{\partial \theta}.
$$


### 调和函数

二元实函数 $\varphi(x, y)$ 若在某区域满足拉普拉斯方程

$$
\frac{\partial^2\varphi}{\partial x^2} + \frac{\partial^2\varphi}{\partial y^2} = 0,
$$

则称 $\varphi$ 在此区域内为调和函数. 函数在解析区域内，实虚部均为调和函数.

若 $f$ 解析，

$$
\left(\frac{\partial}{\partial x}\left|f(z)\right|\right)^2+\left(\frac{\partial}{\partial y}\left|f(z)\right|\right)^2=\left|f'(z)\right|^2.
$$

### 共轭调和函数的不可交换性

若 $f(z)=u+iv$ 解析，则称 $v$ 是 $u$ 的共轭调和函数，但是 $u$ 一般不是 $v$ 的共轭调和函数.

## 复积分

### 复积分

若 $f(z)$ 连续，且 $C$ 为光滑曲线，则

$$
\int_Cf(z)\mathrm{d}z = \int_C(u+iv)(\mathrm{d}x+i\mathrm{d}y).
$$

### 一个重要的积分

$C$ 为以 $z_0$ 为圆心，$r$ 为半径的正向圆周，$n\in\mathbb{Z}$，则积分

$$
\oint_C \frac{\mathrm{d}z}{(z-z_0)^n}
$$

当 $n=1$ 时结果为 $2\pi i$，否则为零.

### 柯西积分定理（柯西-古萨基本定理）

$f(z)$ 在单连通的解析区域内任一条封闭曲线上的积分为零.

### 柯西积分公式

如果 $f(z)$ 在区域 $D$ 内处处解析，$C$ 为 $D$ 内任意一条正向简单闭曲线，$z_0$ 为 $C$ 内的任一点，则

$$
f(z_0) = \frac{1}{2\pi i}\oint_C \frac{f(z)}{z-z_0}\mathrm{d}z.
$$

### 高阶导数公式

对柯西积分公式进行推广，在同样的条件下，

$$
f^{(n)}(z_0) = \frac{n!}{2\pi i}\oint_C\frac{f(z)}{(z-z_0)^{n+1}}\mathrm{d}z.
$$

## 复级数

### Abel 定理

若 $\sum\limits_{n=0}^{\infty}c_nz^n$ 在 $z=z_0$ 收敛，则对任意满足 $|z|<|z_0|$ 的 $z$ 均收敛；若在 $z=z_0$ 发散，则对任意满足 $|z|>|z_0|$ 的 $z$ 均发散.

### 泰勒级数

若 $f(z)$ 在以 $z_0$ 为圆心的某圆域 $|z-z_0|<R$ 内处处解析，将其在 $z_0$ 展开为幂级数，得到泰勒级数

$$
f(z) = \sum_{n=0}^\infty c_n (z-z_0)^n, \quad c_n = \frac{1}{n!}f^{(n)}(z_0).
$$

### 洛朗级数

若 $f(z)$ 在以 $z_0$ 为圆心的圆环域 $R_1 < |z-z_0| < R_2$ 内处处解析，且 $C$ 为该圆环域内任意一条绕 $z_0$ 的正向简单闭曲线，$n\in\mathbb{Z}$，则有洛朗级数

$$
f(z) = \sum_{n=-\infty}^\infty c_n (z-z_0)^n, \quad c_n = \frac{1}{2\pi i}\oint_C\frac{f(z)}{(z-z_0)^{n+1}}\mathrm{d}z.
$$

## 留数

### 奇点的种类

奇点即使函数不解析的点. 奇点并不一定是孤立的，如 $\dfrac{1}{\sin 1/z}$ 的一个奇点 $z=0$ 就不是孤立的.

某点（奇点）洛朗级数中若最高负幂项次数为 $-m$，则此点称为 $m$ 级极点；若次数为 $-\infty$，则称为本性奇点；若不含负幂项，则称为可去奇点.

### 留数

$$
\mathop{\mathrm{Res}}\limits_{z=z_0}f(z) = c_{-1} = \frac{1}{2\pi i}\oint f(z)\mathrm{d}z.
$$

### 留数定理

若区域 $D$ 内仅含 $n$ 个奇点 $z_1, z_2, \cdots, z_n$，$C$ 为 $D$ 内一条包围诸奇点的正向简单闭曲线，则

$$
\oint_C f(z)\mathrm{d}z = 2\pi i\sum_{k=1}^n \mathop{\mathrm{Res}}\limits_{z=z_k}f(z).
$$

### 扩充复平面中的留数

若 $f(z)$ 在扩充复平面内只有有限个孤立奇点，则它们的留数之和为零.
