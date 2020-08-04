//
//  Person.m
//  DataStructure
//
//  Created by gshopper on 2020/8/4.
//  Copyright © 2020 Hutter. All rights reserved.
//

#import "Person.h"

@implementation Person


- (NSString *)description
{
    return [NSString stringWithFormat:@"<%@ %@ %p>", _name, self.className, self];
}

- (void)dealloc {
    NSLog(@"-[%@ %@]", self.className, NSStringFromSelector(_cmd));
}

@end
