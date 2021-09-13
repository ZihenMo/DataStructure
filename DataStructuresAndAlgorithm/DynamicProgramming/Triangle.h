//
// Created by 墨子痕 on 2021/7/31.
// Copyright (c) 2021 Hutter. All rights reserved.
//

#ifndef DATASTRUCTURESANDALGORITHM_TRIANGLE_H
#define DATASTRUCTURESANDALGORITHM_TRIANGLE_H

/**
 *120. 三角形最小路径和
给定一个三角形 triangle ，找出自顶向下的最小路径和。

每一步只能移动到下一行中相邻的结点上。相邻的结点 在这里指的是 下标 与 上一层结点下标相同
或者等于 上一层结点下标 + 1 的两个结点。也就是说，如果正位于当前行的下标 i ，那么下一步
可以移动到下一行的下标 i 或 i + 1 。

示例 1：

输入：triangle = [[2],[3,4],[6,5,7],[4,1,8,3]]
输出：11
解释：如下面简图所示：
   2
  3 4
 6 5 7
4 1 8 3
自顶向下的最小路径和为 11（即，2 + 3 + 5 + 1 = 11）。
*/

#include <iostream>
#include <vector>
#include <algorithm>
using namespace std;

class Triangle {
public:
/**
   * dp[i][j] 包括第i行j列时，到root的最小和
   * dp[i][j] = min{dp[i + 1][j], dp[i + 1][j + 1] }; 下一行的最小和
   */
    int minimumTotal(vector<vector<int>> &triangle) {
        return solution1(triangle);
    }
    int solution1(vector<vector<int>> &triangle) {
        if (triangle.size() == 0) {
            return 0;
        }
        // 二维也需要分配数量,可以使用循环精准分配
        vector<vector<int> > dp(triangle.size(), vector<int>(triangle.back().size()));
        dp.back() = triangle.back();
        for (int i = triangle.size() - 2; i >= 0; --i) {
            for (int j = 0; j < triangle[i].size(); j++) {
                dp[i][j] = min(dp[i + 1][j], dp[i + 1][j + 1]) + triangle[i][j];
            }
        }
        return dp[0][0];
//        if (triangle.size() <= 0) {
//            return 0;
//        }
//        vector<vector<int> > sum(triangle.size(), vector<int>(triangle.back().size()));
//        sum[sum.size() - 1] = triangle.back();       // 最后一层为基础
//        for (int i = triangle.size() - 2; i >= 0; --i) {
//            for (int j = 0; j < triangle[i].size(); ++j) { // size_t 害人,这里不能倒序
//                sum[i][j] = triangle[i][j] + min(sum[i + 1][j], sum[i + 1][j + 1]);
//            }
//        }
//        return sum[0][0];
    }
    /**
     * 由下往上累加时，只需要一行的结果，且未计算的值肯定是j或j+1，因此覆盖j不影响结果。
     */
    int solution2(vector<vector<int>> &triangle) {
        if (triangle.size() <= 0) {
            return 0;
        }
        vector<int> sum = triangle.back();  // 最后一行为基础递推
        for (int i = triangle.size() - 2; i >= 0 ; --i) { // 注意，行从倒数第2行开始,注意包行第0行的结果
            for (int j = 0; j < triangle[i].size(); ++j) {
                sum[j] = triangle[i][j] + min(sum[j], sum[j + 1]);  // sum[i + 1] 就是上一次计算的sum[i]
            }
        }
        return sum[0];
    }
};


#endif //DATASTRUCTURESANDALGORITHM_TRIANGLE_H
