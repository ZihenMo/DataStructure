//
//  Person.h
//  DataStructure
//
//  Created by gshopper on 2020/8/4.
//  Copyright © 2020 Hutter. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Person : NSObject

@property (nonatomic, strong) NSString *name;

@property(nonatomic, assign) NSUInteger age;


+ (instancetype)personWithName:(NSString *)name andAge:(NSUInteger)age;

@end

NS_ASSUME_NONNULL_END
