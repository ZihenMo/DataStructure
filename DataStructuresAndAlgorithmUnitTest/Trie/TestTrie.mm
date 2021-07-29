//
// Created by 墨子痕 on 2021/7/27.
// Copyright (c) 2021 Hutter. All rights reserved.
// 208.前缀树

#import <XCTest/XCTest.h>
#import <iostream>
#import "Trie.h"
#import "CrossWord.h"

using namespace std;

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

- (void)testCrossWord {
    CrossWord *solution = new CrossWord();
    vector<string> words = {"oath", "pea", "eat", "rain"};
    vector<vector<char> > board = {
            {'o', 'a', 'a', 'n'},
            {'e', 't', 'a', 'e'},
            {'i', 'h', 'k', 'r'},
            {'i', 'f', 'l', 'v'}
    };
    vector<string> ans = {"oath", "eat"};
    vector<string> ret = solution->findWords(board, words);
    for (string s : ret) {
        cout << s << endl;
    }
    XCTAssertEqual(ans, ret);
}

@end
