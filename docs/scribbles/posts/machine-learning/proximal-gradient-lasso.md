---
date:
    created: 2023-11-18
categories:
    - Machine Learning
---

# Solving Lasso with Proximal Gradient Method

Proximal gradient method solves optimization problems of the form

$$
\min_{x \in \mathcal{X}} F(x) + R(x),
$$

where $F(x)$ is convex, differentiable, and has Lipschitz-continuous gradient, $R(x)$ is convex, but possibly non-differentiable.

<!-- more -->

Note that the $x^*$ minimizes $F+R$ iff

$$
0 \in \partial (F+R)(x^*),
$$

where $\partial$ is the subdifferential operator.


## Proximal operator

The proximal operator $\operatorname{prox}_f: \mathbb{R}^n \mapsto \mathbb{R}^n$ for convex real function $f$ is defined by

$$
\operatorname{prox}_f(v) = \argmin_x f(x) + \frac{1}{2}\|x-v\|_2^2.
$$


The object function is strongly convex and not everywhere infinite, so it has a unique minimizer for every $v \in \mathbb{R}^n$.

### Fixed point

$x^*$ minimizes $f$ iff $x^* = \operatorname{prox}_f(x^*)$, i.e. $x^*$ is a fixed point of proximal operator.

!!! Abstract "Proof"

    $\Rightarrow$: For any $x$

    $$
    \begin{aligned}
    f(x) &\ge f(x^*) \\
    f(x) + \frac{1}{2}\|x-x^*\|^2 &\ge f(x^*)\\
    f(x) + \frac{1}{2}\|x-x^*\|^2 &\ge f(x^*) + \frac{1}{2}\|x^* - x^*\|^2,
    \end{aligned}
    $$

    thus $x^*$ minimizes $f(x) + \frac{1}{2}\|x-x^*\|^2$.

    $\Leftarrow$: $x^* = \argmin_x f(x) = \frac{1}{2}\|x-x^*\|^2$, so at $x = x^*$,

    $$
    \begin{aligned}
        0 &\in \partial_x f(x) + \partial_x \frac{1}{2}\|x - x^*\|^2 \\
        0 &\in \partial_x f(x) + x - x^* \\
        0 &\in \partial f(x^*),
    \end{aligned}
    $$

    thus $x^*$ minimizes $f$.

### Resolvent of subdifferential operator

The resolvent of subdifferential operator $\partial f$ is defined by $(I + \lambda \partial f)^{-1}$, and it turns out that the proximal operator is the resolvent of the subdifferential operator

$$
\operatorname{prof}_{\lambda f} = (I + \lambda \partial f)^{-1}.
$$

!!! Abstract "Proof"

    If $z \in (I + \lambda \partial f)^{-1}(x)$, $x \in (I + \lambda \partial f)(z) = z + \lambda \partial f(z)$. That is

    $$
    \begin{aligned}
    0 &\in \lambda \partial f(z) + z - x \\
    0 &\in \partial_z (\lambda f(z)) + \partial_z \frac{1}{2}\|z - x\|^2 \\
    0 &\in \partial_z \left(\lambda f(z) +  \frac{1}{2}\|z - x\|^2 \right).
    \end{aligned}
    $$

    Therefore $z = \argmin_z \lambda f(z) + \frac{1}{2}\|z-x\|^2 = \operatorname{prox}_{\lambda f}(z)$.

## Proximal gradient method

Consider the problem at the beginning, the proximal gradient method is

$$
\begin{aligned}
x^{k+1}
&= \operatorname{prox}_{\lambda^k R} (x^k - \lambda^k \nabla F(x^k)) \\
&= \argmin_x \lambda^k R(x) + \frac{1}{2} \|x - x^k + \lambda^k \nabla F(x^k)\|_2^2 \\
&= (I + \lambda^k \partial R)^{-1}(I - \lambda^k \nabla F)(x^k).
\end{aligned}
$$

It converges with rate $O(1/k)$ at a fixed step size $\lambda^k = \lambda \in (0, \frac{1}{L}]$, where $L$ is the Lipschitz constant of $\nabla F$.

### Special cases

When $R = 0$, it reduces to gradient descent.

When $R(x) = \begin{cases}0 & x\in\mathcal{C}\\ +\infty &x\notin\mathcal{C},\end{cases}$ where $\mathcal{C}$ is a closed nonempty convex set. The proximal operator reduces to $\displaystyle\argmax_{x\in\mathcal{C}} \|x - v\|_2^2$, which is the Euclidean projection onto $\mathcal{C}$, and proximal gradient method reduces to projected gradient descent.

When $F = 0$, it reduces to proximal minimization, i.e. solving the fixed-point equation $x^* = \operatorname{prox}_{\lambda^kR}(x^*)$.


### Interpretation: Fixed point iteration

This method can be interpreted by fixed point iteration. For any $\lambda > 0$, $x^*$ minimizes $F+R$ iff

$$
\begin{aligned}
0 &\in \lambda \nabla F(x^*) + \lambda \partial R(x^*) \\
0 &\in - x^* + \lambda \nabla F(x^*) + x^* + \lambda \partial R(x^*) \\
(I - \lambda \nabla F)(x^*) &\in (I + \lambda R)(x^*),
\end{aligned}
$$

and because proximal operator is single-valued,

$$
x^* = \operatorname{prox}_{\lambda R}(x^* - \lambda \nabla F(x^*)).
$$

### Interpretation: Forward-backward integration of gradient flow

Consider the vanilla gradient descent

$$
x^{k+1} = x^k - \lambda^k\partial (F+R)(x^k),
$$

since the step size $\lambda^k$ is small, we can take a backward step $x^k \approx x^{k+1}$ for the possibly non-differential part $R$,

$$
x^{k+1} = x^k - \lambda^k\nabla F(x^k) - \lambda^k\partial R(x^{k+1}),
$$

and rearranging gives

$$
x^{k+1} = (I + \lambda^k \partial R)^{-1}(I - \lambda^k \nabla F)(x^k),
$$

which is exactly the proximal gradient method.

## Solving Lasso

Proximal gradient method offers sparse solution for lasso, where the object functions are considered in a convex term $F(w) = \frac{1}{2}\|Aw - b\|_2^2$ and a non-differentiable term $R(w) = \gamma\|w\|_1$. The proximity operator gives

$$
\begin{aligned}
u
&= \operatorname{prox}_{\lambda R}(w) \\
&= \argmin_x \lambda\gamma \|x\|_1 + \frac{1}{2}\|x - w\|_2^2,
\end{aligned}
$$

and for each component

$$
\begin{aligned}
u_i
&= \argmin_{x_i} \lambda\gamma |x_i| + \frac{1}{2}(x_i - w_i)^2 \\
&= \argmin_{x_i}
\begin{cases}
x_i(\frac{1}{2}x_i - w_i + \lambda\gamma), &x_i \ge 0 \\
x_i(\frac{1}{2}x_i - w_i - \lambda\gamma), &x_i < 0
\end{cases}\\
&=
\begin{cases}
w_i + \lambda\gamma, & w_i < \lambda\gamma \\
0, & w_i \in [-\lambda\gamma, \lambda\gamma] \\
w_i - \lambda\gamma, &w_i > \lambda\gamma.
\end{cases}
\end{aligned}
$$

This is also called soft thresholding $S_{\lambda\gamma}(w_i)$.

Finally, the proximal gradient iteration is

$$
w^{k+1} = S_{\lambda^k\gamma}(w^k - \lambda^k A^\top (Aw^k - b)).
$$

This method for lasso is sometimes called ISTA (iterative shrinkage-thresholding algorithm), and its Nesterov's accelerated version is called FISTA (fast ISTA).

### Comparison with subgradient method

The subgradient method for lasso gives

$$
w^{k+1} = w^k - \lambda^k (A^\top(Aw^k - b) + \gamma \operatorname{sgn}(w)).
$$

This method completely ignores structures in the object function, and has a slow convergence rate of $O(1/\sqrt{k})$, which usually takes too long till convergence to a sparse solution, while ISTA and FISTA converges with rate $O(1/k)$ and $O(1/k^2)$ respectively.

## See Also

* [Neal Parikh and Stephen Boyd. Proximal Algorithms. 2013](https://web.stanford.edu/~boyd/papers/prox_algs.html){:target="_blank"}
* [[1405.4980] Convex Optimization: Algorithms and Complexity](https://arxiv.org/abs/1405.4980){:target="_blank"}
* [[1108.0775] Optimization with Sparsity-Inducing Penalties](https://arxiv.org/abs/1108.0775){:target="_blank"}
