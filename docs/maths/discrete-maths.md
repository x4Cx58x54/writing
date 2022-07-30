# 离散数学

## 数理逻辑

$P\rightarrow Q \Leftrightarrow \lnot P \lor Q$.

对偶式：  
将式中的 $\land$、$\lor$、$\bf{T}$、$\bf{F}$、$\exist$、$\forall$   
分别换为 $\lor$、$\land$、$\bf{F}$、$\bf{T}$、$\forall$、$\exist$.

$A^{**}\Leftrightarrow A$.

扩展德摩根律：$A^*(P_1, P_2, \cdots, P_n) \Leftrightarrow \lnot A(\lnot P_1, \lnot P_2, \cdots, \lnot P_n)$.

对偶原理：$A\Leftrightarrow B$ 则 $A^* \Leftrightarrow B^*$.

$A\Rightarrow B$ 则 $B^* \Rightarrow A^*$.

主析取范式：极小项之和（析取）.  
主合取范式：极大项之积（合取）.

由主析取范式求取主合取范式的方法：  
$\sum (A) \Rightarrow \prod(B)$，$A$ 与 $B$ 互补.  
$\overline{m_i} = M_i$.

## 集合论

$
\Sigma^* = \Sigma^0 \cup \Sigma^1 \cup \Sigma^2 \cup \Sigma^3 \cdots
$.

$
\Sigma^+ = \Sigma^* - \Sigma^0
$.

## 二元关系

传递关系的交集仍传递，但对其他运算无此性质.

$
R_2\subseteq R_3 \Rightarrow R_1R_2\subseteq R_1R_3 \land R_2R_4\subseteq R_3R_4 
$.

$
R_1(R_2\cup R_3)=R_1R_2\cup R_1R_3, \quad (R_2\cup R_3)R_4=R_2R_4\cup R_3R_4
$.

$
R_1(R_2\cap R_3)\subseteq R_1R_2\cap R_1R_3, \quad (R_2\cap R_3)R_4\subseteq R_2R_4\cap R_3R_4
$.

$R^{-1}$ 保持其原自反、反自反、对称、反对称、传递、反传递性质.

$R_1\circ R_2$ 仅能保持其自反性质.

$R$ 传递 $\Rightarrow R^2\subseteq R$.

$R$ 反传递 $\Rightarrow R^2\cap R=\varnothing$.

相容关系：自反、对称. $sr(R)$.

等价关系：自反、对称、传递. $tsr(R)$.

对称闭包不保持传递性质.

$
st(R)\subseteq ts(R).
$

构造反例证明“传递关系的对称闭包不传递”：简单的传递关系 1 > 2 > 3.

## 图论

$(p, q)$ 图：顶点数为 $p$，边数为 $q$ 的无向图. 

$k$ 度正则图：各顶点次数均为 $k$.

$K_p$：$p$ 阶完全图.

$K_{m,n}$：完全二部图.

生成子图：去掉某些边.

导出子图：去掉某些点及其相关边.

通道：任意邻接顶点序列. $\rightarrow$ 闭通道  
迹：无重复边的通道. $\rightarrow$ 圈  
路径：无重复顶点的通道（更没有重复边）. $\rightarrow$ 初等圈  

顶点 $u, v$ 间存在通道 $\Leftrightarrow$ 存在路径.

块：极大无割点子图.

团：极大完全子图.

对简单连通图：$\gamma(G)\le\varepsilon(G)\le\delta(G)$.

$q \ge p - C(G)$.

$\delta(G)\ge2 \Leftrightarrow G$ 含圈.

$\delta(G)\ge k\Leftrightarrow G$ 有 $k$ 长路径.

简单连通非完全图中，存在顶点 $u, v, w$，使得 $u\operatorname{Adj}v$，$v\operatorname{Adj}w$，$u\operatorname{NAdj}w$. 即邻接关系不传递.

$\forall u\in G, d(u) \vert 2 \Leftrightarrow G$ 不含桥.

含 $2k$ 个奇度顶点的图需要 $k$ 笔画出.

$G$ 是 Euler 图 $\forall u \in G, C(G-u)\le d(u)/2$.

$G$ 是 $p (>3)$ 阶简单图，若 $\forall u, v \in G, d(u) + d(v) \ge p-1$，则 $G$ 含 Hamilton 路径.  
若 $d(u) + d(v) \ge p$，则是 Hamilton 图.

若 $G$ 是 Hamilton 图，则 $\forall S \subset V, S\ne\varnothing, C(G-S) \le \#S$. 导出子图支数 $\le$ 除去的点数.

有度为 1 的点 / 割点 / 桥 $\Leftrightarrow$ 不是 Hamilton 图.

$K_{m, n}$ 当且仅当 $m=n$ 时是 Hamilton 图.

邻接矩阵的幂：$k$-通道数解释.

欧拉公式：对平面图有 $p-q+r=2$.

$p-q+r=C(G)+1$.

对简单平面图，$q\le \frac{L}{L-2}(p-2)$，$L$ 为各面次数最小值. 一般取 $L = 3$，即 $q\le 3p-6$，对二部图取 $L = 4$，即 $q\le 2p-4$.

色数 $\chi(G) \le \varDelta(G)+1$，仅奇圈与 $K_p$ 使等号成立.
