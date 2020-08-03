//
//  TestFinonacci.m
//  TestFinonacci
//
//  Created by 墨子痕 on 2020/8/4.
//  Copyright © 2020 Hutter. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Fibonacci.h"

@interface TestFinonacci : XCTestCase

@end

@implementation TestFinonacci

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testWhichFibonacci {
    // 1 1 2 3 5 8
    NSInteger expectResult = 8;
    NSInteger testResult = [Fibonacci which:6];
    XCTAssertEqual(expectResult, testResult);
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
