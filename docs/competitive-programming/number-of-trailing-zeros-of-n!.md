# Number of trailing zeros of N!

[Number of trailing zeros of N! \| 5 kyu \| Codewars](https://www.codewars.com/kata/number-of-trailing-zeros-of-n){:target="_blank"}

即计算 1 至 $n$ 的所有整数的质因子中有多少 2 和 5，取其小者。而因子 5 的个数明显总是更小，故只需计算 5 的数量。在 1 至 $n$ 的整数中，每 5 个含有一个因子 5，而这些 5 的倍数中每 5 个中的一个又有额外的一个因子 5 ... 以此类推可得以下算法。


```c
long zeros(long n) {
    long ans = 0;
    while(n /= 5) ans += n;
    return ans;
}
```

[阶乘之乘 - 洛谷](https://www.luogu.com.cn/problem/P2388){:target="_blank"}

求 $\sum_{i=1}^n i!$ 末尾的零数可以使用同样的思想，但是在计算因子 5 时应横向统计而非前面使用的纵向统计。
