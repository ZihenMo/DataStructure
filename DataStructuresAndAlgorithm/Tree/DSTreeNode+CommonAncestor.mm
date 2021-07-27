//
//  DSTreeNode+CommonAncestor.m
//  DataStructuresAndAlgorithm
//
//  Created by 墨子痕 on 2021/7/18.
//  Copyright © 2021 Hutter. All rights reserved.
// 普通版：
// 方案一 分别遍历存储结构再进行对比。T：O(n)，实际上是3n。
// 方案二 递规找左子树和右子树。T：O(n)，仅访问一次【优】
// BST版：
// 在方案二上优化与当前值的判断确定在左子树还是右子树。


#import "DSTreeNode+CommonAncestor.h"

@implementation DSTreeNode (CommonAncestor)

@end

#pragma mark - C++
/**
 * 1.要么在左子树，要么在右子树，如果都没有，则当前根节点为最小公共祖先。
 */
TreeNode * CommonAncestor::lowestCommonAncestor(TreeNode *root, TreeNode *p, TreeNode *q) {
    if (!root || root == q || root == p) {
        return root;
    }
    TreeNode *left = lowestCommonAncestor(root->left, p, q);
    TreeNode *right = lowestCommonAncestor(root->right, p, q);
    if (!left) {
        return right;
    }
    else if (!right) {
        return left;
    }
    else {
        return root;            // 左右各一个
    }
}
/**
 * 注意运算符！
 * 1.都小于当前节点则在左子树；
 * 2. 都大于当前节点则在右子树；
 * 3.一大一小说明公共祖先是当前节点。
 */
TreeNode * CommonAncestor::lowestCommonAncestor_BST(TreeNode *root, TreeNode *p, TreeNode *q) {
    if (!root || !q || !p) {
        return root;
    }
    if (root->val > p->val && root->val > q->val) { // 都小于当前节点，在左边
        return lowestCommonAncestor(root->left, p, q);
    }
    else if (root->val < p->val && root->val < q->val) { // 都大于当前节点，在右边
        return lowestCommonAncestor(root->right, p, q);
    }
    return root;        // 一大一小在两侧
}

/**
 * 非递归版，效率一致
 */
TreeNode * CommonAncestor::lowestCommonAncestor_BST2(TreeNode *root, TreeNode *p, TreeNode *q) {
    while (root) {
        if (root->val > p->val && root->val > q->val) {
            root = root->left;
        }
        else if (root->val < p->val && root->val < q->val) {
            root = root->right;
        }
        else {
            break;
        }
    }
    return root;
}
