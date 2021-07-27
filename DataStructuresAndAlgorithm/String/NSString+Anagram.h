//
// Created by 墨子痕 on 2021/7/14.
// Copyright (c) 2021 Hutter. All rights reserved.
//
// 242. 有效的字母异位词 (回文词、异位词）
// https://leetcode-cn.com/problems/valid-anagram/
// 给定两个字符串 s 和 t ，编写一个函数来判断 t 是否是 s 的字母异位词。
//
// 示例 1:
// 输入: s = "anagram", t = "nagaram"
// 输出: true
//
// 示例 2:
// 输入: s = "rat", t = "car"
// 输出: false
#import <Foundation/Foundation.h>
#import <string>
@interface NSString (Anagram)
@end


class ValidAnagram {
public:
    bool isAnagram(std::string s, std::string t);
};
