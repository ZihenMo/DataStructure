//
// Created by 墨子痕 on 2021/7/14.
// Copyright (c) 2021 Hutter. All rights reserved.
//
// 方案一：字母排序对比
// 方案二：【Hash计数】对比
//      1.利用Map
//      2.自建Hash表【优】
// 小结：
// 1.核心在于读懂题意，表示两个单词出现的字母次数一致，顺序任意。这样变成统计字母出现次数并求解一致性。
// 2.hash原理与计数功能。
// 3.代码简洁性。
// 4.编码问题，Unicode编码可能对应多个字节（依赖于语言处理）。


#import "NSString+Anagram.h"
#import <string>
#import <map>

using namespace std;

@implementation NSString (Anagram)
@end

#pragma mark - C++
/**
 * @brief Map计数法 代码简洁
 * @param s 字符串1
 * @param t 字符串2
 * @return 是否异位词
 */
bool isAnagram_1(string s, string t) {
    if (s.length() != t.length()) {
        return false;
    }
    map<char, int> counter1, counter2;
    for (char c : s) {
        counter1[c] += 1;
    }
    for (char c : t) {
        counter1[c] -= 1;
    }
    for (pair<char, int> n : counter1) {
        if (n.second != 0) {
            return false;
        }
    }
    return true;
#if 0
    for (char c : t) {
        counter2[c] += 1;
    }
    return counter1 == counter2;
#endif
}
/**
 * @brief 自建哈希法，在这种确定的较小范围计数更加高效
 */
bool isAnagram_2(string s, string t) {
    if (s.length() != t.length()) {
        return false;
    }

    int arr[26] {0};
    for (char c : s) {
        arr[c - 'a'] += 1;
    }
    for (char c : t) {
        arr[c - 'a'] -= 1;
    }
    for (int n : arr) {
        if (n != 0) {
            return false;
        }
    }
    return true;
}
/**
 * @brief 同2，进一步优化代码【最佳】
 * 优化思路，1.可将+1和-1放一起循环；
 *         2.可将-1和校验放一起循环,检验计数是否大于0.这样前面的长度判断就必不可少。
 */
bool isAnagram_3(string s, string t) {
    if (s.length() != t.length()) {
        return false;
    }

    int arr[26] {0};
    for (char c : s) {
        arr[c - 'a'] += 1;
    }
    for (char c : t) {
        arr[c - 'a'] -= 1;
        if (arr[c - 'a'] < 0) { // 注意条件变更，且依赖长度相同
            return false;
        }
    }
    return true;
}
bool ValidAnagram::isAnagram(std::string s, std::string t) {
    return isAnagram_1(s, t);
}
