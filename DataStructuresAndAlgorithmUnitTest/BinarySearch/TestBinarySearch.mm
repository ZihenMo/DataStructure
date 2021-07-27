//
// Created by 墨子痕 on 2021/7/27.
// Copyright (c) 2021 Hutter. All rights reserved.
//
#import <XCTest/XCTest.h>
#import "Sqrt.h"

@interface TestBinarySearch : XCTestCase

@end

@implementation TestBinarySearch


- (void)testSqrt {
    Sqrt *solution = new Sqrt();
    int x = 8;
    int ans = 2;
    int ret = solution->mySqrt(x);
    XCTAssertEqual(ans, ret);
}
@end