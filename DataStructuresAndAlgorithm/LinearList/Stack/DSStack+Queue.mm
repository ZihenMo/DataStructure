//
// Created by 墨子痕 on 2021/7/12.
// Copyright (c) 2021 Hutter. All rights reserved.
//
// 方案：双栈法，输入输出栈。
// 1.push时，in.push；
// 2.pop时, out空时,将in全pop->out.push，out.pop；
// 3.top时，同pop；
// 4.empty，检查in和out。

#import "DSStack+Queue.hpp"


@implementation DSStack (Queue)

- (void)queue_push:(id)obj {
    [self push:obj];
}


- (id)queue_pop {
    return nil;
}

- (id)peek {
    return nil;
}

@end

#pragma mark - C++

StackToQueue::StackToQueue() {

}

void StackToQueue::push(int x) {
    this->inputStack.push(x);
}

int StackToQueue::pop() {
    if (this->outputStack.empty()) {
        while (!this->inputStack.empty()) {
            this->outputStack.push(this->inputStack.top());
            this->inputStack.pop();
        }
    }
    assert(!(this->outputStack.empty()));   // 题目已假定pop时一定有值

    int top = this->outputStack.top();
    this->outputStack.pop();
    return top;
}

int StackToQueue::peek() {
    if (this->outputStack.empty()) {
        while (!this->inputStack.empty()) {
            this->outputStack.push(this->inputStack.top());
            this->inputStack.pop();
        }
    }
    assert(!(this->outputStack.empty()));

    return this->outputStack.top();
}

bool StackToQueue::empty() {
    return this->inputStack.empty() && this->outputStack.empty() ;
}
