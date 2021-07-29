//
// Created by 墨子痕 on 2021/7/29.
// Copyright (c) 2021 Hutter. All rights reserved.
//
// 338. 比特位计数 https://leetcode-cn.com/problems/counting-bits/
// 给定一个非负整数 num。对于 0 ≤ i ≤ num 范围中的每个数字 i ，计算其二进制数中的 1 的数目并将它们作为数组返回。
//
// 示例 1:
//
// 输入: 2
// 输出: [0,1,1]
// 示例 2:
//
// 输入: 5
// 输出: [0,1,1,2,1,2]


#import <vector>

using namespace std;

class CountBits {
    vector<int> solution1(unsigned int n);
    vector<int> solution2(unsigned int n);
public:
    vector<int> countBits(unsigned int n);
};