//
// Created by 墨子痕 on 2021/7/21.
// Copyright (c) 2021 Hutter. All rights reserved.
//
// 【一】贪心【优】由于这里没有交易手续费和买卖次数限制；
// 【二】动态规划

#include "Stock.h"
#import <cmath>


/**
 * @brief 贪心算法
 * 只要后一天股票有涨就在前一天买入，然后一涨就卖；利用先知功能和无手续费问题重复交易达到最终利润计算。
 */
int Stock::maxProfit_122(std::vector<int> &prices) {
    if (prices.size() <= 1) {
        return 0;
    }
    int profit = 0;
    for (int i = 1; i < prices.size(); ++i) {
        if (prices[i - 1] < prices[i]) {
            profit += prices[i] - prices[i - 1];
        }
    }
    return profit;
}

/**
 * @brief 暴力法，
 */
int bruteForce_121(std::vector<int> &prices) {
    if (prices.size() <= 1) {
        return 0;
    }
    int maxProfit = 0;
    for (int i = 0; i < prices.size(); ++i) {
        for (int j = i + 1; j < prices.size(); ++j) {
            maxProfit = std::max(maxProfit, prices[j] - prices[i]);
        }
    }
    return maxProfit;
};
/**
 * @brief 动态规划
 * 因为买入（最小值）一定在卖出之前（最大利润），因此只记录最小价格与最大利润即可，无须回退重新计算利润。
 */
int dp_121(std::vector<int> &prices) {
    if (prices.size() <= 1) {
        return 0;
    }
    int maxProfit = 0;
    int minPrice = prices.front();
    for (int i = 1; i < prices.size(); ++i) {
        int profit = prices[i] - minPrice;
        if (maxProfit < profit) {
            maxProfit = profit;
        }
        else if (prices[i] < minPrice) {
            minPrice = prices[i];
        }
    }
    return maxProfit;
};
int Stock::maxProfit_121(std::vector<int> &prices) {
//    return bruteForce_121(prices);
    return dp_121(prices);
}