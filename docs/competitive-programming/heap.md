# 堆

[堆 - 洛谷](https://www.luogu.com.cn/problem/P3378){:target="_blank"}

堆是一棵完全二叉树，其中每一子树之根节点总是不大于或不小于子树其余节点，由此有小端堆（min-heap）和大端堆（max-heap）之分。

堆不同于二叉查找树。二叉查找树不可能总保持完全二叉树的形态，而且堆没有高效查找操作。

由完全二叉树的良好性质，一般使用一维数组即可实现堆。接下来均以小端堆举例。

### 添加元素

在堆末尾添加一个元素，然后再上浮。其余部分已经是堆，所以每次只需要与父节点比较。

### 取最小值

取出堆首，以堆末元素替代，然后再下沉。在某一步确定是否下沉以及往哪一方向下沉需要先试探：如果左子节点比当前节点小，则将预备转移的地址指向左子节点。但是到这里并不代表一定向左下沉，而是还需要判断右子节点是否比当前节点和左子节点均小，如果是则向右下沉。如果两个条件均不满足，则代表下沉停止。在判断过程中要注意先判边界。

### 建堆

建堆的 $O(n\log n)$ 方法应该是将元素逐个添加到堆中。

```cpp
#include <stdio.h>
int heap[1000000];
int main()
{
    int tt, command, e, tp, child, parent;
    int heapsize = 0;
    scanf("%d", &tt);
    while(tt--)
    {
        scanf("%d", &command);
        switch(command)
        {
            case 1: // Insert e
                scanf("%d", &e);
                heapsize++;
                child = heapsize;
                for(parent = heapsize/2; parent > 0 && e < heap[parent];\
                    child = parent, parent /= 2)
                    heap[child] = heap[parent];
                heap[child] = e;
                break;

            case 2: // Min
                printf("%d\n", heap[1]);
                break;

            case 3: // ExtractMin
                e = heap[heapsize--];
                parent = 1;
                child = 1;
                while(1)
                {
                    tp = parent*2;
                    if (tp <= heapsize && heap[tp] < e)
                        child = tp;
                    if (tp+1 <= heapsize && heap[tp+1] < heap[tp] && heap[tp+1] < e)
                        child = tp + 1;
                    if (parent == child) break;
                    heap[parent] = heap[child];
                    parent = child;
                }
                heap[parent] = e;
                break;
        }
    }
    return 0;
}
```
