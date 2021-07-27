//
// Created by 墨子痕 on 2021/7/21.
// Copyright (c) 2021 Hutter. All rights reserved.
// 1.DFS
// 2.BFS

#import "DSTreeNode+Depth.h"
#import <queue>

@implementation DSTreeNode (Depth)
@end

#pragma mark - 树的最大深度
/**
 * @brief DFS
 * 1.判断叶子节点返回当前层数；
 * 2.比较左右了树的最大层作为结果
 */
int maxDepth_DFS(TreeNode *root, int depth) {
    if (!root) {
        return 0;
    }
    if (!root->left && !root->right) {
        return depth + 1;
    }
    int left = maxDepth_DFS(root->left, depth + 1);
    int right = maxDepth_DFS(root->right, depth + 1);
    return max(left, right);
}

int maxDepth_BFS(TreeNode *root) {
    if (!root) {
        return 0;
    }
    queue<TreeNode *> queue;
    queue.push(root);
    int depth = 0;
    int level = 0;
    while (!queue.empty()) {
        level += 1;
        int breadth = queue.size();
        while (breadth--) {
            TreeNode *root = queue.front();
            queue.pop();
            if (!root->left & !root->right) {   // 这里其实可以不需要判断与比较，外层循环的次数就是最大层
               depth = max(depth, level);
            }
            if (root->left) {
                queue.push(root->left);
            }
            if (root->right) {
                queue.push(root->right);
            }
        }
    }
    return depth;
}

int TreeDepth::maxDepth(TreeNode *root) {
    return maxDepth_DFS(root, 0);
}

#pragma mark - 树的最小深度
int minDepth_BFS(TreeNode *root) {
    if (!root) {
        return 0;
    }
    queue<TreeNode *> queue;
    queue.push(root);
    int depth = INT_MAX;
    int level = 0;
    while (!queue.empty()) {
        level += 1;
        int breadth = queue.size();
        while (breadth--) {
            TreeNode *root = queue.front();
            queue.pop();
            if (!root->left & !root->right) {   // 这里其实可以不需要判断与比较，外层循环的次数就是最大层
                depth = min(depth, level);
            }
            if (root->left) {
                queue.push(root->left);
            }
            if (root->right) {
                queue.push(root->right);
            }
        }
    }
    return depth;
}

/**
 * @brief 注意，该解法的边界值与最大深度有很大不同。因为空节点为0度；
 * 而递归终止条件恰好是空节点同时也可能是叶子节点的下一节点，因此需要进行区分叶子节点；
 * （如果取小值则一定会是0，那么结果将是错误的），因此叶子节点最小值应为1——即一个根节点的度。
 */
int minDepth_DFS(TreeNode *root) {
    if (!root) {
        return 0;
    }
    if (!root->left && !root->right) {
        return 1;       // 不是
    }
    int depth = INT_MAX;
    if (root->left) {           // 条件是必要的,否则返回了0影响了结果
       depth = min(depth, minDepth_DFS(root->left));
    }
    if (root->right) {
        depth = min(depth, minDepth_DFS(root->right));
    }
    return depth + 1;    //    return min(left, right);
}
/**
 * @brief 剪枝,没有必要全遍历完，如果发现了最小度的叶子节点；大于该度的节点没必要遍历；
 */
int minDepthResult = INT_MAX;
void minDepth_DFS2(TreeNode *root, int depth) {
    if (!root) {
        return;
    }
    if (minDepthResult <= depth) {
        return;
    }
    if (!root->left && !root->right) {
        minDepthResult = depth;     // 肯定是最小度的叶子4
    }
    minDepth_DFS2(root->left, depth + 1);
    minDepth_DFS2(root->right, depth + 1);
}

/**
 * @brief 同理，BFS剪枝更优
 */
int minDepth_BFS2(TreeNode *root) {
    if (!root) {
        return 0;
    }
    queue<TreeNode *> queue;
    int depth = 0;
    queue.push(root);
    while (!queue.empty()) {
        size_t breadth = queue.size();
        depth += 1;
        while (breadth--) {
            root = queue.front();
            queue.pop();
            if (!root->left && !root->right) {
                return depth;
            }
            if (root->left) {
                queue.push(root->left);
            }
            if (root->right) {
                queue.push(root->right);
            }
        }
    }
    return depth;
}
int TreeDepth::minDepth(TreeNode *root) {
    if (!root) {
        return 0;
    }
    minDepth_DFS2(root, 1);
    return minDepthResult;
}
