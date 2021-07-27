//
// Created by 墨子痕 on 2021/7/11.
// Copyright (c) 2021 Hutter. All rights reserved.
//
//  24. 两两交换链表中的节点
//  给定一个链表，两两交换其中相邻的节点，并返回交换后的链表。
//
//  你不能只是单纯的改变节点内部的值，而是需要实际的进行节点交换。
//
//  示例 1：
//
//  输入：head = [1,2,3,4]
//  输出：[2,1,4,3]
//
//  链接：https://leetcode-cn.com/problems/swap-nodes-in-pairs

#import <Foundation/Foundation.h>
#import <DSListNode.h>
#import "ListNode.hpp"

@interface DSListNode (Swap)

- (DSListNode *)swapPairs;

@end

ListNode *swapPairs(ListNode* head);

