//
//  DAExchangeNode.h
//  DataStructuresAndAlgorithm
//
//  Created by 墨子痕 on 2021/7/9.
//  Copyright © 2021 Hutter. All rights reserved.
//
//  1721. 交换链表中的节点
//      https://leetcode-cn.com/problems/swapping-nodes-in-a-linked-list/

#import <Foundation/Foundation.h>
#import <DSListNode.h>

NS_ASSUME_NONNULL_BEGIN

@interface DAExchangeNode : NSObject

//  给你链表的头节点 head 和一个整数 k 。
//
//  交换 链表正数第 k 个节点和倒数第 k 个节点的值后，返回链表的头节点（链表 从 1 开始索引）。
//
//  示例1:
//  输入：head = [1,2,3,4,5], k = 2
//  输出：[1,4,3,2,5]。
+ (DSListNode *)exchange:(DSListNode *)head index:(NSInteger)k;

@end

NS_ASSUME_NONNULL_END
