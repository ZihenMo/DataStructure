//
//  DSTreeNode+pathSum.h
//  DataStructuresAndAlgorithm
//
//  Created by 墨子痕 on 2021/7/18.
//  Copyright © 2021 Hutter. All rights reserved.
//
// 112. 路径总和 https://leetcode-cn.com/problems/path-sum/
// 给你二叉树的根节点 root 和一个表示目标和的整数 targetSum ，判断该树中是否存在 根节点到叶子节点 的路径，这条路径上所有节点值相加等于目标和 targetSum 。
//
// 叶子节点 是指没有子节点的节点。

#import "DSTreeNode.h"
#import <unordered_map>
#import <vector>
#import <queue>
#import <stack>
NS_ASSUME_NONNULL_BEGIN

@interface DSTreeNode (PathSum)

@end

NS_ASSUME_NONNULL_END


class PathSum {
private:
    std::unordered_map<TreeNode *, TreeNode *> parent;
    std::vector<int> path;
    std::vector<vector<int>> result;
    vector<int> pathToRoot(TreeNode *leaf);
public:
    bool tree_hasPathSum_DFS(TreeNode *root, int targetSum);
    bool tree_hasPathSum_BFS(TreeNode *root, int targetSum);

    vector<vector<int>>pathSum_DFS(TreeNode* root, int targetSum);
    vector<vector<int>>pathSum_BFS(TreeNode* root, int targetSum);
};


