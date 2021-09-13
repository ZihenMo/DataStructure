//
// Created by 墨子痕 on 2021/7/31.
// Copyright (c) 2021 Hutter. All rights reserved.
// 146. LRU 缓存机制 https://leetcode-cn.com/problems/lru-cache/

#ifndef DATASTRUCTURESANDALGORITHM_LRUCACHE_H
#define DATASTRUCTURESANDALGORITHM_LRUCACHE_H

#include <unordered_map>
#include <list>

using namespace std;

/**
 * @brief 双向链表+哈希表实现
 * 1. 双向链表方便查找最久的值，以及插入最新的值到头部；
 * 2. 哈希表表存储 Key与索引或节点（自己实现双向链表），方便快速查询是否在Cache中，以及找到对应的值，并更新到头部。
 */
class LRUCache {
    int capacity;
    list<int> keyList;
    unordered_map<int, pair<int, list<int>::iterator> > hashMap;

    void insert(int key, int value) {
        keyList.push_back(key);
        hashMap[key] = make_pair(value, --keyList.end());
    }

public:
    /*
    LRUCache(int capacity) : capacity(capacity) {

    }

    int get(int key) {
        auto it = hashMap.find(key);
        if (it == hashMap.end()) {
            return -1;
        }
        // 更新链表中的位置，使用现成结构需先删除元素再添加
        keyList.erase(it->second.second);
        insert(key, it->first);
        return it->first;
    }

    void put(int key, int value) {
        if (get(key) != -1) {   // 修改旧元素也要更新，利用现成的get方法更新即可
            hashMap[key].first = value;
            return;
        }
        if (hashMap.size() < capacity) {
            insert(key, value);
        } else {
            int oldKey = keyList.front();
            keyList.pop_front();        // push_back则pop_front
            hashMap.erase(oldKey);      // delete old element
            insert(key, value);         // insert the new
        }
    }*/
    LRUCache(int capacity) :capacity(capacity) {
    }
    int get(int key) {
        auto it = hashMap.find(key);
        if (it == hashMap.end()) {
            return -1;
        }
        // update order(time) 1.delete old; 2.insert new;
        keyList.erase(it->second.second);
        insert(key, it->first);
        return it->first;
    }
    void put(int key, int val) {
        if (get(key) != -1) { // update
            hashMap[key].first = val;
            return;
        }
        if (capacity >= keyList.size()) {      // delete old element
            int oldKey = keyList.front();
            keyList.pop_front();
            hashMap.erase(oldKey);
        }
        insert(key, val);
    }
};


#endif //DATASTRUCTURESANDALGORITHM_LRUCACHE_H
