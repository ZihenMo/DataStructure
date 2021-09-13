
//
// Created by 墨子痕 on 2021/7/30.
// Copyright (c) 2021 Hutter. All rights reserved.
// 方案一：动态规划，同斐波那契数
// dp[i]：表示爬到i层共有的方法和；
// dp[i] = dp[i - 1] + dp[i - 2] + 2;
// 起始值：dp[1] = 1; dp[2] = 2;
// 方案二：通项公式 (1+√5）/2
// 方案三：矩矩幂乘

#include "ClimbStair.h"
#import <algorithm>
#import <vector>

using namespace std;

//int ClimbStair::climbStairs(int n) {
//    if (n <= 1) {
//        return n;
//    }
//    vector<int> ret(n);
//    ret[0] = 1;         // 到1阶有1种
//    ret[1] = 2;         // 到2阶有2种
//    for (int i = 2; i < n; ++i) {
//        ret[i] = ret[i - 1] + ret[i - 2];
//    }
//    return ret[n - 1];
//}

/**
 * @brief 移动数组，节省内存 与斐波数列不同在于，输入2代表2层楼，有2种方式； 数列 0 1 2 3
 * 斐波那契数列：0 1 1 2 3 5
 * 规律一致,算法一致,由于题目输入为正整数，可以不用处理
 */
int ClimbStair::climbStairs(int n) {
    int a = 0, b = 1, sum = 0;
    for (int i = 1; i <= n; ++i) {          // 一定要注意算到n，比斐波那契多算一次
        sum = a + b;
        a = b;
        b = sum;
    }
    return sum;
}


int Fibonacci::fibonacci(int n) {
    if (n <= 1) { return n;}
    int a = 0;  // 第0项
    int b = 1; // 第1项
    int sum = 0;
    for (int i = 1; i < n; ++i) {   // n - 1次
//        second = first + second;            // 内存溢出
//        first = second - first;
        sum = (a + b) % 1000000007;         // 这样写却不会溢出
        a = b;
        b = sum;
    }
    return sum;
}

int fb1(int n) {
    if (n <= 1) {
        return n;
    }
    int a = 0;
    int b = 1;
    int sum = 0;
    for (int i = 1; i < n; ++i) {
        sum = a + b;
        a = b;
        b = sum;
    }
    return sum;
}
