# Matrix Algebra

> *Matrix Algebra: Theory, Computations and Applications in Statisitcs*  
*James E. Gentle [http://mason.gmu.edu/~jgentle/books/matbk.htm](http://mason.gmu.edu/~jgentle/books/matbk.htm){:target="_blank"}*  
*2007, Springer, 2017, 世界图书出版公司*

---

## Vector Spaces

### Dimension and Order

The maximum number of linearly independent vectors in a vector space is the dimension of the vector space. The length or order of the vectors in the space is the order of the vector space.

### Essentially Disjoint

若两向量空间之交集仅含加法单位元，则称它们 essentially disjoint.

### Sum and Direct Sum

若两向量空间之和 $\mathcal{V} = \mathcal{V}_1 + \mathcal{V}_2$，则

$$
\mathcal{V} = \{v \operatorname{|} v = v_1 + v_2,~v_1 \in \mathcal{V}_1,~v_2 \in \mathcal{V}_2\}.
$$

若 $\mathcal{V}_1$ 与 $\mathcal{V}_2$ essentially disjoint，则该关系可写为直和

$$
\mathcal{V} = \mathcal{V}_1 \oplus \mathcal{V}_2.
$$

### $L_p$ 范数

$$
\|x\|_p = \left(\sum_i |x_i|^p\right)^{1/p}.
$$

在 $p \ge 1$ 时， $\|x\|_p$ 是 $p$ 的不增函数.

对于任意的 $a$-范数和 $b$ 范数，总存在实数 $r$ 与 $s$ 使对于任意 $x$ 都有

$$
r\|x\|_b \le \|x\|_a \le s\|x\|_b.
$$

这是一个自反、对称且传递的关系，故这说明了范数的等价性.

### 正交向量空间

若向量空间 $\mathcal{V}_1 + \mathcal{V}_2 = \mathcal{V}$ 且 $\mathcal{V}_1 \oplus \mathcal{V}_2 = \mathcal{V}$，则称 $\mathcal{V}_2$ 是 $\mathcal{V}_1$ 对于 $\mathcal{V}$ 的正交补.

若 $\mathcal{V}_1$ 与 $\mathcal{V}_2$ 为 $\mathcal{V}$ 中相互正交的子空间，且 $\dim \mathcal{V}_1 + \dim \mathcal{V}_2 = \dim \mathcal{V}$，则 $\mathcal{V} \oplus \mathcal{V}_2 = \mathcal{V}$.

### Parseval 等式

设 $u_1, u_2, \cdots, u_n$ 为空间中一组正交基，且 $x = \sum\limits_{i=1}^n c_iu_i$，则有 Parseval 等式

$$
\|x\|^2 = \sum_{i=1}^n c_i^2.
$$

在 Fourier 展开中，有

$$
\left\|x - \sum_{i=1}^k c_iu_i\right\|^2 = \langle x, x\rangle - \sum_{i=1}^k c_i^2
$$

其中 $k$ 是不大于 $n$ 的非负整数.

### 几何结构

#### 线性结构

在一个 $n$ 维向量空间中，由 $m\ (< n)$ 个方程

$$
\begin{cases}
c_1^\top x = b_1 \\
\qquad\vdots\\
c_m^\top x = b_m
\end{cases}
$$

所确定的 $x$ 的解的集合称为一个 flat. 当方程组齐次时，这个 flat 是 $n-m$ 维的向量空间. 当 $m=1$ 时，为一超平面.

#### 锥

若 $\forall x \in C$ 与 $\forall a \ge 0$，均有 $ax \in C$ 则称 $C$ 为锥.

若 $\forall x_1, x_2 \in C$ 与 $\forall a, b \ge 0$，均有 $ax_1 + bx_2 \in C$ 则称 $C$ 为凸锥.

对于一个锥 $C$，定义其对偶锥（dual cone）$C^*$ 为

$$
C^* = \{x^* ~|~ \forall x \in V,~ x^{*\top}x \ge 0\},
$$

定义其极锥（polar cone）$C^0$ 为

$$
C^0 = \{x^0 ~|~ \forall x \in V,~ x^{0\top}x \le 0\}.
$$

几何上，$C^*$ 包含所有与锥 $C$ 中向量均成锐角或直角的向量. 显然 $C^0 = -C^*$ 和 $(-C)^* = -C^*$.

### 中心化向量

向量 $x$ 减去其均值向量 $\bar{x}$ 的过程称为中心化，得到**中心化向量**（centered vector）$x_c = x - \bar{x}$.

均值向量 $\bar{x}$ 在几何上恰为 $x$ 在 $1_n$ 上的投影，这样它们和 $x_c$ 恰构成一个直角三角形，于是有

$$
\|x\|^2 = \|\bar{x}\|^2 + \|x_c\|^2,
$$

展开得到

$$
\sum_i (x_i - \bar{x})^2 = \sum_i x_i^2 - n\bar{x}^2.
$$

### 标准差、方差、协方差

$x$ 的**方差**定义为

$$
s_x = \frac{\|x_c\|}{\sqrt{n-1}}.
$$

向量 $x$ 的 **scaled vector** 定义为

$$
x_s = \frac{x}{s_x} = \sqrt{n-1}\frac{x}{\|x_c\|},
$$

**centered and scaled vector** 定义为

$$
x_{cs} = \frac{x_c}{s_x} = \sqrt{n-1}\frac{x_c}{\|x_c\|},
$$

以上过程又称为标准化.

向量 $x$ 的**方差**定义为

$$
\begin{aligned}
\mathrm{V}(x) &= s_x^2 \\
&= \frac{\|x_c\|^2}{n-1} \\
&= \frac{\|x\|^2 - \|\bar{x}\|^2}{n-1} \\
&= \frac{1}{n-1}\sum_i (x_i - \bar{x})^2.
\end{aligned}
$$

同样地，对任意实数 $a$ 和 $b$，向量方差也满足

$$
\mathrm{V}(ax+b) = a^2\mathrm{V}(x).
$$

$x$ 与 $y$ 的**协方差**定义为

$$
\operatorname{Cov}(x, y) = \frac{\langle x-\bar{x},\ y-\bar{y}\rangle}{n-1} = \frac{\langle x, y\rangle - n\bar{x}\bar{y}}{n-1}.
$$

协方差的重要性质有

* $\mathrm{V}(x+y) = \mathrm{V}(x) + \mathrm{V}(y) + 2\operatorname{Cov}(x, y)$;
* $\operatorname{Cov}(a1, y) = 0$;
* $\operatorname{Cov}(x, x) = \mathrm{V}(x)$;
* $\operatorname{Cov}(x+y, z) = \operatorname{Cov}(x, z) + \operatorname{Cov}(y, z)$.

$x$ 与 $y$ 的**相关系数**定义为

$$
\begin{aligned}
\operatorname{Corr}(x, y) &= \operatorname{Cov}(x_{cs}, y_{cs}) \\
&= \left\langle\frac{x_c}{\|x_c\|}, \frac{y_c}{\|y_c\|}\right\rangle \\
&= \frac{\langle x_c, y_c\rangle}{\|x_c\|\|y_c\|} \\
&= \cos(\operatorname{angle}(x_c, y_c)) \\
&= \frac{\operatorname{Cov}(x, y)}{\sqrt{\mathrm{V}(x)\mathrm{V}(y)}}.
\end{aligned}
$$

相关系数的值一定在 $[-1, 1]$ 上. 若为 1，则两向量同向；若为 -1，则两向量反向；若为 0，则两向量正交.

对任意实数 $a$，有 $\operatorname{Corr}(ax, y) = \operatorname{sign}(a)\operatorname{Corr}(x, y)$.

## Matrices

### Basic Definitions

The column space of $A$ is also called the range of $A$ or the manifold of $A$, and it is denoted by $\mathcal{V}(A)$ or $\operatorname{span}(A)$.

无论矩阵 $A_{m\times n}$ 是否为方阵，都定义有主对角线（pricinpal diagonal）$\{a_{ii}\}$、codiagonal or minor diagonal $a_{i, i + c_k}$、斜对角线（skew diagonal）$a_{i, m+1-i}$. 对应地有对角矩阵和斜对角矩阵.

若 $A$ 中除了 $a_{i, i+c_k}, c_k \in\{-w_l, \cdots, -1, 0, 1, \cdots, w_u\}$ 以外的元素均为 0，则称此矩阵为 band matrix，其中 $w_l$ 称为 lower band width. 若 upper 和 lower band width 均为 1，则称矩阵为 tridiagonal matrix.

$\operatorname{vecdiag}(A)$ 取出 $A$ 中的对角元素作为向量，得到 $(a_{11}, \cdots, a_{kk})$.

$\operatorname{vec}(A)$ 将 $A$ 的各列取出排列为向量，得到 $(a_1^\top, \cdots, a_m^\top)$

矩阵的直和（direct dum）为 $A\oplus B = \operatorname{diag}(A, B)$，参与运算的两矩阵并不必须形状相同，也不必须是方阵.

### Determinants

方阵 $A$ 的**行列式**定义为

$$
|A| = \sum_{\pi_j}\sigma(\pi_j)a_{1j_1}a_{2j_2}\cdots a_{nj_n},
$$

其中 $\pi_j$ 为 1 至 $n$ 的整数的排列 $(j_1, j_2, \cdots, j_n)$，$\sigma(\pi_j)$ 根据该排列的奇偶性分别得到 -1 和 1.

矩阵中某元素 $a_{ij}$ 对应的**余子式**（minor，complementary minor）定义为去除该元素所在行与列所得子矩阵之行列式，记为 $|A_{-(i)(j)}|$.

余子式与其对应的符号 $(-1)^{i+j}$ 一起称为**代数余子式**（cofactor），记为

$$
a_{(ij)} = (-1)^{i+j}|A_{-(i)(j)}|.
$$

注意，余子式与代数余子式均为标量.

由此，可将行列式在行或列上按（代数）余子式展开，称为 **Laplace expansion**：

$$
|A| = \sum_{i=1}^n a_{ij}a_{(ij)} = \sum_{j=1}^n a_{ij}a_{(ij)}.
$$

对于 $k\neq i$，

$$
\sum_{i=1}^n a_{kj}a_{(ij)} = 0
$$

此式相当于将行 $i$ 用行 $k$ 代替，再计算矩阵的行列式.

方阵 $A$ 的**伴随矩阵**（adjugate matrix，adjoint matrix）定义为

$$
\operatorname{adj}(A) = (a_{(ji)}) = (a_{(ij)})^\top.
$$

由于

$$
\sum_k a_{ik}(\operatorname{adj}(A))_{kj} =
\begin{cases}
|A|,& i = j, \\
0,& i\neq j.
\end{cases}
$$

可得

$$
A\operatorname{adj}(A) = \operatorname{adj}(A)A = |A|I,
$$

即

$$
A^{-1} = \frac{1}{|A|}\operatorname{adj}(A).
$$

### Two Monomial Factorizations

对任意正整数 $k$，

$$
I - A^k = (I-A)(I+A+\cdots+A^{k-1}).
$$

对任意正奇数 $k$，

$$
I + A^k = (I+A)(I-A+\cdots+A^{k-1}).
$$

### Elementary Transformation Matrices

* 交换行/列：$E_\pi$，其中 $\pi$ 是需要交换的行/列序号，例如

$$
E_{32} = E_{23} = \begin{bmatrix}
1 & 0 & 0 \\
0 & 0 & 1 \\
0 & 1 & 0
\end{bmatrix}.
$$

显然有 $E_\pi^\top E_\pi = I$.

* 标量 $a$ 乘以第 $p$ 行/列：$E_p(a)$，例如

$$
E_2(a) = \begin{bmatrix}
1 & 0 & 0 \\
0 & a & 0 \\
0 & 0 & 1
\end{bmatrix}.
$$

* 将第 $p$ 行/列的 $a$ 倍加至第 $q$ 行/列：$E_{pq}(a)$，例如

$$
E_{23}(a) = \begin{bmatrix}
1 & 0 & 0 \\
0 & 1 & a \\
0 & 0 & 1
\end{bmatrix}.
$$

**Premultiplication** operates on rows,  
**Postmultiplication** operates on columns.

### Bilinear and Quadratic Forms, Definiteness

$x^\top Ay$ 称为**双线性形**，而 $x^\top Ax$ 称为**二次型**. 广义上来说，并不要求二次型中的 $A$ 是对称阵，但是对任意的 $A$，都有且仅有一个对称阵 $A_s = \frac{1}{2}\left(A+A^\top\right)$ 使得 $x^\top Ax = x^\top A_sx$. 故在讨论二次型时，只针对 $A$ 对称的情况.

记 $A$ 半正定为 $A \succeq 0$，$A$ 正定为 $A \succ 0$. $A \succ B$（$A \succeq B$）表示 $A-B$（半）正定.

### Anisometric Spaces

之前所讨论的向量空间都是**等距**（isometric）的，其中两向量 $x$ 与 $y$ 内积定义为 $x^\top Iy$. 若描述内积的矩阵为任意矩阵，则称该空间是**非等距**（anisometric）的. 例如各坐标轴保持相互垂直，但单位长度不同的空间中，将各轴相对长度之倒数作为对角阵 $D$ 对角线上各项，则该非等距空间中的内积为 $x^\top Dy$. 为了能够扩展点积（确保自乘时非负），一般还要求矩阵是正定的. 此时 $L_2$ 范数扩展为 $\|x\|_A = \sqrt{x^\top Ax}$，称为 elliptic norm 或 conjugate norm. 由此又可引出 elliptic metric. 在这种度量下两向量 $x$ 与 $y$ 的距离为 $\sqrt{(x-y)^\top A(x-y)}$. Mahalanobis 距离则是一个常用的例子：$\sqrt{(x-y)^\top S^{-1}(x-y)}$，其中 $S$ 为样本协方差矩阵.

### Other Kinds of Matrix Multiplication

矩阵乘法一般指 Cayley 乘法，而事实上还定义有其它的乘法.

#### The Hadamard Product

Hadamard 乘法定义为两同形矩阵的对应元素相乘.

#### The Kronecker Product

两任意矩阵 $A_{m\times n}$ 与 $B_{p\times q}$ 之 Kronecker 积定义为

$$
A\otimes B = \begin{bmatrix}
a_{11}B & \cdots & a_{1n}B \\
\vdots & \ddots & \vdots \\
a_{m1}B & \cdots & a_{mn}B
\end{bmatrix}.
$$

这是一个 $\mathbb{R}^{m\times n} \otimes \mathbb{R}^{p\times q} \mapsto \mathbb{R}^{mp\times nq}$ 的映射.

Kronecker 乘法又称为直积或右直积（左直积相当于互换 $A$、$B$ 位置）.

显然这种乘法并不服从交换律（commutative），但服从分配律（associative）与对加法的分配律（distributive）. 它的单位元为 $[1]$.

#### The Dot Product

两同形矩阵 $A_{m\times n}$ 与 $B_{m\times n}$ 的点积是向量点积的扩展：

$$
A\cdot B = \langle A, B\rangle = \sum_{i=1}^m\sum_{j=1}^n a_{ij}b_{ij}.
$$

可以证明

$$
A\cdot B = \operatorname{Tr}(A^\top B).
$$

该点积仍保持了向量点积的一般性质：

* 若 $A \neq 0$，$A\cdot A > 0$;
* $0\cdot A = 0$;
* $A\cdot B = B\cdot A$;
* $(sA)\cdot B = s(A\cdot B)$;
* $(A+B)\cdot C = A\cdot C + B\cdot C$;
* $A\cdot B \le \sqrt{A\cdot A}\sqrt{B\cdot B}$.

当 $A\cdot B = 0$ 时，称该两矩阵正交.

对向量空间 $\mathbb{R}^{m\times n}$ 的一组基 $\{U_1, U_2, \cdots, U_k\}$，

$$
U_i\cdot U_j = \begin{cases}
0, & i \neq j ,\\
1, & i = j.
\end{cases}
$$

空间内任意矩阵均可 Fourier 展开为

$$
A = \sum_{i=1}^k c_i U_i,
$$

其中 $c_i = A\cdot U_i$.

### Equivalent Matrices Forms

秩为 $r$ 的矩阵由一系列初等变换可变换为其**等价标准型**

$$
PAQ = \begin{bmatrix}
I_r & 0 \\
0 & 0
\end{bmatrix},
$$

其中 $P$ 与 $Q$ 为初等矩阵，$r$ 为 $A$ 的秩.

矩阵的**厄密特标准型**（Hermite form）$H$ 满足：

* $h_{ii} = 0$ 或 $1$，
* 若 $h_{ii} = 0$，则对任意 $j$，$h_{ij} = 0$，
* 若 $h_{ii} = 1$，则对任意 $k\neq j$，$h_{ki} = 0$.

$H$ 显然是幂等的.

矩阵还有其它的等价形式如阶梯形、若尔当标准型等.

### Preservation of Positive Definiteness

若 $C$ 正定，$A$ 为形状符合条件的列满秩矩阵，则 $A^\top CA$ 仍正定. 反之，若 $A^\top CA$ 正定，则 $A$ 列满秩.

### Gramian Matrix $A^\top A$

显然，

$$
\operatorname{Tr}(A^\top A) = 0 \Leftrightarrow A = 0,
$$

由此可推出

$$
A^\top A = 0 \Leftrightarrow A = 0.
$$

$A^\top A$ 是半正定的. 当且仅当 $A$ 列满秩，$A^\top A$ 正定.

通过构造方程 $A^\top A(B-C) = 0$，左乘 $(B^\top - C^\top)$ 可得

$$
A^\top AB = A^\top AC \Leftrightarrow AB = AC,
$$

$$
BA^\top A = CA^\top A \Leftrightarrow BA^\top = CA^\top.
$$

$\operatorname{rank}(A^\top A) = \operatorname{rank}(AA^\top) = \operatorname{rank}(A)$，故 $A^\top Ax = A^\top b$ 一定有解.

### Inverses of Sum of Matrices

对于相同形状的满秩矩阵 $A$ 与 $B$，有以下等式成立：

* $A(I+A)^{-1} = (I+A^{-1})^{-1}$；
* $(A + BB^\top)^{-1}B = A^{-1}B(I+B^\top A^{-1}B)^{-1}$；
* $(A^{-1} + B^{-1})^{-1}  = A(A+B)^{-1}B$；
* $A - A(A+B)^{-1}A = B - B(A+B)^{-1}B$；
* $A^{-1} + B^{-1} = A^{-1}(A+B)B^{-1}$；
* $(I+AB)^{-1} = I - A(I+BA)^{-1}B$；
* $(I+AB)^{-1}A = A(I+BA)^{-1}$.

若 $A$ 或 $B$ 的逆不存在，则使用伪逆替换之，这些关系仍然成立.

和复数类似地有：当 $\|A\| < 1$ 时，

$$
(I-A)^{-1} = I + A + A^2 + A^3 + \cdots.
$$

### Determinants of Partitioned Matrices

若 $A$ 分块为 $\begin{bmatrix}A_{11} & A_{12} \\ A_{21} & A_{22}\end{bmatrix}$，且 $A_{11}$ 可逆，则

$$
|A| = |A_{11}|\left|A_{22} - A_{21}A_{11}^{-1}A_{12}\right|.
$$

上式中的 $A_{22} - A_{21}A_{11}^{-1}A_{12}$ 称为 $A$ 中 $A_{11}$ 的**舒尔补**（Schur complement）.

### Generalized Inverses and Pseudoinverse

若 $G$ 满足 $AGA = A$ 则称 $G$ 为 $A$ 的**广义逆**，记为 $A^-$. 广义逆满足

$$
(A^\top)^- = (A^-)^\top,
$$

$$
\operatorname{rank}(A^-A) = \operatorname{rank}(AA^-) = \operatorname{rank}(A),
$$

$$
(I - A^-A)(I - A^-A) = I - A^-A.
$$

符合以上定义的 $A^-$ 可能并不是唯一的，在这个基础上，可以递进地加入限制条件，得到越来越严格的广义逆定义. 这些条件按顺序如下.

1. $AA^-A=A$. 即广义逆的基础定义. 此时 $A^-$ 又称为 $g_1$ inverse 或 inner pseudoinverse
2. $A^-AA^-=A^-$. 此时的广义逆记为 $A^*$ 称为 $g_2$ inverse、$g_{12}$ inverse、outer pseudoinverse 或 reflexive generalized inverse.
3. $A^-A$ 对称. 此时的广义逆又称为 $g_3$ inverse、$g_{123}$ inverse.
4. $AA^-$ 对称. 此时的广义逆记为 $A^+$，又称为 Moore-Penrose inverse、pseudoinverse 或 normalized generalized inverse.

### Eigenanalysis

若 $Av = \lambda v$，其中 $\lambda$ 和 $v$ 分别为 $A$ 的特征值和对应的特征向量，则有以下性质：

* $bv$ 亦为 $A$ 的特征向量，其中 $b$ 为非零实数；
* $b\lambda$ 亦为 $A$ 的特征值，其中 $b$ 为非零实数；
* 若 $A$ 可逆，则 $1/\lambda$ 和 $v$ 是 $A^{-1}$ 的一组特征值和特征向量；
* 若 $A$ 是方阵，则 $1/\lambda$ 和 $v$ 是 $A^+$ 的一组特征值和特征向量；
* 若 $A$ 是三角矩阵，则其各特征值即为其对角线上的元素，对应的特征向量为各单位向量.
* $\lambda^k$ 和 $v$ 是 $A^k$ 的一组特征值和特征向量；
* $\lambda$ 也是 $A^\top$ 的特征值；
* $\bar{\lambda}$ 和 $\bar{v}$ 是 $A$ 的一组特征值和特征向量，其中 $\bar{\cdot}$ 表示共轭复数；
* $\lambda\bar{\lambda}$ 是 $A^\top A$ 的特征值.

矩阵 $A$ 的特征多项式记为 $p_A(\cdot)$. Cayley-Hamilton 定理：若 $A$ 为 ${n\times n}$ 矩阵，则

$$
p_A{A} = 0_n.
$$

对任意 $n$ 阶多项式均可构造一个矩阵，使这个多项式是矩阵的特征多项式. 设多项式的形式为

$$
p(x) = a_0 + a_1x + \cdots + a_{n-1}x^{n-1} + x^n,
$$

则对应的矩阵为

$$
\begin{bmatrix}
0 & 1 & 0 & \cdots & 0 \\
0 & 0 & 1 & \cdots & 0 \\
 & \vdots & & \ddots & \\
0 & 0 & 0 & \cdots & 1 \\
-a_0 & -a_1 & -a_2 & \cdots & -a_{n-1}
\end{bmatrix}.
$$

#### Left Eigenvectors

左特征向量 $w$ 使得

$$
w^\top A = \lambda w^\top,
$$

即 $w$ 是 $A^\top$ 的特征向量. 相应地，以上 $v$ 又称为右特征向量. 由于 $A$ 与 $A^\top$ 的特征值相同，每个特征值都对应一组左右特征向量. 若 $w$ 和 $v$ 对应的特征值不同，则 $w\cdot v = 0$.

#### The Spectrum

记矩阵 $A_{n\times n}$ 的各不相同的特征值为 $\lambda_1, \lambda_2, \cdots, \lambda_k$，则 $A$ 的**谱**（spectrum）记为

$$
\sigma(A) = \{\lambda_1, \lambda_2, \cdots, \lambda_k\}.
$$

习惯上将各特征值按照模长降序排列：

$$
|\lambda_1| > |\lambda_2| > \cdots > |\lambda_k|.
$$

$|\lambda_1|$ 称为**谱半径**，记为

$$
\rho(A) = |\lambda_1| = \max |\lambda_i|.
$$

对应的特征值 $\lambda_1$ 称为**主导特征值**（dominant eigenvalue），一般来说我们更关心它的模长.

谱半径满足

$$
\rho(A) \le \max_j \sum_k |a_{kj}|,
$$

$$
\rho(A) \le \max_k \sum_j |a_{kj}|.
$$

#### Geometric and Algebraic Multiplicity

对第 $i$ 组特征值和特征向量，有 $(A - \lambda_iI)v_i = 0$. 故 $v_i$ 在 $\mathcal{N}(A-\lambda_iI)$ 中（$A-\lambda_iI$ 不可能满秩），该向量空间称为对应 $\lambda_i$ 的**特征空间**（eigenspace）.

与某特征值 $\lambda_i$ 对应的线性独立的特征向量可能有多个. 它们的非零线性组合，即该特征空间中的非零向量，都是对应 $\lambda_i$ 的特征向量，该特征空间的维数称为 $\lambda_i$ 的**几何重数**（geometric multiplicity）$g_i$，且满足

$$
\operatorname{rank}(A-\lambda_iI) + g_i = n.
$$

虽然特征值是非零的，但是仍可讨论对应 0 的几何重数，它正好是 $A$ 的零空间维数（零化度，nullity）.

特征方程中某根的重数即为该特征值的**代数重数**，简称为重数. 代数与几何重数相同的特征值称为半单特征值（semisimple eigenvalue）；代数重数为 1 的特征值称为简单特征值（simple eigenvalue）.

当特征多项式有 $m$ 重根时，产生代数重数为 $m$ 的特征值. 若它们各自对应的特征向量可以选取为线性独立的，则几何重数与代数重数相等；若这些特征向量线性相关，则特征向量矩阵不可逆，即原矩阵无法对角化，此时特征向量有代数重数个，但分布在几何重数维的空间中. 总而言之，几何重数不超过代数重数.

#### 对角化

矩阵 $A_{n\times n}$ 有 $n$ 个各不相同的特征值（从而必然对应 $n$ 个线性独立的特征向量）是 $A$ 可对角化的一个充分不必要条件. 可对角化定理（diagonalizablity theorem）说明了矩阵可对角化的充要条件：记 $A_{n\times n}$ 的各不相同的特征值为 $\lambda_1, \lambda_2, \cdots, \lambda_k$，对应的代数重数分别为 $m_1, m_2, \cdots, m_k$，若对 $l = 1, 2, \cdots, k$ 均有

$$
\operatorname{rank}(A - \lambda_i I) = n - m_i,
$$

即所有特征值都是半单的（即 $m_i$ 是 $(A - \lambda_i I)$ 的 rank deficiency），则 $A$ 可对角化.

若 $A$ 可对角化，则称其为 regular matrix 或 simple matrix，反之为 deficient / defective matrix.

若 $A$ 的特征分解为 $A = V\Lambda V^{-1}$，则

$$
|A| = |V\Lambda V^{-1}| = |V||\Lambda||V^{-1}| = |\Lambda|,
$$

$$
\operatorname{Tr}(A) = \operatorname{Tr}(V\Lambda V^{-1}) = \operatorname{Tr}(V^{-1}V\Lambda) = \operatorname{Tr}(\Lambda),
$$

且 $V$ 一定满秩，故 $A$ 和 $\Lambda$ 的秩相等. 同时各特征值的代数重数之和等于 $\operatorname{rank}(A)$.

由特征分解有 $A^k = V\Lambda^k V^{-1}$，从而

$$
\mathrm{e}^A = \sum_{k=0}^\infty \frac{A^k}{k!} = V\left(\sum_{k=0}^\infty\frac{A^k}{k!}\right)V^{-1}.
$$

#### Spectral Decomposition

$A$ 为对称矩阵，其特征向量 $v_i$ 选取为相互正交的，则其**谱分解**（Spectral Decomposition）为

$$
A = \sum_i \lambda_i v_i v_i^\top = V\Lambda V^{-1}.
$$

令 $P_i = v_iv_i^\top$，其满足

$$
P_iP_j = \begin{cases}
0, & i \neq j, \\
1, & i = j,
\end{cases}
$$

$$
\sum_iP_i = I,
$$

称为 spectral projectors，是相互正交的投影矩阵. 由此

$$
A = \sum_i \lambda_iP_i.
$$

不仅是特征矩阵，可对角化的矩阵也均可分解为以上形式，且 $P_i$ 保持以上形式，但不一定能写为特征向量外积的形式.

谱分解是一种 Fourier 展开，其各项系数即为特征值，可表示为

$$
\lambda_i = A\cdot(v_iv_i^\top).
$$

#### Powers of Matrices

若对称矩阵 $A$ 的特征值 $\lambda$ 对应特征向量 $v$，且通过放缩使得 $v^\top v = 1$，则由数学归纳法可证

$$
(A - \lambda vv^\top)^k = A^k - \lambda^kvv^\top.
$$

若 $A$ 不对称，则选取其满足 $w^\top v = 1$ 的左右特征向量 $w$ 与 $v$，有

$$
(A - \lambda vw^\top)^k = A^k - \lambda^kvw^\top.
$$

#### Rayleigh Quotient

在对称矩阵的谱分解 $A = V\Lambda V^\top = \sum\limits_i \lambda_i v_iv_i^\top$ 中，由于 $V$ 是满秩的，对任意的对应维数的向量 $x$ 一定存在 $b$ 使得 $x = Vb$，又由于 $V$ 是正交矩阵，$x^\top x = b^\top b$. 由此有

$$
\begin{aligned}
x^\top Ax &= x^\top \sum_i\lambda_iv_iv_i^\top x \\
&= \sum_i b_i^2\lambda_i \\
&\le \max(\lambda_i) \cdot x^\top x.
\end{aligned}
$$

当 $x^\top x \neq 0$ 时，定义**瑞利商**（Rayleigh Quotient）

$$
R_A(x) = \frac{x^\top Ax}{x^\top x},
$$

其最大值为 $\max(\lambda_i)$.

正定矩阵的瑞利商恒为正，半正定矩阵瑞利商恒非负

#### 矩阵的方根

若半正定矩阵 $A$ 的谱分解为 $A = V\Lambda V^\top$，将 $\Lambda$ 对角线元素各自取平方根，得到矩阵 $S$，则可定义 $A$ 的平方根

$$
A^{\frac{1}{2}} = VSV^\top.
$$

类似地还可以定义 $A^{\frac{1}{r}}$，其中 $r > 0$. 显然 $A^{\frac{1}{r}}$ 仍保持半正定. 若 $A$ 正定，则可在 $r \neq 0$ 时定义 $A^{\frac{1}{r}}$，它们保持正定.

注意此处矩阵的方根是半正定的，而非半正定矩阵不视为任何矩阵的方根.

#### Generalized Eigenanalysis and Matrix Pencils

满足方程

$$
Av = \lambda Bv
$$

的 $\lambda$ 和 $v$ 称为 $A$ 和 $B$ 的广义特征值和广义特征向量. 特征方程为

$$
|A - \lambda B| = 0.
$$

当 $c$ 在整个 $\mathbb{R}$ 或 $\mathbb{C}$ 上变化时，$A - cB$ 所产生的矩阵集合称为矩阵束，记为 $(A, B)$.

#### Singular Value Decomposition

在奇异值分解 $A = UDV^\top$ 中，$A$ 亦可写为

$$
A = \sum_{i = 1}^r d_i u_iv_i^\top,
$$

其中 $r$ 为 $A$ 的秩. 这也是谱分解的一种形式. 由于各 $u_iv_i^\top$ 是标准正交的，该谱分解是一种 Fourier 分解，各奇异值可写为

$$
d_i = A\cdot(u_iv_i^\top).
$$

### Matrix Norms

在范数的三条基本性质之上，再加入一致性，组成矩阵范数的基本性质

1. 非负性与加法单位元：若 $A = 0$，则 $\|A\| = 0$，否则 $\|A\|>0$.
2. 标量乘法：对实数 $a$，$\|aA\| = |a|\|A\|$.
3. 三角不等式：$\|A + B\| \le \|A\| + \|B\|$.
4. 一致性：$\|AB\| \le \|A\|\|B\|$.

任何满足以上四性质的 $\mathbb{R}^{m\times n} \mapsto \mathbb{R}$ 的函数均是矩阵范数.

#### Induced Norms

矩阵 $A$ 的**诱导范数**（induced norm）定义为

$$
\|A\| = \max_{x\neq 0} \frac{\|Ax\|}{\|x\|},
$$

该范数又称为 maximum magnification.

#### $L_p$ Matrix Norms

矩阵的 $L_p$ 范数可视作由向量的 $L_p$ 范数诱导而来：

$$
\|A\|_p = \max_{\|x\|_p=1} \|Ax\|_p.
$$

$L_1$ 范数又称为 column-sum norm：

$$
\|A\|_1 = \max_j\sum_i|a_{ij}|.
$$

$L_\infty$ 范数又称为 row-sum norm：

$$
\|A\|_\infty = \max_i\sum_j|a_{ij}|.
$$

$L_2$ 范数又称为 spectral norm：

$$
\|A\|_2 = \sqrt{\rho(A^\top A)}.
$$

显然有 $\|A^\top\|_\infty = \|A\|_1$ 和 $\|A^\top\|_2 = \|A\|_2$.

若 $A$ 对称，则 $\|A\|_2 = \rho(A)$.

若 $Q$ 是正交矩阵，则 $\|Qx\|_2 = \|x\|_2$，$\|Q\|_2 = 1$.

#### The Frobenius Norm

Frobenius 范数定义为

$$
\|A\|_\mathrm{F} = \sqrt{\sum_{i, j}a_{ij}^2} = \sqrt{\operatorname{Tr}(A^\top A)} = \sqrt{A\cdot A}.
$$

由 F 范数还可以定义矩阵交角

$$
\operatorname{angle}(A, B) = \cos^{-1}\left(\frac{A\cdot B}{\|A\|_\mathrm{F}\|B\|_\mathrm{F}}\right).
$$

若 $d_i$ 为 $A$ 各奇异值，则

$$
\|A\|_\mathrm{F}^2 = \sum d_i^2.
$$

#### Matrix Norm Inequalities

若 $\|\cdot\|_a$ 和 $\|\cdot\|_b$ 均为矩阵范数，则一定存在正实数 $r$ 与 $s$，使对任意矩阵 $A$ 都有

$$
r\|A\|_b \le \|A\|_a \le s\|A\|_b.
$$

若 $A$ 为 $m\times n$ 矩阵，则上式的一些特例为

$$
\|A\|_\infty \le \sqrt{n}\|A\|_\mathrm{F},
$$

$$
\|A\|_\mathrm{F} \le \sqrt{m}\|A\|_\infty,
$$

$$
\|A\|_\mathrm{F} \le \sqrt{\min(m, n)}\|A\|_2,
$$

$$
\|A\|_2 \le \|A\|_\mathrm{F},
$$

$$
\|A\|_2 \le \sqrt{n}\|A\|_1,
$$

$$
\|A\|_1 \le \sqrt{m}\|A\|_2.
$$

对任意给定的矩阵 $A$，$\|A\|_p$ 是在 $p \ge 1$ 上不增的函数.

#### Convergence of a Matrix Power Series

若方阵列 $\{A_k\}$ 使得数列 $\{\|A_k - A\|\}$ 收敛至 0，则称 $\{A_k\}$ 收敛至 $A$. 又由于

$$
\rho(A) \le \|A\|,
$$

故 $\{\rho(A_k - A)\}$ 收敛至 0 也可作为 $\{A_k\}$ 收敛至 $A$ 的充分条件.

由范数的一致性 $\|AB\| \le \|A\|\|B\|$，有 $\lim\limits_{k\rightarrow\infty}\|A^k\| \le \lim\limits_{k\rightarrow\infty} \|A\|^k$，故

$$
A^k \rightarrow 0,~ \operatorname{if} \|A\| < 1.
$$

事实上，方阵幂级数 $\{A^k\}$ 收敛至 0 的充要条件为 $\rho(A) < 1$，且有等式

$$
\lim_{k\rightarrow\infty} \|A^k\|^{1/k} = \rho(A).
$$

特别地，若 $A$ 为方阵且 $\|A\| < 1$，

$$
(I - A)^{-1} = I + A + A^2 + A^3 + \cdots.
$$

#### Nilpotent Matrices

$\|A\| < 1$ 并非 $A^k \rightarrow 0$ 的必要条件. 一个反例是 $A = \begin{bmatrix} 0 & 2 \\ 0 & 0 \end{bmatrix}$，此时 $A^2 = 0$，但 $\|A\|_1 = \|A\|_2 = \|A\|_\infty = \|A\|_\mathrm{F} = 2$. 这种矩阵称为**幂零矩阵**（Nilpotent Matrix）. 使 $A^k = 0$ 的最小 $k$ 值称为度数（index）. 若 $A_{n\times n}$ 是幂零矩阵，则

$$
\operatorname{Tr}(A) = 0,
$$

$$
\rho(A) = 0,
$$

$$
\operatorname{rank}(A) = n-1.
$$
