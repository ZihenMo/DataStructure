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
#include "KthLargest.h"

KthLargest::KthLargest(int k, std::vector<int> &nums) {
    this->solution2_init(k, nums);
}
/**
 * @brief 流式添加元素
 * @param val 新元素
 * @return 第K大的数
 */
int KthLargest::add(int val) {
    return this->solution2_add(val);
}

#pragma mark - MinHeap
void KthLargest::solution1_init(int k, std::vector<int> &nums) {
    this->maxSize = k;
    for (int v : nums) {
        this->add(v);
    }
}

int KthLargest::solution1_add(int val) {
    this->minHeap.push(val);
    if (this->minHeap.size() > this->maxSize) {
        this->minHeap.pop();
    }
    return this->minHeap.top();
}

#pragma mark - 数组+排序
void KthLargest::solution2_init(int k, std::vector<int> &nums) {
    this->vector = nums;
    this->maxSize = k;
}


int KthLargest::solution2_add(int val) {
    this->vector.push_back(val);
    std::sort(this->vector.begin(), this->vector.end(), std::greater<int>());
    if (this->vector.size() > this->maxSize) {
        this->vector.pop_back();
    }
    return this->vector.back();
}

#pragma mark - Practise
/**
 * @brief 练习差异
 *
 */
int KthLargest:: add_practise(int val) {

    if (this->minHeap.size() + 1 < this->maxSize) {
        this->minHeap.push(val);
        return 0;   // 假定无结果返回0
    }
    if (this->minHeap.empty()) {
        this->minHeap.push(val);
    }
    else if (this->minHeap.top() < val) { // 出现比堆顶更大元素，置换
        this->minHeap.push(val);
    }
    if (this->minHeap.size() > maxSize) {
        this->minHeap.pop();
    }

    return this->minHeap.top();
}