//
// Created by gshopper on 2020/8/4.
// Copyright (c) 2020 Hutter. All rights reserved.
//

#import "DynamicArray.h"

static const NSUInteger kDefaultCapacity = 10;

@interface DynamicArray ()

@end


@implementation DynamicArray {
    void **_items;
    NSUInteger _capacity;
}

- (instancetype)init {
    return [self initWithCapacity:kDefaultCapacity];
}


- (instancetype)initWithCapacity:(NSUInteger)capacity {
    if (self = [super init]) {
        _capacity = MAX(capacity, kDefaultCapacity);
        _count = 0;
        _items = (void **)calloc(_capacity, sizeof(id));
    }
    return self;
}

- (void)dealloc {
    NSLog(@"[%@ %@]",self.className, NSStringFromSelector(_cmd));
//    for (NSUInteger i = 0; i < _count; ++i) {
//        id _ = (__bridge_transfer id)_items[i];
//    }
    free(_items);
    _items = NULL;
}


- (void)addObject:(id)obj {
    if (_count == _capacity) {[self resize];}
    _items[_count++] = (__bridge_retained void *) obj;
}

- (void)insertObject:(id)obj atIndex:(NSUInteger)idx {
    if (idx < 0 || idx > _count) {
        return ;
    }
    if (_count == _capacity) {[self resize];}
    if (idx == _count) {
        [self addObject:obj];
    }
    else {
        for (NSUInteger i = _count; i > idx; --i) {
            _items[i] = _items[i - 1];
        }
        
        _items[idx] = (__bridge_retained void *) obj;;
        ++_count;
    }
}

- (id)replaceObject:(id)obj atIndex:(NSUInteger)idx {
    if (![self indexEnable:idx]) {
        return nil;
    }
    id oldObj = (__bridge_transfer id)_items[idx];
    _items[idx] = (__bridge_retained void *)obj;
    return oldObj;
}

- (void)removeObject:(id)obj {
    NSUInteger idx = [self indexOfObject:obj];
    [self removeObjectAtIndex:idx];
}

- (id)removeObjectAtIndex:(NSUInteger)idx {
    id obj;
    if ([self indexEnable:idx]) {
        obj = (__bridge id) _items[idx];
    }
    for (NSUInteger i = _count - 1; i > idx; --i) {
        _items[i - 1] = _items[i];
    }
    --_count;
    return obj;
}

- (NSUInteger)indexOfObject:(id)obj {
    NSUInteger idx = NSNotFound;
    for (NSUInteger i = 0; i < _count; ++i) {
        if ([obj isEqualTo:(__bridge id)_items[i]]) {
            idx = i;
            break;
        }
    }

    return idx;
}

- (id)objectAtIndex:(NSUInteger)idx {
    if (!([self indexEnable:idx])) { return nil; }
    id obj = (__bridge id)_items[idx];
    return obj;
}


- (BOOL)empty {
    return _count == 0;
}

#pragma mark - Private

- (BOOL)indexEnable:(NSUInteger)idx {
    NSAssert(idx >= 0 && idx < _count, @"index %ld, out of range [0, %ld]", idx, _count);
    return idx >= 0 && idx < _count;
}

- (void)resize {
    _items = realloc(_items, _capacity + kDefaultCapacity);
}

- (NSString *)description {
    NSMutableString *description = [NSMutableString stringWithFormat:@"<%@: ", NSStringFromClass([self class])];
    [description appendString:@"\n"];
    for (NSUInteger i = 0; i < _count; ++i) {
        [description appendFormat:@"%@\n", (__bridge_transfer id)_items[i]];
    }
    [description appendString:@">"];
    return description;
}


@end
