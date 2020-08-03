//
// Created by 墨子痕 on 2020/8/1.
// Copyright (c) 2020 ___FULLUSERNAME___. All rights reserved.
//

#import "NSString+KMP.h"


@implementation NSString (BF)

- (NSInteger)bf_search:(NSString *)pattern {
    return [self bf_search:0 pattern:pattern];
}

/*
 * 时间复杂度：O(mn)
 * 实际上是类似双层循环
 */
- (NSInteger)bf_search:(NSInteger)pos pattern:(NSString *)pattern {
    if (pos < 0 || pos >= self.length) {
        return NSNotFound;
    }
    NSInteger i = pos;
    NSInteger j = 0;
    NSInteger n = self.length;
    NSInteger m = pattern.length;

    while (i < n && j < m) {
        unichar a = [self characterAtIndex:i];
        unichar b = [pattern characterAtIndex:j];
        if (a == b) {
            ++i;
            ++j;
        } else { // 回退：模式串索引回到开头；主串索引回到本次开始比较的下一索引(已比较长度＋1)
            i = i - j + 1;
            j = 0;
        }
    }

    return j == m ? i - m : NSNotFound;
}

/*
 * for循环实现,更加清晰
 */
- (NSInteger)bf_search2:(NSInteger)pos pattern:(NSString *)pattern {
    if (pos < 0 || pos >= self.length) {
        return NSNotFound;
    }
    NSInteger i = pos;
    NSInteger n = self.length;
    NSInteger m = pattern.length;

    for (; i < n - m + 1; ++i) {                       // 主串没必要匹配比m还短的尾部
        NSInteger j = 0;
        for (; j < m; ++j) {
            unichar a = [self characterAtIndex:i + j];    // 注意此处和外层循环条件对应
            unichar b = [pattern characterAtIndex:j];
            if (a != b) {break;}
        }
        if (j == m) {                                   // 放在外层循环内判断，避免已匹配还在循环
            return i;
        }
    }

    return NSNotFound;
}

/*
 * 优化for循环，采用同while一样回退操作,循环次数其实是一样的。
 * 回退的写法是具有意义的：KMP正是利用next回退到已免匹配的下一个索引。
 */
- (NSInteger)bf_search3:(NSInteger)pos pattern:(NSString *)pattern {
    if (pos < 0 || pos >= self.length) {
        return NSNotFound;
    }
    NSInteger i = pos;
    NSInteger j = 0;
    NSInteger n = self.length;
    NSInteger m = pattern.length;

    for (; i < n && j < m; ++i) {                       // 主串没必要匹配比m还短的尾部
        unichar a = [self characterAtIndex:i];          // 注意此处和外层循环条件对应
        unichar b = [pattern characterAtIndex:j];
        if (a != b) {                                   // 回退
            i = i - j;                                  // 理应i = i - j + 1;由于++i会自增去掉-1
            j = 0;
        }
        else {
            ++j;                                        // 相等时 ++i; ++j;
        }
    }

    return j == m ? i - m : NSNotFound;
}

- (NSArray *)bf_searchAll:(NSString *)pattern {
    NSInteger pos = [self bf_search3:0 pattern:pattern];
    NSMutableArray *allPos = [NSMutableArray array];
    while (pos != NSNotFound) {
        [allPos addObject:@(pos)];
        pos = [self bf_search3:pos + 1 pattern:pattern];
    }
    return allPos;
}


@end

@implementation NSString (KMP)

/*
 * 生成next表格，记录idx之前的子串组成的前后缀最长子串的长度与结束位置。
 */
- (NSArray *)generateNextTable {
    NSString *pattern = self;
    NSMutableArray <NSNumber *> *next = [NSMutableArray arrayWithCapacity:pattern.length];
    if (pattern.length > 0) {
        next[0] = @(-1);
    }
    if (pattern.length == 1) {
        return next;
    }
    NSUInteger i = 0;
    NSUInteger j = 1;
    while (j < pattern.length) {
        if ([pattern characterAtIndex:i] == [pattern characterAtIndex:j]) {
            ++i;
            ++j;
            next[i] = @(j);
        } else {
            next[j] = @(-1);
        }
    }
    return next;
}
@end
