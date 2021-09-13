//
//  TestQueue.m
//  DataStructuresAndAlgorithm
//
//  Created by 墨子痕 on 2021/7/12.
//  Copyright © 2021 Hutter. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DSQueue+Stack.hpp"

@interface TestQueue : XCTestCase

@end

@implementation TestQueue

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

#pragma mark -  队列实现栈功能
- (void)testQueueToStack {
    QueueToStack *stack = new QueueToStack();
    stack->push(2);
    stack->push(1);
    XCTAssertFalse(stack->empty());
    XCTAssertEqual(stack->top(), 1);
    stack->pop();
    XCTAssertEqual(stack->top(), 2);
    stack->pop();
    XCTAssertTrue(stack->empty());
}

@end
