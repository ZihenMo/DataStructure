//
// Created by 墨子痕 on 2021/7/29.
// Copyright (c) 2021 Hutter. All rights reserved.
//

#import "CountBits.h"

/** 方案一
 * @brief 遍历【0，n]的数，并统计其位为1的和
 */
vector<int> CountBits::solution1(unsigned int n) {
    vector<int> result{0};
    for (int i = 1; i <= n; ++i) {
        // count bits
        int tmp = i;
        int count = 0;
        while (tmp > 0) {
            ++count;
            tmp = tmp & (tmp - 1);
        }
        result.push_back(count);
    }
    return result;
}

/**
 * @brief 方案二，由于单调递增求值，后面的数一定比前面的大，而后面的数的二进制位可以在前面已求出1的结果上获得。
 * a = b & (b - 1),其中，b > a，因此a的结果已知；且sum{b位为1} = sum{a位为1} + 1;
 */
vector<int> CountBits::solution2(unsigned int n) {
    vector<int> result{0};
    for (int i = 1; i <= n; ++i) {
        result.push_back(result[i & (i - 1)] + 1);
    }
    return result;
}

vector<int> CountBits::countBits(unsigned int n) {
//    return solution1(n);
    return solution2(n);
}
