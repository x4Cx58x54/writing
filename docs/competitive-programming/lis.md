# 最长上升子序列 | LIS

[递增 - 洛谷](https://www.luogu.com.cn/problem/P3902){:target="_blank"}

只需要维护一个数组 `d[i]` 记录所有长为 `i` 的递增子串的最后一个元素的最小值。显然这个数组也是递增的。每从序列中读入一个数，它都可以拼接到 `d` 中恰比它小的那个数代表的序列之后。这里使用二分查找实现。

```cpp
#include <stdio.h>
#include <algorithm>
int main()
{
    int a, d[100001];
    int n, len = 0, p;
    scanf("%d %d", &n, &d[0]);
    for(int i = 1; i < n; i++)
    {
        scanf("%d", &a);
        if (a > d[len]) d[++len] = a;
            else *std::lower_bound(d, d+len, a) = a;
    }
    printf("%d", n-len-1);
    return 0;
}
```

若求最长不降子序列，则将 `lower_bound` 改为 `upper_bound` 即可。

若求最长下降/不升子序列，则需要在查找函数中加上第四个参数 `std::greater<int>()`.
