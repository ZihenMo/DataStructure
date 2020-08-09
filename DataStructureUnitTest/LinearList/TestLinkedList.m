//
//  TestLinkedList.m
//  DataStructure
//
//  Created by 墨子痕 on 2020/8/9.
//  Copyright © 2020 Hutter. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "LinkedList.h"
#import "Person.h"

@interface TestLinkedList : XCTestCase

@property(nonatomic, strong) LinkedList *list;
@end

@implementation TestLinkedList

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
    self.list = [LinkedList list];

    Person *obj1 = [Person personWithName:@"小一" andAge:18];
    Person *obj2 = [Person personWithName:@"小二" andAge:16];
    Person *obj3 = [Person personWithName:@"小三" andAge:19];

    [self.list addObject:obj1];
    [self.list addObject:obj2];
    [self.list addObject:obj3];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    __weak LinkedList *list = _list;
    @autoreleasepool {
        [self.list removeAllObjects];
        _list = nil;
    }
    NSLog(@"%@", list);
}


/**
 * 测试构建与存储是否正常
 */
- (void)testAccessObj {
    LinkedList *list;
    Person *obj1;
    Person *obj2;
    Person *obj3;
    @autoreleasepool {
        list = [LinkedList list];

        obj1 = [Person personWithName:@"小一" andAge:18];
        obj2 = [Person personWithName:@"小二" andAge:16];
        obj3 = [Person personWithName:@"小三" andAge:19];

        [list addObject:obj1];
        [list addObject:obj2];
        [list addObject:obj3];

        NSLog(@"%@", list);

        XCTAssertEqual(3, list.count);
        XCTAssertEqual(obj1, [list objectAtIndex:0]);
        XCTAssertEqual(obj2, [list objectAtIndex:1]);
        XCTAssertEqual(obj3, [list objectAtIndex:2]);

        [list removeAllObjects];
    }
    NSLog(@"%@", obj1);
    NSLog(@"%@", obj2);
    NSLog(@"%@", obj3);
    NSLog(@"%@", list);
}

/**
 * 测试增删改查
 */
- (void)testCRUD {
    LinkedList *list = _list;
    Person *obj1 = [Person personWithName:@"小一" andAge:18];
    Person *obj2 = [Person personWithName:@"小二" andAge:16];
    Person *obj3 = [Person personWithName:@"小三" andAge:19];

    id old = [list replaceObject:obj2 atIndex:0];
    id new = [list objectAtIndex:0];
    NSUInteger idx = [list indexOfObject:obj2];
    XCTAssertEqualObjects(obj1, old);
    XCTAssertEqualObjects(obj2, new);

    NSLog(@"%@", list);
//  [小二、小二、小三]

    [list removeObject:obj2];
    [list removeObjectAtIndex:1];
    XCTAssertEqual(1, list.count);
    NSLog(@"%@", list);

//   [小二]
    [list insertObject:obj3 atIndex:1];
    [list insertObject:obj3 atIndex:0];
    [list setObject:obj1 atIndex:0];
//  [小一、小二、小三]
    XCTAssertEqualObjects(obj1, [list objectAtIndex:0]);
    XCTAssertEqualObjects(obj2, [list objectAtIndex:1]);
    XCTAssertEqualObjects(obj3, [list objectAtIndex:2]);
    XCTAssertEqual(3, list.count);
    NSLog(@"%@", list);
}

- (void)testLinkedList {
    LinkedList *list;
    Person *obj1;
    Person *obj2;
    Person *obj3;
    @autoreleasepool {
        list = [LinkedList list];
        XCTAssertEqual(0, list.count);
        obj1 = [Person personWithName:@"小一" andAge:18];
        obj2 = [Person personWithName:@"小二" andAge:16];
        obj3 = [Person personWithName:@"小三" andAge:19];

        [list addObject:obj2];
        [list insertObject:obj1 atIndex:0];
        [list insertObject:obj3 atIndex:2];

        NSLog(@"%@", list);

        XCTAssertEqual(0, [list indexOfObject:obj1]);
        XCTAssertEqual(1, [list indexOfObject:obj2]);
        XCTAssertEqualObjects(obj3, [list removeObjectAtIndex:2]);
        XCTAssertEqualObjects(obj2, [list objectAtIndex:1]);
        XCTAssertEqual(2, list.count);

        [list removeAllObjects];
        XCTAssertEqual(0, list.count);
        NSLog(@"%@", list);
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
