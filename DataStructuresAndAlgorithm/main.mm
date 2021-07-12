//
//  main.m
//  DataStructure
//
//  Created by 墨子痕 on 2020/8/4.
//  Copyright © 2020 Hutter. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import <ListNode.hpp>


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSString *name;
        @autoreleasepool {
            ListNode *node = new ListNode(0);
            node->next = new ListNode(1);
            node->printList();
            name = [NSString stringWithFormat:@"some body"];
            @autoreleasepool {
                Person *person = [[Person alloc] init];
                person.name = name;
            }
        }
        NSLog(@"%@", name);

    }
    return 0;

}
