//
// Created by 墨子痕 on 2021/7/27.
// Copyright (c) 2021 Hutter. All rights reserved.
// 208.前缀树

#import <XCTest/XCTest.h>
#import "Trie.h"

@interface TestTrie : XCTestCase

@end

@implementation TestTrie

- (void)testTrie {
    Trie *trie = new Trie();
    trie->insert("apple");
    XCTAssertTrue(trie->search("apple"));   // 返回 True
    XCTAssertFalse(trie->search("app"));     // 返回 False
    XCTAssertTrue(trie->startsWith("app")); // 返回 True
    trie->insert("app");
    XCTAssertTrue(trie->search("app"));     // 返回 True
}

@end
