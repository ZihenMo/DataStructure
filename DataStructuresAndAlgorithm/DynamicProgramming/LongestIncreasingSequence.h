//
// Created by 墨子痕 on 2021/7/31.
// Copyright (c) 2021 Hutter. All rights reserved.
// [300.最长递增子序列](https://leetcode-cn.com/problems/longest-increasing-subsequence/)

#ifndef DATASTRUCTURESANDALGORITHM_LONGESTINCREASINGSEQUENCE_H
#define DATASTRUCTURESANDALGORITHM_LONGESTINCREASINGSEQUENCE_H

#import <vector>

using namespace std;

class LongestIncreasingSequence {
public:
    int lengthOfLIS(vector<int> &nums) {
//        return binarySearch(nums);
return bs2(nums);
    }
    /**
     * @brief 二分搜索法
     * 维护一个上升子序列，有比元素上的数就替换进去，大的追加在末尾.
     */
    int binarySearch(vector<int> &nums) {
        if (nums.size() <= 1) {
            return nums.size();
        }
        vector<int> seq{nums.front()};
        for (int i = 1; i < nums.size(); ++i) {
            if (nums[i] > seq.back()) {
                seq.push_back(nums[i]);
            } else { // search the seq and insert it may smaller
                auto idx = lower_bound(seq.begin(), seq.end(), nums[i]);    // 这里可替换成自己写的二分搜索
                if (idx != seq.end()) {
                    *idx = nums[i];
                }
            }
        }
        return seq.size();
    }

    int bs2(vector<int> &nums) {
        if (nums.size() <= 1) {
            return nums.size();
        }
        vector<int> seq{nums.front()};
        for (int i = 1; i < nums.size(); ++i) {
            if (nums[i] > seq.back()) {
                seq.push_back(nums[i]);
            } else { // search the seq and insert it may smaller
                int l = 0;
                int r = seq.size() - 1;
                while (l <= r) {            // 找到第一个小于该数的位,找不到则为0表示更小
                    int mid = (l + r) / 2;
                    if (seq[mid] < nums[i]) { // at right
                        l = mid + 1;
                    } else {
                        r = mid - 1;
                    }
                }
                seq[l] = nums[i];
            }
        }
        return seq.size();
    }

    int dp(vector<int> &nums) {
        if (nums.size() < 1) {
            return 0;
        }
        vector<int> dp(nums.size(), 1);
        int result = 1;
        for (int i = 1; i < nums.size(); ++i) {
            for (int j = 0; j < i; ++j) {
                if (nums[j] < nums[i]) {
                    dp[i] = max(dp[i], dp[j] + 1);
                }
            }
            result = max(result, dp[i]);     // 注意结果并不是dp[n-1]，dp[i]的含义是包含nums[i]
        }
        return result;
    }
};


#endif //DATASTRUCTURESANDALGORITHM_LONGESTINCREASINGSEQUENCE_H
