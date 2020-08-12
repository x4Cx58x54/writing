# 类斐波那契数列 | Fibonacci(-like) Sequence

计算斐波那契数列中的某一项 $F_n$ 可以使用矩阵快速幂加速至 $O(\log n)$. 由

$$
\begin{aligned}
F_n &= 1 \cdot F_{n-1} + 1 \cdot F_{n-2},\\
F_{n-1} &= 1 \cdot F_{n-1} + 0 \cdot F_{n-2},
\end{aligned}
$$

构造矩阵，有

$$
\begin{bmatrix}
1 & 1\\
1 & 0
\end{bmatrix}
^ n =
\begin{bmatrix}
F_{n+1} & F_n\\
F_n & F_{n-1}
\end{bmatrix}
$$

[矩阵加速数列 - 洛谷](https://www.luogu.com.cn/problem/P1939){:target="_blank"}

对于

$$
F_x= \begin{cases} 1 & x \in\{1,2,3\}\\
F_{x-1}+F_{x-3} & x \geq 4 \end{cases}
$$

这样的类斐波那契数列，我们可以通过同样的原理来构造矩阵：

$$
\begin{aligned}
F_n &= 1 \cdot F_{n-1} + 0 \cdot F_{n-2} + 1 \cdot F_{n-3},\\
F_{n-1} &= 1 \cdot F_{n-1} + 0 \cdot F_{n-2} + 0 \cdot F_{n-3},\\
F_{n-2} &= 0 \cdot F_{n-1} + 1 \cdot F_{n-2} + 0 \cdot F_{n-3},\\
\end{aligned}
$$

由此得到

$$
\begin{bmatrix}
1 & 0 & 1\\
1 & 0 & 0\\
0 & 1 & 0
\end{bmatrix}
^ n =
\begin{bmatrix}
\cdot & \cdot & \cdot\;\\
F_n & \cdot & \cdot\;\\
\cdot & \cdot & \cdot\;
\end{bmatrix}
$$
