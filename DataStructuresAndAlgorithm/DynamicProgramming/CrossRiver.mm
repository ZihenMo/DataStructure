
// Created by 墨子痕 on 2021/7/30.
// Copyright (c) 2021 Hutter. All rights reserved.
//


#include "CrossRiver.h"

/**
 * 1. 状态定义 i:石子编号；j：上一次跳的距离；
 * 2.
 */
bool CrossRiver::canCross(vector<int> &stones) {
//    if (stones.size() <= 1) {
//        return true;
//    }
//    state.resize(stones.size());
//    return dfs(0, 0, stones);
    return dp(stones);
}



bool CrossRiver::dfs(int i, int lastDistance, vector<int> &stones) {
    if (i == stones.size() - 1) {
        return true;
    }
    if (state[i].find(lastDistance) != state[i].end()) {     // 该位置以同样的距离跳过了
        return state[i][lastDistance];
    }
    for (int curDis = lastDistance - 1; curDis <= lastDistance + 1; ++curDis) { // 三种距离
        if (curDis > 0)  {
            auto next = find(stones.begin(), stones.end(), stones[i] + curDis);
            if (next != stones.end() && dfs(next - stones.begin(), curDis, stones)) {
                state[i][curDis] = true;
                return true;
            }
        }
    }
    state[i][lastDistance] = false;
    return false;
}
/** DP
 * 1. dp[i][k] = true or false: 编号为i的石子，k: 上一次跳的距离 能否达到；
 * 2. 设j为上次的编号，即(stone[i] - stone[j]  == k)
 *    dp[i][k] = dp[j][k-1] || d[j][k] || dp[j][k+1]  三种距离任一能达到即可
 */
bool CrossRiver::dp(vector<int> &stones) {
    if (stones.size() <= 1) {
        return true;
    }
    int n = stones.size();
    vector<vector<int> > dp(n, vector<int>(n)); // n个石头，k <= n
    dp[0][0] = true;
    for (int i = 1; i < n; ++i) {
        for (int j = i - 1; j >= 0; --j) {  // j肯定是小于i的；且
            int k = stones[i] = stones[j];
            if (k > j + 1) {        // 不能少，k的索引溢出，k <= j < n;
                break;
            }
            dp[i][k] = dp[j][k - 1] || dp[j][k] || dp[j][k + 1];
            if (i == n - 1 && dp[i][k]) {       // 最后一次落在n-1
                return true;
            }
        }
    }
    return false;
}

