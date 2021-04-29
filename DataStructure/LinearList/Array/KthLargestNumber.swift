//
// Created by gshopper on 2021/3/23.
// Copyright (c) 2021 Hutter. All rights reserved.
//

import Foundation

/// MARK: - 215.数组中的第K个最大元素
/// 在未排序的数组中找到第 k 个最大的元素。请注意，你需要找的是数组排序后的第 k 个最大的元素，而不是第 k 个不同的元素。
//
//示例 1:
//
//输入: [3,2,1,5,6,4] 和 k = 2
//输出: 5
//示例 2:
//
//输入: [3,2,3,1,2,4,5,5,6] 和 k = 4
//输出: 4
//说明:
//
//你可以假设 k 总是有效的，且 1 ≤ k ≤ 数组的长度。
//
//来源：力扣（LeetCode）
//链接：https://leetcode-cn.com/problems/kth-largest-element-in-an-array

/// 题解：
/// 利用快排的特性，中轴数左边一定都小于该数、右边的一定大于该数，即该数的位置是确定的。
/// 第K大的数刚好是中轴位为K的数。
/// 另外，如果中轴位小于K，可以放弃左半部分的区间，直接从右边开始查找
/// 反之，则放弃右半部分区间
class KthLargestNumber {

    func findKthLargest(_ nums: inout [Int], _ k: Int) -> Int {
        return quickSelect(&nums, l: 0, r: nums.count - 1, index: k - 1)
    }
    func quickSelect(_ nums: inout [Int], l: Int, r: Int, index: Int) -> Int {
        if nums.count == 1 {            // 注意该基线条件
            return nums[0]
        }
        let pivot = partition(&nums, l: l, r: r)
        if pivot == index {
            return nums[pivot]
        }
        else {
            return pivot < index ? quickSelect(&nums, l: pivot + 1, r: r, index: index) :
                    quickSelect(&nums, l: l, r: pivot - 1, index: index)
        }
    }
    /// 注意，寻找第K大数，使用降序排序
    /// 引入随机数非常重要，因为最差可能是一分为2之后每次走一小步，这样时间复杂度为O(n^2)
    /// 随入随机索引，时间复杂度为O(n)
    func partition(_ nums: inout [Int], l: Int, r: Int) -> Int {
        var l = l
        var r = r
        let randomIndex = Int.random(in: (l...r))
        let pivot = nums[randomIndex]
        nums.swapAt(l, randomIndex) // 交换随机索引与左边数
        while l < r {
            while l < r && nums[r] <= pivot {
                r -= 1
            }
            nums[l] = nums[r]
            while l < r && nums[l] >= pivot {
                l += 1
            }
            nums[r] = nums[l]
        }
        nums[l] = pivot
        return l
    }
}

// MARK: - 不可变解法
extension KthLargestNumber {
    func findKthLargest2(_ nums: [Int], _ k: Int) -> Int {
        var nums = nums;
        return quickSelect(&nums, l: 0, r: nums.count - 1, index: k - 1)
    }
}

// MARK: - 使用系统快排
extension KthLargestNumber {
    func findKthLargest3(_ nums: [Int], _ k: Int) -> Int {
        return nums.sorted { $0 > $1  }[k - 1]
    }
}