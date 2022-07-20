//
//  Set+Extensions.swift
//  DataStructuresAndAlgorithm
//
//  Created by 墨子痕 on 2022/7/19.
//  Copyright © 2022 Hutter. All rights reserved.
//  给定一个集合,返回这个集合所有的子集
//  剑指 Offer II 079. 所有子集 https://leetcode.cn/problems/TVdhkn/
//  给定一个整数数组 nums ，数组中的元素 互不相同 。返回该数组所有可能的子集（幂集）。
//
//  解集 不能 包含重复的子集。你可以按 任意顺序 返回解集。
//
//
//  示例 1：
//
//  输入：nums = [1,2,3]
//  输出：[[],[1],[2],[1,2],[3],[1,3],[2,3],[1,2,3]]
//  示例 2：
//
//  输入：nums = [0]
//  输出：[[],[0]]



import Foundation

extension Set {
    /// 位方法
    /// • 思路:解这道题的思想本质上就是元素选与不选的问题,于是我们就可以想到用二进制来代表选与不选的情况。
    /// “1”代表这个元素已经选择,而“0”代表这个元素没有选择。假如三个元素 A B C ,那么 101 就代表 B 没有选择,所以 101 代表的子集为 AC 。
    /// 思路与算法
    ///    记原序列中元素的总数为 n。原序列中的每个数字 a_ia
    ///
    ///      的状态可能有两种，即「在子集中」和「不在子集中」。我们用 11 表示「在子集中」，00 表示不在子集中，那么每一个子集可以对应一个长度为 n 的 0/1 序列，第 i 位表示 a_ia
    ///
    ///      是否在子集中。例如，n = 3 ，a={5,2,9} 时：
    ///
    ///    0/1 序列    子集    0/1 序列对应的二进制数
    ///    000000    {}    0
    ///    001001    {9}    1
    ///    010010    {2}    2
    ///    011011    {2,9}    3
    ///    100100    {5}    4
    ///    101101    {5,9}    5
    ///    110110    {5,2}    6
    ///    111111    {5,2,9}    7
    ///    可以发现 0//1 序列对应的二进制数正好从 00 到 2^n - 12
    ///     −1。我们可以枚举n [0, 2^n - 1]mask∈[0,2^n - 1],
    ///     mask 的二进制表示是一个 0/1 序列，我们可以按照这个 0/1 序列在原集合当中取数。当我们枚举完所有 2^n
    ///      个 mask，我们也就能构造出所有的子集。
    func allSubSet1() -> Array<Set<Element>> {
        let count = 1 << self.count
        let elements = Array(self)
        var subSets = Array<Set<Element>>()
        for i in 0..<count {               // 理论上有几个数结果便是2^n个子集，1左移n位即可
            var subSet = Set<Element>()
            for j in 0..<elements.count {
                if (i >> j) & 1 == 1 {     // 将这个数右移，如果末位是1表示当前元素需加入到集合
                    subSet.insert(elements[j])
                }
            }
            subSets.append(subSet)
        }
        return subSets
    }
    
    /// 递归法
    /// 当集合只有一个元素时，拥有两个子集；拥有两个元素在，在原来的子集基础上 对第二个元素选与不选的组合构成新的子集。
    /// 看起来与二叉树十分相似。使用DFS遍历即可，每条路径代表一个子集，元素个数等于树的高，注意使用路径表示元素而非节点
    /// 节点表示选与不选该元素。
    func dfs_allSubSet() -> Array<Set<Element>> {
        let elements = Array(self)
        var subSet = Set<Element>()
        var result = Array<Set<Element>>()
        dfs(elements: elements, cur: 0, subset: &subSet, result: &result)
        return result
    }
    
    func dfs(elements: [Element], cur: Int, subset: inout Set<Element>, result: inout Array<Set<Element>>) {
        guard cur != elements.count else {
            result.append(subset)
            return
        }
        subset.insert(elements[cur])
        dfs(elements: elements, cur: cur + 1, subset: &subset, result: &result)
        subset.remove(elements[cur])
        dfs(elements: elements, cur: cur + 1, subset: &subset, result: &result)
    }
}


// MARK: - 练习
extension Set {
    func allSubSet() -> Array<Set<Element>> {
        // 0. 转成数组
        let elements = Array(self)
        // 1. 由元素个数得到二进制位数 1 << n
        let bits = 1 << count
        // 2. 定义结果存储
        var result = Array<Set<Element>>()
        // 3. 遍历2^n这个十进制数，因为有2^n个子集；每个子集由i的二进制位来表示
        var subSet = Set<Element>()
        for i in 0..<bits {
            // 4. 定义一个子集容器
            subSet.removeAll()
            // 5. 从0位开始，枚举i的每一位二进制位，为1则表示数组中的元素在该子集中
            for j in 0..<count {
                if (i >> j) & 1 == 1 {
                    // 6. 将元素加入子集容器
                    subSet.insert(elements[j])
                }
                // 7. 将子集容器加入结果数组，注意这里索引是j而不是i
            }
            result.append(subSet)
        }
        // 8. 返回结果
        return result
    }
    
}

