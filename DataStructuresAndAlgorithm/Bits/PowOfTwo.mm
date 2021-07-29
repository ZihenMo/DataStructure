//
// Created by 墨子痕 on 2021/7/29.
// Copyright (c) 2021 Hutter. All rights reserved.
//

#include "PowOfTwo.h"

/** 方案一
 * @brief 模2统1为1的位数
 */
bool solution1(int n) {
    int bits = 0;
    while (n && bits <= 2) {
        if (n & 1) {
            ++bits;
        }
        n = n >> 1;
    }
    return bits == 1;
}
/**
 * @brief 同方案一，按位统计1
 */
bool solution11(int n) {
   int bits = 0;
   while (n && bits <= 2) {
       ++bits;
       n = n & (n - 1);     // 抹掉末位的1
   }
   return bits == 1;
}

/** 方案二
 * @brief 脑回路版，清掉末位的1，整体值是否为0
 */
bool solution2(int n) {
    return n > 0 && (n & (n - 1)) == 0;
}


/**
 * @brief 2的幂只有一位为1，其他为0
 */
bool PowOfTwo::isPowerOfTwo(int n) {
//    return solution1(n);
    return solution2(n);
//    return solution11(n);
    return false;
}
