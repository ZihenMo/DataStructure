//
// Created by gshopper on 2020/8/4.
// Copyright (c) 2020 Hutter. All rights reserved.
//

#import "LinkedList.h"

@interface Node : NSObject

@property(nonatomic, strong) id data;
@property(nonatomic, strong) Node *next;

@end


@implementation Node

+ (instancetype)nodeWithData:(id)data {
    Node *node = [[Node alloc] init];
    node.data = data;
    node.next = nil;
    return node;
}

@end

@interface LinkedList ()

@property(nonatomic, strong) Node *header;

@property(nonatomic, assign) NSUInteger count;

@end

@implementation LinkedList
+ (instancetype)list {
    return [[LinkedList alloc] init];
}

- (instancetype)init {
    self = [super init];
    if (self) {
        _header = [Node nodeWithData:nil];
        _count = 0;
    }
    return self;
}


- (void)addObject:(id)obj {
    [self insertObject:obj atIndex:_count];
}

- (void)insertObject:(id)obj atIndex:(NSUInteger)idx {
    if (![self indexEnableForAdd:idx] || !obj) {
        return;
    }
    Node *newNode = [Node nodeWithData:obj];
    Node *prevNode = idx == 0 ? _header : [self nodeAtIndex:idx - 1];
    newNode.next = prevNode.next;
    prevNode.next = newNode;
    ++_count;
}

- (void)setObject:(id)obj atIndex:(NSUInteger)idx {
    [self replaceObject:obj atIndex:idx];
}

- (id)replaceObject:(id)obj atIndex:(NSUInteger)idx {
    if (![self indexEnable:idx] || !obj) {
        return nil;
    }
    Node *prevNode = [self nodeAtIndex:idx];
    id old = prevNode.data;
    prevNode.data = obj;
    return old;
}

- (void)removeObject:(id)obj {
    if (!obj) {return;}
    Node *preNode = _header;
    for (int i = 0; i < _count; ++i) {
        preNode = preNode.next;
        if ([preNode.data isEqualTo:obj]) {
            Node *tmp = preNode;
            preNode.next = preNode.next.next;
            --_count;
            break;
        }
    }
}

- (id)removeObjectAtIndex:(NSUInteger)idx {
    if (![self indexEnable:idx]) {
        return nil;
    }
    Node *preNode = idx == 0 ? _header : [self nodeAtIndex:idx - 1];
    Node *node = preNode.next;
    preNode.next = node.next;
    --_count;
    return node.data;
}

- (void)removeAllObjects {
    _header.next = nil;
    _count = 0;
}

- (NSUInteger)indexOfObject:(id)obj {
    if (!obj) {return NSNotFound;}
    Node *preNode = _header;
    for (NSUInteger i = 0; i < _count; ++i) {
        preNode = preNode.next;
        if ([preNode.data isEqual:obj]) {
            return i;
        }
    }
    return NSNotFound;
}

- (id)objectAtIndex:(NSUInteger)idx {
    return [self nodeAtIndex:idx].data;
}

- (BOOL)containsObject:(id)obj {
    return [self indexOfObject:obj] != NSNotFound;
}

- (BOOL)empty {
    return _count == 0;
}

- (NSString *)description {
    NSMutableString *description = [NSMutableString stringWithFormat:@"<%@: ", NSStringFromClass([self class])];
    [description appendString:@"\n"];
    Node *node = _header;
    for (NSUInteger i = 0; i < _count; ++i) {
        node = node.next;
        [description appendFormat:@"%@\n", node.data];
    }
    [description appendString:@">"];
    return description;
}


#pragma mark: - Private

- (Node *)nodeAtIndex:(NSUInteger)idx {
    if (![self indexEnable:idx]) {
        return nil;
    }
    Node *preNode = _header;
    for (int i = 0; i < idx; ++i) {
        preNode = preNode.next;
    }
    return preNode.next;
}

- (BOOL)indexEnable:(NSUInteger)idx {
    NSAssert(idx >= 0 && idx < _count, @"index %ld, out of range [0, %ld]", idx, _count);
    return idx >= 0 && idx < _count;
}

- (BOOL)indexEnableForAdd:(NSUInteger)idx {
    NSAssert(idx >= 0 && idx <= _count, @"index %ld, out of range [0, %ld] for add", idx, _count + 1);
    return idx >= 0 && idx <= _count;
}


@end