//
// Created by 墨子痕 on 2021/7/22.
// Copyright (c) 2021 Hutter. All rights reserved.
//
// 22. 括号生成  https://leetcode-cn.com/problems/generate-parentheses/
// 数字 n 代表生成括号的对数，请你设计一个函数，用于能够生成所有可能的并且 有效的 括号组合。
//
// 示例 1：
// 输入：n = 3
// 输出：["((()))","(()())","(())()","()(())","()()()"]
// 示例 2：
// 输入：n = 1
// 输出：["()"]

#import <Foundation/Foundation.h>
#import <DSTreeNode.h>

@interface DSTreeNode (Bracket)

@end

class Bracket {
    vector<string> result;
public:
    vector<string> generateParenthesis(int n);

#pragma mark - 回溯法
    void dfs(string pattern, int left, int right);

#pragma mark - 暴力法
    bool isValid(string &bracket);

    void bruteForce(string &string);

    void bruteForce(string &string, int n);
};
