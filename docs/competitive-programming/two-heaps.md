# 对顶堆

对顶堆指的是一个大顶堆和一个小顶堆，动态维护数据中第 $k$ 大的数。利用堆插入与删除堆顶数据复杂度仅 $O(\log n)$ 的特性，快速调整两个堆的大小，维护堆顶元素。

注意 C++ 中，默认的堆是大顶堆，即 `priority_queue<int>` 等价于

```cpp
priority_queue<int, vector<int>, less<int>>
```

而小顶堆为

```cpp
priority_queue<int, vector<int>, greater<int>>
```

[295. 数据流的中位数 - 力扣（LeetCode）](https://leetcode.cn/problems/find-median-from-data-stream/)

建立一个大顶堆存储较小的数，小顶堆存储较大的数。每次加入元素后平衡两个堆的大小使其差值不大于 1，那么中位数就在堆顶取得。注意每次从一个堆中移动一个元素到另一个堆中时，两对大小差值会变化 2。

控制小顶堆大顶堆大小之差为 -1、0 或 1，那么中位数为某堆堆顶或两堆堆顶平均数；若控制为 1 或 0，则中位数为小顶堆堆顶或两堆顶平均数，这样可以简化判断。

```cpp
class MedianFinder {
public:
    priority_queue<int, vector<int>, less<int>> small;
    priority_queue<int, vector<int>, greater<int>> large;
    int diff = 0; // small.size() - large.size()
    MedianFinder() {
    }
    void balance() {
        while (diff < -1) {
            diff += 2;
            small.push(large.top());
            large.pop();
        }
        while (diff > 1) {
            diff -= 2;
            large.push(small.top());
            small.pop();
        }
    }
    void addNum(int num) {
        if (small.empty() || num <= small.top()) {small.push(num); diff++; }
        else {large.push(num); diff--; }
        balance();
    }
    double findMedian() {
        if (diff == 0) return small.top()/2.0 + large.top()/2.0;
        else if (diff == -1) return large.top();
        else return small.top();
    }
};
```

[480. 滑动窗口中位数 - 力扣（LeetCode）](https://leetcode.cn/problems/sliding-window-median/)

沿用上一题的思路，这一题的难点在于如何从堆中删除移出滑动窗口的元素。非堆顶元素是无法直接删除的，解决的方法是懒删除：先给要删除的元素打上标记，等到它们出现在堆顶时再真正删除。当两堆中无删除标记的元素数量平衡时，只要堆顶元素没有删除标记，就不影响求取中位数。

在删除元素时：

* 给该元素打上删除标记。只需要使用一个字典记录该元素当前需要删除的次数。
* 根据其所在堆更新两堆大小差值。即这个差值是真正删去该元素后的值。

那么就只需要合理安排各操作的顺序了。其中最核心的在于取中位数时，两堆应当平衡且堆顶元素无删除标记。而真正删除有标记的堆顶元素时，对两堆平衡情况是不产生影响的。所以每次窗口滑动时更新如下：

1. 加入新元素，更新差值
2. 打删除标记，更新差值
3. 平衡两堆，更新差值
4. 若堆顶元素有标记，删除之
5. 取中位数

```cpp
vector<double> medianSlidingWindow(vector<int>& nums, int k) {
    int n = nums.size(), i = 0, tail = -1;
    priority_queue<int, vector<int>, less<int>> small;
    priority_queue<int, vector<int>, greater<int>> large;
    unordered_map<int, int> todel;
    int diff = 0;
    vector<double> res;
    if (k == 1) {
        for (int j = 0; j < n; ++j) res.push_back(nums[j]);
        return res;
    }
    for (; i < k-1; ++i) {
        small.push(nums[i]);
        diff++;
    }
    for (; i < n; ++i, ++tail) {
        // add element
        if (small.empty() || nums[i] <= small.top()) {
            small.push(nums[i]);
            diff++;
        } else {
            large.push(nums[i]);
            diff--;
        }
        // tag as deleted
        if (tail >= 0) {
            if (nums[tail] <= small.top()) diff--; else diff++;
            todel[nums[tail]]++;
        }
        // balance
        while (diff > 1) {
            diff -= 2;
            large.push(small.top());
            small.pop();
        }
        while (diff < 0) {
            diff += 2;
            small.push(large.top());
            large.pop();
        }
        // delete
        while (!small.empty() && todel.count(small.top()) && todel[small.top()] > 0) {
            todel[small.top()]--;
            small.pop();
        }
        while (!large.empty() && todel.count(large.top()) && todel[large.top()] > 0) {
            todel[large.top()]--;
            large.pop();
        }
        // get median
        if (diff == 0) res.push_back(small.top()/2.0 + large.top()/2.0);
        else res.push_back(small.top());
    }
    return res;
}
```
