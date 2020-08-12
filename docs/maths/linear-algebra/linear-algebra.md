# Linear Algebra

## 矩阵与行列式

### Basics

$$
\left(A^\top\right)^{-1} = \left(A^{-1}\right)^\top
$$

$$
(AB)^{-1} = B^{-1}A^{-1}
$$

$$
(AB)^\top = B^\top A^\top
$$

$$
\operatorname{Tr}(A) = \sum_i \lambda_i
$$

$$
\det(A) = \prod_i \lambda_i
$$

$$
\operatorname{Tr}(AB) = \operatorname{Tr}(BA)
$$

$$
\operatorname{Tr}(ABC) = \operatorname{Tr}(BCA) =  \operatorname{Tr}(CAB)
$$

$$
A_{2\times 2}^{-1} =
\begin{bmatrix}
a_{11} & a_{12}\\
a_{21} & a_{22}
\end{bmatrix}^{-1} =
\frac{1}{\det(A)}
\begin{bmatrix}
a_{22} & -a_{12}\\
-a_{21} & a_{11}
\end{bmatrix}
$$

### Derivatives

设 $a$ 为标量，$\boldsymbol{b}$ 与 $\boldsymbol{x}$ 均为列向量，$A$ 为矩阵，且维数使得运算合法，则

$f(\boldsymbol{x})$ | $\partial f/\partial\boldsymbol{x}$
:---|:---
$a\boldsymbol{x}$ | $a$
$\boldsymbol{b}^\top\boldsymbol{x}$ | $\boldsymbol{b}$
$\boldsymbol{x}^\top\boldsymbol{b}$ | $\boldsymbol{b}^\top$
$\boldsymbol{x}^\top\boldsymbol{x}$ | $2\boldsymbol{x}$
$\boldsymbol{x}\boldsymbol{x}^\top$ | $2\boldsymbol{x}^\top$
$\boldsymbol{b}^\top A\boldsymbol{x}$ | $A^\top\boldsymbol{b}$
$\boldsymbol{x}^\top A\boldsymbol{b}$ | $\boldsymbol{b}^\top A$
$\boldsymbol{x}^\top A\boldsymbol{x}$ | $\left(A+A^\top\right)\boldsymbol{x}$
$\exp\left(-\frac{1}{2}\boldsymbol{x}^\top A\boldsymbol{x}\right)$ | $-\exp\left(-\frac{1}{2}\boldsymbol{x}^\top A\boldsymbol{x}\right)A\boldsymbol{x}$
$\|\boldsymbol{x}\|_2^2$ | $2\boldsymbol{x}$


### 矩阵乘法的计算

$M_{m\times n}$ 代表矩阵 $M$ 有 $m$ 行、$n$ 列. 设 $A_{m\times n}B_{n\times p}=C_{m\times p}$：

#### 点积

$$
c_{ij} = \sum_k a_{ik}b_{kj} = A_{i,:}\cdot B_{:,j}.
$$

即 $C$ 中第 $i$ 行，第 $j$ 列的元素恰好是 $A$ 的第 $i$ 行与 $B$ 的第 $j$ 列之内积.

#### 矩阵乘以列向量

$C$ 的第 $j$ 列是 $A$ 各列的线性组合，其系数为 $B$ 的第 $j$ 列. 这一列与 $B$ 的其它列无关. 这样看来，$C$ 的每一列都是 $A$ 与 $B$ 中对应列的乘积.

#### 行向量乘以矩阵

$C$ 的第 $i$ 行是 $B$ 各行的线性组合，其系数为 $A$ 的第 $i$ 行. 这一行与 $A$ 的其它行无关. 这样看来，$C$ 的每一行都是 $A$ 中对应行与 $B$ 的乘积. 

#### 列向量乘以行向量

将 $A$ 中各列和 $B$ 中各行对应相乘，得到的矩阵全部相加即得 $C$. 值得一提的是，列向量乘以行向量得到的矩阵中，每一列都是列向量的倍数，每一行都是行向量的倍数.


### 关于行列式的变换

* 交换两行/列，行列式变号；
* 用 $k$ 乘以某行/列，行列式的值亦变为其 $k$ 倍；
* 某行/列的 $k$ 倍加至另一行/列，行列式的值不变.

### Moore-Penrose 伪逆

$A$ 的伪逆 $A^+$ 满足

$$
\begin{cases}
AA^+A = A,\\
A^+AA^+ = A^+,
\end{cases}
$$

且 $AA^+$ 与 $A^+A$ 均对称. $A^+$ 有且仅有一个. 将 $A$ 奇异值分解，

$$
A = U\Sigma V^\top,
$$

则

$$
A^+ = V\Sigma^+U^\top,
$$

其中 $\Sigma^+$ 是将 $\Sigma$ 各元素取倒数，然后转置而得到的.

## 向量空间与线性方程组

### 秩

矩阵 $A$ 的秩即为 $A$ 的行阶梯式中非全零行数.

乘以一个矩阵不可能使得结果的秩更大，

$$
R(AB) \le \min\{(R(A), R(B)\}.
$$

矩阵和的秩不大于秩之和，

$$
R(A+B) \le R(A) + R(B).
$$



### 初等变换

初等行变换有以下三种操作：

* 非零实数 $k$ 乘至某行；
* 某行 $k$ 倍加至另一行；
* 互换两行.

初等列变换同理.

初等行变换相当于左乘一个满秩矩阵，初等列变化相当于右乘一个满秩矩阵.

初等变换得到的矩阵和原矩阵等价. $A$ 与 $B$ 等价记作 $A\sim B$. 初等变换不会改变秩.

### 线性方程组的解

对于 $n$ 元线性方程组 $A\boldsymbol{x} = \boldsymbol{b}$，系数矩阵为 $A$，增广矩阵为 $(A, \boldsymbol{b})$，

* $R(A) < R(A, \boldsymbol{b})$ 时，零系数得到非零和，无解；
* $R(A) = R(A, \boldsymbol{b}) = n$ 时，有唯一解；
* $R(A) = R(A, \boldsymbol{b}) < n$ 时，有无穷多解；

另外，$A\boldsymbol{x} = \boldsymbol{0}$ 有解的充要条件是 $R(A) < n$.

## 特征值与特征向量

### 正交矩阵

对于正交矩阵 $A$，组成的 $A$ 的列（行）向量均为单位向量，且相互正交,

$$
A^\top A = AA^\top = I,
$$

$$
A^\top = A^{-1}.
$$

### Gram-Schmidt Orthonormalization

逐个处理需要正交化的向量 $\boldsymbol{v}$. 将向量 $\boldsymbol{v}_k$ 分别减去其在已正交化的向量 $\boldsymbol{u}_i$ 上的投影,

$$
\boldsymbol{u}_k = \boldsymbol{v}_k - \sum_{i < k} |\boldsymbol{v}_k| \cos(\boldsymbol{v}_k, \boldsymbol{u}_i),
$$

最后将所有向量归一化.

过程演示如下[^1].

[^1]: [https://en.wikipedia.org/wiki/File:Gram-Schmidt_orthonormalization_process.gif](https://en.wikipedia.org/wiki/File:Gram-Schmidt_orthonormalization_process.gif){: target="_blank"}

![](https://upload.wikimedia.org/wikipedia/commons/e/ee/Gram-Schmidt_orthonormalization_process.gif)

### 相似矩阵

若 $\exists P$ 使得

$$
P^{-1}AP = B,
$$

则称 $A$ 与 $B$ 相似.

相似矩阵具有相同的特征值. 实际上，相似矩阵和[基变换](../essence-of-linear-algebra/#9-change-of-basis)的形式是完全一致的，即相似矩阵是在不同基底下，对相同的线性变换的描述.

### 对角化

若对于方阵 $A$，存在一个正交阵 $P$，将其相似变换为一个对角阵，

$$
P^{-1}AP = P^\top AP = \Lambda.
$$

则称 $A$ 是可（相似）对角化的.

$n$ 阶方阵 $A$ 能相似对角化的充要条件是它有 $n$ 个线性无关的特征向量. 实对称矩阵一定可以对角化.

### 奇异值分解

对任意实矩阵 $A$，其 SVD 为

$$
A = U\Sigma V^\top,
$$

$U$ 为左奇异向量组成的正交矩阵，$\Sigma$ 为各奇异值组成的对角阵，$V$ 为右奇异向量组成的正交矩阵.

考虑

$$
A^\top A = V\Sigma^\top\Sigma V^\top = V\Lambda V^\top,
$$

故将 $A^\top A$ 特征分解，得到各个特征值的算术平方根 $\sqrt{\lambda_i}$ 即为各奇异值 $\sigma_i$（$A^\top A$ 必然是半正定的，$\lambda_i \ge 0$），对应的特征向量组成 $V$.
