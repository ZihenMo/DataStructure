//
//  DSTreeNode+pathSum.m
//  DataStructuresAndAlgorithm
//
//  Created by 墨子痕 on 2021/7/18.
//  Copyright © 2021 Hutter. All rights reserved.
//

#import "DSTreeNode+PathSum.h"
#import <vector>
#import <queue>
#import <stack>

using namespace std;

@implementation DSTreeNode (PathSum)

@end

#pragma mark - 判断路径和

/**
 * 递归先序遍历 DFS
 */
bool PathSum::tree_hasPathSum_DFS(TreeNode *root, int targetSum) {
    if (!root) {
        return false;
    }
    targetSum -= root->val;
    if (!root->left && !root->right) { // leaf
        return targetSum == 0;
    }
    bool left = tree_hasPathSum_DFS(root->left, targetSum);
    bool right = tree_hasPathSum_DFS(root->right, targetSum);
    return left || right;   // 注意是或，结果在左子树或右子树中
}

/**
 * 层序遍历 BFS T:O(n) S:O(n)
 */
bool PathSum::tree_hasPathSum_BFS(TreeNode *root, int targetSum) {
    if (!root) {
        return false;
    }
    queue<TreeNode *> nodeQue;
    queue<int> sumQue;
    nodeQue.push(root);
    sumQue.push(root->val);
    while (!nodeQue.empty()) {
        root = nodeQue.front();
        int sum = sumQue.front();
        if (root->left) {
            nodeQue.push(root->left);
            sumQue.push(sum + root->left->val);
        }
        if (root->right) {
            nodeQue.push(root->right);
            sumQue.push(sum + root->right->val);
        }
        if (!root->left && !root->right && sum == targetSum) {
            return true;
        }
        nodeQue.pop();
        sumQue.pop();
    }
    return false;
}

#pragma mark - 找出所有路径和
/**
 * @brief DFS
 */
vector<vector<int>> PathSum::pathSum_DFS(TreeNode *root, int targetSum) {
    if (!root) {
        return {};
    }
    targetSum -= root->val;
    path.push_back(root->val);
    if (targetSum == 0 && !root->left && !root->right) {
        result.push_back(path);
    }
    pathSum_DFS(root->left, targetSum);
    pathSum_DFS(root->right, targetSum);
    path.pop_back();    // necessary?
    return result;
}

/**
 * @brief 非递归 DFS 该如果回溯和值？未解
 */
vector<vector<int>> pathSum_DFS2(TreeNode *root, int targetSum) {
    if (!root) {return {};}
    vector<int> path;
    vector<vector<int>>result;
    stack<TreeNode *> stack;
    while (root || !stack.empty()) {
        while (root) {
            stack.push(root);
            targetSum -= root->val;
            path.push_back(root->val);
            root = root->left;
        }
        if (!stack.empty()) {
            root = stack.top()->right;
            stack.pop();
        }
    }
    return result;
}

/**
 * @brief 广度优先搜索 O(n2)
 * 1.搜索时使用hashTable保存其父节点，找到解时通过父节点表索引出完整路径。
 */
vector<vector<int>> PathSum::pathSum_BFS(TreeNode *root, int targetSum) {
    if (!root) {
        return vector<vector<int>>();
    }
    queue<TreeNode *> nodeQue;
    queue<int> sumQue;
    nodeQue.push(root);
    sumQue.push(root->val);
    while (!nodeQue.empty()) {
        TreeNode *node = nodeQue.front();
        nodeQue.pop();
        int sum = sumQue.front();
        sumQue.pop();
        if (!node->left && !node->right && sum == targetSum) {
            // find the path
            auto path = this->pathToRoot(node);
            result.push_back(path);
        }
        if (node->left) {
            nodeQue.push(node->left);
            sumQue.push(sum + node->left->val);   // 注意是用sum+而非node->val
            this->parent[node->left] = node;
        }
        if (node->right) {
            nodeQue.push(node->right);
            sumQue.push(sum + node->right->val);
            this->parent[node->right] = node;
        }
    }
    return this->result;
}
/**
 * @brief 获取节点对应的路径
 */
vector<int> PathSum::pathToRoot(TreeNode *node) {
    vector<int> path;
    while (node) {
        path.push_back(node->val);
        node = this->parent[node];
    }
    reverse(path.begin(), path.end());
    return path;
}
