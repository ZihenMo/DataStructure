//
// Created by 墨子痕 on 2021/7/22.
// Copyright (c) 2021 Hutter. All rights reserved.
// DFS
// 1.递归层级就是行；
// 2.最重要的规律就是当前（行）Q能放的位置不在已有列、已有左对角、已有右对象中；因为行是遍历次数，无须考虑；
// 3.同时，影响的左对角规律为：x` - y` = x - y,影响的右对角为 x` + y` = x + y;因此对角每次只需记录两个常数即可。
// 4.注意清除状态，同时结果需要保存x和y两个值。

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
    DFS(0, 0, {});
    return print();
}

void Queen::DFS(int row, int column, vector<pair<int, int>> state) {
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
            DFS(row + 1, i, state);
            state.pop_back();
            columns.erase(i);
            xy_diff.erase(row - i);
            xy_sum.erase(row + i);
        }
    }
}
