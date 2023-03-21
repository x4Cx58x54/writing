# Coordinate Compression

坐标压缩指的将一组数据映射到它们的排名上，这样既保留了原数据中的排序关系，还将这些值压缩到了一个很小的范围中。这里统一讨论升序排名，显然降序排名的情况可同理推出。

```
compress([78, 98, -1, 4, 3, 9])
       = [ 5,  6,  1, 3, 2, 4]
```

最朴素的想法是使用一个存有元素值和元素在数组种位置结构体，根据原数组构造这个结构体数组后排序，就可以查询各元素的排名了。但是这种方法并不能解决有重复元素的情况。

!!! Info "关于算法名称"

    中文资料中常见误导性地使用“离散化”这一名称来称呼本文中主要描述的算法。离散化实际指的是将连续数据转换为离散数据。英文资料中亦未见可信来源使用 “discretization” 或类似的词称呼该算法（可参考坐标压缩模板题的社区题解 [1331. Rank Transform of an Array - LeetCode](https://leetcode.com/problems/rank-transform-of-an-array/solutions)）。除“离散化”，在杂乱无章的互相摘编中仍存在诸多名词误用误译，包括“匈牙利算法”等，亟待建立统一标准予以规范。[^oikashinhoax]

[^oikashinhoax]: <https://zhuanlan.zhihu.com/p/601517592>{: target="_blank"}

### 相等元素并列排名且仅占用一个排名

若需要将相等的元素映射到同一个排名上，而且靠后的数据不因此而顺延排名。本质上是在对每一个元素求数组中有多少**种**元素比它排名靠前。

```
compress([4, 4, 9, 9, 1, 1])
       = [2, 2, 3, 3, 1, 1]
```

以下算法二分查找每一元素在原数组对应的有序且去重的数组中最左边的位置。

```cpp
vector<int> compress(vector<int>& arr)
{
    int n = arr.size();
    vector<int> sorted(arr), res(n);
    sort(sorted.begin(), sorted.end());
    vector<int>::iterator uniqp = unique(sorted.begin(), sorted.end());
    for (int i = 0; i < n; ++i)
    {
        res[i] = lower_bound(sorted.begin(), uniqp, arr[i]) - sorted.begin() + 1;
    }
    return res;
}
```

### 相等元素并列但占用排名

这里指的是生活中排名一般使用的方法：如果有两个第二名，那么紧接着下一个人的排名应该是第四。问题本质上可以转化为对每一个元素求数组中有多少**个**元素个比它排名靠前。

```
compress([4, 4, 9, 9, 1, 1])
       = [3, 3, 5, 5, 1, 1]
```

此问题的解法和上面非常相似，只需要去掉去重的步骤即可。

### 相等元素不并列

要使两个相等元素排名不并列，而是由其它因素（如位置）决定，那么这种离散化映射是一种从大小为 $n$ 的数组到 $\{1, 2, \cdots, n\}$ 的双射（一一对应）。如果规定相等元素的排名和原顺序相同，则：

```
compress([4, 4, 9, 9, 1, 1])
       = [3, 4, 5, 6, 1, 2]
```

这里沿用前述情况的思路。由于相等元素不并列，那么这里同样地不做 `unique` 操作。在找到原数组 `arr` 中某个元素 $x$ 在 `sorted` 的起始位置（`lower_bound`）后，`sorted` 数组中对应的元素就不可再使用了。那么下一次寻找 $x$ 时，应使 `lower_bound` 找到 `sorted` 数组中的下一个元素。

用以上例子来说明。当第一次寻找 $x = 4$ 的排名时，`sorted` 数组及寻找到的位置为：

```
[1, 1, 4, 4, 9, 9]
       ^
       lower bound = 2
```

此时将 `sorted` 数组中此位置的元素改为其它的值，使下一次 `lower_bound` 寻找 4 时找到的是第二个 4。

```
[1, 1, x, 4, 9, 9]
          ^
          lower bound = 3
```

其实只需要将这个值减 1 即可。这个将 $x$ 改为 $x-1$ 的操作：

* 将 $x$ 在 `sorted` 数组中的左边界右移一位，这正是此处要求的性质；
* 保留 `sorted` 数组的有序结构，使 `lower_bound` 依然能够正常运行；
* 不会影响寻找非 $x$ 或 $x-1$ 的元素的排名；
* 由于 `sorted` 和 `array` 的元素是一一对应的，两数组中原本的所有 $x-1$ 会恰好同时耗尽，故也不会对 $x-1$ 造成任何影响。

```cpp
vector<int> compress(vector<int>& arr)
{
    int n = arr.size();
    vector<int> sorted(arr), res(n);
    sort(sorted.begin(), sorted.end());
    for (int i = 0; i < n; ++i)
    {
        res[i] = lower_bound(sorted.begin(), sorted.end(), arr[i]) - sorted.begin() + 1;
        sorted[res[i]-1]--;
    }
    return res;
}
```