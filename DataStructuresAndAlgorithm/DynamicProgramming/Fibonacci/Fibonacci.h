//
// Created by 墨子痕 on 2020/8/3.
// Copyright (c) 2020 ___FULLUSERNAME___. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Fibonacci : NSObject

@property(nonatomic, strong, readonly) NSArray *items;

- (instancetype)initWithNumber:(NSInteger)n;

+ (NSInteger)which:(NSInteger)n;

@end