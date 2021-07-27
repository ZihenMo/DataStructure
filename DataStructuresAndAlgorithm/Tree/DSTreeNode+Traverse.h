//
// Created by 墨子痕 on 2021/7/14.
// Copyright (c) 2021 Hutter. All rights reserved.
//
// 二叉树遍历
// 1. 先根；
// 2. 中根；
// 3. 后根；
// 4. 深度；


#import <Foundation/Foundation.h>
#import "DSTreeNode.h"
#import <vector>

using namespace std;

/**
 * 二叉树遍历
 */
@interface DSTreeNode (Traverse)


@end

#pragma mark - C++
/**
 * @brief 前序遍历
 */
vector<int> tree_preorder(TreeNode *tree);
/**
 * @brief 中序遍历
 */
vector<int> tree_inorder(TreeNode *tree);
/**
 * @brief 后序遍历
 */
vector<int> tree_postOrder(TreeNode *tree);
/**
 * @brief 层序遍历
 */
vector<int> tree_levelOrder(TreeNode *tree);

/**
 * @brief 102. 二叉树的层序遍历
 * 给你一个二叉树，请你返回其按 层序遍历 得到的节点值。 （即逐层地，从左到右访问所有节点）。
 *
 * 示例：
 * 二叉树：[3,9,20,null,null,15,7],
 * 返回其层序遍历结果：
 * [
 *   [3],
 *   [9,20],
 *   [15,7]
 * ]
 */
vector<vector<int>> tree_levelOrder2(TreeNode* root);

#pragma mark - 栈法
void tree_preorder_stack(TreeNode *tree);
void tree_inorder_stack(TreeNode *tree);
void tree_postorder_stack(TreeNode *tree);


