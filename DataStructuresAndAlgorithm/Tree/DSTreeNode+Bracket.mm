//
// Created by 墨子痕 on 2021/7/22.
// Copyright (c) 2021 Hutter. All rights reserved.
// 1. 暴力法；尝试所有选择，再进行验证是否合法的括号；T：O(2^n)
// 2. 回朔法，只对合法的括号进行匹配；同时清除法上一步状态尝试找出所有解。


#import "DSTreeNode+Bracket.h"
#import <vector>
#import <string>

using namespace std;

@implementation DSTreeNode (Bracket)
@end

void Bracket::dfs(string pattern, int left, int right) {
    if (left == 0 && right == 0) {    // 括号已用完,说明有解
        this->result.push_back(pattern);
        return;
    }
    if (left > 0) {
#if 0
        pattern.push_back('(');
        dfs(pattern,left - 1, right);       // 可以传入当前下标，从而省略pop操作
        pattern.pop_back();
#endif
        dfs(pattern + '(', left - 1, right); // 这样string不能使用引用类型
    }
    if (right > left && right > 0) { // right > 0是肯定的，可以省略
#if 0
        pattern.push_back(')');
        dfs(pattern, left, right - 1);
        pattern.pop_back();     // 清除状态！
#endif
        dfs(pattern + ')', left, right - 1);
    }
}

vector<string> Bracket::generateParenthesis(int n) {
    string pattern = "";
    dfs(pattern, n, n);
    return this->result;
//    bruteForce(pattern, 2 * n);
//    return this->result;
}

#pragma mark - 暴力法
/**
 * @brief 暴力法括号生成，每次生成(或)
 * @param n 字符数 2 * n
 */
void Bracket::bruteForce(string &string, int n) {
    if (n == 0) {
        if (isValid(string)) {
            this->result.push_back(string);
        }
        return;
    }
    string.push_back('(');
    bruteForce(string, n - 1);
    string.pop_back();

    string.push_back(')');
    bruteForce(string, n - 1);
    string.pop_back();
}

bool Bracket::isValid(string &bracket) {
    int left = 0;
    int right = 0;
    for (int i = 0; i < bracket.size(); ++i) {
        if (bracket[i] == '(') {
            left++;
        }
        else {
            right++;
        }
        if (right > left) {
            return false;
        }
    }
    return left == right;
}

