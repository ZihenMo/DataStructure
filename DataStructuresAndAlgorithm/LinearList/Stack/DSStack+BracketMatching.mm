//
// Created by 墨子痕 on 2021/7/12.
// Copyright (c) 2021 Hutter. All rights reserved.
//

#import "DSStack+BracketMatching.hpp"
#import <stack>
#import <unordered_map>
#import <map>

using namespace std;

@implementation DSStack (BracketMatching)
- (BOOL)validateBracket:(NSString *)s {
    NSDictionary *table = @{
            @"}":@"{",
            @"]":@"[",
            @")":@"("
    };
    for (NSString *substring in s) {
        if (table[substring]) { // exist in table mean right bracket
            if (self.empty || table[substring] != self.peek) { // unpair right to left
                return NO;
            }
            else {
                [self pop];
            };
        }
        else {
            [self push:substring];
        }
    }
    return self.empty;
}

@end

#pragma mark - C++

/**
 * @brief 栈方案
 * @step 1.建立映射（方便匹配）；
 *       2.左括号压栈；
 *       3.右括号匹配栈顶。
 * @param s 括号字符串
 * @return  有效性
 */
bool BracketMatching::isValid(std::string s) {
    if (s.length() % 2 != 0) {
        return false;
    }
    // 1. 建立映射表
    unordered_map<char, char>table{
        {'}', '{'},
        {']', '['},
        {')', '('}
    };
    stack<char> stack;
    // 2. 压栈与匹配
    for (char c : s) {
        if (table.count(c)) { // right
            if (stack.empty() || stack.top() != table[c]) { // unmatching
                return false;
            }
            else {
                stack.pop();
            }
        }
        else {
            stack.push(c);
        }
    }
    return stack.empty();
}


/**
 结果：
  1. 语法问题，需要了解太多复杂的数据结构api，浪费时间。
  2. 如果空栈，top是会挂的。
  3. string迭代器值为char，substring参数为起点和长度。
  4. map的列表初始化样式，不用":“或”=“，使用"{}"包括键值对。
 */
bool practise1(std::string s) {
    std::map<string,string> table {{")", "("}, {"}", "{"}, {"]", "["}};
    std::stack<string> stack;
    for (int i = 0; i < s.length(); ++i) {
        auto substr = s.substr(i, 1);
        string v = table[substr];
        if (v.length() > 0 && !stack.empty()) {
            if (stack.top() == v) {
                stack.pop();
            }
            else {
                return false;
            }
        }
        else {
            stack.push(substr);
        }
    }
    return stack.empty();
}


