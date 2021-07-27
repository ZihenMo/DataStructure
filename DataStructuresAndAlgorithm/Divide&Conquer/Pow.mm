//
// Created by 墨子痕 on 2021/7/20.
// Copyright (c) 2021 Hutter. All rights reserved.
// 指数减少一半，底数相应增大为平方值；
// T：O（LogN）
// 注意 ：
// 1.负数求指数为倒数的指数值；
// 2.奇数与偶数由于除2向下取整，奇数需多乘上一个底数。



#include "Pow.h"

#pragma mark - Pow
/**
 * @brief 分治 递归
 */
 double pow_recursive(double x, int n) {
    if (n == 0 || x == 1) {
        return 1;
    }
    if (n == 1) {
        return x;
    }
    if (n < 0) { // 指数为负时，求底数的倒数的指数运算
        long N = abs((long) n);       // 最大int负数转正越界
        return 1 / pow(x, N);           // 注意将n修正
    }
    // 2 ^ 4 = 2 ^ 2 * 2 ^ 2 = (2 * 2 ) ^ 2
    if (n % 2 == 0) {    // 偶数拆分为 x ^ (n / 2) * x ^ (n / 2) ；在调用时应合并底数避免重复计算
        return pow(x * x, n / 2);   // 这是里不要写成 pow (x , n / 2) * pow (x, n / 2);
    } else {
        return pow(x * x, n / 2) * x;       // 注意是原底数，不是新底数
    }
}
/**
 * @brief 分治，非递归
 */
double pow_iteration(double x, int n) {
    if (n < 0) {
        x =  1 / x;
        n = abs(n);
    }
    int t = 1;
    while (n != 0) {
        if (n & 1) {     // n % 2
            t *= x; // 奇数
        }
        x *= x;
        n >>= 1; // n /= 2;
    }
    return t;
}
double Pow::pow(double x, int n) {
    return pow_iteration(x, n);
//    return pow_recursive(x, n);
}

