//
//  Tree+Path.swift
//  DataStructuresAndAlgorithm
//
//  Created by 墨子痕 on 2022/7/20.
//  Copyright © 2022 Hutter. All rights reserved.
//
//  257. 二叉树的所有路径
//  给你一个二叉树的根节点 root ，按 任意顺序 ，返回所有从根节点到叶子节点的路径。
//
//  叶子节点 是指没有子节点的节点。
//  输入：root = [1,2,3,null,5]
//  输出：["1->2->5","1->3"]
//  示例 2：
//
//  输入：root = [1]
//  输出：["1"]
//
//  提示：
//
//  树中节点的数目在范围 [1, 100] 内
//  -100 <= Node.val <= 100
//
//  来源：力扣（LeetCode）
//  链接：https://leetcode.cn/problems/binary-tree-paths

class BTreePathSolution {
    /// 解法1: DFS
    
    var result: [String] = []
    var path: [String] = []
    
    func binaryTreePaths(_ root: TreeNode?) -> [String] {
//        var allPath = [String]()
//        dfs(root, path: "", allPath: &allPath)
//        return allPath
        
        dfs(root)
        return result
    }
    
    func dfs(_ node: TreeNode?, path: String, allPath: inout [String]) {
        guard let node = node else {
            return
        }
        var newPath: String
        if path.isEmpty {
            newPath = "\(node.val)"
        } else {
            newPath = path + "->\(node.val)"
        }
        if node.left == nil && node.right == nil {
            allPath.append(newPath)
        }
        dfs(node.left, path: newPath, allPath: &allPath)
        dfs(node.right, path: newPath, allPath: &allPath)
    }
    
    /// 另一种写法
    /// 数组存放每个节点，使用joined拼接，非常巧妙
    func dfs(_ node: TreeNode?) {
        guard let node = node else { return }
        path.append("\(node.val)")
        if node.left == nil && node.right == nil {
            result.append(path.joined(separator: "->"))
        } else {
            dfs(node.left)
            dfs(node.right)
        }
        path.removeLast()   // 回到上个节点
    }
}
