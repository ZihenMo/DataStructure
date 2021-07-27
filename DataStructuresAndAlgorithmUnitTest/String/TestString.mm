//
//  TestString.m
//  DataStructureUnitTest
//
//  Created by gshopper on 2020/12/11.
//  Copyright © 2020 Hutter. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSString+Reverse.h"
#import "NSString+Anagram.h"
#import <string>
using namespace std;

@interface TestString : XCTestCase

@end

@implementation TestString

#pragma mark - 242.有效的字母异位词
- (void)testAnagram {
    ValidAnagram *solution = new ValidAnagram();
    string s = "art";
    string t = "tar";

    XCTAssertTrue(solution->isAnagram(s, t));
}

@end
