//
// Created by 墨子痕 on 2021/7/11.
// Copyright (c) 2021 Hutter. All rights reserved.
//

#import "DSListNode+Cycle.hpp"
#import <vector>
#import <set>

/**
 * @brief 【一】哈希法
 */
bool solution1(ListNode *head);

/**
 * @brief 【二】快慢指针 T:O(n) S:O(1)
 * 快慢指针同时遍历，快走两步，慢走一步，如果有一环一定会相遇。s
 */
bool solution2(ListNode *head);

using namespace std;

@implementation DSListNode (Cycle)
@end

#pragma mark - C++ 环形链表

bool hasCycle(ListNode *head) {
    return solution2(head);
}
/**
 * @brief 【一】哈希法 T:O(n) S:O(n)
 */
bool solution1(ListNode *head) {
    ListNode *p = head;
    set<ListNode *> set;
    while (p) {
        if (set.find(p) == set.end()) {
            set.insert(p);
            p = p->next;
        }
        else {
            return true;
        }
    }
    return false;
}
/**
 * @brief 【二】快慢指针 T:O(n) S:O(1)
 * 快慢指针同时遍历，快走两步，慢走一步，如果有一环一定会相遇。
 */
bool solution2(ListNode *head) {
    ListNode *fast = head;
    ListNode *slow = head;
    while (fast != slow) {
        if (fast == nullptr || fast->next == nullptr) {
            return false;
        }
        fast = fast->next->next;
        slow = slow->next;
    }
    return true;
}
/**
 * 复盘细节
 * 1. 边界值与空指针问题。若无环，快指针先一步到null。若有环，不存在空指针问题。
 * 2. 单个元素问题。同上，只需判断快指针->next是否为空即可。
 */

/**
 * @brief 练习1 结果
 * 1. 空指针异常，fast->next->next。
 * 2. 单个元素空指针。
 */
bool practise1(ListNode *head) {
    if (!head || head->next == nullptr) {
        return false;
    }
    ListNode *fast = head;
    ListNode *slow = head;
    while (fast && slow) { // 任一个结束说明没环;若无环，fast一定先为nullptr
        fast = fast->next ? fast->next->next : nullptr;
        slow = slow->next;
        if (fast == slow) {
            return true;
        }
    }
    return false;
}

