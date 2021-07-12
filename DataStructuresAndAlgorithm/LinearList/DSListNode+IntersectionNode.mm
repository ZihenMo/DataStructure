//
// Created by 墨子痕 on 2021/7/9.
// Copyright (c) 2021 Hutter. All rights reserved.
//

#import "DSListNode+IntersectionNode.hpp"


/// 无交叉点时
ListNode *solution3(ListNode *headA, ListNode *headB);

@implementation DSListNode (IntersectionNode)


/// 所有解：
/// 1. 双指针两遍历法：O(n)
/// 2. 双指针两遍历变体法: O(n)
- (DSListNode *)intersectionWithList:(DSListNode *)head {
#if 1
    return [self solution1:head];
#endif
}

/// 方案1 双指针两遍遍历法（最佳）
///    分别用两个指针遍历list1+list2与list2+lis1的合并链表（遍历其中一个再遍历另一个）。
///    这样在第二遍的首个交叉结点会相遇。(须保证无环)
///
/// @param head 另一个链表头节点
/// @return 交叉节点
- (DSListNode *)solution1:(DSListNode *)head {
    DSListNode *p = self;
    DSListNode *q = head;
    while (p != q) {                // 遍历的总次数一定是相等的，因此只考虑值相等性
        p = !p ? head : p.next;
        q = !q ? self : q.next;
    }
    return p;
}
/**
 * 注意点：
 *  1.遍历顺序需要交换;
 *  2.边界值，在无结果时返回空。无须考虑，因为链表的长度相等，则遍历次数是一致的，双指针会同时遍历两个链表且指向空。
 */

#pragma mark - C++

/** 方案1: 双指针合并遍历法
 *
 * @param headA  其一链表头节点
 * @param headB  另一链表头节点
 * @return 交叉节点
 */
ListNode *
FindFirstCommonNodeSolution::
getIntersectionNode(ListNode *headA, ListNode *headB) {
//    return solution3(headA, headB);
    ListNode *p = headA;
    ListNode *q = headB;
    while (p != q) {
        p = p != nullptr ? p->next : headB;
        q = q != nullptr ? q->next : headA;
    }
    return p;
}

/** 方案2: 非重点方案
 * 1.遍历链表得出长度；
 * 2.用长的减去减的得到差距；
 * 3.重新从头遍历，让长的先移动多出的步数；然后同步移动找出交叉点。
 *
 * @param headA 链表1头节点
 * @param headB 链表2头节点
 * @return 交叉节点
 */
ListNode *solution2(ListNode *headA, ListNode *headB) {
    int len1 = 0;
    int len2 = 0;
    int distance = 0;
    ListNode *p1 = headA;
    ListNode *p2 = headB;
    while (p1 || p2) {
        if (p1) {
            p1 = p1->next;
            ++len1;
        }
        if (p2) {
            p2 = p2->next;
            ++len2;
        }
    }
    if (len1 > len2) {
        p1 = headA;
        p2 = headB;
    } else {
        p1 = headB;
        p2 = headA;
    }
    distance = len1 > len2 ? len1 - len2 : len2 - len1;
    // 让长链表先走一步
    while (distance) {
        p1 = p1->next;
        --distance;
    }
    // 一起走，找出节点
    while (p1 != p2) {
        p1 = p1->next;
        p2 = p2->next;
    }
    return p1;
}

/** 结论
 *  步骤繁琐，代码不美观。
 */

/// 同1，无交叉点时记录，非优化方案
ListNode *solution3(ListNode *headA, ListNode *headB) {
    ListNode *p = headA;
    ListNode *q = headB;
    bool visited1 = false;
    bool visited2 = false;
    while (q && p && p != q) {
        if (!(p->next) && !visited1) {
            p = headB;
            visited1 = true;
        } else {
            p = p->next;
        }
        if (!(q->next) && !visited2) {
            q = headA;
            visited2 = true;
        } else {
            q = q->next;
        }
    }
    return p;
}


@end
