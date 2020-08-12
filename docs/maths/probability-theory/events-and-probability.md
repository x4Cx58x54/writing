# Events and Probability


一个人在口袋里放 2 盒火柴，每盒 $n$ 支，每次抽烟时从口袋中随机拿出一盒（即每次每盒有同等机会被拿出）并用掉一支，到某次他迟早会发现：取出的那一盒已空了. 问“这时另一盒中恰好有 $m$ 支火柴”的概率是多少?[^1]

[^1]: 陈希孺, 概率论与数理统计.

??? note "Hint"
    我们来考察最初 $2n+1-m$ 次抽用的情况，每次抽用时有 2 种方法（抽出甲盒或乙盒），故总的不同的抽法有 $2^{2n+1-m}$ 种. 有利于所述时间的抽法可计算如下：先看“最后一次（即第 $2n+1-m$ 次）抽出甲盒”的情况. 为使所述事件发生，在前 $2n-m$ 次中，必须有 $n$ 次抽用甲盒，实现这一点不同的抽法为 $\mathrm{C}_{2n-m}^{n}$. 类似的，“最后一次抽出乙盒”的抽法也有这么多. 故有利于所述时间的全部抽法为 $2\mathrm{C}_{2n-m}^{n}$，而事件的概率为

    $$
    \frac{2\mathrm{C}_{2n-m}^{n}}{2^{2n+1-m}} = \frac{\mathrm{C}_{2n-m}^{n}}{2^{2n-m}}.
    $$


#### Pairwise Independence[^2]

[^2]: DeGroot, Schervish, *Probability and Statistics*, Fourth Edition.

Consider an experiment in which the sample space $S$ contains four outcomes $\{s_1, s_2, s_3, s_4\}$, and suppose that the probability of each outcome is $1/4$. Let the three events $A$, $B$ and $C$ be defined as follows:

$$
A = \{s_1, s_2\},\ \ B = \{s_1, s_3\},\ \ \mathrm{and}\ \ C = \{s_1, s_4\}.
$$

Then $AB = AC = BC = ABC = \{s_1\}$. Hence,

$$
\Pr(A) = \Pr(B) = \Pr(C) = 1/2
$$

and

$$
\Pr(AB) = \Pr(AC) = \Pr(BC) = \Pr(ABC) = 1/4.
$$

These results can be summarized by saying that the events $A$, $B$ and $C$ are *pairwise independent*, but all three events are not independent.
