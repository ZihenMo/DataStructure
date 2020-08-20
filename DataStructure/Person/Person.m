//
//  Person.m
//  DataStructure
//
//  Created by gshopper on 2020/8/4.
//  Copyright © 2020 Hutter. All rights reserved.
//

#import "Person.h"

@implementation Person

+ (instancetype)personWithName:(NSString *)name andAge:(NSUInteger)age {
    Person *person = [[Person alloc] init];
    person.name = name;
    person.age = age;
    return person;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"<%@ %@ %ld %p>", self.className, _name, _age, (__bridge  void *) self];
}

- (void)dealloc {
    NSLog(@"-[%@ %@]", self, NSStringFromSelector(_cmd));
}

- (BOOL)isEqualTo:(nullable id)other {
    if ([other isKindOfClass:self.class]) {
        Person *another = (Person *)other;
        return [_name isEqualToString:another.name] && _age == another.age;
    }
    return [super isEqualTo:other];
}

- (BOOL)isEqual:(id)other {
    return [self isEqualTo:other];
}


@end
