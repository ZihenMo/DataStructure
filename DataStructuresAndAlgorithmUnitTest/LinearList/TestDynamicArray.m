//
//  TestDyamicArray.m
//  DataStructure
//
//  Created by gshopper on 2020/8/4.
//  Copyright © 2020 Hutter. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <DSContainerForObjC/DSArray.h>
#import "Person.h"

@interface TestDSArray : XCTestCase


@property(nonatomic, strong) DSArray *dynamicArray;

@end

@implementation TestDSArray

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
    self.dynamicArray = [DSArray array];

    Person *obj1 = [Person personWithName:@"小一" andAge:18];
    Person *obj2 = [Person personWithName:@"小二" andAge:16];
    Person *obj3 = [Person personWithName:@"小三" andAge:19];

    [self.dynamicArray addObject:obj1];
    [self.dynamicArray addObject:obj2];
    [self.dynamicArray addObject:obj3];

}

/**
 * 查看内存是否泄漏
 */
- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    __weak DSArray *dynamicArray = _dynamicArray;
    @autoreleasepool {
        [self.dynamicArray removeAllObjects];
        _dynamicArray = nil;
    }
    NSLog(@"%@", dynamicArray);
}

/**
 * 测试构建与存储是否正常
 */
- (void)testAccessObj {
    DSArray *dynamicArray;
    Person *obj1;
    Person *obj2;
    Person *obj3;
    @autoreleasepool {
        dynamicArray = [DSArray array];

        obj1 = [Person personWithName:@"小一" andAge:18];
        obj2 = [Person personWithName:@"小二" andAge:16];
        obj3 = [Person personWithName:@"小三" andAge:19];

        [dynamicArray addObject:obj1];
        [dynamicArray addObject:obj2];
        [dynamicArray addObject:obj3];

        NSLog(@"%@", dynamicArray);

        XCTAssertEqual(3, dynamicArray.count);
        XCTAssertEqual(obj1, [dynamicArray objectAtIndex:0]);
        XCTAssertEqual(obj2, [dynamicArray objectAtIndex:1]);
        XCTAssertEqual(obj3, [dynamicArray objectAtIndex:2]);

        [dynamicArray removeAllObjects];
    }
    NSLog(@"%@", obj1);
    NSLog(@"%@", obj2);
    NSLog(@"%@", obj3);
    NSLog(@"%@", dynamicArray);
}

/**
 * 测试增删改查
 */
- (void)testCRUD {
    DSArray *dynamicArray = _dynamicArray;
    Person *obj1 = [Person personWithName:@"小一" andAge:18];
    Person *obj2 = [Person personWithName:@"小二" andAge:16];
    Person *obj3 = [Person personWithName:@"小三" andAge:19];

    id old = [dynamicArray replaceObject:obj2 atIndex:0];
    id new = [dynamicArray objectAtIndex:0];
    NSUInteger idx = [dynamicArray indexOfObject:obj2];
    XCTAssertEqualObjects(obj1, old);
    XCTAssertEqualObjects(obj2, new);

    NSLog(@"%@", dynamicArray);
//  [小二、小二、小三]

    [dynamicArray removeObject:obj2];
    [dynamicArray removeObjectAtIndex:1];
    XCTAssertEqual(1, dynamicArray.count);
    NSLog(@"%@", dynamicArray);

//   [小二]
    [dynamicArray insertObject:obj3 atIndex:1];
    [dynamicArray insertObject:obj3 atIndex:0];
    [dynamicArray setObject:obj1 atIndex:0];
//  [小一、小二、小三]
    XCTAssertEqualObjects(obj1, [dynamicArray objectAtIndex:0]);
    XCTAssertEqualObjects(obj2, [dynamicArray objectAtIndex:1]);
    XCTAssertEqualObjects(obj3, [dynamicArray objectAtIndex:2]);
    XCTAssertEqual(3, dynamicArray.count);
    NSLog(@"%@", dynamicArray);
}

- (void)testDSArray {
    DSArray *dynamicArray;
    Person *obj1;
    Person *obj2;
    Person *obj3;
    @autoreleasepool {
        dynamicArray = [[DSArray alloc] initWithCapacity:12];
        XCTAssertEqual(0, dynamicArray.count);
        obj1 = [Person personWithName:@"小一" andAge:18];
        obj2 = [Person personWithName:@"小二" andAge:16];
        obj3 = [Person personWithName:@"小三" andAge:19];

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
