//
// Created by 墨子痕 on 2021/7/12.
// Copyright (c) 2021 Hutter. All rights reserved.
//
// 方案1：双队列
// 1.push时，将元素放到临时队列，然后将原队列元素pop并push到临时队列；交换队列。
// 2.pop时，直接出队；因为push操作已完成了逆序。
// 3.top同理。
// 4.empty时，只需判断储存队列，因为临时队列一定会被交换。
// 方案2: 单个队列
// 原理同上，只是需要获取size，通过size进行避免无限循环。


#import "DSQueue+Stack.hpp"


@implementation DSQueue (Stack)

- (void)stack_push:(id)obj {

}

- (id)stack_pop {
    return nil;
}

- (id)stack_peek {
    return nil;
}

- (BOOL)stack_empty {
    return NO;
}


@end

#pragma mark - C++

QueueToStack::QueueToStack() {

}

/**
 * @brief 核心，注意一定要交换两个队列指针而不是用赋值！
 * @step 1. 元素入临时队列；
 *       2. 将存储队列的元素全部pop到临时队列（这样栈顶元素就变了）；
 *       3. 交换两个队列！！！
 * @param x 入栈元素
 */
void QueueToStack::push(int x) {
    this->tempQueue.push(x);
    while (!this->storeQueue.empty()) {
        this->tempQueue.push(storeQueue.front());
        this->storeQueue.pop();
    }
    auto mid = this->tempQueue;
    this->tempQueue = this->storeQueue;
    this->storeQueue = mid;
}

int QueueToStack::pop() {
    int top = this->storeQueue.front();
    this->storeQueue.pop();
    return top;
}

int QueueToStack::top() {
    return this->storeQueue.front();
}

bool QueueToStack::empty() {
    return this->storeQueue.empty();
}

//  结论与要点：
//  1.队列实现栈，用栈实现队列本质是一样的，但是做法略有不同，一个是处理push；另一个是处理pop和peek。
//  2.如果只允许一个队列也是可以实现的，push之后想像一下在一个环形队列调整顺序，你需要的是利用获取size的api。
//  如果不提供，也就多了个O(n)的时间去获取而已。该方案可以让你选择在push操作或在pop操作。

