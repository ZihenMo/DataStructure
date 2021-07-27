//
// Created by 墨子痕 on 2021/7/12.
// Copyright (c) 2021 Hutter. All rights reserved.
//
// 20. 有效的括号
//
// 给定一个只包括 '('，')'，'{'，'}'，'['，']' 的字符串 s ，判断字符串是否有效。
//
// 有效字符串需满足：
// 左括号必须用相同类型的右括号闭合。
// 左括号必须以正确的顺序闭合。
// 链接：https://leetcode-cn.com/problems/valid-parentheses
// 示例 1：
//
// 输入：s = "()"
// 输出：true
// 示例2：
//
// 输入：s = "()[]{}"
// 输出：true
// 示例3：
//
// 输入：s = "(]"
// 输出：false
// 示例4：
//
// 输入：s = "([)]"
// 输出：false

#import <Foundation/Foundation.h>
#import <string>
#import <DSStack.h>



@interface DSStack (BracketMatching)

- (BOOL)validateBracket:(NSString *)s;

@end


class BracketMatching {
    
public:
    /**
     * @brief 20.有效的括号
     * @link hClass//leetcode-cn.co;m/problems/valid-parentheses
     * @param s 括号字符串
     * @return 有效性
     */
    bool isValid(std::string s);
};
