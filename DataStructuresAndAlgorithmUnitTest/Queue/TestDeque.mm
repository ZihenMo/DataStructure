//
// Created by 墨子痕 on 2021/7/13.
// Copyright (c) 2021 Hutter. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "SlideWindow.h"
#import <vector>

using namespace std;

@interface TestDeque: XCTestCase
@end

@implementation TestDeque

/**
 * @brief 239. 滑动窗口最大值
 */
- (void)testSlideWindow {
    SlideWindow *solution = new SlideWindow();
//    vector<int> nums = {1,3,-1,-3,5,3,6,7};
//    int k = 3;
//    vector<int> answer = {3,3,5,5,6,7};

    vector<int> nums = {1,3,1,2,0,5};
    int k = 3;
    vector<int> answer = {3,3,2,5};
    auto result = solution->maxSlidingWindow(nums, k);
    for (auto i : result) {
        NSLog(@"%d", i);
    }
    XCTAssertTrue(equal(answer.begin(), answer.end(), result.begin()));
}

@end