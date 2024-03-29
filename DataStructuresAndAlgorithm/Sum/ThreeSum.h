//
// Created by 墨子痕 on 2021/7/14.
// Copyright (c) 2021 Hutter. All rights reserved.
//
// 15. 三数之和
// https://leetcode-cn.com/problems/3sum/
//  给你一个包含 n 个整数的数组 nums，判断 nums 中是否存在三个元素 a，b，c.
//  使得 a + b + c = 0 ？请你找出所有和为 0 且不重复的三元组。
// 
// 注意：答案中不可以包含重复的三元组。
// 示例 1：
// 
// 输入：nums = [-1,0,1,2,-1,-4]
// 输出：[[-1,-1,2],[-1,0,1]]

#ifndef DATASTRUCTURESANDALGORITHM_THREESUM_H
#define DATASTRUCTURESANDALGORITHM_THREESUM_H

#import <vector>
using namespace std;

class ThreeSum {
public:
    vector<vector<int>> threeSum(vector<int>& nums);
};


#endif //DATASTRUCTURESANDALGORITHM_THREESUM_H
