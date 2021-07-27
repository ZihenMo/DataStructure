//
// Created by 墨子痕 on 2021/7/21.
// Copyright (c) 2021 Hutter. All rights reserved.
//


#import <XCTest/XCTest.h>
#import "Stock.h"

@interface TestGreedy : XCTestCase

@end

@implementation TestGreedy

- (void)testStock121 {
    Stock *stock = new Stock();
    std::vector<int> prices1 = {17,1,5,3,6,4};
    std::vector<int> prices2 = {7,6,4,3,1};


    XCTAssertEqual(stock->maxProfit_121(prices1), 5);
    XCTAssertEqual(stock->maxProfit_121(prices2), 0);
}

@end