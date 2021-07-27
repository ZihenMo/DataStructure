//
// Created by 墨子痕 on 2021/7/27.
// Copyright (c) 2021 Hutter. All rights reserved.
//

#include "Trie.h"

static const char Trie_Node_START = '*';
static const char Trie_Node_END = '#';


Trie::Trie() {
    root = new TrieNode();
}

void Trie::insert(string word) {
    TrieNode *p = root;
    for (char c : word) {
        size_t idx = c - 'a';
        if (p->children[idx] == nullptr) {
            p ->children[idx] = new TrieNode(); // 使用索引充当值
        }
        p = p->children[idx];
    }
    p->isEndPoint = true;   // 标记叶子节点
}

bool Trie::search(string word) {
    if (word.size() == 0) { return false; }
    TrieNode *p = root;
    for (char c : word) {
        c -= 'a';   // 转化索引
        if (p->children[c] == nullptr) {
            return false;
        }
        p = p->children[c];
    }
    return p->isEndPoint;
}

bool Trie::startsWith(string prefix) {
    if (prefix.size() == 0) { return false; }
    TrieNode *p = root;
    for (char c : prefix) {
        c -= 'a';
        if (p->children[c] == nullptr) {
            return false;
        }
        p = p->children[c];
    }
    return true;
}
