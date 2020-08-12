# 平面最接近点对

[平面最接近点对 - 洛谷](https://www.luogu.com.cn/problem/P1429){:target="_blank"}

采用分治方法解决。将点集分为左右两份，且两份的点数大致相等。这可以由按横坐标值排序轻易做到。之后递归地计算左右两子集中最接近点对，再计算跨左右点对中的最小值，然后三个值取最小。

递归的边界是点集规模在 3 个以内时，直接计算距离。

这里主要的问题是如何计算跨左右点对中的最小值。首先假设左右点集中点对距离最小值为 $d$。若跨某左右点对距离小于 $d$，那么这两个点一定出现在中线左右各 $d$ 宽的带状区域中。此时如果直接枚举这个区域中的点对计算距离，那么整个算法的复杂度仍是 $O(n^2)$ 的，所以我们需要继续优化。

进一步观察可知，由于 $d$ 的限制，中间的带状区域中的点的分布不可能太密，事实上如果中间带某点对距离比 $d$ 更小，那么它们在纵向上不可能相隔超过 6 个点。所以在这里的做法是将中间带的点复制到一个临时数组中，对纵坐标进行排序，然后计算每一个点与其之后 6 个点之间的距离，取最小值。

```c++
#include <stdio.h>
#include <math.h>
#include <algorithm>
struct Point { double x, y; };
bool cmpx(const Point& a, const Point& b) { return a.x < b.x; };
bool cmpy(const Point& a, const Point& b) { return a.y < b.y; };
inline double dist(const Point& a, const Point& b)
{
     return sqrt((a.x-b.x)*(a.x-b.x) + (a.y-b.y)*(a.y-b.y));
}
Point point[200010], temp[200010];
double shortest(int l, int r)
{
    double mind, d;
    if (r - l <= 2)
    {
        mind = 1e38;
        for(int i = l; i < r; i++)
        {
            d = dist(point[i], point[i+1]);
            if (d < mind) mind = d;
        }
        d = dist(point[l], point[r]);
        if (d < mind) mind = d;
        return mind;
    }
    int mid = (l + r) / 2;
    double dl = shortest(l, mid), dr = shortest(mid+1, r);
    double liml, limr;
    int lp, rp;
    mind = (dl < dr ? dl : dr);
    // merge
    liml = point[mid+1].x - mind;
    limr = point[mid].x + mind;
    int p = 0;
    for(lp = mid; lp >= l && point[lp].x >= liml; --lp)
        temp[p++] = point[lp]; //improve: binsearch
    for(rp = mid+1; rp <= r && point[rp].x <= limr; ++rp)
        temp[p++] = point[rp];
    std::sort(temp, temp+p, cmpy);
    for(int i = 0; i < p; ++i)
        for(int j = i+1; j < i+7 && j < p; ++j)
        {
            d = dist(temp[i], temp[j]);
            if (d < mind) mind = d;
        }
    return mind;
}
int main()
{
    int n;
    double ans;
    scanf("%d", &n);
    for(int i = 0; i < n; ++i) 
        scanf("%lf %lf", &point[i].x, &point[i].y);
    std::sort(point, point + n, cmpx);
    ans = shortest(0, n-1);
    printf("%.4f", ans);
    return 0;
}
```
