//
// Created by 墨子痕 on 2021/7/23.
// Copyright (c) 2021 Hutter. All rights reserved.
//
// 分析：
// 【状态记录】需要记录哪些状态 ？
// 填入一个数的满足条件有三：
//  1.当前行未出现的数字；
//  2.当前列未出现的数字；
//  3.当前3×3的矩阵未出现的数字。
//  *. 数字是1-9。
// 为此，需保存这三个状态值，仔细想想，这三个状态在填每个元素i,j都需要。由于数字是1到9，我们可以采用10位长的数组
// 进行存储，索引+1代表对应的数字，使用0和1表示未填与已填。因此状态存储的意义是：
//  1. row[i][10] 第i行已填数字；
//  2. row[j][10] 第j列已填数字；
//  3. block[i/3][j/3][10] 第i,j个矩阵已填数字。
// 实际上，给我们的矩阵已经用'.'表示空位，我们可以不用开僻额外的空间来存储将要填写的空格列表。
//
// 【执行操作】需要执行什么操作，达到怎么样结果？
//  简单点思考就是将9×9的矩阵数列遍历一次：
//  1.如果未填，你有两种选择：
//      a.存储所有未填的空格，等下集中填写；（条理清晰，代码冗余）
//      b.直接尝试填数。（代码较少且集中）
//  2.如果已填，设置三个状态表。
//  3.填数（整体只求一个解）
//      a.loop 1-9 填入(i, j);
//      b.检查其合法性；
//      c.不合法清除状态。
// 结果就是遍历完成（填完数），相当于无须判断。


#import "DSTreeNode+Sudoku.h"

@implementation DSTreeNode (Sudoku)
@end


void Sudoku::solveSudoku(vector<vector<char>> &board) {
    if (board.size() == 0) { // 引用不需要判空
        return;
    }
    DFS(board);
}

#pragma mark - 方案一无额外空间
bool Sudoku::DFS(vector<vector<char>> &board) {
    for (int i = 0; i < board.size(); ++i) {
        for (int j = 0; j < board.front().size(); ++j) {
            if (board[i][j] == '.') {
                for (int k = 0; k < 9; ++k) { // 填数7
                    if (valid(static_cast<char>('1' + k), i, j, board)) {
                        board[i][j] = static_cast<char>('1' + k);
                        if (DFS(board)) { // 难以理解的判断，表示每一位都正确填写了
                            return true;
                        } else {
                            board[i][j] = '.';  // reset
                        }
                    }
                }
                return false;   // 数字遍历完了
            }
        }
    }
    return true;    // true or false ?? what's difference ?
}

bool Sudoku::valid(char target, int row, int col, vector<vector<char>> &board) {
    if (target == '.') {
        return false;
    }
    for (int i = 0; i < 9; ++i) {      // 谨记，使用索引充当值
        if (board[row][i] == target) {
            return false;
        }
        if (board[i][col] == target) {  // 注意调换位置
            return false;
        }
        if (board[3 * (row / 3)  + i / 3][3 * (col / 3) + i % 3] == target) { // 这里索引计算比较复杂，我们需要3×3的索引
            // 【误】乘3与除3不能自作聪明抵消！
            return false;
        }
    }
    return true;
}
