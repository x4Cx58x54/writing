# Jacobian Matrix

雅可比矩阵描述的是线性空间中变换的导数。以一个二维空间为例：设点 $\boldsymbol{a} = (x_a, y_a)$ 经过变换 $f = (f_x, f_y)$ 后映射到了 $f(\boldsymbol{a}) = \boldsymbol{b} = (x_b, y_b)$ 上，即

$$
f_x(x_a, y_a) = x_b,\\
f_y(x_a, y_a) = y_b.
$$

若无穷小量 $\varepsilon_x$ 和 $\varepsilon_y$ 带来的扰动使 $\boldsymbol{a}$ 偏移到了 $\boldsymbol{a} + (\varepsilon_x, \varepsilon_y)$，分开考虑两个基底方向上的扰动：

$$
\begin{aligned}
&f_x(x_a + \varepsilon_x , &y_a&&\hspace{-1em}) = x_b + \tfrac{\partial f_x}{\partial x} \varepsilon_x,\\
&f_x(x_a , &y_a& + \varepsilon_y&\hspace{-1em}) = x_b + \tfrac{\partial f_x}{\partial y} \varepsilon_y,\\
&f_y(x_a + \varepsilon_x , &y_a&&\hspace{-1em}) = y_b + \tfrac{\partial f_y}{\partial x} \varepsilon_x,\\
&f_y(x_a , &y_a& + \varepsilon_y&\hspace{-1em}) = y_b + \tfrac{\partial f_y}{\partial y} \varepsilon_y.
\end{aligned}
$$

综上，有

$$
f\left(\boldsymbol{a} +
\begin{bmatrix}
\varepsilon_x\\
\varepsilon_y
\end{bmatrix}\right) = f(\boldsymbol{a}) +
\begin{bmatrix}
\frac{\partial f_x}{\partial x} & \frac{\partial f_x}{\partial y}\\[0.5em]
\frac{\partial f_y}{\partial x} & \frac{\partial f_y}{\partial y}
\end{bmatrix}
\begin{bmatrix}
\varepsilon_x\\
\varepsilon_y
\end{bmatrix}.
$$

其中矩阵

$$
\boldsymbol{J} = \begin{bmatrix}
\dfrac{\partial f_x}{\partial x} & \dfrac{\partial f_x}{\partial y}\\[1.2em]
\dfrac{\partial f_y}{\partial x} & \dfrac{\partial f_y}{\partial y}
\end{bmatrix}
$$

即为 $f$ 的雅可比矩阵，很容易可以看到它的意义即为 $f$ 的导数

$$
\boldsymbol{J} = \mathrm{D}f.
$$

特别地，当 $f: \mathbb{R}^n \mapsto \mathbb{R}$ 时，$\mathrm{D}f$ 为梯度 $\nabla f$；当 $f: \mathbb{R}^n \mapsto \mathbb{R}^m$ 时，$\mathrm{D}f$ 为雅可比矩阵。

定义：函数 $f(x_1, x_2, \cdots, x_n) = (f_1, f_2, \cdots, f_m)$ 的雅可比矩阵为以下元素组成的矩阵

$$
J_{ij} = \frac{\partial f_i}{\partial x_j}.
$$

---

在对积分变量进行换元时，即需要使用雅可比矩阵。简单起见，先以一元积分为例：

$$
\int_a^b f(x) \mathrm{d}x,
$$

将 $x$ 换元为 $y$，满足关系 $x = h(y)$，则原积分化为

$$
\int_{h^{-1}(a)}^{h^{-1}(b)}f(h(y))\ \mathrm{d}(h(y)),
$$

其中的 $\mathrm{d}x$ 的转化可以理解为 $\mathrm{d}(h(y)) \mapsto \det(\boldsymbol{J}_h)\mathrm{d}y = h'(y)\mathrm{d}y$（注意：行列式的意义在于空间被放缩的比例）。

在二维区域上进行积分时，从直角坐标系到极坐标系的变换为

$$
h(x, y) = (r\cos\theta, r\sin\theta)
$$

那么积分的转换为

$$
\begin{aligned}
\iint_S f(x, y) \mathrm{d}x\mathrm{d}y
&= \iint_{S'} f(r\cos\theta, r\sin\theta)\det(\boldsymbol{J}_h)\mathrm{d}r\mathrm{d}\theta\\
&= \iint_{S'} f(r\cos\theta, r\sin\theta)\left|\frac{\partial(x, y)}{\partial(r, \theta)}\right|\mathrm{d}r\mathrm{d}\theta\\
&= \iint_{S'} f(r\cos\theta, r\sin\theta)\begin{vmatrix}\frac{\partial x}{\partial r} & \frac{\partial x}{\partial \theta}\\[0.3em]\frac{\partial y}{\partial r} & \frac{\partial y}{\partial \theta}\end{vmatrix}\mathrm{d}r\mathrm{d}\theta\\
&= \iint_{S'} f(r\cos\theta, r\sin\theta)\begin{vmatrix}\cos\theta & -r\sin\theta\\ \sin\theta & r\cos\theta\end{vmatrix}\mathrm{d}r\mathrm{d}\theta\\
&= \iint_{S'} f(r\cos\theta, r\sin\theta)r\mathrm{d}r\mathrm{d}\theta.
\end{aligned}
$$

上式第二行使用的是雅可比行列式（Jacobian determinant）的一种写法。
