//
//  DAExchangeNode.m
//  DataStructuresAndAlgorithm
//
//  Created by 墨子痕 on 2021/7/9.
//  Copyright © 2021 Hutter. All rights reserved.
//
//  回顾异错点：
//  1. 边界值。题明索引从1开始，while (--k)和while(p1Node.next);为什么不写while(p1Node)
//  因为p1Node指向尾后元素，相当于从0倒数。
//  2. 交换元素不能使用节点交换，只能用节点值或修改节点next指向的方式进行交换。
//  这里图方便，直接交换节点的值。

#import "DAExchangeNode.h"

@implementation DAExchangeNode

//
//  解决方案: 快慢指针。
//  慢指针先走k步找到第k个节点，
//  慢指针同快指针一起走直到末尾，此时快指针指向倒数第k个。
+ (DSListNode *)exchange:(DSListNode *)head index:(NSInteger)k {
    DSListNode *p1Node   = head;
    DSListNode *p2Node   = head;
    DSListNode *ascNode  = head;
    DSListNode *descNode = head;
    //
    while (--k) {
        p1Node = p1Node.next;
    }
    ascNode = p1Node;
    while (p1Node.next) {
        p2Node = p2Node.next;
        p1Node = p1Node.next;
    }
    descNode = p2Node;
    // 交换
    NSInteger value = ascNode.value;
    ascNode.value = descNode.value;
    descNode.value = value;
    return head;
}



@end

