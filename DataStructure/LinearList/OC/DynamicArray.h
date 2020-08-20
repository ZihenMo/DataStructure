//
// Created by gshopper on 2020/8/4.
// Copyright (c) 2020 Hutter. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "List_OC.h"


@interface DynamicArray : NSObject <List_OC>


+ (instancetype)array;
+ (instancetype)arrayWithCapacity:(NSUInteger)capacity;
- (instancetype)initWithCapacity:(NSUInteger)capacity;

@end