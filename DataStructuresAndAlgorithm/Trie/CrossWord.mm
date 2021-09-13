//
// Created by 墨子痕 on 2021/7/28.
// Copyright (c) 2021 Hutter. All rights reserved.
// 方案，Trie+回溯（DFS）
// 1. 使用输入的单词构造Trie；
// 2. 遍历表格Board，移动四个方向在Trie查找前缀看能否组成单词；
// 3. 重置已访问字母。

#include "CrossWord.h"
#import "Trie.h"


vector<string> CrossWord::findWords(vector<vector<char>> &board, vector<string> &words) {
    if (board.size() == 0 || words.size() == 0) { return vector<string>(); }
    // 1. 构造Trie
    TrieNode *root = new TrieNode();
    for (string s: words) {
        TrieNode *p = root;
        for (char c : s) {
            size_t idx = c - 'a';
            if (p->children[idx] == nullptr) {
                p->children[idx] = new TrieNode();
            }
            p = p->children[idx];
        }
        p->isEndPoint = true;
    }
    // 2. 遍历字母表
    for (int i = 0; i < board.size(); ++i) {
        for (int j = 0; j < board.front().size(); ++j) {
            if (root->children[board[i][j] - 'a'] != nullptr) {
                this->DFS(i, j, root, "", board);
            }
        }
    }
    return result;
}

void CrossWord::DFS(int row, int col, TrieNode *pNode, string curStr, vector<vector<char>> &board) {
    char ch = board[row][col];
    TrieNode *node = pNode->children[ch - 'a'];
    curStr += ch;
    if (node->isEndPoint) {
        node->isEndPoint = false;   // 【误】避免重复
        this->result.push_back(curStr);
    }
    // 3.标记访问
    board[row][col] = '#';
    int rowOffset[4] {-1, 0, 1, 0}; // 上左下右, 行的移动
    int colOffset[4] {0, -1, 0, 1};
    for (int i = 0; i < 4; ++i) {
        int newRow = row + rowOffset[i];
        int newCol = col + colOffset[i];
        if (newRow >= 0 && newCol >= 0 && newRow < board.size() && newCol < board.front().size()
                && board[newRow][newCol] != '#' &&          // 必要条件！
                node->children[board[newRow][newCol] - 'a'] != nullptr) {
            DFS(newRow, newCol, node, curStr, board);
        }
    }
    // 4. 重置标记
    board[row][col] = ch;
    // 5.剪枝 剪掉已访问的叶子【误】是剪掉底下没有单词的叶子节点
//    if (node->isEndPoint) {
//        pNode->children[ch - 'a'] = nullptr;
//    }
}
