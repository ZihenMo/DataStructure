//
// Created by 墨子痕 on 2021/7/13.
// Copyright (c) 2021 Hutter. All rights reserved.
//
// 方案一：数组排序 T: O(N * KLogK) 快排
// 1.维护K个最大元素的数组。
// 2.每增加一个元素排一次序并剔除末尾元素。
//
// 方案二：小顶堆（优） T：O(NlogN) 利用堆的调整速度为LogN进行加速。
// 1.维持小顶堆保持K个值，这样最小值就是第K大的数。
// 2.堆是优先队列的一种实现，使用priority_queue。


#import "DSPriorityQueue+KthLargest.hpp"


@implementation DSPriorityQueue (KthLargest)
@end

#pragma mark - C++

/* KthLargest.h */