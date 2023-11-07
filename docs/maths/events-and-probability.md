# Events and Probability

#### 抽火柴[^1]

[^1]: 陈希孺, 概率论与数理统计.

一个人在口袋里放 2 盒火柴，每盒 $n$ 支，每次抽烟时从口袋中随机拿出一盒（即每次每盒有同等机会被拿出）并用掉一支，到某次他迟早会发现：取出的那一盒已空了. 问“这时另一盒中恰好有 $m$ 支火柴”的概率是多少？

??? Hint
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


#### 分层抽取

$n$ 个红球和 $n$ 个白球，分装至两个容器中。均等概率选择一个容器从中取一个球，如何分配球能使得取到红球概率最大？

??? Hint

    注意两容器球数并不限制为均等。第一个容器中仅有 1 个红球，其余球均放进第二个容器，这样只要选中了第一个容器就一定取到红球，而第二个容器仍有略小于一半的概率取到红球，总体取到红球的概率略小于 3/4.


#### 扑克分组

54 张扑克打乱分成三组，求大小王在同一组的概率。

??? Hint

    考虑大小王在前 18 张中的情况数：先从前 18 个位置中选出 2 个给大小王（$P_{18}^2$），剩余的所有牌全部排列一遍（$52!$），大小王在三堆中任意一堆的概率均等，故概率为 $\frac{3\cdot P_{18}^2\cdot 52!}{54!} = \frac{17}{53}$.


#### 赛马

64 匹马，8 条赛道，最少几次比赛能决出前 4 名？

??? Hint

    假设每一匹马都有一个固定的速度属性，每次比赛的结果仅取决于马的速度的比较，即马之间存在确定的全序关系。将这 64 匹马列成表格，其中：

    * ***粗斜体***表示参加某次比赛；
    * <font color="gray">灰色</font>表示被淘汰；
    * <font color="#ebb10d">黄色</font>表示已确定为前 4 名中的某位置；
    * A 到 B 的箭头表示可知 A 快于 B.

    注意一匹马在任意一场比赛取得的名次不可能优于其总排名，且箭头组成的任一链条上名次大于 4 者必定被淘汰。

    首先将所有马分为 8 组，比赛 8 场，表格中每行表示一场比赛。每一匹马用所获名次表示。淘汰所有名次大于 4 的马。

    <style>
    table {
        border-collapse: collapse;
        border: 0 !important;
    }
    table td {
        width: 24px;
        height: 24px;
        text-align: center !important;
        font-size: 11px;
        line-height: 1;
        padding: 0 !important;
        border: 1px solid var(--md-typeset-table-color) !important;
        position: relative;
    }
    table td.selected {
        color: #ebb10d;
        background-color: rgba(249,236,195,0.5);
    }
    table td.highlight {
        color: rgba(32,161,98,1);
        background-color: rgba(102,193,140,0.2);
    }
    table td.elimated {
        opacity: 0.4;
        background-color: rgba(127,127,127,0.2);
    }
    table#race1 td, table td.racing {
        font-weight: bold;
        font-style: italic;
    }
    table td.down::after, table td:not(:last-child)::before {
        position: absolute;
        font-style: normal;
        font-weight: bold;
        color: #AAA;
        opacity: 0.8;
        z-index: 2;
    }
    table td:not(:last-child)::before {
        right: -25%;
        content: "→";
    }
    table td.down::after {
        left: 0;
        right: 0;
        bottom: -30%;
        content: "↓";
        text-align: center;
    }

    </style>

    <div align="center">
    <table id="race1">
    <tr>
        <td>1</td><td>2</td><td>3</td><td>4</td>
        <td class="elimated">5</td><td class="elimated">6</td><td class="elimated">7</td><td class="elimated">8</td>
    </tr>
    <tr>
        <td>1</td><td>2</td><td>3</td><td>4</td>
        <td class="elimated">5</td><td class="elimated">6</td><td class="elimated">7</td><td class="elimated">8</td>
    </tr>
    <tr>
        <td>1</td><td>2</td><td>3</td><td>4</td>
        <td class="elimated">5</td><td class="elimated">6</td><td class="elimated">7</td><td class="elimated">8</td>
    </tr>
    <tr>
        <td>1</td><td>2</td><td>3</td><td>4</td>
        <td class="elimated">5</td><td class="elimated">6</td><td class="elimated">7</td><td class="elimated">8</td>
    </tr>
    <tr>
        <td>1</td><td>2</td><td>3</td><td>4</td>
        <td class="elimated">5</td><td class="elimated">6</td><td class="elimated">7</td><td class="elimated">8</td>
    </tr>
    <tr>
        <td>1</td><td>2</td><td>3</td><td>4</td>
        <td class="elimated">5</td><td class="elimated">6</td><td class="elimated">7</td><td class="elimated">8</td>
    </tr>
    <tr>
        <td>1</td><td>2</td><td>3</td><td>4</td>
        <td class="elimated">5</td><td class="elimated">6</td><td class="elimated">7</td><td class="elimated">8</td>
    </tr>
    <tr>
        <td>1</td><td>2</td><td>3</td><td>4</td>
        <td class="elimated">5</td><td class="elimated">6</td><td class="elimated">7</td><td class="elimated">8</td>
    </tr>
    </table>
    </div>

    第 9 场比赛，总冠军一定在各组比赛的第一名中产生，且淘汰本场比赛名次大于 4 者以及更慢者等。

    <div align="center">
    <table>
    <tr>
        <td class="racing selected down">1<small>st</small></td><td>2</td><td>3</td><td>4</td>
    </tr>
    <tr>
        <td class="racing down">12</td><td>2</td><td>3</td><td class="elimated">4</td>
    </tr>
    <tr>
        <td class="racing down">13</td><td>2</td><td class="elimated">3</td><td class="elimated">4</td>
    </tr>
    <tr>
        <td class="racing down">14</td><td class="elimated">2</td><td class="elimated">3</td><td class="elimated">4</td>
    </tr>
    <tr>
        <td class="racing elimated down">15</td><td class="elimated">2</td><td class="elimated">3</td><td class="elimated">4</td>
    </tr>
    <tr>
        <td class="racing elimated down">16</td><td class="elimated">2</td><td class="elimated">3</td><td class="elimated">4</td>
    </tr>
    <tr>
        <td class="racing elimated down">17</td><td class="elimated">2</td><td class="elimated">3</td><td class="elimated">4</td>
    </tr>
    <tr>
        <td class="racing elimated">18</td><td class="elimated">2</td><td class="elimated">3</td><td class="elimated">4</td>
    </tr>
    </table>
    </div>

    此时总亚军和季军可能出现的范围分别如下绿色区域所示。右下四匹马可能的最佳排名只能是第四。若其中某匹马排名第四，那么指向其的那匹马一定是总季军（这些马不在总亚军可能出现的范围内）

    <div align="center" style="display:flex;justify-content: space-evenly;">
    <table>
    <tr>
        <td class="selected down">1<small>st</small></td><td class="highlight">2</td><td>3</td><td>4</td>
    </tr>
    <tr>
        <td class="highlight down">12</td><td>2</td><td>3</td>
    </tr>
    <tr>
        <td class="down">13</td><td>2</td>
    </tr>
    <tr>
        <td>14</td>
    </tr>
    </table>
    <table>
    <tr>
        <td class="selected down">1<small>st</small></td><td class="highlight">2</td><td class="highlight">3</td><td>4</td>
    </tr>
    <tr>
        <td class="highlight down">12</td><td class="highlight">2</td><td>3</td>
    </tr>
    <tr>
        <td class="highlight down">13</td><td>2</td>
    </tr>
    <tr>
        <td>14</td>
    </tr>
    </table>
    </div>

    故第 10 场比赛参与者包括以上绿色部分，剩余三个名额分配给右下角四匹马中的三匹，且前两名一定为总亚、季军。简洁起见，略去此次比赛产生的结果箭头。特定情况下可以直接淘汰未参加本次比赛的马，即确定本次比赛的前三名分列总第二至四名，而分析的关键在于指向总第四名的马一定在总前三中。那么这样总共只需要进行 10 场比赛，这些情况包括

    * 本次比赛前两名为位于左上第二条次反对角线的两匹马。此时无论右下四匹马是否参加比赛，均能确定总第四名为本次比赛第三名（可能出现在左上第三条次反对角线中的任一位置，未标出）

    <div align="center" style="display:flex;justify-content: space-evenly;">
    <table>
    <tr>
        <td class="selected down">1<small>st</small></td><td class="racing selected">3<small>rd</small></td><td class="racing">3</td><td class="elimated">4</td>
    </tr>
    <tr>
        <td class="racing selected down">2<small>nd</small></td><td class="racing">2</td><td class="elimated">3</td>
    </tr>
    <tr>
        <td class="racing down">13</td><td class="elimated">2</td>
    </tr>
    <tr>
        <td class="elimated">14</td>
    </tr>
    </table>
    <table>
    <tr>
        <td class="selected down">1<small>st</small></td><td class="racing selected">2<small>nd</small></td><td class="racing">3</td><td class="elimated">4</td>
    </tr>
    <tr>
        <td class="racing selected down">3<small>rd</small></td><td class="racing">2</td><td class="elimated">3</td>
    </tr>
    <tr>
        <td class="racing down">13</td><td class="elimated">2</td>
    </tr>
    <tr>
        <td class="elimated">14</td>
    </tr>
    </table>
    </div>

    * 总第三名在左上第三条次反对角线上，但仍可以依据结果淘汰未参加比赛的马，举两例如下

    <div align="center" style="display:flex;justify-content: space-evenly;">
    <table>
    <tr>
        <td class="selected down">1<small>st</small></td><td class="racing">2</td><td class="racing elimated">3</td><td class="elimated">4</td>
    </tr>
    <tr>
        <td class="racing selected down">2<small>nd</small></td><td class="racing selected">3<small>rd</small></td><td class="racing">3</td>
    </tr>
    <tr>
        <td class="racing down">13</td><td class="racing elimated">2</td>
    </tr>
    <tr>
        <td class="elimated">14</td>
    </tr>
    </table>
    <table>
    <tr>
        <td class="selected down">1<small>st</small></td><td class="racing selected">2<small>nd</small></td><td class="racing selected">3<small>rd</small></td><td class="racing">4</td>
    </tr>
    <tr>
        <td class="racing down">12</td><td class="racing elimated">2</td><td class="elimated">3</td>
    </tr>
    <tr>
        <td class="racing down elimated">13</td><td class="elimated">2</td>
    </tr>
    <tr>
        <td class="elimated">14</td>
    </tr>
    </table>
    </div>

    若右下角四匹马中未参加本轮比赛的一匹仍未被排除为总第四名可能性，则需要再组织一场前一次未参加比赛的马与其它潜在争夺者的比赛，总共进行 11 场比赛。


#### 公路

假设一段公路上，一小时内有汽车经过的概率为 96%，求半小时内有汽车经过的概率。

??? Hint

    一小时内无汽车经过的概率为 0.04，等价于连续两次半小时无汽车经过，且两次事件独立，故半小时内无汽车经过的概率为 0.2.


#### 等待时间期望

公交车 $T$ 分钟一趟，问等车时间的期望是多少？

??? Hint

    首先毫无疑问的是，任一次等待的时间 $t$ 服从均匀分布 $U(0, T)$. 若此期望为平均每次等待的时间，那么显然为 $\int_0^T t\frac{1}{T}\mathrm{d}t = \frac{T}{2}$.

    但是存在另一种计算期望的情况：在随机的时间点抽取一等车人的总等车时间 $X$，那么显然概率随着 $X$ 线性增长：$P(X=x) = kx$，且 $\int_0^T P(X=x)\mathrm{d}x = 1$，解得 $k = 2/T^2$. 故期望 $\mathrm{E}(X) = \frac{2}{3}T$.


#### rand 生成 rand

如何用均匀分布的 `rand(n)` 生成 `rand(m)`？

??? Hint

    视为一个 $n$ 进制数生成器，生成的数若超出范围 $m$ 则拒绝，重新生成。以 `rand(5)` 生成 `rand(7)` 为例，7 在 5 进制数中有两位数，故一次生成中运行两次 `rand(5)` 得到 $a_0$ 和 $a_1$。若 $5^0a_0 + 5^1a_1 < 7$ 则接受，否则重新采样。

#### 放回黑白球

桶中有黑白球各 10000 个，每次取两个球，若同色则放回一个黑球，若异色则放回一个白球。求最后一个球是黑色的概率。

??? Hint

    每次操作有三种情况：

    * 取出 1 白 1 黑，放回 1 白；
    * 取出 2 白，放回 1 黑
    * 取出 2 黑，放回 1 黑

    可以通过两种方式理解：

    * 每次操作后白球数量要么不变，要么减少 2，故白球的奇偶性保持不变。若初始白球有偶数个，那么最后剩下的唯一一个球一定不是白球。
    * 将白球看作 1，黑球看作 0，那么最后一个球就是所有球异或的结果。


#### 帽子问题 | The hat-check problem[^derange]

[^derange]: [Derangement - Wikipedia](https://en.wikipedia.org/wiki/Derangement)

$n$ 个人帽子随机打乱，无人取回原帽子的概率。

??? Hint

    记满足条件的情况数为 $D(n)$，第 $i$ 个人为 $P_i$，第 $i$ 顶帽子为 $H_i$. 首先 $P_1$ 仅能拿除 $H_1$ 以外的帽子，假设拿到的是 $H_j$，这里 $j$ 有 $n-1$ 种情况。考虑 $P_j$：

    * 若 $P_j$ 拿到 $H_1$，那么 $P_1$ 和 $P_j$ 以及他们的帽子已经确定，剩余 $n-2$ 个人和他们对应的帽子，即此时情况数等于 $D(n-2)$；
    * 若 $P_j$ 拿的不是 $H_1$，那么还剩下 $n-1$ 个人，其中 $P_j$ 不能拿 $H_1$，其余 $P_i$ 不能拿 $P_i$，情况数等于 $D(n-1)$.

    综上有递推式 $D(n) = (n-1)\cdot(D(n-2) + D(n-1))$.

    对于边界情况有 $D(1) = 0$、$D(2) = 1$.


#### 反面结束游戏

连续抛硬币，抛到反面即停止，求结束抛硬币需要次数的期望。

??? Hint

    记 $X$ 为结束抛硬币需要的次数。显然 $X$ 服从几何分布，$P(X=x) = 2^{-x}$. $\mathrm{E}(X) = \sum_{x=1}^{\infty} x2^{-x}$. 为了计算该级数求和，记硬币向上的概率为 $p$，则 $\mathrm{E}(X) = \sum_{x=1}^{\infty} xp^x$. 已知 $\sum_{x=1}^{\infty} p^x = \frac{p}{1-p}$. 两边对 $p$ 微分得 $\sum_{x=1}^{\infty}xp^{x-1} = \frac{1}{(1-p)^2}$，故 $\mathrm{E}(X) = \sum_{x=1}^{\infty} x2^{-x} = 2$.


#### 集齐骰子六面

掷骰子直到结果集齐六面结束，求掷骰子次数的期望。

??? Hint

    当还有 $n$ 种点数未出现过，使这些点数中的某一个出现所需要的掷骰子次数 $X$ 服从几何分布 $G(n/6)$，期望为 $6/n$.

    * 使第一个数出现的次数期望为 6/6 = 1，这也是显而易见的；
    * 在此基础上，使第二个数出现的次数期望为在以上基础上平均再掷的次数，为 1 + 6/5；
    * ...

    如此将期望累加，得到最终使六个数均出现的期望为 6/6 + 6/5 + 6/4 + 6/3 + 6/2 + 6/1 = 14.7


#### 飞机座位

飞机上有 100 个座位，100 个乘客逐个登机。每个乘客尽量坐自己的座位，但若座位被占则随便坐。第一个乘客喝醉了随便坐，问最后一个人坐到自己座位的概率。

??? Hint

    首先将问题一般化，记人数为 $n$ 时，最后一个人坐到自己座位的概率为 $P_n$. 以下情况中，最后一个人可以坐到自己的座位：

    * 醉鬼以 $1/n$ 的概率坐到自己的 1 号座位；
    * 醉鬼以 $1/n$ 的概率坐到 2 至 $n-1$ 号座位的任一个，记为 $k$，等到这个被占座的乘客登机时，他随机在剩余的 $n - k + 1$ 座位中选一个。此时相当于这位乘客请醉鬼坐到别处，即问题缩小为了 $n = n - k + 1$ 时的情形。

    边界情况 $P_1 = 1$，$P_2 = \frac{1}{2}$.

    故以上情况可列出递推式

    $$
    P_n = \frac{1}{n} + \sum_{k=2}^{n-1} \frac{1}{n} P_{n-k+1} = \frac{1}{n}\sum_{k=1}^{n-1}P_k, \quad n = 2, 3, \cdots.
    $$

    解得 $P_n = \frac{1}{2}$ 对大于 1 的整数恒成立。


#### 空盒子

$a$ 个球随机放进 $b$ 个盒子，求空盒子数量的期望。

??? Hint

    任意一个盒子最终是空的概率是 $(1-\frac{1}{b})^a$，这个值也代表着对于一个盒子而言空盒子数量的期望。故对所有盒子来说空盒子数量的期望是 $b(1-\frac{1}{b})^a$. 注意期望对于任意随机变量都是线性的，无论各变量是否独立。


#### 异常硬币

1000 枚硬币有一枚两面都是花，其余硬币正常。拿出一个硬币抛 10 次均为花面，求这枚硬币不正常的概率。

??? Hint

    记 $n$ 枚硬币中取到一枚异常硬币为事件 $A$，某一枚硬币抛 $k$ 次均为花为事件 $B$，则所求概率为

    $$
    \begin{aligned}
    P(A\mid B)
    &= \frac{P(A, B)}{P(B)}\\
    &= \frac{P(A, B)}{P(B\mid A)P(A) + P(B\mid \bar{A})P(\bar{A})}\\
    &= \frac{\frac{1}{n}}{1\cdot \frac{1}{n} + \frac{1}{2^k}\cdot \frac{n-1}{n}}\\
    &= \frac{2^k}{2^k + n-1}.
    \end{aligned}
    $$
