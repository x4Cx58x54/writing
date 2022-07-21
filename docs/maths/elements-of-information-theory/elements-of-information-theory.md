# Elements of Information Theory

>*Second Edition*  
*Thomas M. Cover, Joy A. Thomas*  
*2006, John Wiley & Sons*  

---

## Ch. 2: Entropy, relative entropy, mutual information

**Entropy** measures uncertainty of a discrete random variable. Let $X$ be a discrete r.v. with alphabet $\mathcal{X} = \{x: \Pr(X=x)>0\}$ and probability mass function $p(x) = \Pr(X=x)$. The entropy of $X$ is

$$
H(X) = \sum_{x \in \mathcal{X}} p(x)\log\frac{1}{p(x)} = \operatorname{E}_{p}\left[\log\frac{1}{p(X)}\right],
$$

where $\log$ denotes logarithm base 2 unless specified, thus the entropy value is in bits. Also, if the base of the logarithm is $\mathrm{e}$, the entropy is measured in nats, and entropy of any base can convert to another according to the change of base rule.

**Joint entropy**:

$$
H(X, Y) = \sum_{x\in \mathcal{X}}\sum_{y\in \mathcal{Y}} p(x, y)\log\frac{1}{p(x, y)} = \mathrm{E}_{p(X, Y)}\left[\frac{1}{p(X, Y)}\right].
$$

**Conditional entropy**:

$$
\begin{aligned}
H(Y|X) &= \sum_{x\in\mathcal{X}} p(x)H(Y|X = x) \\
&= \sum_{x\in \mathcal{X}}p(x)\sum_{y\in \mathcal{Y}}p(y|x)\log\frac{1}{p(y|x)}\\
&= \sum_{x\in \mathcal{X}}\sum_{y\in \mathcal{Y}}p(x, y)\log\frac{1}{p(y|x)}\\
&= \mathrm{E}\left[\frac{1}{\log p(Y|X)}\right].
\end{aligned}
$$

**Chain rules**:

$H(X, Y) = H(X) + H(Y|X)$.

$H(X, Y | Z) = H(X | Z) + H(Y|X, Z)$.

Comma as higher priority than conditioning.

**Relative entropy (KL Distance)**:

$$
D(p\|q) = \sum_{x\in \mathcal{X}}p(x)\log\frac{p(x)}{q(x)} = \mathrm{E}_p\left[\log\frac{p(X)}{q(X)}\right].
$$

**Mutual information**:

$$
I(X;Y) = D(p(x, y) \| p(x)p(y)) = \mathrm{E}_{p(X, Y)}\left[\log\frac{p(X, Y)}{p(X)p(Y)}\right].
$$

$$
\begin{aligned}
I(X; Y) &= H(X) - H(X|Y) \\
&= H(Y) - H(Y|X)\\
&= H(X) + H(Y) - H(X, Y).
\end{aligned}
$$

$$
I(X; X) = H(X),\quad H(X|X) = 0.
$$

**Chain rule for entropy**:

$$
\begin{aligned}
H(X_1, X_2, \cdots, X_n) &= \sum_{i=1}^n H(X_i | X_{i-1}, \cdots, X_1) \\
&= H(X_1) + H(X_2|X_1) + H(X_3|X_2, X_1), \cdots.
\end{aligned}
$$

It is very obvious graphically.

**Conditional mutual information**:

$$
I(X; Y | Z) = H(X | Z) - H(X | Y, Z) = \mathrm{E}\left[\log\frac{p(X, Y | Z)}{p(X|Z)p(Y| Z)}\right].
$$

Semicolon has higher priority than conditioning.

**Chain rule for information**:

$$
\begin{aligned}
I(X_1, X_2, \cdots, X_n ; Y) &= \sum_{i=1}^n I(X_i; Y | X_{i-1}, X_{i-2}, X_1) \\
&= I(X_1; Y) + I(X_2; Y | X_1) + I(X_3; Y | X_2, X_1), \cdots.
\end{aligned}
$$

It is obvious graphically.

**Conditional relative entropy**:

$$
D(p(y|x)\|q(y|x)) = \mathrm{E}_{p(X, Y)}\left[\log\frac{p(Y|X)}{q(Y|X)}\right].
$$

**Chain rule for relative entropy**:

$$
D(p(x, y)\|q(x, y)) = D(p(x)\|q(x)) + D(p(y|x) \| q(y|x)).
$$

**Independence bound on entropy**: $H(X_1, X_2, \cdots, X_n)\le \sum H(X_i)$, with equality iff all $X_i$ are independent.

**Log sum inequality**:

$$
\sum a_i \log\frac{a_i}{b_i} \ge \sum a_i \log \frac{\sum a_i}{\sum b_i}.
$$

**Relative entropy** $D(p\| q)$ is **convex** in the pair $(p, q)$.

**Entropy** is **concave**, as $H(p) = \log|\mathcal{X}| - D(p \| u)$, where $u$ is the uniform distribution on $\mathcal{X}$ and $\log|\mathcal{X}| = \mathrm{E}\left[\log\frac{1}{u(x)}\right]$.

**Mutual information** $I(X; Y)$ is **concave** with respect to $p(x)$ for fixed $p(y|x)$; **convex** with respect to $p(y|x)$ for fixed $p(x)$.

A **Markov chain** $X\rightarrow Y \rightarrow Z$ has the following properties:

* $p(x, y, z) = p(x)p(y|x)p(z|y)$ (definition),
* $p(z|y) = p(z|x, y)$,
* $p(x, z | y) = p(x|y)p(z|y)$,
* $Z \rightarrow Y \rightarrow X$ ($X\leftrightarrow Y \leftrightarrow Z$),
* if $Z = f(Y)$, $X \rightarrow Y \rightarrow Z$,
* $I(X; Z|Y) = 0$.

**Data processing inequality**: in a Markov chain $X\rightarrow Y \rightarrow Z$, $I(X; Y) \ge I(X; Z)$. Also, observation of $Z$ reduces dependence between $X$ and $Y$: $I(X; Y | Z) \le I(X; Y)$, which might be the opposite when they do not form a Markov chain: $X$ and $Y$ independently observes Bernoulli distribution with $p=0.5$, and $Z = X + Y$.

**Fano's inequality**: $Y$ is related to $X$ by $p(y|x)$, and an estimator of $Y$ is $g(Y) = X$. Therefore, $X \rightarrow Y \rightarrow \hat{X}$. The probability of error is defined as $P_e = \Pr\{X\neq \hat{X}\}$.


#### Joint differential entropy of fully dependent r.v.s: $X \sim U(0, 1), Y = X, H(X, Y) = ?$

First we derive the joint probability density of $X$ and $Y$ step by step. The probability density of $X$ is

$$
p(x) = \begin{cases}
1, & x \in (0, 1), \\
0, & \text{otherwise}.
\end{cases}
$$

And the conditional probability density $p(y|x) = \delta(y-x)$, where $\delta$ is the Dirac delta function. Therefore,

$$
p(x, y) = p(y|x)p(x) = \delta(y-x)p(x).
$$

Check unit measure property: $\int_0^1 \delta(y-x)\mathrm{d}x = p(y) = p(x)$, or, $\forall y\in (0, 1), 0 \in \{y - x: x\in (0, 1)\}$, thus $\int_0^1 \delta(y-x)\mathrm{d}x = 1$. Then $\int_\mathbb{R} p(x, y) \mathrm{d}x\mathrm{d}y = \int_0^1\int_0^1 \delta(y-x)p(x) \mathrm{d}x\mathrm{d}y = 1$.

$$
\begin{aligned}
h(X, Y) &= -\int_0^1\int_0^1 \delta(y-x)p(x)\log(\delta(y-x)p(x))\mathrm{d}x\mathrm{d}y\\
&= -\int_0^1\int_0^1 \delta(y-x)\log\delta(y-x)\mathrm{d}x\mathrm{d}y.\\
\end{aligned}
$$

Let $u(y) = \int_0^1 \delta(y-x)\log\delta(y-x)\mathrm{d}x$ for $x \in (0, 1)$, with domain $y \in (0, 1)$.

Dirac delta function can be represented by $\displaystyle\delta(x) = \lim_{a\rightarrow 0} \delta_a(x)$, where

$$
\delta_a(x) = \begin{cases}
\dfrac{1}{2a}, & x\in (-a, a) \\
0, &\text{otherwise}.
\end{cases}
$$

Thus, for any $x_0 \in (0, 1)$,

$$
\begin{aligned}
u(y) &= \lim_{a\rightarrow 0} \int_0^1 \delta_a(y-x_0)\log\delta_a(y-x_0)\mathrm{d}y \\
&= \lim_{a\rightarrow 0} \int_{x_0 - a}^{x_0 + a} \frac{1}{2a}\log\frac{1}{2a}\mathrm{d}y \\
&= \lim_{a\rightarrow 0} \log\frac{1}{2a} \\
&= +\infty.
\end{aligned}
$$

The joint differential entropy $h(X, Y) = -\int_0^1 u(y) \mathrm{d}y = -\infty$, and mutual information $I(X, Y) = h(X) + h(Y) - h(X, Y) = +\infty$. In general, if probability distribution occupies manifold of less dimension than the space, its differential entropy is $-\infty$.
