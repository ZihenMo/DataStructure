//
// Created by 墨子痕 on 2021/7/13.
// Copyright (c) 2021 Hutter. All rights reserved.
//
// 方法一：辅助栈(常见）；
// 1.push时使用辅助栈存储最小值，如果小于当前top，存入新值，否则拷贝top。
// 2.getMin使用辅助栈的top。
// 3.其他操作均用容器栈。
//
// 方法二：元组或数组包装元素。
// 1. 将最小值关联存储为键值对。
// 2. push\pop相当于同步更新最小值。

#import "DSStack+Min.h"

using namespace std;

@implementation DSStack (Min)
@end


#pragma mark - C++

MinStack::MinStack() {

}

void MinStack::push(int val) {
    this->containerStack.push(val);
    if (this->auxiliaryStack.empty() ||
            (!this->auxiliaryStack.empty() && this->auxiliaryStack.top() > val)) {
        this->auxiliaryStack.push(val);
    } else {
        this->auxiliaryStack.push(this->auxiliaryStack.top());
    }
}

void MinStack::pop(void) {
    this->containerStack.pop();
    this->auxiliaryStack.pop();
}

int MinStack::top(void) {
    return this->containerStack.top();
}

int MinStack::getMin(void) {
    return this->auxiliaryStack.top();
}


#pragma mark - 元组解

void MinStack_2::push(int val) {
    int minVal = val;
    if (!this->stack.empty()) {
        minVal = min(this->stack.top().second, minVal); // 注意这里是second
    }
    this->stack.push({val, minVal});
}

void MinStack_2::pop() {
    this->stack.pop();
}
int MinStack_2::top() {
    return this->stack.top().first;
}

int MinStack_2::getMin() {
    return this->stack.top().second;
}