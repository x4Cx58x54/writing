# 找筷子

[找筷子 - 洛谷](https://www.luogu.com.cn/problem/P1469){:target="_blank"}

由异或运算的性质有 $x \operatorname{xor} x = 0$，故偶数个相同的数按位异或后一定得到 $0$。由此，将所有长度值异或，最后剩下的就是落单的长度。

```c++
#include <stdio.h>
int main()
{
    int n, len, ans = 0;
    scanf("%d", &n);
    while(n--)
    {
        scanf("%d", &len);
        ans ^= len;
    }
    printf("%d", ans);
    return 0;
}
```
