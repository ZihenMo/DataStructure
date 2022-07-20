//
//  DSTreeNode+CommonAncestor.h
//  DataStructuresAndAlgorithm
//
//  Created by 墨子痕 on 2021/7/18.
//  Copyright © 2021 Hutter. All rights reserved.
//
// 235.（搜索二叉树）236. 二叉树的最近公共祖先
// https://leetcode-cn.com/problems/lowest-common-ancestor-of-a-binary-tree/
// 给定一个二叉树, 找到该树中两个指定节点的最近公共祖先。
//
// 百度百科中最近公共祖先的定义为：“对于有根树 T 的两个节点 p、q，最近公共祖先表示为一个节点  x，满足 x 是 p、q 的祖先且 x 的深度尽可能大（一个节点也可以是它自己的祖先）。”
//
// 示例 1：
//
// 输入：root = [3,5,1,6,2,0,8,null,null,7,4], p = 5, q = 1
// 输出：3
// 解释：节点 5 和节点 1 的最近公共祖先是节点 3 。
//
// 提示：
//
// 树中节点数目在范围 [2, 105] 内。
// -109 <= Node.val <= 109
// 所有 Node.val 互不相同 。
// p != q
// p 和 q 均存在于给定的二叉树中。

#import "DSTreeNode.h"

NS_ASSUME_NONNULL_BEGIN

@interface DSTreeNode (CommonAncestor)


@end

NS_ASSUME_NONNULL_END

class CommonAncestor {
public:
    CTreeNode *lowestCommonAncestor(CTreeNode *root, CTreeNode *p, CTreeNode *q);

    /**
     * 搜索二叉树版
     */
    CTreeNode *lowestCommonAncestor_BST(CTreeNode *root, CTreeNode *p, CTreeNode *q);

    CTreeNode *lowestCommonAncestor_BST2(CTreeNode *root, CTreeNode *p, CTreeNode *q);
};
