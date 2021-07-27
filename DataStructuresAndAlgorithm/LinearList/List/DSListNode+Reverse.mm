//
// Created by 墨子痕 on 2021/7/10.
// Copyright (c) 2021 Hutter. All rights reserved.
//
// 解法：1.迭代；2.递归。
//
// 解题步骤：
// 1.使用两个指针，一个用于修改指向pre，一个用于原链表前进cur。
// 2.新链表头指针res，用于前进。
//
// 细节步骤:
// 1. pre = cur;        指向同一节点
// 2. cur = cur.next;   当前节点前进
// 3. pre.next = res;   修改原节点指向新链表的头节点
// 4. res = pre;        修改头节点为新节点

#import "DSListNode+Reverse.hpp"


@implementation DSListNode (Reverse)

- (DSListNode *)reverse {
    DSListNode *cur = self;
    DSListNode *res;
    DSListNode *pre;
    while (cur) {
        pre = cur;
        cur = cur.next;
        pre.next = res;
        res = pre;
    }
    return res;
}

@end

#pragma mark - C++
ListNode *reverseList(ListNode* head) {
    ListNode *cur = head;
    ListNode *pre = nullptr;
    ListNode *res = nullptr;
    while (cur) {
        pre = cur;
        cur = cur->next;    // 注意顺序
        pre->next = res;
        res = pre;    // 注意这里应直接赋值进行移动！
    }
    return res;
}
//  递归解题步骤：
//    1.大问题拆解成子问题；
//    2.子问题同原问题求解方式一致;
//    3.存在最小子问题（明确有解）
//
//  递归法:
//  1. 拆解为头节点与待反转节点构成的链表
//  2. 最少为一个节点，即没有后继，不需要反转(注意，这里需要记录该节点作为返回值）;
//  3. 两个节点时，待反转节点指向头节点即可;
//  4. 修改反转过的头节点（已是尾节点）指向空，避免环。
ListNode *reverseList2(ListNode *head) {
    if (!head || !head->next) {     // 终止条件，只有一个节点时（最后一个节点)
        return head;
    }
    ListNode *trail = reverseList2(head->next); // 分解，注意需要记录最后的节点作为返回值。
    head->next->next = head;                    // 反转操作
    head->next = nullptr;                       // 避免环！
    return trail;
}


