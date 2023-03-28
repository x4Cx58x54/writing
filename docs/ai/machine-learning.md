# 机器学习

## 模型评估与选择

### 评估方法

* 留出法（hold-out）：划分互斥的训练集与测试集.
* $k$ 折交叉验证（$k$-fold cross validation）：将数据集等分为 $k$ 个互斥的子集，每次使用 $k-1$ 个子集训练，剩下一个作为测试集. 这样一共 $k$ 次训练与测试，取结果的均值. 若每子集仅含一个样本，则称为留一法（Leave-One-Out，LOO）.
* 自助法（bootstrapping）：从数据集 $D$ 中，有放回地采样得到 $D'$ 作为训练集，$D\setminus D'$ 作为测试集.

自助法改变了初始数据集分布，会引入估计偏差，但是在数据量较小时较为有效. 若数据足够，则一般使用留出法或交叉验证法.

### 性能指标

* 错误率（error rate）：若分类错误样本有 $a$ 个，总样本数 $m$ 个，则错误率为

$$
E = \frac{a}{m}.
$$

* 精度（accuracy）：

$$
\mathrm{acc} = 1 - \frac{a}{m}.
$$

* 查准率（precision）：分类结果为正例的样本中，真正例之占比：

$$
P = \frac{\mathrm{TP}}{\mathrm{TP} + \mathrm{FP}}.
$$

* 查全率（recall）：在全部正样本中，识别为正之占比：

$$
R = \frac{\mathrm{TP}}{\mathrm{TP} + \mathrm{FN}}.
$$

平衡点（Break-Even Point，BEP）根据 $P = R$ 时的值评价分类器，一个更常用的综合 $P$ 与 $R$ 的评价指标是 $F_1$ 值，定义为 $P$ 与 $R$ 的调和平均

$$
F_1 = \frac{2PR}{P+R}.
$$

$F_\beta$ 则是 $P$ 与 $R$ 的调和平均

$$
F_\beta = \frac{(1+\beta^2)PR}{(\beta^2P + R)},
$$

即

$$
\frac{1}{F_\beta} = \frac{1}{1+\beta^2}\left(\frac{1}{P} + \frac{\beta^2}{R}\right).
$$

由于调和平均更重视较小值， $\beta$ 代表了 $R$ 的相对重要性.

当有多个二分类混淆矩阵时，可计算各混淆矩阵上的 $P$ 与 $R$，然后进行平均得到 $\text{macro-}P$ 与 $\text{macro-}R$，进而计算 $\text{macro-}F_1$；或平均混淆矩阵当中的各元素，得到 $\overline{\mathrm{TP}}$、$\overline{\mathrm{FP}}$、$\overline{\mathrm{TN}}$、$\overline{\mathrm{FN}}$，从而计算 $\text{micro-}P$ 与 $\text{micro-}R$ 与 $\text{micro-}F_1$.

ROC 曲线的纵轴是真正例率（TPR），横轴是假正例率（FPR），分别定义为正例中正确识别为正的占比与负例中误识别为正的占比：

$$
\mathrm{TPR} = \frac{\mathrm{TP}}{\mathrm{TP} + \mathrm{FN}},
$$

$$
\mathrm{FPR} = \frac{\mathrm{FP}}{\mathrm{TN} + \mathrm{FP}}.
$$

## Supervised Learning Algorithms

### Logistic Regression

#### Logistic?

Logistic 分布的概率累积函数定义为

$$
F(x) = \frac{1}{1+\exp\left(-\dfrac{x-\mu}{\gamma}\right)}.
$$

这就是广为人知的“S 形曲线”. $F$ 取值范围为 $(0, 1)$，在 $x = \mu$ 处有值 $1/2$，且以此点 $(\mu, 1/2)$ 中心对称. $\gamma > 0$ 时 $F$ 单调递增，反之则递减；$\gamma$ 绝对值越小，$F$ 在 $x = \mu$ 附近变化越快；$\gamma = +\varepsilon$ 时 $F$ 退化为阶跃函数.

#### Regression?

Logistic regression 实际上处理的是分类问题，而采用的手段是使用 logistic 曲线拟合概率. 为何不直接用阶跃函数拟合？因为阶跃函数并非处处可微，带来优化上的困难. 下图是一个当 $x$ 为 1 维向量时的简单例子.再曲线上的点 $y$ 值越大，说明该样本为蓝色的概率越高.

<iframe src="https://www.desmos.com/calculator/qmzqy5pdix?embed" width="500" height="300" style="border: 1px solid #ccc" frameborder=0></iframe>

假设有样本集 $\{(x_i, y_i): x_i\in\mathbb{R}^m, \ y_i\in\{0, 1\}, \ i = 1, \cdots, n\}$，那么要估计的就是概率 $p = P(Y = 1 \mid x)$. 为了方便计算，这里用 $\hat{p} = 1 - F(x)$ 估计这个概率，也就是估计曲线的参数 $\mu$ 和 $\gamma$. 这里再把这两个参数换成更常用的形式：$-\frac{x-\mu}{\gamma} = w\cdot x'$，其中 $x' = [x, 1]^\top$. 以下均用 $x$ 代替 $x'$. 此时问题就已经初步形式化为：求最优的 $w$，使

$$
\hat{p} = \frac{\exp(w\cdot x)}{1+\exp(w\cdot x)}
$$

最接近 $p = P(Y = 1 \mid x)$.

#### Logit?

至此，这条曲线的拟合还并不直观. 这里做一个变换，将概率转换为 logit（称为对率）. 对于某事件的概率 $p$，其对率为

$$
\operatorname{logit}p = \log \mathrm{odds} = \log\frac{p}{1-p}.
$$

Logit 变换使得

* $p = 1$ 时，$\operatorname{logit}p = +\infty$,
* $p = \frac{1}{2}$ 时，$\operatorname{logit}p = 0$,
* $p = 1$ 时，$\operatorname{logit}p = -\infty$.

但是最重要的是 logit 和 logistic 曲线两者性质的完美配合使曲线变为了线性：当 $p$ 是 logistic 曲线时，代入 $p = \frac{\exp(w\cdot x)}{1+\exp(w\cdot x)}$，有

$$
\operatorname{logit} p = w\cdot x.
$$

即此时事件的对率是一个关于 $x$ 的线性函数.

#### 参数估计

再次强调，logistic regression 的目标是用一个 logistic 曲线 $\hat{p} = \frac{\exp(w\cdot x)}{1+\exp(w\cdot x)}$ 估计 $p = P(Y = 1 \mid x)$，从而可以实现根据 $x$ 预测 $y$. 由于 $y_i \in \{0, 1\}$，有对数似然函数

$$
\begin{aligned}
\log L(w) &= \log\prod_{i=1}^n \hat{P}(Y = 1\mid x)^{y_i} \hat{P}(Y = 0 \mid x)^{1-y_i} \\
&= \sum_{i=1}^n (y_i\log \hat{p} + (1-y_i)\log (1-\hat{p})) \\
&= \sum_{i=1}^n \left(y_i\log \frac{\hat{p}}{1-\hat{p}} + \log (1-\hat{p})\right) \\
&= \sum_{i=1}^n \left(y_i (w\cdot x_i) - \log (1+\exp(w\cdot x_i))\right).
\end{aligned}
$$

求解的目标是使 $\log L(w)$ 最大，那么定义损失函数样本平均的负对数似然

$$
\ell(w) = -\frac{1}{n}\log L(w).
$$

##### 随机梯度下降

损失函数的一阶梯度

$$
\frac{\partial \ell}{\partial w} = \left(\frac{\exp(w \cdot x_i)}{1 + \exp(w \cdot x_i)} - y_i\right)x_i,
$$

迭代下降

$$
w^{(k+1)} = w^{(k)} - \alpha \frac{\partial \ell}{\partial w},
$$

其中 $\alpha$ 为学习率.

##### 牛顿法

对于一个二阶连续可微函数，牛顿法在当前估计的极小值点 $w^{(k)}$ 处进行二阶泰勒展开

$$
\varphi(w) = \ell(w^{(k)}) + \ell'(w^{(k)})(w - w^{(k)}) + \frac{1}{2}\ell''(w^{(k)})(w - w^{(k)})^2.
$$

那么 $\varphi(w)$ 是 $\ell(w)$ 在 $w^{(k)}$ 附近的一个近似，所以 $\varphi(w)$ 的极小值点可用于近似 $\ell(w)$ 的极小值点. 令 $\varphi'(w^{(k+1)}) = 0$，有

$$
w^{(k+1)} = w^{(k)} - \frac{\ell'(w^{(k)})}{\ell''(w^{(k)})} = w^{(k)} - H_k^{-1} \ell'(w^{(k)}),
$$

其中 $H_k$ 为海森矩阵，$H_{ij} = \dfrac{\partial^2 \ell(w)}{\partial w_i \partial w_j}$.


## Optimizations

### 正则化

#### L0 正则化

使用最优参数子集选择，即认为好的模型参数数量不应过多. 在损失函数中加入正则化项 $\|w\|_0$，以使惩罚与非零参数数量成正比. 这样做的问题在于正则化项的梯度要么不存在，要么为 0，无法使用梯度下降优化，而遍历每一个参数子集的复杂度过高. 所以使用 L0 正则项的最优凸近似代替，这个最优凸近似就是 L1 正则项.

#### L1 正则化

使用 LASSO（least absolute shrinkage and selection operator），即加入先验：$w_i$ 服从 0 均值的拉普拉斯分布：

$$
f(w_i; \mu, b) = \frac{1}{2b}\exp\left(-\frac{|w_i - \mu|}{b}\right).
$$

故似然函数为

$$
L_1(w) = P(y| w, x)P(w) = L(w)\cdot\prod_{i=1}^d \frac{1}{2b}\exp\left(-\frac{|w_j|}{b}\right).
$$

那么相应地，负对数似然为

$$
-\log L_1(w) = - \log L(w) + \frac{1}{2b} \|w\|_1.
$$

增加的这一项即为 L1 正则项.

#### L2 正则化

使用 ridge 回归，即加入先验：$w_i$ 服从零均值的正态分布：

$$
f(w_i; 0, \sigma) = \frac{1}{\sigma\sqrt{2\pi}}\exp\left(-\frac{w_i^2}{2\sigma^2}\right).
$$

通过与上面相似的计算，可以得到在损失函数中额外增加的项为

$$
d\log (\sigma\sqrt{2\pi}) + \frac{1}{2\sigma^2}w^\top w,
$$

忽略常数项，那么等价于增加了 L2 正则项.

#### Elastic Net 正则化

Elastic Net 正则化相当于同时加入了 L1 和 L2 正则项. 即正则项为 $\lambda_1\|w\|_1 + \lambda_2\|w\|_2$.

#### 几何解释

简单起见图中以二维的 $w$ 举例[^regularizations]. 图中红色线条为原损失函数的等高线，蓝/灰色线条为正则项的等高线. 可见在原损失函数的等高线上，要使正则项最小，则 $w$ 取交点处，正则项的等高线上，要使原损失函数越小，$w$ 也取交点. 故正则化后的损失函数最小值点往往在两项各自的某等高线交点处取得.

[^regularizations]: <https://en.wikipedia.org/wiki/File:L1_and_L2_balls.svg>{: target="_blank"}

![](https://upload.wikimedia.org/wikipedia/commons/f/f8/L1_and_L2_balls.svg)

对于 L1 正则化，这样的点倾向于使 $w$ 的一些分量为 0，从而得到稀疏解；而 L2 正则化处处可微，而且倾向于使 $w$ 各分量都较小.

从概率的角度解释，拉普拉斯分布在其期望处有一个显著的尖峰，所以 L1 正则化使 $w$ 分量为 0 的概率很高；正态分布的概率密度曲线则比较平缓，所以只使 $w$ 处于较小值时概率较大.

