# 直线交点数

[直线交点数 - 洛谷](https://www.luogu.com.cn/problem/P2789){:target="_blank"}

平面上有 $n$ 条直线，且无三线共点，那么这些直线能有多少不同的交点数？

在这 $n$ 条直线中，考虑恰有 $k\ (1 \le k \le n)$ 条相互平行。则这 $k$ 条直线必然与其余 $n-k$ 条直线各有交点。这里产生的交点有 $k\cdot(n-k)$ 个，再加上 $n-k$ 条直线的交点数即得当前方案交点数。对每一个可能的 $k$ 以及每一个可能的 $n-k$ 条直线的交点数枚举即得答案。

以上方法会产生直线平行方案上的重复，但是题目只要求计算交点数不同的方案数，故只要交点数相同，不管方案是否重复，均视为一种情况。直接使用 `set` 数组枚举递推即可。

```c++
#include <stdio.h>
#include <set>
int main(void)
{
    //freopen("input.txt", "r", stdin);
    int n;
    std::set<int> cross[26];
    std::set<int>::iterator it;
    cross[1].insert(0);
    scanf("%d", &n);
    for(int i = 2; i <= n; i++)
    {
        cross[i].insert(0);
        for(int j = 1; j < i; j++)
            for(it = cross[i-j].begin(); it != cross[i-j].end(); it++)
                cross[i].insert(*it+(j*(i-j)));
    }
    printf("%d", cross[n].size());
    return 0;
}
```
