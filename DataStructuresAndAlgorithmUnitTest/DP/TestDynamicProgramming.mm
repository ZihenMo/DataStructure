//
//  TestDynamicProgramming.m
//  DataStructuresAndAlgorithm
//
//  Created by 墨子痕 on 2021/7/30.
//  Copyright © 2021 Hutter. All rights reserved.
//

#import <XCTest/XCTest.h>
#include "ClimbStair.h"
#import "CrossRiver.h"
#import "Triangle.h"
#import "MaxProduct.h"
#import "LongestIncreasingSequence.h"
#include <iostream>
#include <vector>

using namespace std;

@interface TestDynamicProgramming : XCTestCase

@end

@implementation TestDynamicProgramming
- (void)testFibonacci {
    int n = 8;

    Fibonacci *fb = new Fibonacci();
    ClimbStair *cs = new ClimbStair();
    cout<<"fibonacci"<<endl;
    for (int i = 0; i <= n; ++i) {
        cout<<fb->fibonacci(i)<<" ";
    }
    cout<<endl<<"climb stairs"<<endl;
    for (int i = 0; i <= n; ++i) {
        cout<<cs->climbStairs(i)<<" ";
    }
    cout<<endl;
}

#pragma mark - 青蛙过河

- (void)testCrossRiver {
//    vector<int> stones {0, 1, 3, 5, 6, 8, 12, 17};
    vector<int> stones{0, 1, 3, 5, 6, 8, 12, 17};
    CrossRiver *solution = new CrossRiver();
    bool ret = solution->canCross(stones);
    cout<<ret<<endl;
}

#pragma mark - 三角形最小和路径
- (void)testTriangle {
    cout << "begin" << endl;
    vector<vector<int> > triangle{
            {2},
            {3, 4},
            {6, 5, 7},
            {4, 1, 8, 3}
    };
    Triangle *solution = new Triangle();
    int ret = solution->minimumTotal(triangle);
    cout << ret << endl;
}

#pragma mark - 最大乘积子序列
- (void)testMaxProduct {
    vector<int> nums {2,3,-2,4};

    MaxProduct *solution = new MaxProduct();
    int ret = solution->maxProduct(nums);
    cout << ret << endl;

}

#pragma mark - 最长子序列
- (void)testLIS {
    LongestIncreasingSequence *lis = new LongestIncreasingSequence();
//    vector<int> nums = {10,9,2,5,3,7,101,18};
    vector<int> nums = {15,18,19,16,2,3,101,29};
    int ret = lis->lengthOfLIS(nums);
    XCTAssertEqual(4, ret);
}
@end
