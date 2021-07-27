//
// Created by 墨子痕 on 2021/7/10.
// Copyright (c) 2021 Hutter. All rights reserved.
//
// 206. 反转链表
// 
//  https://leetcode-cn.com/problems/reverse-linked-list/
//
//  输入：head = [1,2,3,4,5]
//  输出：[5,4,3,2,1]

#import <Foundation/Foundation.h>
#import <DSListNode.h>
#import "ListNode.hpp"

@interface DSListNode (Reverse)

- (DSListNode *)reverse;

@end

#pragma mark - C++ 反转链表
/**
 * @brief 206. 反转链表
 * @link  https://leetcode-cn.com/problems/reverse-linked-list/
 * @param head
 * @return
 */
extern ListNode* reverseList(ListNode* head);

