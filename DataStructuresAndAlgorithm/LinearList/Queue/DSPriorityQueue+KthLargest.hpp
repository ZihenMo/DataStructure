//
// Created by 墨子痕 on 2021/7/13.
// Copyright (c) 2021 Hutter. All rights reserved.
//
// 703. 数据流中的第 K 大元素
//  https://leetcode-cn.com/problems/kth-largest-element-in-a-stream/
//         设计一个找到数据流中第 k 大元素的类（class）。注意是排序后的第 k 大元素，不是第 k 个不同的元素。
//
// 请实现 KthLargest 类：
//
// KthLargest(int k, int[] nums) 使用整数 k 和整数流 nums 初始化对象。
// int add(int val) 将 val 插入数据流 nums 后，返回当前数据流中第 k 大的元素。


#import <Foundation/Foundation.h>
#import "DSPriorityQueue.h"


@interface DSPriorityQueue (KthLargest)


@end


