//
// Created by 墨子痕 on 2021/7/29.
// Copyright (c) 2021 Hutter. All rights reserved.
//
#import <XCTest/XCTest.h>
#import "PowOfTwo.h"
#import "CountBits.h"
#import "TestUtil.h"

@interface TestBits : XCTestCase
@end

@implementation TestBits {

}

#pragma mark - 231. 2 的幂
- (void)testPowOfTwo {
    int n1 = 1;
    int n2 = 16;
    int n3 = 3;
    int n4 = 4;
    int n5 = -8;
    PowOfTwo *solution = new PowOfTwo();
    bool ret1 = solution->isPowerOfTwo(n1);
    bool ret2 = solution->isPowerOfTwo(n2);
    bool ret3 = solution->isPowerOfTwo(n3);
    bool ret4 = solution->isPowerOfTwo(n4);
    bool ret5 = solution->isPowerOfTwo(n5);
    XCTAssertTrue(ret1);
    XCTAssertTrue(ret2);
    XCTAssertFalse(ret3);
    XCTAssertTrue(ret4);
    XCTAssertFalse(ret5);
}

#pragma mark - 313.比特位计数
- (void)testCountBits {
    CountBits *solution = new CountBits();
    int n1 = 2;
    int n2 = 5;
    vector<int> ans1 {0,1,1};
    vector<int> ans2 {0,1,1,2,1,2};
    vector<int> ret1 = solution->countBits(n1);
    vector<int> ret2 = solution->countBits(n2);
    printVector(ret1);
    printVector(ret2);
//    XCTAssertEqual(ret1, ans1);
//    XCTAssertEqual(ret2, ans2);
}

@end