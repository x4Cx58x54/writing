# 二叉搜索树 | Binary Search Tree

二叉搜索树的每一个子树都是二叉搜索树，并且任意一个结点都大于它的左子树的所有结点，小于它的右子树的所有结点。一棵二叉树的中序遍历严格升序是该二叉树为二叉搜索树的充要条件。

在此定义下，二叉搜索树不存在相同值的结点。若需要存储重复的结点，一般在结点上增加一个存储重复数的数据域。

## 查找元素

[700. 二叉搜索树中的搜索 - 力扣（LeetCode）](https://leetcode.cn/problems/search-in-a-binary-search-tree/)

??? note "Code"

    ```cpp
    TreeNode* searchBST(TreeNode* root, int val) {
        if (!root) return nullptr;
        if (val > root->val) {
            return searchBST(root->right, val);
        } else if (val < root->val) {
            return searchBST(root->left, val);
        }
        return root; // if val == root->val
    }
    ```

## 判断二叉搜索树

[98. 验证二叉搜索树 - 力扣（LeetCode）](https://leetcode.cn/problems/validate-binary-search-tree/)

可以用定义来判断，但是更优的解法是验证中序遍历是否严格升序。

## 插入元素

[701. 二叉搜索树中的插入操作 - 力扣（LeetCode）](https://leetcode.cn/problems/insert-into-a-binary-search-tree/)

只需要在合适的叶子结点处新增一个结点。可以看作递归地将子树更新为插入新增元素后的子树。

```cpp
TreeNode* insertIntoBST(TreeNode* root, int val) {
    if (!root) return new TreeNode(val);
    if (val > root->val) root->right = insertIntoBST(root->right, val);
    else root->left = insertIntoBST(root->left, val);
    return root;
}
```

以上写法更新搜索路径上的每一个连接。更直观的想法是找到新节点的父结点，只进行一次更新。

```cpp
int insertVal;
void traverseInsert(TreeNode* root) {
    if (insertVal > root->val) {
        if (root->right) {
            traverseInsert(root->right);
        } else {
            root->right = new TreeNode(insertVal);
        }
    } else {
        if (root->left) {
            traverseInsert(root->left);
        } else {
            root->left = new TreeNode(insertVal);
        }
    }
}
TreeNode* insertIntoBST(TreeNode* root, int val) {
    insertVal = val;
    if (!root) return new TreeNode(insertVal);
    traverseInsert(root);
    return root;
}
```

## 删除元素

[450. 删除二叉搜索树中的节点 - 力扣（LeetCode）](https://leetcode.cn/problems/delete-node-in-a-bst/)

同样进行递归删除，搜索路径上的子树更新为删除目标元素后的子树。主要问题在于讨论要删除的元素的子结点情况。若要删除的结点

* 是叶子结点，那么直接删除即可；
* 左或右结点为空，那么使用其非空子树替代之；
* 左右结点均非空，那么使用其左子树中的最大结点或右子树的最小结点替代之，但这里要先在该左/右子树中删除这个最大/小结点，故进入另一级别的递归。

```cpp
TreeNode* deleteNode(TreeNode* root, int key) {
    if (!root) return nullptr;
    if (key == root->val) {
        if (!root->left) {
            return root->right;
        } else if (!root->right) {
            return root->left;
        } else {
            TreeNode* leftMax = maxNode(root->left);
            root->left = deleteNode(root->left, leftMax->val);
            leftMax->left = root->left;
            leftMax->right = root->right;
            delete root;
            return leftMax;
        }
    } else if (key < root->val) {
        root->left = deleteNode(root->left, key);
    } else {
        root->right = deleteNode(root->right, key);
    }
    return root;
}
TreeNode* maxNode(TreeNode* root) {
    while (root->right) root = root->right;
    return root;
}
```

## 查找指定排名的元素

[230. 二叉搜索树中第 K 小的元素 - 力扣（LeetCode）](https://leetcode.cn/problems/kth-smallest-element-in-a-bst/)

利用二叉搜索树中序遍历结果即为排序结果的性质寻找。

??? note "Code"

    ```cpp
    int target = 0, res = -1, cur = 0;
    void traverse(TreeNode* root) {
        if (!root || res >= 0) return;
        traverse(root->left);
        cur++;
        if (cur == target) res = root->val;
        traverse(root->right);
    }
    int kthSmallest(TreeNode* root, int k) {
        target = k;
        traverse(root);
        return res;
    }
    ```
