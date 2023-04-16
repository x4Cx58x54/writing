# Binomial Series, Generalized Binomial Coefficients

The binomial theorem states that for $n\in \mathbb{N}$,

$$
(x+y)^n = \sum_{k=0}^n\binom{n}{k}x^k y^{n-k},
$$

where the binomial coefficients can be computed by

$$
\binom{n}{k} = \frac{n!}{k!(n-k)!} = \frac{(n-k+1)\cdots(n-1)\cdot n}{1\cdot 2\cdots(k-1)\cdot k}.
$$

To generalize binomial coefficients to $n \in \mathbb{C}$, we rewrite the principal branch of binomial power in exponential form

$$
f(z) = (1+z)^\alpha = \exp(\alpha\ln(1+z)), \quad \alpha, z \in \mathbb{C}.
$$

The binomial series is the Taylor series for $f$ centered at $z_0 = 0$, which converges for all $|z| < 1$:

$$
f(z) = \sum_{k=0}^\infty \frac{1}{k!}f^{(k)}(z_0)(z-z_0)^k.
$$

And the derivatives of $f$ are

$$
\begin{aligned}
f^{(0)}(z) &= \exp(\alpha\ln(1+z)), \\
f^{(1)}(z) &= \exp(\alpha\ln(1+z))\cdot\alpha\frac{1}{1+z} \\
&= \exp(\alpha\ln(1+z))\cdot\alpha\frac{1}{\exp\ln(1+z)}  \\
&= \alpha\cdot\exp((\alpha-1)\ln(1+z)), \\
f^{(2)}(z) &= \alpha(\alpha-1)\cdot\exp((\alpha-2)\ln(1+z)), \\
&\qquad\vdots \\
f^{(k)}(z) &= \alpha(\alpha-1)\cdots(\alpha-k+1)\cdot\exp((\alpha-k)\ln(1+z)),
\end{aligned}
$$

Within the disk of convergence, the binomial series expands to

$$
(1+z)^\alpha = \sum_{k=0}^\infty\frac{\alpha(\alpha-1)\cdots(\alpha-k+1)}{k!}z^k. \tag{*}
$$

As a result, for $\alpha \in \mathbb{C}$, the binomial coefficients can be generalized to

$$
\binom{\alpha}{k} = \frac{\alpha(\alpha-1)\cdots(\alpha-k+1)}{k!}.
$$

The convergence of binomial series $\text{(*)}$ depends on $\alpha$ and $z$:

* if $|z| < 1$, it converges absolutely for all $\alpha \in \mathbb{C}$,
* if $|z| > 1$, it diverges for all $\alpha \in \mathbb{C} \setminus\mathbb{N}$,
* if $|z| = 1$,
    * if $\operatorname{Re}(\alpha) > 0$, it converges absolutely,
    * if $\operatorname{Re}(\alpha) \le -1$, it diverges,
    * if $-1 < \operatorname{Re}(\alpha) \le 0$,
        * if $x = -1$, it diverges,
        * if $x \neq -1$, it converges conditionally.

For any $\alpha \in \mathbb{C}$, it still holds that

$$
\binom{\alpha}{0} = 1,
$$

$$
\binom{\alpha}{k-1} + \binom{\alpha}{k} = \binom{\alpha+1}{k}.
$$
