//
// Created by gshopper on 2021/3/23.
// Copyright (c) 2021 Hutter. All rights reserved.
//

import Foundation


class RotateArray {

// MARK: - 旋转数组最小值
// 把一个数组最开始的若干个元素搬到数组的末尾，我们称之为数组的旋转。输入一个递增排序的数组的一个旋转，输出旋转数组的最小元素。例如，数组 [3,4,5,1,2] 为 [1,2,3,4,5] 的一个旋转，该数组的最小值为1。  
//
// 示例 1：
//
// 输入：[3,4,5,1,2]
// 输出：1
// 示例 2：
//
// 输入：[2,2,2,0,1]
// 输出：0
//
// 来源：力扣（LeetCode）
// 链接：https://leetcode-cn.com/problems/xuan-zhuan-shu-zu-de-zui-xiao-shu-zi-lcof

/// 题解: 从原旋转点（arr[r]）入手，可以发现所有最小值右侧的元素一定小于等于arr[r]；最小值左侧的元素则大于等于arr[r]。
/// 0. 取一个中位的数, x = l + (r - l) / 2;
/// 1. arr[x] < arr[r]，则min在(l,x]，r = x;
/// 2. arr[x] > arr[r], 则min在(x,r], l = x + 1;
/// 3. arr[x] == arr[r], 相等时只能一步步挪, r = r - 1。不论arr[r]是不是最小值，它的左侧肯定存在相等或比它小的存在。
/// - Parameter arr:旋转数组
/// - Returns:最小值
    static func findMinValue(arr: [Int]) -> Int {
        if arr.count < 2 {
            return arr.first ?? NSNotFound
        }
        var l = 0
        var r = arr.count - 1
        var x = (l + r - l) / 2
        while l < r {
            if arr[x] < arr[r] {
                r = x
            }
            else if arr[x] > arr[r] {
                l = x + 1
            }
            else {
                r -= 1
            }
            x = l + (r - l) / 2
        }
        return arr[l]
    }
}