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
        for (int i = 0; i < n - 1; ++i) {
            NSNumber *number = @([Fibonacci which:i]);
            [items addObject:number];
        }
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
/// 返回第几位的斐波那契数
/// @param n 位置
/// @return 结果数
/// @discussion
///     1. 小于1时直接返回。
///     2. 正序循环至n-1的位置。
///     3. b = a + b; a = b - a;
///     4. 返回b。因为
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
