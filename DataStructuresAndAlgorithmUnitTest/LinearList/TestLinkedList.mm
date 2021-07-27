//
//  TestLinkedList.m
//  DataStructure
//
//  Created by 墨子痕 on 2020/8/9.
//  Copyright © 2020 Hutter. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <DSContainerForObjC/DSLinkedList.h>
#import "Person.h"
#import "DAExchangeNode.h"
#import "DSListNode.h"
#import "DSListNode+IntersectionNode.hpp"
#import "DSListNode+Cycle.hpp"

@interface TestDSLinkedList : XCTestCase

@property(nonatomic, strong) DSLinkedList *list;
@end

@implementation TestDSLinkedList

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
    self.list = [DSLinkedList list];

    Person *obj1 = [Person personWithName:@"小一" andAge:18];
    Person *obj2 = [Person personWithName:@"小二" andAge:16];
    Person *obj3 = [Person personWithName:@"小三" andAge:19];

    [self.list addObject:obj1];
    [self.list addObject:obj2];
    [self.list addObject:obj3];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    __weak DSLinkedList *list = _list;
    @autoreleasepool {
        [self.list removeAllObjects];
        _list = nil;
    }
//    NSLog(@"%@", list);
}


/**
 * 测试构建与存储是否正常
 */
- (void)testAccessObj {
    DSLinkedList *list;
    Person *obj1;
    Person *obj2;
    Person *obj3;
    @autoreleasepool {
        list = [DSLinkedList list];

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
    DSLinkedList *list = _list;
    Person *obj1 = [Person personWithName:@"小一" andAge:18];
    Person *obj2 = [Person personWithName:@"小二" andAge:16];
    Person *obj3 = [Person personWithName:@"小三" andAge:19];

    id oldObj = [list replaceObject:obj2 atIndex:0];
    id newObj = [list objectAtIndex:0];
    NSUInteger idx = [list indexOfObject:obj2];
    XCTAssertEqualObjects(obj1, oldObj);
    XCTAssertEqualObjects(obj2, newObj);

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
    DSLinkedList *list;
    Person *obj1;
    Person *obj2;
    Person *obj3;
    @autoreleasepool {
        list = [DSLinkedList list];
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


- (void)testListNodeExchange {
    NSArray *array1 = @[@1, @2, @3, @4, @5];
    NSArray *array2 = @[@1, @4, @3, @2, @5];
    DSListNode *list = [DSListNode listWithArray:array1];
    DSListNode *answer = [DSListNode listWithArray:array2];
    DSListNode *result = [DAExchangeNode exchange:list index:2];
    
    NSLog(@"%@", result.descriptionForList);
    
    XCTAssertEqualObjects(answer.descriptionForList, result.descriptionForList);
}

#pragma mark - 两个链表的第一个公共节点
/* 测试链表交叉节点 */
- (void)testFindFirstCommonNode {
    int arr1[] = {1,2,3,4,5};
    int arr2[] = {8,7,9,6};
    size_t len1 = 5;
    size_t len2 = 4;

    ListNode *list1 = constructList(arr1, 5);
    ListNode *list2 = new ListNode(8);
//    list2->next = new ListNode(7);
//    list2->next->next = list1->next->next->next;
    
    list1->printList();
    list2->printList();
    
    ListNode *result = (new FindFirstCommonNodeSolution())->getIntersectionNode(list1, list2);
    XCTAssertEqual(result, nullptr);
    
}

#pragma mark - 反转链表
- (void)testReverseList {
    ListNode *list;
}

#pragma mark - 检查链表环
- (void)testCycle {
    int arr1[] = {1,2,3,4,5,6,7,8};
    ListNode *list1 = constructList(arr1, 8);
    ListNode *list2 = constructList(arr1, 8);
    int cycleIndex = static_cast<int>(random() % 8);
    ListNode *p = list2;
    ListNode *cycleNode = nullptr;
    while (p->next) {
        p = p->next;
        if (--cycleIndex) {
            cycleNode = p;
        }
    }
    if (cycleNode) {
        p->next = cycleNode;
    }
    list1->printList();
    XCTAssertEqual(hasCycle(list1), NO);
    XCTAssertEqual(hasCycle(list2), YES);

}
@end
