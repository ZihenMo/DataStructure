//
// Created by 墨子痕 on 2021/7/9.
// Copyright (c) 2021 Hutter. All rights reserved.
//
//  剑指 Offer 52. 两个链表的第一个公共节点
//  输入：intersectVal = 8, listA = [4,1,8,4,5], listB = [5,0,1,8,4,5], skipA = 2, skipB = 3
//  输出：Reference of the node with value = 8
//  输入解释：相交节点的值为 8 （注意，如果两个列表相交则不能为 0）。从各自的表头开始算起，链表 A 为 [4,1,8,4,5]，链表 B 为 [5,0,1,8,4,5]。在 A 中，相交节点前有 2 个节点；在 B 中，相交节点前有 3 个节点。
//
//  来源：力扣（LeetCode）
//  链接：https://leetcode-cn.com/problems/liang-ge-lian-biao-de-di-yi-ge-gong-gong-jie-dian-lcof
//       https://leetcode-cn.com/problems/intersection-of-two-linked-lists/
//  著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。

#import <Foundation/Foundation.h>
#import "DSListNode.h"
#import <ListNode.hpp>

struct FindFirstCommonNodeSolution {
public:
    ListNode *getIntersectionNode(ListNode *headA, ListNode *headB);
};


@interface DSListNode (IntersectionNode)

- (DSListNode *)intersectionWithList:(DSListNode *)head;

@end


