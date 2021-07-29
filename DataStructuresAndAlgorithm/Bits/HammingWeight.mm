//
// Created by 墨子痕 on 2021/7/29.
// Copyright (c) 2021 Hutter. All rights reserved.
//

#include "HammingWeight.h"

int HammingWeight::hammingWeight(unsigned  int n) {
    return solution1(n);
}

int HammingWeight::solution1(unsigned int n) {
    int bits = 0;
    while (n) {    // 无符号类型，不用考虑负数
        ++bits;
        n = n & (n - 1);            // & 上最后一个1外全取反
    }
    return bits;
}

int HammingWeight::solution2(unsigned int n) {
    int bits = 0;
    while (n) {
        if (n & 1) {
            ++bits;
        }
        n >>= 1;
    }
    return bits;
}
