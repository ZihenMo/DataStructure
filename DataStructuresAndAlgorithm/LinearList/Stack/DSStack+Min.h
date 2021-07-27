//
// Created by 墨子痕 on 2021/7/13.
// Copyright (c) 2021 Hutter. All rights reserved.
//
// 155. 最小栈
//   https://leetcode-cn.com/problems/min-stack/
//   设计一个支持 push ，pop ，top 操作，并能在常数时间内检索到最小元素的栈。
//
// push(x) —— 将元素 x 推入栈中。
// pop() —— 删除栈顶的元素。
// top() —— 获取栈顶元素。
// getMin() —— 检索栈中的最小元素。
//
// 示例:
//
// 输入：
// ["MinStack","push","push","push","getMin","pop","top","getMin"]
// [[],[-2],[0],[-3],[],[],[],[]]
//
// 输出：
// [null,null,null,null,-3,null,0,-2]
//
// 解释：
// MinStack minStack = new MinStack();
// minStack.push(-2);
// minStack.push(0);
// minStack.push(-3);
// minStack.getMin();   --> 返回 -3.
// minStack.pop();
// minStack.top();      --> 返回 0.
// minStack.getMin();   --> 返回 -2.
//
// 提示: pop、top 和 getMin 操作总是在 非空栈 上调用。
// 题意解毒：
// 1.维持栈功能；
// 2.支持O(1)检索最小值。

#import <Foundation/Foundation.h>
#import <DSStack.h>
#import <stack>

@interface DSStack (Min)

@end

class MinStack {
private:
    // -- solution1
    std::stack<int> containerStack;
    std::stack<int> auxiliaryStack; // 辅助栈
public:
    MinStack();

    virtual void push(int val);

    virtual void pop(void);

    virtual int top(void);

    virtual int getMin(void);
};

class MinStack_2 : public MinStack {
private:
    std::stack<std::pair<int, int>> stack;
public:
    void push(int val);

    void pop(void);

    int top(void);

    int getMin(void);

};