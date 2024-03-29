//
// Created by 墨子痕 on 2021/7/21.
// Copyright (c) 2021 Hutter. All rights reserved.
//
// 121/122. 买卖股票的最佳时机 II  https://leetcode-cn.com/problems/best-time-to-buy-and-sell-stock-ii/
// 给定一个数组 prices ，其中 prices[i] 是一支给定股票第 i 天的价格。
// 
// 设计一个算法来计算你所能获取的最大利润。你可以尽可能地完成更多的交易（多次买卖一支股票）。
// 
// 注意：你不能同时参与多笔交易（你必须在再次购买前出售掉之前的股票）。
// 示例 1:
// 
// 输入: prices = [7,1,5,3,6,4]
// 输出: 7
// 解释: 在第 2 天（股票价格 = 1）的时候买入，在第 3 天（股票价格 = 5）的时候卖出, 这笔交易所能获得利润 = 5-1 = 4 。
// 随后，在第 4 天（股票价格 = 3）的时候买入，在第 5 天（股票价格 = 6）的时候卖出, 这笔交易所能获得利润 = 6-3 = 3 。
// 121只能做一次交易；122无限


#import <vector>

#ifndef DATASTRUCTURESANDALGORITHM_STOCK_H
#define DATASTRUCTURESANDALGORITHM_STOCK_H


class Stock {
public:
    int maxProfit_121(std::vector<int> &prices);
    int maxProfit_122(std::vector<int> &prices);
};


#endif //DATASTRUCTURESANDALGORITHM_STOCK_H
