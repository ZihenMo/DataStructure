//
// Created by 墨子痕 on 2021/7/13.
// Copyright (c) 2021 Hutter. All rights reserved.
//
// 方案一：大顶堆；T:O(N * LogN)
// 1.维护K个元素的大顶堆；LogN
// 2.每次移动取堆顶元素为最大值。 1
//
// 方案二：双端队列; T:O(N)
// 0.因窗口大小固定，且只记录最大值的【索引】，可采用双端队列。
// 1.入队时，如果比之前的元素都大，则将前面的所有元素出队(注意从新的往旧的比）；
// 2.入队时，如果比之前的元素小，则达到窗口值的大小的最久元素出队，同时因为1的规则，不需要维护队列。
// 3.每次最大值是队列的尾部元素。
//

#include "SlideWindow.h"
#import <deque>
#import <queue>

using namespace std;

vector<int> solution1(vector<int> &nums, int k);
vector<int> solution2(vector<int> &nums, int k);
vector<int> solution3(vector<int> &nums, int k);

/**
 * 1. 记录的是索引；
 * 2. 满足窗口大小才进行入队；而超过窗口还需要出列；
 * 3. 维持最大值在front;对比时从back开始，避免中间出现旧的小值。
 * 4. 各种边界值十分蛋疼！！首先K是与索引比较时要-1，同时，满足K时要用=。
 * 5. front、back方法调用将需小心队列不能是empty。
 */
vector<int>
SlideWindow::
maxSlidingWindow(std::vector<int> &nums, int k) {
    return solution1(nums, k);
}

vector<int> solution1(vector<int> &nums, int k) {
    priority_queue<pair<int, int>> maxHeap; // 大顶堆
    vector<int> result;
    for (int i = 0; i < nums.size(); ++i) {
        maxHeap.emplace(nums[i], i);   // maxHeap.push({nums[i], i})
        if (i >= k - 1) {                           // 满足窗口值
            while (maxHeap.top().second <= i - k) { // 在窗口左侧
                maxHeap.pop();
            }
            result.push_back(maxHeap.top().first);
        }
    }
    return result;
}

vector<int> solution2(vector<int> &nums, int k) {
    vector<int> result;
    deque<int> deq;
    for (int i = 0; i < nums.size(); ++i) {
        if (i >= k && deq.front() <= i - k) { // pop超数元素。因为窗口可能不一定满K个元素，因此判断是否越界用索引值
            deq.pop_front();
        }
        while (deq.size() > 0 && nums[deq.back()] < nums[i]) {  // 小于最新值的全部出列
            deq.pop_back();
        }
        deq.push_back(i);                           // 新值入队
        if (i >= k - 1) {                           // 满足窗口尺寸时进行记录结果,这个数值很刁钻！！
            result.push_back(nums[deq.front()]);    // front!!!
        }
    }
    return result;
}

/**
 * @brief 为什么不能使用队列来实现？
 * 在比较新元素与队列中的大小时必须从入队端开始，这样保证了出队端是最大值。
 * 否则可能出现出队端是大的旧值，中间有较旧的小值，这样大的新值没有将中间较旧的小值筛除。
 */


