# 公共子串数

[公共子串 - 洛谷](https://www.luogu.com.cn/problem/P3856){:target="_blank"}

求三个字符串中互不相同的公共子串数目。

三个字符串分别记为 `a`、`b`、`c`，下标均起始于 1。对三个字符串中的每一个字符，计算它之前一次出现的位置，存入对应的 `last` 数组中（若该字符之前未出现过则存入 0）。

`f[i][j][k]` 代表 `a[1..i]`、`b[1..j]` 和 `c[1..k]` 上互不相同的公共子串数目（即子问题的解）。下面动态规划计算 `f`。

当 `a[i] == b[j] == c[k] == ch` 时，会产生新的公共子串。此时考虑将 `ch` 接到之前出现的所有公共子串之后，这样就产生了与之前数量相同的新公共子串，再加上 `ch` 本身也是新公共子串，故此时有

$$
f_{i,\,j,\,k} = 2\cdot f_{i-1,\,j-1,\,k-1} + 1.
$$

但是上面没有考虑重复的情况。哪一部分公共子串是重复的呢？为了方便，我们先将 `ch` 在三个字符串中上一次出现的位置 `lasta[a[i]]`、`lastb[b[j]]` 和 `lastc[c[k]]` 分别记为 `li`、`lj`、`lk`。那么在计算 `f[li][lj][lk]` 和 `f[i][j][k]` 时均会在 `f[li-1][lj-1][lk-1]` 所代表的公共子串末尾接上 `ch`，这部分就是重复的。还有 `ch` 本身亦重复，故当 `li`、`lj` 和 `lk` 均不为 0 时，需要考虑重复数。

$$
f_{i,\,j,\,k} = 2\cdot f_{i-1,\,j-1,\,k-1} - f_{li-1,\,lj-1,\,lk-1}.
$$

若 `a[i]`、`b[j]`、`c[k]` 不相等，那么没有新的公共子串产生，此时直接将之前的值继承过来即可。但问题在于，如何定义“之前”呢？直接复制 `f[i-1][j-1][k-1]` 显然是错的，因为未考虑在 `f[i-1][j][k]` 等处产生的新公共子串。很容易可以想到容斥原理：

$$
\begin{aligned}
f_{i,\,j,\,k} = &\phantom{+} f_{i-1,\,j,\,k} + f_{i,\,j-1,\,k} + f_{i,\,j,\,k-1}\\
&- f_{i-1,\,j-1,\,k} - f_{i,\,j-1,\,k-1} - f_{i-1,\,j,\,k-1}\\
&+ f_{i-1,\,j-1,\,k-1}.
\end{aligned}
$$

```cpp
#include <stdio.h>
#include <string.h>
char a[128], b[128], c[128];
int alen, blen, clen;
int lasta[128], lastb[128], lastc[128], templast['z' + 1];
long long f[128][128][128];
inline void compute_last(char str[], int last[], int length)
{
    for(int i = 'a'; i <= 'z'; ++i) templast[i] = 0;
    for(int i = 1; i <= length; ++i)
    {
        last[i] = templast[str[i]];
        templast[str[i]] = i;
    }
}
int main()
{
    scanf("%s%s%s", a+1, b+1, c+1);
    alen = strlen(a+1);
    blen = strlen(b+1);
    clen = strlen(c+1);
    compute_last(a, lasta, alen);
    compute_last(b, lastb, blen);
    compute_last(c, lastc, clen);
    for(int i = 1; i <= alen; ++i)
        for(int j = 1; j <= blen; ++j)
            for(int k = 1; k <= clen; ++k)
                if (a[i] == b[j] && b[j] == c[k])
                {
                    f[i][j][k] = f[i-1][j-1][k-1]*2 + 1;
                    if (lasta[i] && lastb[j] && lastc[k])
                        f[i][j][k] -= f[lasta[i]-1][lastb[j]-1][lastc[k]-1] + 1;
                }
                else
                {
                    f[i][j][k] = f[i-1][j][k] + f[i][j-1][k] + f[i][j][k-1]
                               - f[i-1][j-1][k] - f[i][j-1][k-1] - f[i-1][j][k-1]
                               + f[i-1][j-1][k-1];
                }
    printf("%lld", f[alen][blen][clen]);
    return 0;
}
```
