//
// Created by 墨子痕 on 2021/7/14.
// Copyright (c) 2021 Hutter. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ThreeSum.h"

@interface TestSum:XCTestCase

@end

@implementation TestSum
#pragma mark - 15.三数之和
- (void)testThreeSum {
    ThreeSum *threeSum = new ThreeSum();
    vector<int> nums = {-1,0,1,2,-1,-4};
//    vector<int> nums = {0,0,0,0};
    auto result = threeSum->threeSum(nums);
    for (auto v : result) {
        printf("{ ");
        for (auto i : v) {
            printf("%d ", i);
        }
        printf("},");
    }
}

@end
