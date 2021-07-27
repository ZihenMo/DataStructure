//
// Created by 墨子痕 on 2021/7/27.
// Copyright (c) 2021 Hutter. All rights reserved.
//
//  208. 实现 Trie (前缀树) https://leetcode-cn.com/problems/implement-trie-prefix-tree/
//  Trie（发音类似 "try"）或者说 前缀树 是一种树形数据结构，用于高效地存储和检索字符串数据集中的键。这一数据结构有相当多的应用情景，例如自动补完和拼写检查。
//
//  请你实现 Trie 类：
//
//  Trie() 初始化前缀树对象。
//  void insert(String word) 向前缀树中插入字符串 word 。
//  boolean search(String word) 如果字符串 word 在前缀树中，返回 true（即，在检索之前已经插入）；否则，返回 false 。
//  boolean startsWith(String prefix) 如果之前已经插入的字符串 word 的前缀之一为 prefix ，返回 true ；否则，返回 false 。
//
//  示例：
//  输入
//  ["Trie", "insert", "search", "search", "startsWith", "insert", "search"]
//  [[], ["apple"], ["apple"], ["app"], ["app"], ["app"], ["app"]]
//  输出
//  [null, null, true, false, true, null, true]
//
//  解释
//          Trie trie = new Trie();
//  trie.insert("apple");
//  trie.search("apple");   // 返回 True
//  trie.search("app");     // 返回 False
//  trie.startsWith("app"); // 返回 True
//  trie.insert("app");
//  ∂trie.search("app");     // 返回 True

#ifndef DATASTRUCTURESANDALGORITHM_TRIE_H
#define DATASTRUCTURESANDALGORITHM_TRIE_H

#import <string>
#import <vector>
using namespace std;

const int TRIE_MAX_SIZE =  26; // 仅26个字母

class TrieNode {
public:
    bool isEndPoint;
    TrieNode *children[TRIE_MAX_SIZE];
    TrieNode()  {
        isEndPoint = false;
        memset(children, 0, sizeof(children));  // ……实始化内存！！
    }
};

class Trie {
    TrieNode *root;
public:
    /** Initialize your data structure here. */
    Trie();

    /** Inserts a word into the trie. */
    void insert(string word);

    /** Returns if the word is in the trie. */
    bool search(string word);

    /** Returns if there is any word in the trie that starts with the given prefix. */
    bool startsWith(string prefix);
};


#endif //DATASTRUCTURESANDALGORITHM_TRIE_H
