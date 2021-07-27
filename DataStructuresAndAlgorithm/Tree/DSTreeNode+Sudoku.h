//
// Created by 墨子痕 on 2021/7/23.
// Copyright (c) 2021 Hutter. All rights reserved.
//
// 36.37. 解数独 https://leetcode-cn.com/problems/sudoku-solver/
//         编写一个程序，通过填充空格来解决数独问题。
//
// 数独的解法需 遵循如下规则：
//
// 数字 1-9 在每一行只能出现一次。
// 数字 1-9 在每一列只能出现一次。
// 数字 1-9 在每一个以粗实线分隔的 3x3 宫内只能出现一次。（请参考示例图）
// 数独部分空格内已填入了数字，空白格用 '.' 表示。
// 提示：
// board.length == 9
// board[i].length == 9
// board[i][j] 是一位数字或者 '.'
// 题目数据 保证 输入数独仅有一个解


#import <Foundation/Foundation.h>
#import <DSTreeNode.h>

@interface DSTreeNode (Sudoku)
@end

class Sudoku {
    int rows[9][9];
    int cols[9][9];
    int block[3][3][9];
public:
    void solveSudoku(vector<vector<char>> &board);
    /**
     * @brief 递归填数
     * @param board 数独矩阵
     * @return 当前行列元素有解否
     */
    bool DFS(vector<vector<char> > &board);
    /**
     * @brief 检查能否填入target数字
     * @param target 即将填入的数字
     * @param row 行
     * @param col 列
     * @param board 数独矩阵
     * @return  数字是否合法
     */
    bool valid(char target, int row, int col, vector<vector<char>> &board);
};