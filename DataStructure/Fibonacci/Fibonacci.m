//
// Created by 墨子痕 on 2020/8/3.
// Copyright (c) 2020 ___FULLUSERNAME___. All rights reserved.
//

#import "Fibonacci.h"

@interface Fibonacci ()

@end

@implementation Fibonacci {

}
- (instancetype)initWithNumber:(NSInteger)n {
    self = [super init];
    if (self) {
        NSMutableArray *items = [NSMutableArray array];
        NSInteger first = 0;
        NSInteger second = 1;
        [items addObject:@(first)];
        for (int i = 0; i < n - 1; ++i) {
            second = first + second;
            first = second - first;
            [items addObject:@(first)];
        }
        [items addObject:@(second)];
    }
    return self;
}

- (NSString *)description {
    NSMutableString *description = [NSMutableString stringWithFormat:@"<%@: ", NSStringFromClass([self class])];
    [description appendString:@"\n"];
    for (NSNumber *item in _items) {
        [description appendFormat:@"%@ ", item.stringValue];
    }
    [description appendString:@"\n"];
    [description appendString:@">"];
    return description;
}


+ (NSInteger)which:(NSInteger)n {
    if (n <= 1) { return n;}
    NSInteger first = 0;
    NSInteger second = 1;
    for (int i = 0; i < n - 1; ++i) {
        second = first + second;
        first = second - first;
    }
    return second;
}


@end