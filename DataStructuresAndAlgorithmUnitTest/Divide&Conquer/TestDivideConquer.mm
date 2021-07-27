//
// Created by 墨子痕 on 2021/7/20.
// Copyright (c) 2021 Hutter. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <XCTest/XCTest.h>
#import <vector>
#import "MajorityElement.h"
#import "Pow.h"

using namespace std;

@interface TestDivideConquer : XCTestCase
@end

@implementation TestDivideConquer
#pragma mark - 求Pow

- (void)testPow {
    double x = 2.1;
    int n = 3;
    double result = Pow().pow(x, n);

    XCTAssertTrue(result - 9.261 < 1.0e-4); // 浮点数精度问题
}

#pragma mark - Majority Element

- (void)testMajorityElement {
    vector<int> nums = {2,2,3,3,3,3,2};
    int answer = 3;
    XCTAssertEqual(answer, MajorityElement().majorityElement(nums));
}
@end