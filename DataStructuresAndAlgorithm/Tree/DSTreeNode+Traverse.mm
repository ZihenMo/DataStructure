//
// Created by 墨子痕 on 2021/7/14.
// Copyright (c) 2021 Hutter. All rights reserved.
//

#import "DSTreeNode+Traverse.h"
#import <vector>
#import <queue>
#import <stack>
#import <iostream>

using namespace std;

@implementation DSTreeNode (Traverse)
@end

#pragma mark - 递规法

/**
 * @brief 递规遍历
 * 三种方法基本一致都是利用二叉树与递规的特性。
 */
vector<int> tree_preorder(CTreeNode *tree) {
    if (!tree) {
        return {};
    }
    vector<int> ret;
    ret.push_back(tree->val);
    vector<int> left = tree_preorder(tree->left);
    ret.insert(ret.end(), left.begin(), left.end());
    vector<int> right = tree_preorder(tree->right);
    ret.insert(ret.end(), right.begin(), right.end());
    return ret;
}

vector<int> tree_inorder(CTreeNode *tree) {
    if (!tree) {
        return {};
    }
    vector<int> ret;
    vector<int> left = tree_inorder(tree->left);
    ret.insert(ret.end(), left.begin(), left.end());
    ret.push_back(tree->val);
    vector<int> right = tree_inorder(tree->right);
    ret.insert(ret.end(), right.begin(), right.end());
    return ret;
}


vector<int> tree_postOrder(CTreeNode *tree) {
    if (!tree) {
        return {};
    }
    vector<int> ret;
    vector<int> left = tree_postOrder(tree->left);
    ret.insert(ret.end(), left.begin(), left.end());
    vector<int> right = tree_postOrder(tree->right);
    ret.insert(ret.end(), right.begin(), right.end());
    ret.push_back(tree->val);
    return ret;
}

/**
 * @brief 层序遍历
 * 方案；利用队列先进先出的特性，在遍历节点时同时压入当前节点的子节点，排在兄弟节点之后。
 */
vector<int> tree_levelOrder(CTreeNode *tree) {
    if (!tree) {
        return vector<int>();
    }
    vector<int> ret;
    queue<CTreeNode *> que;
    que.push(tree);
    while (!que.empty()) {
        tree = que.front();
        ret.push_back(tree->val);
        que.pop();
        if (tree->left) {
            que.push(tree->left);
        }
        if (tree->right) {
            que.push(tree->right);
        }
    }
    return ret;
}

/**
 * @brief BFS 稍有不同的是，在每次遍历时将一层遍历完进行存储
 */
vector<vector<int>> tree_levelOrder2(CTreeNode *root) {
    if (!root) {
        return vector<vector<int>>();
    }
    queue<CTreeNode *> queue;
    vector<vector<int>> result;
    queue.push(root);
    while (!queue.empty()) {
        size_t levelSize = queue.size();       // 每层的数量
        vector<int> level;
        while (levelSize--) {
            root = queue.front();
            queue.pop();
            level.push_back(root->val);
            if (root->left) {
                queue.push(root->left);
            }
            if (root->right) {
                queue.push(root->right);
            }
        }
        result.push_back(level);
    }
    return result;
}
/**
 * @brief DFS实现层序遍历
 */
vector<vector<int>> levelResult;

void level_dfs(CTreeNode *root, int level) {
    if (!root) {
        return;
    }
    if (level > levelResult.size()) {
        levelResult.push_back(vector<int>());    // 新的一层
    }
    levelResult[level - 1].push_back(root->val); // 注意边界值
    level_dfs(root->left, level + 1);
    level_dfs(root->right, level + 1);
}

vector<vector<int>> tree_levelOrder_DFS(CTreeNode *root) {
    levelResult = {};
    level_dfs(root, 1);
    return levelResult;
}
#pragma mark - 栈遍历

/**
 * 前序遍历
 *  1. 先访问节点；
 *  2. 将所有左节点的路径访问并压栈（循环）；
 *  3. 如果栈不为空，说明已有无左节点，pop并访问其右节点（单次，因为右节点下可能也有树）
 */
void tree_preorder_stack(CTreeNode *tree) {
    if (!tree) {
        return;
    }
    stack<CTreeNode *> stack;
    while (tree || !stack.empty()) {
        while (tree) {
            cout<<tree->val<<" ";
            stack.push(tree);
            tree = tree->left;
        }
        if (!stack.empty()) {
            tree = stack.top()->right;
            stack.pop();
        }
    }
    cout<<endl;
}

/**
 * 同前序遍历，只是访问时机在栈pop前，也就是一路压栈到最左边后开始访问节点并pop。
 */
void tree_inorder_stack(CTreeNode *tree) {
    if (!tree) {
        return;
    }
    stack<CTreeNode *> stack;
    while (tree || !stack.empty()) {
        while (tree) {
            stack.push(tree);
            tree = tree->left;
        }
        if (!stack.empty()) {
            tree = stack.top();
            cout<<tree->val<<" ";
            tree = tree->right;
            stack.pop();
        }
    }
    cout<<endl;
}

/**
 * 当前节点的左节点存在则压栈直至空（这里注意压栈节点不能是上次出栈节点！）；
 * 当前记录上次出栈节点是否为当前节点的右节点或当前节点的右节点为空，则当前节点出栈；否则压栈；
 */
void tree_postorder_stack(CTreeNode *tree) {
    if (!tree) {
        return;
    }
    stack<CTreeNode *> stack;
    CTreeNode *lastPop = nullptr;

    while (tree || !stack.empty()) {
        while (tree && tree != lastPop) { // 第二个条件至关重要！
            stack.push(tree);
            tree = tree->left;
        }
        if (!stack.empty()) {
            tree = stack.top();
            if (lastPop == tree->right || !tree->right) {
                cout<<tree->val<<" ";
                lastPop = tree;
                stack.pop();
            } else if (tree->right) {
                tree = tree->right;
            }
        }
    }
    cout<<endl;
}
