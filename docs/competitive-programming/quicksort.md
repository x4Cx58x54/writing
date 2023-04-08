# 快速排序 / 第 k 小的数

[912. 排序数组 - 力扣（LeetCode）](https://leetcode.cn/problems/sort-an-array/)

[快速排序 - 洛谷](https://www.luogu.com.cn/problem/P1177){:target="_blank"}

[第 k 小的数 - 洛谷](https://www.luogu.com.cn/problem/P1923){:target="_blank"}

## 快速排序基本框架

排序第 $l$ 至 $r$ 的元素时，算法停止条件是 $l = r$，意味着当前处理的数组仅含一个元素。`partition` 选取当前区间某元素作为比较标准 pivot，并将其移动到数组中某个位置，使其右边的元素均大于等于 pivot，左边的元素均小于等于 pivot。

```cpp
int partition(int a[], int l, int r)
{
    int pivot = a[l];
    while (l < r) {
        while (l < r && a[r] >= pivot) r--;
        a[l] = a[r];
        while (l < r && a[l] <= pivot) l++;
        a[r] = a[l];
    }
    a[l] = pivot;
    return l;
}
void quicksort(int a[], int l, int r)
{
    if (l >= r) return;
    int p = partition(a, l, r);
    quicksort(a, l, p-1);
    quicksort(a, p+1, r);
}
```

以上写法的 `partition` 中先选取最左边的元素作为 pivot。两边搜索时遇到已经符合条件的数就跳过（左边的小于等于 pivot 的元素和右边的大于等于 pivot 的元素）。由于在两边寻找到符合条件的数后直接移动到另一边，而且不会马上向中间移动该下标，故不可以将过滤条件改为严格的大于/小于，否则导致此处死循环。循环跳出时一定有 $l = r$，所以将 pivot 放在 $a[r]$ 处且返回 $r$ 也是可行的。

下面是一种更简洁的写法：

```cpp
void quicksort(int a[], int l, int r)
{
    if (l >= r) return;
    int i = l-1, j = r+1, pivot = a[l+r >> 1];
    while (i < j)
    {
        do i++; while (a[i] < pivot);
        do j--; while (a[j] > pivot);
        if (i < j) swap(a[i], a[j]);
    }
    quicksort(a, l, j);
    quicksort(a, j+1, r);
}
```

由于左右下标 $i$ 和 $j$ 先向中间搜索再进行判断，所以最开始要先各自向外退一步。而 pivot 的取值只要在当前处理的数组中即可，这里取中间元素。搜索时，遇到大于等于/小于等于 pivot 的值时就进行判断，这样能保证 pivot 能阻挡 $i$ 和 $j$ 的搜索，否则会发生越界。

在确定递归子问题的处理范围时，以上是仅有的写法，任何对语义的改动都会导致出错。由于 pivot 的取值会在数组正中间或偏左一位的位置，而在外层 `while` 循环结束时有 $i = j$ 或 $j+1 = i$，故这样的子问题处理范围是合理的。这里不做证明，但简单的 2 至 3 元素的数组可以作为反例排除其它方案。

值得注意的是这种写法中 pivot 最后出现的位置不确定。求第 k 小的数时需要这一信息，应使用第一种写法。
