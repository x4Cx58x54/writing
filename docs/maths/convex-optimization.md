# Convex Optimization

## Convex Sets

The **affine combination** of $x_1$ and $x_2$ is $\theta_1 x_1 + \theta_2 x_2$, where $\sum \theta_i = 1$, and this idea can be generalized to more than two points.

An **affine set** $C$ is a set such that contains all the affine combinations of the points in $C$.

The **affine hull** of set $C$ is the set of all the affine combinations of all points in $C$, denoted by $\operatorname{\mathbf{aff}} C$.

For any affine set $C$, and $\forall x_0 \in C$, $C - x_0$ is a **subspace**.

The **relative interior** of a set $C$ is $\operatorname{\mathbf{relint}} C = \{x \in C \mid B(x, r) \cap \operatorname{\mathbf{aff}} C \subseteq C \text{ for some }r > 0\}$, where $B(x, r)$ is the ball of radius $r$ and center $x$ in any norm $\|\cdot\|$ (any norm defines the same relative interior).

The **relative boundary** of a set $C$ is $\operatorname{\mathbf{cl}}C\setminus\operatorname{\mathbf{relint}}C$, where $\operatorname{\mathbf{relint}}C$ is the closure of $C$.

The **convex combination** of $x_1$ and $x_2$ is $\theta_1 x_1 + \theta_2 + x_2$ where $\sum \theta_i = 1$, $\theta_i \ge 0$, and this idea can be generalized to more than two points.

A **convex set** $C$ is a set such that contains all the convex combinations of all points in $C$.

The **convex hull** of $C$ is the set of all the convex combinations of all points in $C$, denoted by $\operatorname{\mathbf{conv}} C$.

A **cone** $C$ is a set such that $\forall x \in C$ and $\forall \theta \ge 0$, $\theta x \in C$.

The **conic combination** of $x_1$ and $x_2$ is $\theta_1 x_1 + \theta_2 x_2$, where $\theta_i \ge 0$.

A **convex cone** $C$ is a set such that contains all the conic combinations of all the points in $C$.

A **hyperplane** is $\{x \mid a^\top x = b\}$.

A **norm cone** is $\{(x, t) \mid \|x\| \le t\}$.

A **polyhedron** is $\{x \mid a_i^\top x \le b_i, c_i^\top x = d_i\}$, including all affine sets, rays, segments, halfspaces, hyperplanes and all their intersections.

$k+1$ points $\{v_0, v_1, \cdots, v_k\}$ are **affinely independent** iff $\{v_1-v_0, v_2-v0, \cdots, v_k - v_0\}$ is linearly independent.

**Simplexes** are a family of polyhedra, and a $k$-dimentional simplex is the convex hull of $k+1$ affinely independent points.

Operations that perserve convexity of a set includes:

* intersection,
* affine function and its inverse,
* sum, $\big\{\sum x_i \mid x_i \in S_i\big\}$,
* Cartesian product,
* partial sum, $\{(x, y_1 + y_2) \mid (x, y_1) \in S_1, (x, y_2) \in S_2 \}$ ($x \in \mathbb{R}^n$, $y_1, y_2 \in \mathbb{R}^m$),
* perspective function, $P(z, t) = z/t$, and its inverse,
* linear-fractional, $f(x) = \dfrac{Ax + b}{c^\top x + d}$, $c^\top + d > 0$, and its inverse.

A **proper cone** is: convex, closed, solid, pointed ($x \in K \land -x \in K \Rightarrow x = 0$).

**Generalized inequalities**: $x \preccurlyeq_K y \Leftrightarrow y - x \in K$, $x \prec_K y \Leftrightarrow y - x \in \operatorname{\mathbf{int}} K$, where $K$ is a proper cone.

**Separating hyperplane theorem**: there exists a hyperplane separating two nonempty disjoint convex sets. Its converse does not always hold.

**Supporting hyperplane**: for $x_0 \in \operatorname{\mathbf{bd}} C = \operatorname{\mathbf{cl}} C \setminus \operatorname{\mathbf{int}} C$, if $\forall x \in C$, $a^\top x \le a^\top x_0$, one of the supporting hyperplane of $C$ is $\left\{x \mid a^\top x = a^\top x_0\right\}$.

**Supporting hyperplane theorem**: for any nonempty convex set $C$ and any $x_0 \in \operatorname{\mathbf{bd}} C$, there exists a supporting hyperplane that contains $x_0$. Its converse: a set is closed, has nonempty interior and supporting hyperplane on every boundary point is convex.

The **dual cone** of a cone $K$ is $K^* = \{y \mid x^\top y \ge 0, \forall x \in K\}$.

## Convex Functions

**Zeroth-order condition**: if $\operatorname{\mathbf{dom}}f$ is convex, $f$ is convex iff $\forall \theta\in [0, 1]$, $\forall x, y \in \operatorname{\mathbf{dom}}f$, $f(\theta x + (1 - \theta)y) \le \theta f(x) + (1-\theta)f(y)$.

**First-order condition**: if $\operatorname{\mathbf{dom}}f$ is convex and $f$ is differentiable, $f$ is convex iff $\forall x, y \in \operatorname{\mathbf{dom}}f$, $f(y) \ge f(x) + \nabla f(x)^\top (y-x)$.

**Second-order condition**: if $\operatorname{\mathbf{dom}}f$ is convex and $f$ is twice differentiable, $f$ is convex iff $\forall x \in \operatorname{\mathbf{dom}}f$, $\nabla^2 f(x) \succcurlyeq 0$. However, strictly convexity does not imply that $\nabla^2 f(x) \succ 0$ ($f(x) = x^4$).

The **$\alpha$-sublevel set** of $f$ is $C_\alpha = \{x \in \operatorname{\mathbf{dom}}f\mid f(x) \ge \alpha\}$, and the **$\alpha$-superlevel** set is defined likewise.

Any sublevel set of a convex function is convex, and any superlevel set of a concave function is convex.

The **epigraph** of $f$ is $\operatorname{\mathbf{epi}}f = \{(x, t) \mid t \ge f(x), x \in \operatorname{\mathbf{dom}}f\}$, and the **hypograph** is defined likewise.

$f$ is convex iff $\operatorname{\mathbf{epi}}f$ is convex.

Operations that preserve convexity of a function $f$ includes:

* nonnegative weighted sum,
* composition with an affine function, $f(Ax + b)$,
* $\max{f_i}$,
* scalar composition,
* perspective function, $tf(x/t)$.

The **conjugate function** of $f$ is $f^*(y) = \sup\limits_{x\in\operatorname{\mathbf{dom}}f} \big(y^\top x - f(x)\big)$.

If $f$ is convex and closed ($\operatorname{\mathbf{epi}}f$ is closed), $f^{**} = f$.

**Frenchel's inequality**: $f(x) + f^*(y) \ge x^\top y$.

A function is **quasiconvex** iff all its sublevel sets are convex. If a function is both quasiconvex and quasiconcave, it is quasilinear.

* $\log x$ is quasilinear.
* $\operatorname{ceil}(x)$ is quasilinear.
* $f(x_1, x_2) = x_1x_2$ is neither convex or concave, but it is quasiconcave.
* $\frac{a^\top x + b}{c^\top x + d}$ is quasilinear.

$f$ is quasiconvex iff $\operatorname{\mathbf{dom}}f$ is convex, and $\forall x, y \in \operatorname{\mathbf{dom}}f$, $\forall \theta \in [0, 1]$, $f(\theta x + (1 - \theta)y) \le \max\{f(x, f(y)\}$, this inequality is called **Jensen's inequality for quasiconvex functions**.

## Convex Optimization Problems

A **optimization problem** has the following form. Its domain $\mathcal{D} = \bigcap \operatorname{\mathbf{dom}}f_i \cap \bigcap \operatorname{\mathbf{dom}}h_i$. Its optimal value is denoted by $p^* = f_0(x^*)$.

$$
\begin{aligned}
\operatorname{minimize~~}& f_0(x)\\
\operatorname{s.t.~~}& f_i(x) \le 0, \quad i = 1, 2, \cdots, m\\
& h_i(x) = 0, \quad i = 1, 2, \cdots, p,
\end{aligned}\tag{op}
$$

where $x$ is called the optimization variable, $f_0$ is called the objective function or cost function, $f_i \le 0$ are called inequality constraints, $h_i(x) = 0$ are called equality constraints.

A **convex optimization problem** is a minimization problem with the objective function and inequality constraints are convex, and equality constraints are affine:

$$
\begin{aligned}
\operatorname{minimize~~}& f_0(x)\\
\operatorname{s.t.~~}& f_i(x) \le 0, \quad i = 1, 2, \cdots, m\\
& Ax = b.
\end{aligned}\tag{cop}
$$

**Optimality criterion** for differentiable objective functions: $x_0$ is optimal iff $\nabla f_0(x_0)^\top (y-x) \ge 0$ for all $y$ in feasible set.

## Duality

**Lagrange function** $L(x, \lambda, \nu) = f_0(x) + \sum \lambda_i f_i(x) + \sum \nu_i h_i(x)$.

**Lagrange dual function** $g(\lambda, \nu) = \inf\limits_{x\in \mathcal{D}} L(x, \lambda, \nu)$. It is the infimum of a set of affine function therefore it is concave. For any $\lambda \succeq 0$ and any $\nu$, it always holds that $g(\lambda, \nu) \le p^*$.

The **Lagrange dual problem** associated to the **primal problem** is shown as follows, and its optimal value is denoted by $d^* = g(\lambda^*, \nu^*)$.

$$
\begin{aligned}
\operatorname{maximize~~}& g(\lambda, \nu)\\
\operatorname{s.t.~~}& \lambda \succeq 0.
\end{aligned}
$$

**Weak duality** always holds, even if the problem is not convex: $d^* \le p^*$.

**Strong duality** usually holds: $d^* = p^*$ for convex optimization problems.

**Slater's condition**: For a convex optimization problem, i.e. the primal problem of the form in $\text{(cop)}$, strong duality hold, if there exists a strictly feasible point for the non-affine inequality constraints, that is, there exists an $x \in \operatorname{\mathbf{relint}}D$ that

$$
\begin{aligned}
&\begin{cases}
f_i(x) \le 0, & f_i(x) \text{ is affine},\\
f_i(x) < 0, & f_i(x) \text{ is not affine},\\
\end{cases} \quad i = 1, 2, \cdots, m, \\
&\quad Ax = b.
\end{aligned}
$$

Slater's conditions reduces to feasibility (there exists an feasible point) when the constraints are all linear equalities and inequalities, and $\operatorname{\mathbf{dom}}f_0$ is open.

**KKT optimality conditions**: $L^*(x) = L(x,\lambda^*, \nu^*)$ has zero derivative at $x^*$, namely

$$
\begin{aligned}
\nabla f_0(x^*) + \sum \lambda_i^* \nabla f_i(x^*) + \sum \nu_i^* \nabla h(x^*) = 0& \text{ (zero derivative)},\\
f_i(x^*) \le 0& \text{ (primal problem constraints)},\\
h_i(x^*) = 0& \text{ (primal problem constraints)},\\
\lambda_i \ge 0& \text{ (dual problem constraints)},\\
\lambda_i f_i(x_i^*) = 0& \text{ (zero optimal duality gap)}.\\
\end{aligned}
$$

For any optimization problem with differentiable objective and constraint functions for which strong duality obtains, any primal optimal and dual optimal points must satisfy KKT conditions, that is, KKT conditions are necessary for optimality.

For any convex optimization problem, any pair of points that satisfy KKT conditions are primal optimal and dual optimal, that is, KKT conditions are sufficient for optimality.
