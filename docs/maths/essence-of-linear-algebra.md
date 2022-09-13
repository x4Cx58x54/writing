# Essence of Linear Algebra[^1]

[^1]: [3Blue1Brown - Essence of Linear Algebra](https://www.3blue1brown.com/essence-of-linear-algebra-page/){: target="_blank"}

## 1 Vectors, What Even Are They?

Vectors are the extension of numbers.

Difference between a vector and a point:

$$
\text{a vector:}
\begin{bmatrix}
z_1 \\ z_2 \\ \vdots
\end{bmatrix},\quad
\text{a point:}
\left(z_1, z_2, \cdots\right).
$$

## 2 Linear Combinations, Span and Bases

Linear independent $\Leftrightarrow$ Any one of the vectors is outside the span of the others.

## 3 Matrices as Linear Transformations

*Transformation* is a fancy word for function, but it suggests **movement**.

*Linear transformation*: all straight lines remain straight, and the origin remains its place.

In the lingo,

$$
\mathscr{A}(m\mathbf{u}+n\mathbf{v})=m\mathscr{A}(\mathbf{u})+n\mathscr{A}(\mathbf{v}),
$$

which suggests that, **a vector remains the same linear combination of the transformed bases**.

Therefore, in two-dimensional space, suppose

$$
\mathbf{v}=x\hat{\imath}+y\hat{\jmath},
$$

when applied linear transformation $\mathscr{A}$, $
\hat{\imath}$ lands at $[\,a_{11}\ \ a_{21}\,]^\top$, $\hat{\jmath}$ lands at $[\,a_{12}\ \ a_{22}\,]^\top$. That is

$$
\mathscr{A}(\mathbf{v})=x
\begin{bmatrix}
a_{11} \\ a_{21}
\end{bmatrix}
+y
\begin{bmatrix}
a_{12} \\ a_{22}
\end{bmatrix}=
\begin{bmatrix}
a_{11}x+a_{12}y \\ a_{21}x+a_{22}y
\end{bmatrix}=
\begin{bmatrix}
a_{11}&a_{12} \\ a_{21}&a_{22}
\end{bmatrix}
\begin{bmatrix}
x \\ y
\end{bmatrix},
$$

namely

$$
\mathscr{A}(\mathbf{v})=
\begin{bmatrix}
a_{11}&a_{12} \\ a_{21}&a_{22}
\end{bmatrix}\mathbf{v}.
$$

For the bases,

$$
\mathscr{A}(\hat{\imath})=
\begin{bmatrix}
a_{11}&a_{12} \\ a_{21}&a_{22}
\end{bmatrix}\hat{\imath}=
\begin{bmatrix}
a_{11}&a_{12} \\ a_{21}&a_{22}
\end{bmatrix}
\begin{bmatrix}
1 \\ 0
\end{bmatrix}=
\begin{bmatrix}
a_{11} \\ a_{21}
\end{bmatrix},
$$

$$
\mathscr{A}(\hat{\jmath})=
\begin{bmatrix}
a_{11}&a_{12} \\ a_{21}&a_{22}
\end{bmatrix}\hat{\jmath}=
\begin{bmatrix}
a_{11}&a_{12} \\ a_{21}&a_{22}
\end{bmatrix}
\begin{bmatrix}
0 \\ 1
\end{bmatrix}=
\begin{bmatrix}
a_{12} \\ a_{22}
\end{bmatrix}.
$$

It is the relation between linear transformation and matrix-vector multiplication.

By recording where the bases land when applying a linear transformation and packaging them into a matrix, we have all the information about this transformation.

Starting from a specified matrix, we can imagine what the whole space and all the vectors inside look like after the transformation. Conversely, intuitive knowledge of a transformation itself can be expressed as a matrix.

Particularly, if $\mathscr{A}(\hat{\imath}),\,\mathscr{A}(\hat{\jmath})$ are linearly dependent, the whole 2-D space is squished onto the line where those two vectors sit, a.k.a. the span of them.


## 4 Matrix Multiplication as Composition

Applying two successive linear transformations $\mathscr{A}_1$ and $\mathscr{A}_2$ on a vector/space, we get a composition of linear transformations. Numerically, it is the multiplication of matrices corresponding to these transformations respectively.

$$
M_2M_1\mathbf{v}=M\mathbf{v},
$$

$$
M=M_2M_1.
$$

Therefore, (square) matrix multiplication can be viewed as a series of linear transformations.

In 2-D space,

$$
\begin{aligned}
M&=M_2M_1
\\&=
\begin{bmatrix}
b_{11}&b_{12} \\ b_{21}&b_{22}
\end{bmatrix}
\begin{bmatrix}
a_{11}&a_{12} \\ a_{21}&a_{22}
\end{bmatrix}
\\&=
\left[
\begin{bmatrix}
b_{11}&b_{12} \\ b_{21}&b_{22}
\end{bmatrix}
\begin{bmatrix}
a_{11} \\ a_{21}
\end{bmatrix}\quad
\begin{bmatrix}
b_{11}&b_{12} \\ b_{21}&b_{22}
\end{bmatrix}
\begin{bmatrix}
a_{12} \\ a_{22}
\end{bmatrix}
\right]
\\&=
\left[\;
a_{11}\hspace{-7mu}
\begin{bmatrix}
b_{11} \\ b_{21}
\end{bmatrix}+
a_{21}\hspace{-7mu}
\begin{bmatrix}
b_{12} \\ b_{22}
\end{bmatrix}\quad
a_{12}\hspace{-7mu}
\begin{bmatrix}
b_{11} \\ b_{21}
\end{bmatrix}+
a_{22}\hspace{-7mu}
\begin{bmatrix}
b_{12} \\ b_{22}
\end{bmatrix}
\;\right]
\\&=\cdots.
\end{aligned}
$$


## 5 The Determinant

The determinant of a matrix represents in what scale the transformation squeezes or stretches the space.

* In 2-D space, the unit square that sits on $\hat{\imath}$ and $\hat{\jmath}$ is transformed into a parallelogram, with its area equals to the determinant.
* In 3-D space, the unit cube that sits on $\hat{\imath}$, $\hat{\jmath}$ and $\hat{k}$ transforms into a parallelepiped, with its volume equals to the determinant.

For negative determinants, they are the result of inverting the orientation of space.

* In 2-D space, imagine flipping space over.
* In 3-D space, right-hand rule is involved.

In a word, **the determinant equals to the factor by which the areas/volumes have been scaled**.

![](./img/eola_06_det.png){: width=280px}

$$
\det \left(\begin{bmatrix}a & b \\ c & d \\ \end{bmatrix}\right)=(a+b)(c+d)-ac-bd-2bc=ad-bc.
$$

If we apply two successive linear transformations, it is obvious that the factor by which the space have been scaled equals to the multiplication of the two determinants, namely

$$
\det(M_1M_2)=\det(M_1)\det(M_2)=\det(M_2M_1).
$$

行阶梯式（row echelon form）具有以下形式:

$$
A=
\begin{bmatrix}
a_{11} & a_{12} & a_{13} & \cdots & a_{1n} \\
0 &  a_{22} & a_{23} & \cdots & a_{2n} \\
0 &  0 & a_{33} & \cdots & a_{3n} \\
\vdots & \vdots & \vdots & \ddots & \vdots \\
0 &  0 & 0 & 0 & a_{nn}
\end{bmatrix}
$$

其对空间的缩放比例即其行列式，等于其对原空间中单位超立方体的变换结果（对应矩阵任意前 $k$ 列的 $k$ 维图形均为将对应矩阵 $k-1$ 列之图形沿第 $k$ 列向量扫过的超柱体）之体积，等于每一列垂直于其之前诸列张成空间的分量的乘积，即主对角线诸项之乘积

$$
\det(A)=\prod\limits_{i=j}a_{ij}.
$$

高斯消元法（Gaussian elimination）可视为用行列式为 1 的矩阵与原矩阵相乘，故行列式的值未改变，通过高斯消元得到行阶梯式即可求出行列式.


## 6 Inverse Matrices, Column Space and Null Space

A system of linear equations

$$
A\mathbf{x}=\mathbf{v}
$$

has its geometric interpretation that we are looking for a vector $\mathbf{x}$ which lands on $\mathbf{v}$ when applying the transformation $A$ on it.

The solution for $\mathbf{x}$ depends on whether the transformation $A$ squishes space into a lower dimensional one, i.e., whether $\det(A)$ equals to 0 or not.

In the case where $\det(A)\neq 0$, there will always be one and only one solution and the finding process is actually playing the transformation in inverse. The inverse transformation corresponds to matrix $A^{-1}$ which satisfies that

$$
A^{-1}A\mathbf{x}=A^{-1}\mathbf{v},
$$

where

$$
A^{-1}A=I,
$$

where $I$ is called identity matrix, corresponding to identity transformation, which "does nothing".

Therefore, we have

$$
\mathbf{x}=A^{-1}\mathbf{v}.
$$

And when we play this inverse transformation and follow $\mathbf{v}$, the single unique solution for $\mathbf{x}$ is obtained.

When $\det(A)= 0$, the transformation squishes the space into a lower dimension, but there is no transformation that can unsquish space into a higher one, for a function cannot map a vector to multiple ones. That is to say, $A^{-1}$ does not exist in this case. If vector $\mathbf{v}$ is lucky enough to live on that lower-dimensional space, there will be infinite solutions for $\mathbf{x}$, otherwise there won't be any solutions.

The number of dimensions in the output of the transformation is called the **rank** of the matrix.

Set of all possible $A\mathbf{x}$ is called the **column space** of $A$, i.e. the span of columns.

output space = set of all possible $A\mathbf{x}$ = span of columns = column space

That is to say, rank is the number of dimensions in the column space. When the rank is as high as it can be, and equals the number of columns, we call the matrix **full rank**. Set of all vectors that land on the origin after transformation is called the **null space** or the **kernel** of the matrix.

When $\det(A)\neq 0$, i.e. $A$ is full rank, only $\mathbf{0}$ lands on the origin.

When $\det(A_{n\times n})= 0$, a space will land on the origin, its number of dimensions being $n-\mathrm{rank}(A)$.

For a system of linear equations

$$
A\mathbf{x}=\mathbf{0},
$$

its solution is the null space of $A$.

## 6+ Nonsquare Matrices

Nonsquare matrices are transformations between dimensions.

For a $m\times n$ matrix

$$
A_{m\times n}=
\begin{bmatrix}
a_{11} & a_{12} & \cdots & a_{1n} \\
a_{21} & a_{22} & \cdots & a_{2n} \\
\vdots & \vdots & \ddots & \vdots \\
a_{m1} & a_{m2} & \cdots & a_{mn}
\end{bmatrix}\; m \text{ rows},\\
\space\\
n \text{ columns}
$$

the inputs are $n$ bases, and the outputs are $n$ $m$-dimensional vectors, which can be interpreted as a linear transformation from an $n$-dimensional space to an $m$ (or lower)-dimensional space.

## 7 Dot Products and Duality

$$
\mathbf{a}\cdot\mathbf{b}=
\begin{bmatrix}
a_1 \\ a_2 \\ \vdots \\ a_n
\end{bmatrix}
\cdotp
\begin{bmatrix}
b_1 \\ b_2 \\ \vdots \\ b_n
\end{bmatrix} =
\big[
a_1\hspace{10mu}a_2\hspace{8mu}\cdots\hspace{8mu}a_n
\big]
\begin{bmatrix}
b_1 \\ b_2 \\ \vdots \\ b_n
\end{bmatrix}=\sum_{i=1}^n a_ib_i.
$$

Matrix $[a_1, a_2, \cdots , a_n]$ corresponds to a transformation from $n$-dimensional to one-dimensional, where $\hat{e}_1$ lands on $a_1$, $\hat{e}_2$ lands on $a_2$, ... ,  $\hat{e}_n$ lands on $a_n$.

### Relation between matrix-vector product and dot product 

Suppose there is a tilted number line in a space, and for simplicity, the space is 2-dimensional. The number 0 on that line remains in the origin and the base (with the same length of the bases in the original space) being

$$
\hat{u}=
\begin{bmatrix}
u_x \\ u_y
\end{bmatrix}.
$$

#### For matrix-vector product:

Imagine a linear transformation that squishes the plane is onto that number line and $\hat{\imath}$ lands at $u_x$, $\hat{\jmath}$ lands at $u_y$. In this transformation, vector $\mathbf{v} = \big[x\quad  y\big]^\top$ lands on

$$
\big[u_x\quad u_y\big]
\begin{bmatrix}
x \\ y
\end{bmatrix}
=u_x \cdotp x+u_y \cdotp y.
$$

???+ Note
    Yes, $\big[u_x\quad u_y\big]$ itself corresponds to another linear transformation where all points in the space are squished onto $x$ axis, but the calculation above also integrates a change of bases, which rotates the $x$ axis to the tilted number line. Without this change of bases, the transformation described would be $\begin{bmatrix}u_x^2 & u_x u_y \\ u_x u_y & u_y^2\end{bmatrix}$. Next, we rotate the space back to horizontal, namely by $\operatorname{rot}(-\arg \hat{u}) = \begin{bmatrix}\cos (-\arg\hat{u}) & - \sin (-\arg\hat{u}) \\ -\sin (-\arg\hat{u}) & \cos (-\arg\hat{u})\end{bmatrix} = \begin{bmatrix}u_x & u_y \\ -u_y & u_x\end{bmatrix}$. Multiply this rotation matrix to the former transformation matrix, and the composition is $\begin{bmatrix}u_x & u_y \\ 0 & 0\end{bmatrix}$.

#### For dot product:

Project $\hat{\imath}$ to $\hat{u}$, according to symmetry shown in the figure below, $\hat{\imath}_u=u_x$. Similarly, $\hat{\jmath}_u=u_y$.

![](./img/eola_07_dot_1.png){: width=160px}

Therefore, projection of $\mathbf{v}$ on $\hat{u}$

$$
\mathbf{v}_u = x\cdot\hat{\imath}_u+y\cdot\hat{\jmath}_u=x \cdot u_x+y \cdot u_y = \hat{u}\cdot\mathbf{v}.
$$

This is why the dot product with a unit vector can be interpreted as projecting the vector onto to the span of that unit vector and taking the (directed) length.

### Duality

**A vector is the physical embodiment of a linear transformation.**

A linear transformation from space to the number line can be just defined by projecting space onto that number line, instead of numerical dot products or vectors. Because this transformation is linear, it is necessarily described by some $1\times n$ matrix. And since multiplying this matrix is the same as taking the associated dot product, the transformation is inescapably related to some vector.

## 8 Cross Product in the Light of Linear Transformations

In 2-D space, $|\mathbf{v\times w}|$ equals to area of the parallelogram determined by these vectors.

In the light of linear transformation, when $\hat{\imath}$ lands on $\mathbf{v}$ and $\hat{\jmath}$ lands on $\mathbf{w}$, area of the parallelogram equals to the determinant, therefore,

$$
\mathbf{v\times w}=
\begin{vmatrix}
v_x & w_x \\
v_y & w_y
\end{vmatrix}\hat{k}=
\begin{vmatrix}
v_x & v_y \\
w_x & w_y
\end{vmatrix}\hat{k}.
$$

In 3-D space,

$$
\begin{bmatrix}
v_x \\ v_y \\ v_z
\end{bmatrix}\times
\begin{bmatrix}
w_x \\ w_y \\ w_z
\end{bmatrix}=
\begin{vmatrix}
\hat{\imath} & v_x & w_x \\
\hat{\jmath} & v_y & w_y \\
\hat{k} & v_z & w_z
\end{vmatrix}.
$$

Since function

$$
f\left(\begin{bmatrix}x\\y\\z\end{bmatrix}\right)=
\begin{vmatrix}
x & v_x & w_x \\
y & v_y & w_y \\
z & v_z & w_z
\end{vmatrix}
$$

is linear, and its output is a number. It necessarily associates with a linear transformation whose correspondent is a vector, according to duality.

It is computationally evident that

$$
\begin{bmatrix}
\begin{vmatrix}v_y & w_y \\ v_z & w_z\end{vmatrix}\\
\\
\begin{vmatrix}v_z & w_z \\ v_x & w_x\end{vmatrix}\\
\\
\begin{vmatrix}v_x & w_x \\ v_y & w_y\end{vmatrix}
\end{bmatrix}\cdotp
\begin{bmatrix}x\\y\\z\end{bmatrix}=
\begin{bmatrix}
v_y w_z-v_z w_y\\
v_z w_x-v_x w_z\\
v_x w_y-v_y w_x
\end{bmatrix}\cdotp
\begin{bmatrix}x\\y\\z\end{bmatrix}=
\begin{vmatrix}
x & v_x & w_x \\
y & v_y & w_y \\
z & v_z & w_z
\end{vmatrix}.
$$

For convenience, define

$$
\begin{bmatrix}
\begin{vmatrix}v_y & w_y \\ v_z & w_z\end{vmatrix}\\
\\
\begin{vmatrix}v_z & w_z \\ v_x & w_x\end{vmatrix}\\
\\
\begin{vmatrix}v_x & w_x \\ v_y & w_y\end{vmatrix}
\end{bmatrix}
\triangleq\mathbf{p},
$$

therefore, the vector $\mathbf{p}$ satisfies that

$$
\begin{aligned}
\mathbf{p}\cdot
\begin{bmatrix}x \\ y \\ z \end{bmatrix}
& = \det\left(
\begin{bmatrix}
x & v_x & w_x \\
y & v_y & w_y \\
z & v_z & w_z
\end{bmatrix}
\right)\\
& = \text{Volume of parallelpiped spanned on }\begin{bmatrix}x \\ y \\ z \end{bmatrix},\mathbf{v,w}\\
& = (\text{Area of parallelogram spanned on }\mathbf{v,w}) \cdot \left\Vert\begin{bmatrix}x \\ y \\ z \end{bmatrix}_{\perp(\mathbf{v,w})}\right\Vert,
\end{aligned}
$$

and geometrically,

$$
\begin{aligned}
\mathbf{p}\cdot
\begin{bmatrix}x \\ y \\ z\end{bmatrix}
& = \|\mathbf{p}\|\cdot(\text{projection of }\begin{bmatrix}x\\y\\z\end{bmatrix} \text{on } \mathbf{p})\\
& = \|\mathbf{p}\|\cdot
\left\Vert\begin{bmatrix}x \\ y \\ z\end{bmatrix}_{\mathbf{p}\perp(\mathbf{v,w})}\right\Vert.
\end{aligned}
$$

Therefore $\|\mathbf{p}\|$ equals to area of parallelogram spanned on $\mathbf{v,w}$, and $\mathbf{p}$ obeys the right-hand rule. So it becomes evident that

$$
\mathbf{p}=\mathbf{v}\times\mathbf{w}.
$$

Note that

$$
\mathbf{p}=
\begin{bmatrix}
v_x \\ v_y \\ v_z
\end{bmatrix}\times
\begin{bmatrix}
w_x \\ w_y \\ w_z
\end{bmatrix}=
\begin{bmatrix}
\begin{vmatrix}v_y & w_y \\ v_z & w_z\end{vmatrix}\\
\\
\begin{vmatrix}v_z & w_z \\ v_x & w_x\end{vmatrix}\\
\\
\begin{vmatrix}v_x & w_x \\ v_y & w_y\end{vmatrix}
\end{bmatrix}=
\begin{vmatrix}
\hat{\imath} & v_x & w_x \\
\hat{\jmath} & v_y & w_y \\
\hat{k} & v_z & w_z
\end{vmatrix}.
$$


## 9 Change of Basis

A change of basis is equivalent to a linear transformation.

Suppose in coordinate system $S$, the bases are

$$
\hat{\imath}=\begin{bmatrix}1 \\ 0\end{bmatrix}, \;
\hat{\jmath}=\begin{bmatrix}0 \\ 1\end{bmatrix},
$$

and another group of bases that span coordinate system $S'$, from the perspective of $S$, are

$$
\hat{u}=\begin{bmatrix}u_1 \\ u_2\end{bmatrix}, \;
\hat{v}=\begin{bmatrix}v_1 \\ v_2\end{bmatrix}.
$$

In coordinate system $S'$, vector

$$
\mathbf{w}'=
\begin{bmatrix}
w'_x\\w'_y
\end{bmatrix}=
w'_x \hat{u}+w'_y \hat{v}.
$$

If we apply linear transformation

$$
A=\begin{bmatrix}u_1 & v_1 \\ u_2 & v_2 \end{bmatrix}
$$

on $S$, some vector $\mathbf{w}=w_x \hat{\imath}+w_y \hat{\jmath}$ will land on $\mathbf{w}'$. According to linearity, $\mathbf{w}$ will remain the same combination of the bases, which is

$$
\begin{aligned}
\begin{bmatrix}u_1 & v_1 \\ u_2 & v_2 \end{bmatrix}\mathbf{w} &= \mathbf{w}'\\
w_x \hat{u}+w_y \hat{v} &= w'_x \hat{u}+w'_y \hat{v}\\
\Rightarrow
\begin{cases}
w_x=w'_x\\
w_y=w'_y
\end{cases}.
\end{aligned}
$$

That is, $\mathbf{w}$ in $S$ and $\mathbf{w}'$ in $S'$ has the same representation. And from the perspective of each coordinate system,

$$
\begin{aligned}
\mathbf{w'} &= w'_x \hat{u} + w'_y \hat{v} \qquad\left(= \begin{bmatrix}w'_x \\ w'_y\end{bmatrix}_{(S')}\right)\\
&= w'_x \begin{bmatrix}u_1\\ u_2 \end{bmatrix} \hat{\imath} + w'_y \begin{bmatrix}u_1 \\ u_2 \end{bmatrix}\hat{\jmath}\\
&= \begin{bmatrix}u_1 & v_1 \\ u_2 & v_2 \end{bmatrix} \begin{bmatrix}w'_x \\ w'_y\end{bmatrix}_{(S)}.
\end{aligned}
$$

So a translation from $S'$ to $S$ is obtained:

$$
\mathbf{w}'_{(S)} = \begin{bmatrix}u_1 & v_1 \\ u_2 & v_2 \end{bmatrix} \mathbf{w}'_{(S')}.
$$

In the simplest case, $\hat{u} = \begin{bmatrix}u_1\\ u_2\end{bmatrix}_{(S)} = \begin{bmatrix}1\\ 0\end{bmatrix}_{(S')}$.

这样，我们能将两个坐标系之间的关系记为

$$
S = AS'.
$$

In terms of linear transformations, how a transformation is expressed is related to the bases. Here are the steps to describe the same transformation in a different coordinate systems:

Suppose a linear transformation $M$ in coordinate system $S$ is applied to some vector $\mathbf{w}$ in $S'$,

1. first translate $\mathbf{w}$ to $S$ by multiplying $A$ to $\mathbf{w}$;
2. since we've got $A\mathbf{w}$ in $S$, apply the transformation by multiplying $M$ to $A\mathbf{w}$;
3. translate it back to $S'$ by multiplying $A^{-1}$ to it;
4. finally we got $A^{-1}MA\mathbf{w}$.

To sum up,

$$
M_{(S)} = A^{-1}MA_{(S')}.
$$

## 10 Eigenvectors and Eigenvalues

An eigenvector of a linear transformation is a **non-zero** vector that changes only a scalar factor when that transformation is applied to it. It is defined as

$$
A\mathbf{v}=\lambda\mathbf{v},
$$

where non-zero vector $\mathbf{v}$ is an eigenvector of $A$, and $\lambda\in\mathbb{R}$ is the eigenvalue associated to it.

When applying the transformation, each eigenvector is scaled by the factor of its associated eigenvalue, while other vectors are all knocked off their original directions.

An equivalence of the equation above

$$
(A-\lambda I)\mathbf{v} = \mathbf{0}
$$

is called the *characteristic equation*.

In other words, non-zero vector $\mathbf{v}$ becomes zero when applying linear transformation $A-\lambda I$ to it, and the only way to do it is that matrix squeezes the space into a lower-dimensional one, therefore

$$
\det(A-\lambda I)=0.
$$

Solve this equation, and if an eigenvector exists, all the vectors on the line spanned by it would be eigenvectors too.

When all the basis vectors happen to be eigenvectors, they are called eigenbases, and the corresponding transformation matrix would be diagonal. Therefore a way to interpret a diagonal matrix is that all the bases are eigenvectors, with the diagonal entries of this matrix being their eigenvalues.

A diagonal matrix has a nice property that

$$
\begin{bmatrix}
a_{1} & & &  \\
& a_{2} & &  \\
& & \ddots &  \\
& & & a_{n}  \\
\end{bmatrix}^k\mathbf{v}=
\begin{bmatrix}
a_{1}^k & & &  \\
& a_{2}^k & &  \\
& & \ddots &  \\
& & & a_{n}^k  \\
\end{bmatrix}\mathbf{v}=
\begin{bmatrix}
a_{1}^k v_1 \\
a_{2}^k v_2 \\
\vdots \\
a_{n}^k v_n
\end{bmatrix},
$$

which indicates that if the eigenvectors of matrix $M$ span the whole space, we can change the bases to the eigenvectors, and the change-of-basis matrix is

$$
A=
\big[
\mathbf{v}_1\hspace{10mu}\mathbf{v}_2\hspace{8mu}\cdots\hspace{8mu}\mathbf{v}_n
\big],
$$

where $\mathbf{v}_i$ are the eigenvectors.

Matrix $A^{-1}MA$ would express the same transformation in the eigenbasis coordinate system, and it is guaranteed to be diagonal with its corresponding eigenvalues down that diagonal, because the vectors are only scaled from the perspective of that coordinate system.

When raising a non-diagonal matrix to some power, first change it into its eigenbases, and then compute that power in the new system, then convert back to the original system.

When a matrix does not have enough eigenvectors to span the full space, this approach fails to work.

## 11 Abstract Vector Spaces

Since functions also have linear properties:

$$
(\lambda f)(x)=\lambda f(x),\\
(f+g)(x)=f(x)+g(x),
$$

the concept of vectors can be expanded to functions.

The derivative is an example of linear transformation (function) of a function, because it is linear,

$$
\frac{\text{d}}{\text{d}x}(\lambda f)=
\lambda \frac{\text{d}}{\text{d}x}f,
$$

$$
\frac{\text{d}}{\text{d}x}(f+g)=
\frac{\text{d}}{\text{d}x}f+\frac{\text{d}}{\text{d}x}g,
$$

and it transforms one function into another.

In other words, the differential operator and the derivative operator are linear.

To express derivatives in the form of matrices, for example in the space of polynomials, we choose

$$
b_0(x)=1,\; b_1(x)=x,\; b_2(x)=x^2,\; \cdots,\; b_n(x)=x^n ,\; \cdots
$$

as *basis functions*, and all polynomials can be described as the linear combinations of the basis functions:

$$
f(x)=a_0 + a_1 x + a_2 x^2 + \cdots + a_n x^n =
\begin{bmatrix}
a_0 \\ a_1 \\ a_2 \\ \vdots \\ a_n \\ \vdots
\end{bmatrix}.
$$

Since

$$
\frac{\text{d}}{\text{d}x}b_0(x)=
\begin{bmatrix}
0 \\ 0 \\ 0 \\ \vdots
\end{bmatrix},\;
\frac{\text{d}}{\text{d}x}b_1(x)=
\begin{bmatrix}
1 \\ 0 \\ 0 \\ \vdots
\end{bmatrix},\;
\frac{\text{d}}{\text{d}x}b_2(x)=
\begin{bmatrix}
0 \\ 2 \\ 0 \\ \vdots
\end{bmatrix},\;\cdots
$$

the derivative operator matrix

$$
\frac{\text{d}}{\text{d}x}=
\begin{bmatrix}
0 & 1 & 0 & 0 & \cdots \\
0 & 0 & 2 & 0 & \cdots \\
0 & 0 & 0 & 3 & \cdots \\
0 & 0 & 0 & 0 & \cdots \\
\vdots & \vdots & \vdots & \vdots & \ddots
\end{bmatrix}.
$$

Therefore,

$$
\begin{aligned}
\frac{\text{d}}{\text{d}x}f(x) & =
\begin{bmatrix}
0 & 1 & 0 & 0 & \cdots \\
0 & 0 & 2 & 0 & \cdots \\
0 & 0 & 0 & 3 & \cdots \\
0 & 0 & 0 & 0 & \cdots \\
\vdots & \vdots & \vdots & \vdots & \ddots
\end{bmatrix}
\begin{bmatrix}
a_0 \\ a_1 \\ a_2 \\ a_3 \\ \vdots
\end{bmatrix} =
\begin{bmatrix}
1a_1 \\ 2a_2 \\ 3a_3 \\ 4a_4 \\ \vdots
\end{bmatrix}\\ \\ & =
1a_1+2a_2x+3a_3x^2+4a_4x^3+\cdots.
\end{aligned}
$$

Almost all linear algebra concepts have their alternate names when applied to functions:

$$
\begin{aligned}
\text{Linear transformations} & \longleftrightarrow \text{Linear operators}\\
\text{Dot products} & \longleftrightarrow \text{Inner products}\\
\text{Eigenvectors} & \longleftrightarrow \text{Eigenfunctions}\\
\cdots & \longleftrightarrow \cdots
\end{aligned}
$$

In conclusion, *vectors* can be far more abstract, the forms they take do not matter. It is an intangible notion that maths abstracts all its embodiments into.
