//
//  TestStack.m
//  DataStructuresAndAlgorithmUnitTest
//
//  Created by 墨子痕 on 2021/7/12.
//  Copyright © 2021 Hutter. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DSStack+BracketMatching.hpp"
#import "DSStack+Queue.hpp"
#import "DSStack+Min.h"

@interface TestStack : XCTestCase

@end

@implementation TestStack

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}
#pragma mark - 括号有效性
- (void)testBracket {
    BracketMatching *solution = new BracketMatching();
    std::string s = "((([[]])))";
    XCTAssertTrue(solution->isValid("()[]"));
    XCTAssertFalse(solution->isValid("]"));
}

#pragma mark - 栈实现队列功能
- (void)testStackToQueue {
    StackToQueue *queue = new StackToQueue();
    queue->push(1);
    queue->push(2);
    XCTAssertFalse(queue->empty());
    XCTAssertEqual(queue->peek(), 1);
    queue->pop();
    XCTAssertEqual(queue->peek(), 2);
    queue->pop();
    XCTAssertTrue(queue->empty());
}

#pragma mark - 最小栈
- (void)testMinStack {
//    MinStack *solution = new MinStack_2();
//    solution->push(-2);
//    solution->push(0);
//    solution->push(-3);
//    XCTAssertEqual(solution->getMin(), -3);
//    solution->pop();
//    XCTAssertEqual(solution->top(), 0);
//    XCTAssertEqual(solution->getMin(), -2);


    MinStack *solution = new MinStack();
    solution->push(-2);
    solution->push(0);
    solution->push(-1);
    XCTAssertEqual(solution->getMin(), -2);
    XCTAssertEqual(solution->top(), -1);
    solution->pop();
    XCTAssertEqual(solution->getMin(), -2);

}
@end
