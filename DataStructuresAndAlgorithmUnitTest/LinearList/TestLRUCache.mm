//
//  TestLRUCache.m
//  DataStructuresAndAlgorithm
//
//  Created by 墨子痕 on 2021/7/31.
//  Copyright © 2021 Hutter. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "LRUCache.h"

@interface TestLRUCache : XCTestCase

@end

@implementation TestLRUCache

- (void)testLRU {
    LRUCache *lru = new LRUCache(2);
    lru->put(1, 1); // 缓存是 {1=1}
    lru->put(2, 2); // 缓存是 {1=1, 2=2}
    XCTAssertEqual(1, lru->get(1));    // 返回 1
    lru->put(3, 3); // 该操作会使得关键字 2 作废，缓存是 {1=1, 3=3}
    XCTAssertEqual(-1,lru->get(2));    // 返回 -1 (未找到)
    lru->put(4, 4); // 该操作会使得关键字 1 作废，缓存是 {4=4, 3=3}
    XCTAssertEqual(-1, lru->get(1));    // 返回 -1 (未找到)
    XCTAssertEqual(3, lru->get(3));    // 返回 3
    XCTAssertEqual(4, lru->get(4));    // 返回 4
}

@end
