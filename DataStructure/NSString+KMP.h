//
// Created by 墨子痕 on 2020/8/1.
// Copyright (c) 2020 ___FULLUSERNAME___. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (BF)
/*
 * 暴力匹配
 */
- (NSInteger)bf_search:(NSString *)pattern;
- (NSInteger)bf_search:(NSInteger)pos pattern: (NSString *)pattern;
- (NSArray *)bf_searchAll:(NSString *)pattern;

@end

@interface NSString (KMP)

- (NSArray *)generateNextTable;

@end