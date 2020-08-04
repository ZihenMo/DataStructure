//
//  TestNSString.m
//  AlgorithmUnitTest
//
//  Created by gshopper on 2020/8/3.
//  Copyright © 2020 gshopper. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSString+KMP.h"

@interface PatternMatchingTestCase : XCTestCase

@end

@implementation PatternMatchingTestCase

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

/*
 * 测试暴力匹配
 */
- (void) testBrutForceMatch {
    NSString *string = @"the china made in china";
    NSString *pattern = @"china";

    NSInteger pos = [string bf_search:pattern];
    NSArray *allPos = [string bf_searchAll:pattern];
    NSLog(@"string: %@, pattern: %@", string, pattern);
    NSLog(@"pos: %@", pos == NSNotFound ? @"NotFound" : @(pos));
    NSLog(@"all pos: %@", allPos);
    
    NSInteger exPos = 4;
    NSArray *exAllPos = @[@4, @18];
    XCTAssertEqual(pos, exPos);
    XCTAssertEqualObjects(allPos, exAllPos);
}

- (void) testKMPMatch {
    NSString *pattern = @"aaaaaaaab";
    NSArray *next = [pattern generateNextTable];
    NSLog(@"next table: %@", next);
}


- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
