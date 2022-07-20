//
//  Tree.swift
//  DataStructuresAndAlgorithm
//
//  Created by 墨子痕 on 2022/7/20.
//  Copyright © 2022 Hutter. All rights reserved.
//  采用LeetCode定义

import Foundation
class TreeNode {
    var val: Int
    var left: TreeNode?
    var right: TreeNode?
    init() { self.val = 0; self.left = nil; self.right = nil; }
    init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}


extension TreeNode {
    
    /// 生成树
    static func makeTree(from sequence: [Int?]) -> TreeNode? {
        guard !sequence.isEmpty else { return nil }
        let root = TreeNode(sequence.first!!)
        var nodes = [TreeNode?]()
        nodes.append(root)
        for i in 1..<sequence.count {
            guard let val = sequence[i] else {
                nodes.append(nil)
                continue
            }
            let node = TreeNode(val)
            let parent = nodes[(i + 1) / 2 - 1]
            nodes.append(node)
            if (i + 1) % 2 == 0 {
                parent?.left = node
            } else {
                parent?.right = node
            }
            nodes[(i + 1) / 2 - 1] = parent
        }
        return root
    }
    
    /// 打印树
    
}
