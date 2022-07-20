//
// Created by 墨子痕 on 2021/7/14.
// Copyright (c) 2021 Hutter. All rights reserved.
//
// 核心思想：利二叉搜索树特性
// 方案一：中序遍历，得到一个有序数列（可以仅判断与前一数的大小关系）。
// 方案二：递归判断左、右子树是否是BST。
// 1. 拆分问题，左右子树也必须是BST，符合递规含义。
// 2. 左子树的最大值小于当前节点；
// 3. 右子树的最小值大于当前节点；

#import "DSTreeNode+ValidBST.h"
#import "DSTreeNode+Traverse.h"

@implementation DSTreeNode (ValidBST)
@end

#pragma mark - C++
#pragma mark - 98.验证二叉搜索树

/**
 * @brief 中序遍历法
 * 要点：中序遍历的二叉搜索树是一个有序数列
 * 缺陷：遍历以容器返回分配了大量空间
 */

bool solution11(CTreeNode *root) {
    vector<int> inorder = tree_inorder(root);
    if (inorder.size() <= 1) {
        return true;
    }
    for (auto it = inorder.begin() + 1; it != inorder.end(); ++it) {
        if (*it <= *(it - 1)) {      // 注意不能=
            return false;
        }
    }
    return true;
}
/*
 * @brief 使用成员变量记住上一个（根）节点，这样不需要保存所有节点，只需要和根节点比较
 */
bool ValidBST:: dfs(CTreeNode *root) {
    if (!root) {
        return true;
    }
    if (!dfs(root->left)) {
        return false;
    }
    if (pre && pre->val >= root->val) {
        return false;
    }
    pre = root;
    return dfs(root->right);
}

/**
 * 左子树的最大值小于根，右子树的最小值大于根。
 * 采用递归传递最大最小值。
 * 缺陷：边界值局限问题（以及类型提升），实际问题可能无法确实最大值与最小值。
 */
bool solution2_helper(CTreeNode *root, long long min, long long max) {
    if (!root) { return true; }
    
    if ((max != LONG_LONG_MAX && root->val >= max) || (min != LONG_LONG_MIN && root->val <= min)) {
        return false;
    }

    return solution2_helper(root->left, min, root->val) &&
    solution2_helper(root->right, root->val, max);
}

bool solution2(CTreeNode *root) {
    return solution2_helper(root, LONG_LONG_MIN, LONG_LONG_MAX);
}

bool ValidBST::isValidBST(CTreeNode *root) {
//    this->pre = nullptr;
//    return this->dfs(root);
    return solution2(root);
}
