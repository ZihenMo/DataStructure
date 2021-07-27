//
// Created by 墨子痕 on 2021/7/21.
// Copyright (c) 2021 Hutter. All rights reserved.
//
// 104. 二叉树的最大深度  https://leetcode-cn.com/problems/maximum-depth-of-binary-tree/
//         给定一个二叉树，找出其最大深度。
//
// 二叉树的深度为根节点到最远叶子节点的最长路径上的节点数。
//
// 说明: 叶子节点是指没有子节点的节点。
//
// 示例：
// 给定二叉树 [3,9,20,null,null,15,7]，
//   3
//  / \
// 9  20
//   /  \
//  15   7
// 返回它的最大深度 3 。
//
// 111. 二叉树的最小深度 https://leetcode-cn.com/problems/minimum-depth-of-binary-tree/
// 给定一个二叉树，找出其最小深度。
//
// 最小深度是从根节点到最近叶子节点的最短路径上的节点数量。

#import <Foundation/Foundation.h>
#import <DSTreeNode.h>
@interface DSTreeNode (Depth)
@end

class TreeDepth {
public:
    int maxDepth(TreeNode* root);
    int minDepth(TreeNode* root);
};