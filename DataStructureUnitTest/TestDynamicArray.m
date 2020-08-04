//
//  TestDyamicArray.m
//  DataStructure
//
//  Created by gshopper on 2020/8/4.
//  Copyright © 2020 Hutter. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DynamicArray.h"

@interface TestDynamicArray : XCTestCase


@end

@implementation TestDynamicArray

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testDynamicArray {
    DynamicArray *dynamicArray;
    @autoreleasepool {
    dynamicArray = [[DynamicArray alloc] initWithCapacity:12];
    XCTAssertEqual(0, dynamicArray.count);
    NSObject *obj1 = [NSObject new];
    NSObject *obj2 = [NSObject new];
    NSObject *obj3 = [NSObject new];

    [dynamicArray addObject:obj2];
    [dynamicArray insertObject:obj1 atIndex:0];
    [dynamicArray insertObject:obj3 atIndex:2];
        
    NSLog(@"%@", dynamicArray);
        
    XCTAssertEqual(0, [dynamicArray indexOfObject:obj1]);
    XCTAssertEqual(1, [dynamicArray indexOfObject:obj2]);
    XCTAssertEqualObjects(obj3, [dynamicArray removeObjectAtIndex:2]);
    XCTAssertEqualObjects(obj2, [dynamicArray objectAtIndex:1]);
    XCTAssertEqual(2, dynamicArray.count);
    }
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
