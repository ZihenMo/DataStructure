//
// Created by 墨子痕 on 2021/7/14.
// Copyright (c) 2021 Hutter. All rights reserved.
//

#include "ThreeSum.h"
#import <vector>
#import <unordered_set>
#import <set>

#pragma mark - 哈希法

/**
 * @brief 哈希法,减少一层循环
 * 重复元素怎么解？
 * 1.排序；（不影响整体时间复杂度）
 * 2.避免【前面】已求值的重复元素求值。
 * 3.结果使用set去重。效率低下,空间占用高。
 */
vector<vector<int>> threeSum_1(vector<int> &nums) {
    if (nums.size() < 3) {
        return vector<vector<int>>();
    }
    sort(nums.begin(), nums.end());
    set<vector<int>> result;
    for (int i = 0; i < nums.size() - 2; ++i) {
        int a = nums[i];
        if (i >= 1 && a == nums[i - 1]) {// 只能过滤前面的！！！
            continue;                   // 重复元素
        }
        unordered_set<int> set;
        for (int j = i + 1; j < nums.size(); ++j) { // 这里注意-1
            int b = nums[j];
            if (set.find(b) == set.end()) { // find b
                set.insert(-a - b);           // insert c = -(a+b) = -a-b;
            } else {
                result.insert({a, b, -a - b});
            }
        }
    }
    // c++中的unordered_set的迭代器不方便转换
    return vector<vector<int>>(result.begin(), result.end());
}

/**
 * @brief 优化结果去重，使用set太糟,使用unorder_set更加麻烦，需要提供哈希函数
 */
struct VectorHash {
    size_t operator()(const std::vector<int> &v) const {
        std::hash<int> hasher;
        size_t seed = 0;
        for (int i : v) {
            seed ^= hasher(i) + 0x9e3779b9 + (seed<<6) + (seed>>2);
        }
        return seed;
    }
};

vector<vector<int>> threeSum_11(vector<int> &nums) {
    if (nums.size() < 3) {
        return vector<vector<int>>();
    }
    sort(nums.begin(), nums.end());
    unordered_set<vector<int>, VectorHash> result;
    for (int i = 0; i < nums.size() - 2; ++i) {
        int a = nums[i];
        if (i >= 1 && a == nums[i - 1]) {// 只能过滤前面的！！！
            continue;                   // 重复元素
        }
        unordered_set<int> set;
        for (int j = i + 1; j < nums.size(); ++j) { // 这里注意-1
            int b = nums[j];
            if (set.find(b) == set.end()) { // find b
                set.insert(-a - b);           // insert c = -(a+b) = -a-b;
            } else {
                result.insert({a, b, -a - b});
            }
        }
    }
    vector<vector<int>> ret;
    for (auto r : result) {
        ret.push_back(r);
    }
    return ret;
}

#pragma mark - 双指针+排序

/**
 * @brief 第二、三遍循环合并，双指针头尾遍历进行匹配结果（和）
 * @param nums
 * @return
 */
vector<vector<int>> threeSum_2(vector<int> &nums) {
    if (nums.size() < 3) {
        return vector<vector<int>>();
    }
    sort(nums.begin(), nums.end());
    if (nums.back() > 0 || nums.front() < 0) {  // 最小值大于0或最大值小于0则和不可能为0
        return vector<vector<int>>();
    }
    vector<vector<int>> result;
    for (int i = 0; i < nums.size() - 2; ++i) {
        if (i > 0 && nums[i] == nums[i - 1]) {
            continue;           // 减少一些重复元素求值的循环
        }
        int l = i + 1;
        int r = static_cast<int>(nums.size() - 1);
        while (l < r) {
            int s = nums[i] + nums[l] + nums[r];
            if (s < 0) { // 结果太小，加左边
                ++l;
            } else if (s > 0) {   //  结果太大，减右边
                --r;
            } else {  // 有解，去重
                result.push_back({nums[i], nums[l], nums[r]});
                while (l < r && nums[l] == nums[l + 1]) {
                    ++l;
                }
                while (l < r && nums[r] == nums[r - 1]) {
                    --r;
                }
                ++l;            // import!!有解不重复需要同步前进
                --r;
            }
        }
    }
    return result;
}

vector<vector<int>> ThreeSum::threeSum(vector<int> &nums) {
    return threeSum_2(nums);
}
