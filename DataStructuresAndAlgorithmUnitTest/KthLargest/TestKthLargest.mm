//
//  TestKthLargest.m
//  DataStructuresAndAlgorithm
//
//  Created by 墨子痕 on 2021/7/13.
//  Copyright © 2021 Hutter. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "KthLargest.h"
#import <vector>

@interface TestKthLargest : XCTestCase

@end

@implementation TestKthLargest

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

#pragma mark - 703.数据流中的第 K 大元素
- (void)testKthLargest {
    int arr[] = {3,5,10,9,4};
    int k = 3;
    std::vector<int> vector = {4,5,8,2};
    KthLargest *kth = new KthLargest(k, vector);
    for (int v : vector) {
        NSLog(@"%d", v);
    }
    int result = 0;
    for (int v : arr) {
        result = kth->add(v);
        NSLog(@"add: %d, kth: %d", v, result);
    }
    XCTAssertEqual(result, -1);
}

@end
