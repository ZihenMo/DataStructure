//
// Created by gshopper on 2020/8/4.
// Copyright (c) 2020 Hutter. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface DynamicArray : NSObject

@property (nonatomic, assign, readonly) NSUInteger count;


- (instancetype)initWithCapacity:(NSUInteger)capacity;

- (void)addObject:(id)obj;

- (void)insertObject:(id)obj atIndex:(NSUInteger)idx;

- (id)replaceObject:(id)obj atIndex:(NSUInteger)idx;

- (void)removeObject:(id)obj;

- (NSUInteger)indexOfObject:(id)obj;

- (id)removeObjectAtIndex:(NSUInteger)idx;

- (void)removeAllObjects;

- (id)objectAtIndex:(NSUInteger)idx;

- (BOOL)empty;

@end