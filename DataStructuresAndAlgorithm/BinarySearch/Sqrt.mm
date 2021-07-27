//
// Created by 墨子痕 on 2021/7/27.
// Copyright (c) 2021 Hutter. All rights reserved.
// 方案一【大众】 二分查找法
// 方案二【优】牛顿迭代法，需记公式

#include "Sqrt.h"

/**
 * @brief 实际上应考虑使用double类型的结果来保证算法完整性。
 * @param x 开根数
 * @return 开根结果
 */
int Sqrt::mySqrt(int x) {
    if (x == 0 || x == 1) {
        return x;
    }
    int l = 1;  // double 从0开始，int则可从1开始
    int r = x;
    while (l <= r) {
        int m = (l + r) / 2;    // 无聊的边界值可能益出，在l + r时。
        if (m == x / m) {   // 刚好整数时,这里应理解为 m - x / m > 0 && m - x / m<= 1;
            return m;
        } else if (m > x / m) { // 使用除代替乘避免溢出
            r = m - 1;
        } else {
            l = m + 1;
        }
    }
    return l - 1;           // 取下界值-1
}

/**
 * @brief 二分法代码优化
 */
int sqrt_1(int x) {
    if (x == 0 || x == 1) {
        return x;
    }
    int l = 1;
    int r = x;
    while (l <= r) {
        int m = (l + r) / 2;
        if (m <= x / m) {
            l = m + 1;
        } else {
            r = m - 1;
        }
    }
    return l - 1;
}

/**
 * @brief 浮点数版
 * @param precision 精度 通常为1e-8
 */
double sqrt_2(double x, double precision) {
    if (x == 0 || x == 1) {
        return x;
    }
    double l = 0;
    double r = x;
    while (l <= r) {
        double m = (l + r) / 2;
        if (m - x / m > 0 && m - x / m <= precision) {
            return m;
        } else if (m < x / m) {
            l = m + 1;
        } else {
            r = m - 1;
        }
    }
    return l - 1;   // 这里return -1即可，因为一定存在某个精度下的解
}
