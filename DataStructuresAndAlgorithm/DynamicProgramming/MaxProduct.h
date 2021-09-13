//
// Created by 墨子痕 on 2021/7/31.
// Copyright (c) 2021 Hutter. All rights reserved.
// 152. 乘积最大子数组 https://leetcode-cn.com/problems/maximum-product-subarray/
// 给你一个整数数组 nums，请你找出数组中乘积最大的连续子数组（该子数组中至少包含一个数字），并返回该子数组所对应的乘积。
//
// 示例 1:
// 输入: [2,3,-2,4]
// 输出: 6
// 解释:子数组 [2,3] 有最大乘积 6。
//
// 示例 2:
// 输入: [-2,0,-1]
// 输出: 0
// 解释:结果不能为 2, 因为 [-2,-1] 不是子数组。

#ifndef DATASTRUCTURESANDALGORITHM_MAXPRODUCT_H
#define DATASTRUCTURESANDALGORITHM_MAXPRODUCT_H

#include <vector>
#include <algorithm>
using namespace std;

class MaxProduct {
public:
    int maxProduct(vector<int> &nums) {
        return dp2(nums);
    }
    int dp1(vector<int> &nums) {
        if (nums.size() == 0) {
            return 0;
        }
        vector<int> maxP(nums);
        vector<int> minP(nums);
        for (int i = 1; i < nums.size(); ++i) {
            maxP[i] = max(maxP[i - 1] * nums[i], minP[i - 1] * nums[i]);
            minP[i] = min(maxP[i - 1] * nums[i], minP[i - 1] * nums[i]);
        }
        return *max_element(maxP.begin(), maxP.end());  // 在所有最大值中找
    }
    /**
     * 使用2维2个元素记录前一个子序列的最大值与当前序列的最大值；前面序列存在的负最大值与当前负最大值；
     */
    int dp2(vector<int> &nums) {
        if (nums.size() == 0) {
            return 0;
        }
        int arr[2][2];
        arr[0][0] = nums[0];
        arr[0][1] = nums[0];
        int result = 0;
        for (int i = 1; i < nums.size(); ++i) {
            int idx1 = i % 2;   // 当前元素
            int idx2 = (i - 1) % 2; // 前一个;相当于i - 1
            arr[idx1][0] = max(nums[i] * arr[idx2][0], nums[i] * arr[idx2][1]);
            arr[idx1][1] = min(nums[i] * arr[idx2][0], nums[i] * arr[idx2][1]);
            result = max(result, arr[idx1][0]);  // 正数更新最大值
        }
        return result;
    }

};


#endif //DATASTRUCTURESANDALGORITHM_MAXPRODUCT_H
