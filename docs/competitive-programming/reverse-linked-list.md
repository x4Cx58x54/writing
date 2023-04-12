# 反转链表

反转链表是一类简单的模拟题，难度不高，但一旦思路不清，就易导致细节错误。本文致力于理清其中逻辑，用统一的框架解决此类问题。

## 反转整个链表

[206. 反转链表 - 力扣（LeetCode）](https://leetcode.cn/problems/reverse-linked-list/)

### 非递归解法

存储 `prev`、`cur` 和 `next` 三个结点，每次反转 `prev` 到 `cur` 的连接。在头结点之前加入一个空结点并使头节点指向它。反转最后一个连接之后 `cur` 还会从尾结点移动到空结点，故返回 `prev`。

```cpp
ListNode* reverseList(ListNode* head) {
    ListNode *prev = nullptr, *cur = head, *next;
    while(cur) {
        next = cur->next;
        cur->next = prev;
        prev = cur;
        cur = next;
    }
    return prev;
}
```

### 递归解法

将要反转的链表看作递归的两部分：头结点 `head` 和头结点之后的链表 `{head->next}`（这里用括号表示以此结点为头的整个链表）。最朴素的递归思想将 `{head->next}` 反转，然后再将 `head->next` 指向 `head`。如果递归函数的返回的是其处理链表的头结点 `head`，那么直接将下一级递归返回值 `reverse(head->next)` 指向 `head` 即可。但这样需要额外记录原链表的尾结点作为最终结果。

注意最后还需要将原头结点指向空结点。

```cpp
ListNode* reversed_head;
ListNode* reverse(ListNode *head) {
    if (head->next)
        reverse(head->next) -> next = head;
    else
        reversed_head = head;
    return head;
}
ListNode* reverseList(ListNode* head) {
    if (!head) return head;
    reverse(head);
    head->next = nullptr;
    return reversed_head;
}
```

前一种方法，递归函数返回的是其处理的链表的头结点，以直接将其指向之前的结点。但事实上并不一定需要通过这个函数获取下一个链表的头结点。先进入递归，反转 `{head->next}` 后，当前结点 `head` 指向下一结点的连接并未被破坏，所以并不需要递归函数返回 `head->next`，而是直接获取即可。这样就可以使递归函数返回链表尾结点，作为最后的返回值。

```cpp
ListNode* reverse(ListNode* head) {
    if (!head->next) return head;
    ListNode *tail = reverse(head->next);
    head->next->next = head;
    return tail;
}
ListNode* reverseList(ListNode* head) {
    if (!head) return head;
    ListNode *tail = reverse(head);
    head->next = nullptr;
    return tail;
}
```

## 反转部分链表

[92. 反转链表 II - 力扣（LeetCode）](https://leetcode.cn/problems/reverse-linked-list-ii/)

题目大意是给定链表和两个正整数 $l$ 和 $r$，反转链表中第 $l$ 至第 $r$ 个结点的部分。

除了反转指定的范围，还要使反转范围之前的部分指向反转部分的尾结点，反转部分的头结点指向反转范围之后的部分。

![](./img/reverse-linked-list-part.svg){:width=360px}

反转部分的思路沿用反转整个链表的方法，记录 `prev`、`cur`、`next` 三个结点，每次反转 `prev` 到 `cur` 的连接。

### 如何确定反转的范围？

使用 $k$ 记录结点 `cur` 所在结点序号，初始状态下 $k = 1$。由于反转的是 `prev` 到 `cur` 的连接，第一次反转时 `cur` 应在第 $l+1$ 个结点。而最后一次反转时，`cur` 位于第 $r$ 个结点。

### 如何连接反转部分与其余部分？

此处的连接涉及 4 个结点，按顺序分别为

* 反转部分之前的最后一个结点 `revprev`；
* 反转部分的第一个结点 `revhead`；
* 反转部分的最后一个结点；
* 反转部分之后的第一个结点。

前两个结点是第 $l-1$ 和第 $l$ 个结点，对应 $k = l$ 时的 `prev` 和 `cur` 结点。后两个结点是第 $r$ 和第 $r+1$ 个结点，对应 $k = r+1$ 时的 `prev` 和 `cur` 结点。

反转结束后，不能直接找到前两个结点，所以需要额外存储。而反转结束后恰好有 $k = r+1$，后两个结点对应 `prev` 和 `cur`，可直接处理。

若链表从第一个结点开始反转，那么 `revprev` 不存在，而且返回的新链表头是原反转部分的尾结点。为了统一处理，开始反转前在链表头部增加一个结点 `dummy`，以避免这种特殊情况。那么新链表头一定是 `dummy->next`。

综上所述，反转部分链表的问题就归结为 `prev`、`cur` 和 `next` 三个结点沿着链表移动时，根据 `cur` 结点的序号 $k$，分阶段处理：

* $k = 1$，初始状态，`prev` 为 `dummy` 结点，`cur` 为原链表头结点；
* $k = 1, \cdots, l-1$，无额外操作；
* $k = l$，记录 `revprev` 和 `revhead`；
* $k = l+1, \cdots, r$，反转连接；
* $k = r+1$，此时 `prev` 和 `cur` 为反转部分的最后一个及其之后的结点；
* 连接反转部分的头尾。

```cpp
ListNode* reverseBetween(ListNode* head, int left, int right) {
    ListNode *dummy = new ListNode;
    dummy->next = head;
    ListNode *prev = dummy, *cur = head, *next, *revprev, *revhead;
    // init cur = head, at the 1st node
    int kcur = 1;
    while (kcur < left) {
        prev = cur;
        cur = cur->next;
        kcur++;
    }
    // now kcur = left
    revprev = prev;
    revhead = cur;
    // move right
    prev = cur;
    cur = cur->next;
    kcur++;
    // now kcur = left+1, start reversing
    while (kcur <= right) {
        next = cur->next;
        cur->next = prev;
        kcur++;
        prev = cur;
        cur = next;
    }
    // now kcur = right+1, connect the rest
    revprev->next = prev;
    revhead->next = cur;
    return dummy->next;
}
```

## K 个一组反转链表

[25. K 个一组翻转链表 - 力扣（LeetCode）](https://leetcode.cn/problems/reverse-nodes-in-k-group/)

这个问题很容易转化为反转部分链表，按顺序对原链表每 $K$ 个结点进行一次反转即可。`reverseKNodes` 就是反转部分链表的简化版本，反转 $K$ 个结点即为反转 $K-1$ 个连接，并处理反转部分的头尾。先遍历一次链表得到结点总数 $n$，那么需要 $\lfloor n/K \rfloor$ 次反转。

```cpp
ListNode* reverseKNodes(ListNode* prevHead, int k) {
    ListNode *prev = prevHead->next, *cur = prev->next, *next, *tail = prev;
    for (int i = 1; i < k; ++i) {
        next = cur->next;
        cur->next = prev;
        prev = cur;
        cur = next;
    }
    prevHead->next->next = cur;
    prevHead->next = prev;
    return tail;
}
ListNode* reverseKGroup(ListNode* head, int k) {
    if (k == 1) return head; // optional optimization
    ListNode *dummy = new ListNode, *cur = head;
    dummy->next = head;
    int n = 0;
    while (cur) {
        cur = cur->next;
        n++;
    }
    n /= k;
    cur = dummy;
    for (int i = 0; i < n; ++i) {
        cur = reverseKNodes(cur, k);
    }
    return dummy->next;
}
```
