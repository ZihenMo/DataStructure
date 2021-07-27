// Created by 墨子痕 on 2021/7/22.
// Copyright (c) 2021 Hutter. All rights reserved.
// 51.52 N 皇后问题 https://leetcode-cn.com/problems/n-queens/
// 51. N 皇后
// n 皇后问题 研究的是如何将 n 个皇后放置在 n×n 的棋盘上，并且使皇后彼此之间不能相互攻击。
// 给你一个整数 n ，返回所有不同的 n 皇后问题 的解决方案。
// 每一种解法包含一个不同的 n 皇后问题 的棋子放置方案，该方案中 'Q' 和 '.' 分别代表了皇后和空位。

#import <Foundation/Foundation.h>
#import <DSTreeNode.h>
#import <vector>
#import <set>
#import <string>
using namespace  std;

@interface DSTreeNode (Queen)
@end

class Queen {
    int n;
    set<int> xy_sum;        // x + y = c; 左对角线
    set<int> xy_diff;       // x - y = c; 右对角线
    set<int> columns;
    vector<vector<pair<int, int>>> result;
public:
    vector<vector<string>> print(void);
        vector<vector<string>> solveNQueens(int n);
    void DFS(int row, int column, vector<pair<int, int>> state);
};