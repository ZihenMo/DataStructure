//
// Created by 墨子痕 on 2021/7/22.
// Copyright (c) 2021 Hutter. All rights reserved.
// 方案一：DFS          T: O(N!)  S: O(N) N行、N列、N个集合元素（递归次数）；4N
// 1.递归层级就是行；
// 2.最重要的规律就是当前（行）Q能放的位置不在已有列、已有左对角、已有右对象中；因为行是遍历次数，无须考虑；
// 3.同时，影响的左对角规律为：x` - y` = x - y,影响的右对角为 x` + y` = x + y;因此对角每次只需记录两个常数即可。
// 4.注意清除状态，同时结果需要保存x和y两个值。
// 方案二：位运算存储状态，判重更快。 T:O(N!) S:O(N) N次递规（N个位置信息），单次为1的空间。 1N。

#import "DSTreeNode+Queen.h"


@implementation DSTreeNode (Queen)
@end

vector<vector<string>> Queen::print(void) {
    vector<vector<string>> ret;
    for (auto v: result) {
        vector<string> vet;
        for (auto pair : v) {
            string s(pair.second, '.');
            s = s + 'Q' + string(n - pair.second - 1, '.'); // first指x，second为y，默认就是n个
            vet.push_back(s);
        }
        ret.push_back(vet);
    }
    return ret;
}

vector<vector<string>> Queen::solveNQueens(int n) {
    this->n = n;
//    DFS(0, {});
    vector<pair<int, int> > queens;
    DFS_bit(0, 0, 0, 0, queens);
    return print();
}

void Queen::DFS(int row, vector<pair<int, int>> state) {
    if (state.size() == n) {
        this->result.push_back(state);
        return;
    }
    for (int i = 0; i < n; ++i) {
        if (columns.find(i) == columns.end() &&
                xy_diff.find(row - i) == xy_diff.end() &&
                xy_sum.find(row + i) == xy_sum.end()) { // 当前列、左对角、右对角都没有放置Q
            columns.insert(i);
            xy_diff.insert(row - i);
            xy_sum.insert(row + i);
            state.push_back({row, i});
            DFS(row + 1, state);
            state.pop_back();
            columns.erase(i);
            xy_diff.erase(row - i);
            xy_sum.erase(row + i);
        }
    }
}

/**
 * @brief 使用位存储状态与判重。
 *  1. 找出列空位；
 *  2. 更新状态，递归下一行；
 *  3. 重置状态；
 * @param row 行
 * @param col 列状态；位为0的表示空位，1表示已不能用；
 * @param xy_dif 左对角状态
 * @param xy_sum 右对角状态
 */
void Queen::DFS_bit(int row, int col, int xy_dif, int xy_sum, vector<pair<int, int> > &queens) {
    if (row >= n) {
        result.push_back(queens);
        return;
    }
    // 1. 找出空位  Mask = (1 << n) - 1;表示一行有n个格子，这里全为1用于得到可放置的格子。
    // 0011 0100  假设|操作之后为0100，n = 4；
    // 1100 0011  ~之后，之所以取后是为了方便判断还有位置没有（原有位置标识为0，取反后为1），因此需要掩码
    // 0000 1111  &上掩码，只保存后N位
    int bits = ~(col | xy_dif | xy_sum) & ((1 << n) - 1);
    while (bits > 0) {
        int curBit = bits & -bits;        // 得到末位为1的数；即本次放置皇后的位置
        int y = __builtin_ctz(curBit);      // 返回后面0的个数，得到列位置
        queens.push_back({row, y});
        // 2. 更新状态并递归
        DFS_bit(row + 1, col | curBit, (xy_dif | curBit) << 1, (xy_sum | curBit) >> 1, queens);
        // 3. 已放置位置清0
        queens.pop_back();
        bits = bits & (bits - 1);    // 末位1清0
    }
}
