//
//  TestString.m
//  DataStructureUnitTest
//
//  Created by gshopper on 2020/12/11.
//  Copyright © 2020 Hutter. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSString+Reverse.h"

@interface TestString : XCTestCase

@end

@implementation TestString

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    NSString *str = @"Hello World!";
    str = [str reverse];
    NSLog(@"reverse: %@", str);
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
