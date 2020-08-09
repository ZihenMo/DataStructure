//
//  main.m
//  DataStructure
//
//  Created by 墨子痕 on 2020/8/4.
//  Copyright © 2020 Hutter. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        
        NSMutableArray *array = [NSMutableArray array];
        [array insertObject:@0 atIndex:0];
        [array addObject:@1];
        [array insertObject:@10 atIndex:2];
        NSLog(@"Hello, World! %@", array);
    }
    return 0;

}
