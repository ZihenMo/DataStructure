//
// Created by 墨子痕 on 2021/7/11.
// Copyright (c) 2021 Hutter. All rights reserved.
//
// 考验的不是逻辑，而是代码能力，边界差错等等。逻辑简单，但是具体代码编写较为困难，极易出错。
// 1. 空与一个节点原样返回（边界值，保证两个节点以上 ）；
// 2. 迭代方案时必须使用哑节点，否则头节点为首个元素，无法连接后续的链表;
// 3. 迭代前不要赋值，否则超出了当前判断条件！

#import "DSListNode+Swap.hpp"


@implementation DSListNode (Swap)

- (DSListNode *)swapPairs {
    DSListNode *dumpy = [DSListNode nodeWithValue:0];    // 使用哑节点可避免诸多判断
    DSListNode *node1;
    DSListNode *node2;
    DSListNode *p = dumpy;
    p.next = self;              // 重点
    while (p.next && p.next.next) {
        // 1. 赋值
        node1 = p.next;
        node2 = node1.next;
        // 2. 交换
        node1.next = node2.next;
        node2.next = node1;
        // 3. 连接与移动
        p.next = node2;
        p = node1;
    }
    return dumpy.next;
}

@end

#pragma mark - C++ 两两交换链表中的节点
// 优化后的迭代方案
ListNode *swapPairs(ListNode* head) {
    ListNode *dumpy = new ListNode(0);
    ListNode *p = dumpy;                    // 哑节点
    ListNode *node1;
    ListNode *node2;
    p->next = head;                         // 以p为基线，先设定连接原有链表!!
    while (p->next && p->next->next) {      // 保证两个可交换节点
        // 1.赋值
        node1 = p->next;
        node2 = node1->next;
        // 2.交换
        node1->next = node2->next;
        node2->next = node1;
        // 3.连接与移动
        p->next = node2;                     // 连接交换后链表
        p = node1;
    }
    return dumpy->next;
}
// 交换的两个节点指针
// 记录位置的指针，因为头节点也可能交换，因此需要使用一个哑节点
// 边界值
// 先移动会有各种问题,因此这里用了很多判断，神奇的是提交显示时间更快一点
ListNode *swapPairs1(ListNode* head) {
    ListNode *dumpy = new ListNode(0);
    ListNode *p = dumpy;                 // 索引节点
    ListNode *node1 = head;              // 当前交换节点1
    ListNode *node2 = node1 ? node1->next : nullptr;       // 当前交换节点2
    p->next = head;
    while (node1 && node2) {
        node1->next = node2->next;
        node2->next = node1;
        p->next = node2;            // 连接已反转节点
        p = node1;
        node1 = node1->next;        // 移动
        node2 = node1 ? node1->next : nullptr;       // 移动
    }
    return dumpy->next;
}

// 递归法
ListNode *swapPairs2(ListNode* head) {
    if (!head || !head->next) {
        return head;
    }
    ListNode *node = head->next;
    head->next = swapPairs2(node->next);            // 最少两个元素时，node1.next = null,即递归终止条件
    node->next = head;                              // node2.next指向修改
    return node;                                    // 这里返回是至少两个节点，则第二个节点为头
}