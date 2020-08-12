
# 树状数组 | Fenwick Tree

树状数组是一种支持高效单点修改和区段求和两种操作的数据结构。

树状数组并不直接存储数组中的元素，而是将原有数据进行一定变换后再存入数组。如图所示，数组中每一个元素都代表树上的一个节点，树状数组的该元素存储的是对应节点的子节点之和。或者说，是该节点子树每一节点对应的原数组中的元素之和。如 `c4` 节点为原数组中 1 至 4 元素之和。

观察可知，若节点序号 $x$ 是 $2^n$ （$n$ 尽可能大）的倍数，则它的子树管理小于等于 $x$ 的连续 $n+1$ 个元素，且 $n+1$ 正好是 $x$ 二进制表示中最右的 1 代表的权值。利用补码的性质，可以直接得到 $n+1 = x \operatorname{\&} -x$，将这个运算记为 `lowbit`。

![](./img/fenwick.svg){: width=600px}

这样，在原数组某位置 $x$ 增加 $k$ 时，就需要从 $x$ 开始上溯父节点，并加上 $k$。每一次上溯所移动的距离正好就是当前节点序号的 `lowbit` 值。

在求取原数组某位置 $x$ 的前缀和时，只需要从 $x$ 开始向前，求取每一个子树之和。每一次向前移动的距离也是当前节点序号的 `lowbit` 值。

如果直接存储，则单点修改的复杂度是 $O(1)$，区间求和的复杂度是 $O(n)$，若使用前缀和数组，则两项指标互换。树状数组的单点修改和区间求和的复杂度都是 $O(\log n)$，很好地平衡了性能。

[树状数组 1 - 洛谷](https://www.luogu.com.cn/problem/P3374){:target="_blank"}


```c++
long long fenwick[500010];
inline int lowbit(int pos)
{
    return pos & -pos;
}
inline void add(int pos, long long k, int n)
{
    while(pos <= n)
    {
        fenwick[pos] += k;
        pos += lowbit(pos);
    }
}
inline long long sum(int pos)
{
    long long res = 0;
    while(pos >= 1)
    {
        res += fenwick[pos];
        pos -= lowbit(pos);
    }
    return res;
}
```

[树状数组 2 - 洛谷](https://www.luogu.com.cn/problem/P3368){:target="_blank"}

如果需要单点取值，区间修改，则可以使用将每一个数据表示为与之前一位的差分，再使用树状数组存储。则单点取值的操作为 `sum(x)`，区间 $[x, y)$ 增加 $k$ 的操作为 `add(x, k), add(y, -k)`。在存入差分数组初值时，应计算差分直接存入数组，以降低复杂度。
