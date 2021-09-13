//
// Created by 墨子痕 on 2021/7/28.
// Copyright (c) 2021 Hutter. All rights reserved.
// https://leetcode-cn.com/problems/word-search-ii/

//212. 单词搜索 II
//给定一个 m x n 二维字符网格 board 和一个单词（字符串）列表 words，找出所有同时在二维网格和字典中出现的单词。
//
//单词必须按照字母顺序，通过 相邻的单元格 内的字母构成，其中“相邻”单元格是那些水平相邻或垂直相邻的单元格。
// 同一个单元格内的字母在一个单词中不允许被重复使用。
//
//示例 1：
//
//输入：board = [["o","a","a","n"],["e","t","a","e"],["i","h","k","r"],["i","f","l","v"]], words = ["oath","pea","eat","rain"]
//输出：["eat","oath"]

#ifndef DATASTRUCTURESANDALGORITHM_CROSSWORD_H
#define DATASTRUCTURESANDALGORITHM_CROSSWORD_H

#import <vector>
#import <string>
#import "Trie.h"

using namespace std;

class CrossWord {
private:
    vector<string> result;
public:
    vector <string> findWords(vector <vector<char>> &board, vector <string> &words);
    /**
     * @brief 遍历字母表是否存在单词
     * @param row 行
     * @param col 列
     * @param pNode 父节点
     * @param curStr 当前路径组成的词
     * @param board 字母表
     */
    void DFS(int row, int col, TrieNode *pNode, string curStr, vector<vector<char>> &board);
};


#endif //DATASTRUCTURESANDALGORITHM_CROSSWORD_H
