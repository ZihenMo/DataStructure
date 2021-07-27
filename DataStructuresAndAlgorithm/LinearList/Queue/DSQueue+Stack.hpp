//
// Created by 墨子痕 on 2021/7/12.
// Copyright (c) 2021 Hutter. All rights reserved.
//
//  225. 用队列实现栈 同232 用栈实现队列
//    https://leetcode-cn.com/problems/implement-stack-using-queues/
//  请你仅使用两个队列实现一个后入先出（LIFO）的栈，并支持普通栈的全部四种操作（push、top、pop 和 empty）。
//
//  实现 QueueToStack 类：
//
//  void push(int x) 将元素 x 压入栈顶。
//  int pop() 移除并返回栈顶元素。
//  int top() 返回栈顶元素。
//  boolean empty() 如果栈是空的，返回 true ；否则，返回 false 。
//
//  注意：
//
//  你只能使用队列的基本操作 —— 也就是 push to back、peek/pop from front、size 和 is empty 这些操作。
//  你所使用的语言也许不支持队列。 你可以使用 list （列表）或者 deque（双端队列）来模拟一个队列 , 只要是标准的队列操作即可。

#import <Foundation/Foundation.h>
#import <DSQueue.h>
#import <queue>

@interface DSQueue (Stack)

- (void)stack_push:(id)obj;

- (id)stack_pop;
- (id)stack_peek;
- (BOOL)stack_empty;

@end

class QueueToStack {
private:
    std::queue<int> tempQueue;
    std::queue<int> storeQueue;
public:
    /** Initialize your data structure here. */
    QueueToStack();

    /** Push element x onto stack. */
    void push(int x);

    /** Removes the element on top of the stack and returns that element. */
    int pop();

    /** Get the top element. */
    int top();

    /** Returns whether the stack is empty. */
    bool empty();
};