//
//  TestDyamicArray.m
//  DataStructure
//
//  Created by gshopper on 2020/8/4.
//  Copyright © 2020 Hutter. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DynamicArray.h"
#import "Person.h"

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
    Person *obj1;
    Person *obj2;
    Person *obj3;
    @autoreleasepool {
        dynamicArray = [[DynamicArray alloc] initWithCapacity:12];
        XCTAssertEqual(0, dynamicArray.count);
        obj1 = [Person new];
        obj2 = [Person new];
        obj3 = [Person new];

        [dynamicArray addObject:obj2];
        [dynamicArray insertObject:obj1 atIndex:0];
        [dynamicArray insertObject:obj3 atIndex:2];

        NSLog(@"%@", dynamicArray);

        XCTAssertEqual(0, [dynamicArray indexOfObject:obj1]);
        XCTAssertEqual(1, [dynamicArray indexOfObject:obj2]);
        XCTAssertEqualObjects(obj3, [dynamicArray removeObjectAtIndex:2]);
        XCTAssertEqualObjects(obj2, [dynamicArray objectAtIndex:1]);
        XCTAssertEqual(2, dynamicArray.count);

        [dynamicArray removeAllObjects];
        XCTAssertEqual(0, dynamicArray.count);
        NSLog(@"%@", dynamicArray);
    }
    NSLog(@"%@", obj1);
    NSLog(@"%@", obj2);
    NSLog(@"%@", obj3);
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
