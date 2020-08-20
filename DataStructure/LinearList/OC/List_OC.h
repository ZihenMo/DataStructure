//
// Created by 墨子痕 on 2020/8/9.
// Copyright (c) 2020 Hutter. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol List_OC <NSObject>

@property(nonatomic, assign, readonly) NSUInteger count;

- (void)addObject:(id)obj;

- (void)setObject:(id)obj atIndex:(NSUInteger)idx;

- (void)insertObject:(id)obj atIndex:(NSUInteger)idx;

- (id)replaceObject:(id)obj atIndex:(NSUInteger)idx;

- (void)removeObject:(id)obj;

- (NSUInteger)indexOfObject:(id)obj;

- (id)removeObjectAtIndex:(NSUInteger)idx;

- (void)removeAllObjects;

- (id)objectAtIndex:(NSUInteger)idx;

- (BOOL)containsObject:(id)obj;

- (BOOL)empty;

@end