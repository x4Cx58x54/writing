---
date:
    created: 2022-05-25
categories:
    - Maths
---


# Chebyshev Center

[^chebyshevcenterwikipedia]:  [Chebyshev Center - Wikipedia](https://en.wikipedia.org/wiki/Chebyshev_center)
[^chebyshevcenter]: Stephen Boyd, Lieven Vandenberghe. Chebyshev center of a polyhedron. [Convex optimization](https://web.stanford.edu/~boyd/cvxbook/). 2004:417-418.
[^wikivertexenumeration]: [Vertex enumeration problem - Wikipedia](https://en.wikipedia.org/wiki/Vertex_enumeration_problem)
[^scipyhalfspaceintersection]: [scipy.spatial.HalfspaceIntersection](https://docs.scipy.org/doc/scipy/reference/generated/scipy.spatial.HalfspaceIntersection.html)

This starts with another question: what are the corner points of the feasible region of a set of linear inequalities? <!-- more -->
It is called vertex enumeration problem[^wikivertexenumeration].


Since we already know the linear inequalities $a_i^\top x \le b_i, ~i = 1, \cdots, m$, It can be easily solved by `scipy.spatial.HalfspaceIntersection`[^scipyhalfspaceintersection], if we specify an interior point of the feasible region.

The Chebyshev center is such interior point, and can be easily calculated with the known linear inequalities. It is the solution $x^*$ of the following linear programming problem:

$$
\begin{aligned}
    \operatorname{maximize}~~& R \\
    \operatorname{subject~to}~~& a_i^\top x + R \|a_i\| \le b_i, \quad i = 1, \cdots, m \\
    & R \ge 0.
\end{aligned}
$$

Code for vertex enumeration:

```python
import numpy as np
from scipy.spatial import HalfspaceIntersection
from scipy.optimize import linprog
from scipy.linalg import norm

def vertex_enumeration(A, b):
    # corners of A <= b
    row_norms = norm(A, axis=1)
    A_ub = np.hstack((A, row_norms[:, None]))
    c = np.array([0]*A.shape[1] + [-1])
    chebyshev_center = linprog(c, A_ub=A_ub, b_ub=b[:, None], bounds=(None, None)).x[:-1]
    halfspaces_equ = np.hstack((A, -b[:, None]))
    return HalfspaceIntersection(halfspaces_equ, chebyshev_center).intersections
```
