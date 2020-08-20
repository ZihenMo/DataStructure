//
//  LinkedList.swift
//  DataStructure
//
//  Created by gshopper on 2020/8/10.
//  Copyright © 2020 Hutter. All rights reserved.
//  单链表

import Foundation

public class LinkedList<T>: List {

    private(set) var count: UInt = 0
    private var head: ListNode?


    public func add(_ obj: T) {
        insert(obj, at: count)
    }

    public func insert(_ obj: T, at index: UInt) {
        guard indexEnableForAdd(index) else {
            return
        }
        let node = ListNode(data: obj)
        if index == 0 {
            node.next = head
            head = node
        } else {
            let preNode = move(index - 1)
            node.next = preNode?.next
            preNode?.next = node
        }
        count += 1
    }

    public subscript(_ index: UInt) -> T? {
        get {
            guard indexEnable(index) else {
                return nil
            }
            return move(index)?.data
        }
        set {
            guard let obj = newValue else {
                return
            }
            if indexEnable(index) {
                let _ = replace(obj: obj, at: index)
            } else if indexEnableForAdd(index) {
                insert(obj, at: index)
            }
        }
    }

    public func object(at index: UInt) -> T? {
        self[index]
    }

    public func replace(obj: T, at index: UInt) -> T? {
        guard indexEnable(index) else {
            return nil
        }
        let preNode = move(index)
        let old = preNode?.data
        preNode?.data = obj
        return old
    }

    public func remove(at index: UInt) {
        guard indexEnable(index) else {
            return
        }
        if index == 0 {
            head = head?.next
        } else {
            let preNode = move(index - 1)
            preNode?.next = preNode?.next?.next
        }
        count -= 1
    }


}

// MARK: - 工具方法
extension LinkedList: CustomStringConvertible {
    func move(_ index: UInt) -> ListNode? {
        var node = head
        for _ in 0..<index {
            node = node?.next
        }
        return node
    }

    func indexEnable(_ index: UInt) -> Bool {
        let condition = index >= 0 && index < count
        assert(condition, "index:\(index) out of range [0,\(count))")
        return condition
    }

    func indexEnableForAdd(_ index: UInt) -> Bool {
        let condition = index >= 0 && index <= count
        assert(condition, "index:\(index) out of range [0,\(count)]")
        return condition
    }


    func reverse() {
        #if false
        head = reverse(head)
        #else
        head = reverse2(head)
        #endif

    }

    func reversePairs() {
        #if false
        head = reversePairs(head)
        #else
        head = reversePairs2(head)
        #endif
    }

    public var description: String {


        var desc = "<\(Self.self) \(Unmanaged.passUnretained(self).toOpaque()) \n"
        var node = head
        for _ in 0..<count {
            desc += "\t\(String(describing: node?.data))\n"
            node = node?.next
        }
        desc += ">"
        return desc
    }
}

// MARK: - 算法
extension LinkedList {

    /// 删除指定节点 LeetCode_237
    /// - Parameter node: 指定待删除节点
    ///
    /// 实现：拷贝下一节点数据，并删除（跳过）下一节点
    /// 该节点之后至少有一个节点
    fileprivate func remove(_ node: ListNode) {
        if node.next != nil {
            node.data = node.next!.data
        }
        node.next = node.next?.next
    }

    /// 反转链表-从指定头节点开始 LeetCode_206
    /// - Parameter aHead: 头结点
    ///
    /// 注意，这里的算法中，链表其实是一个ListNode指针开头。
    /// 意味着全程不应使用到LinkedList的其他属性（包括head）
    fileprivate func reverse(_ aHead: ListNode?) -> ListNode? {
        guard aHead != nil && aHead?.next != nil else {
            return aHead
        }
        let newNode = reverse(aHead?.next)
        aHead?.next?.next = aHead
        aHead?.next = nil
        return newNode
    }

    /// 反转链表－非递归实现
    /// - Parameter aHead: 头结点
    /// - Returns: 反转链表头结点
    ///
    /// 借助next记录原头结点的下一节点，将头结点反转至新链表并移动原头结点
    /// 由于swift函数参数默认为let，额外定义currentNode记录原头结点
    fileprivate func reverse2(_ head: ListNode?) -> ListNode? {
        guard head != nil && head?.next != nil else {
            return head
        }
        var newHead: ListNode?
        var cur = head
        var next = cur?.next
        while cur != nil {
            cur?.next = newHead
            newHead = cur
            cur = next
            next = next?.next
        }
        return newHead
    }


    /// 两两反转链表－反转两个相邻元素的顺序　LettCode_24
    /// - Parameter head:　头结点
    /// 解法：创建一个假结点作为头结点前驱
    /// 一次走两步，将两个结点反转
    fileprivate func reversePairs(_ head: ListNode?) -> ListNode? {
        guard head != nil && head?.next != nil else {
            return head
        }
        let dummy = ListNode(data: nil)   // 假结点
        var pre: ListNode? = dummy
        pre?.next = head
        var cur: ListNode?
        var next: ListNode?
        while pre?.next != nil && pre?.next?.next != nil {
            cur = pre?.next
            next = cur?.next
            // swapping
            pre?.next = next
            cur?.next = next?.next
            next?.next = cur
            // jump
            pre = cur
        }
        return dummy.next
    }


    /// 两两反转元素 - 递规实现方案
    fileprivate func reversePairs2(_ head: ListNode?) -> ListNode? {
        guard head != nil && head?.next != nil else {
            return head
        }
        var cur = head
        var next = cur?.next

        cur?.next = reversePairs2(next?.next) // 指向已反转的结点
        next?.next = cur

        return next
    }


    /// 环形链表 - LeetCode 141
    ///
    /// 哈希表或set方案
    /// 注意需ListNode实现Hashable协议
    fileprivate func hasCycle(_ head: ListNode?) -> Bool {
        var cur = head
        var set = Set<ListNode>()
        while cur != nil {
            if set.contains(cur!) { return true }
            set.insert(cur!)
            cur = cur?.next
        }
        return false
    }


    /// 环形链表 - LeetCode 141
    ///
    /// 快慢指针法，慢指针追上快指针时有环
    /// 注意Swift可用 === 或实现Equatable协议
    /// 相对Hash表方式，节省了内存空间 O(n)的时间复杂度 O(1)的空间复杂度
    fileprivate func hasCycle2(_ head:ListNode?) -> Bool {
        var cur = head
        var next = cur?.next

        while cur != nil {
            if cur === next { return true }
            cur = cur?.next
            next = next?.next?.next
        }
        return false
    }

}

// MARK: - ListNode
extension LinkedList {

    public class ListNode:Hashable {

        var data: T?
        var next: ListNode?

        init(data: T?) {
            self.data = data
        }

        public func hash(into hasher: inout Hasher) {
            hasher.combine(ObjectIdentifier(self))
        }
        public static func ==(lhs: LinkedList<T>.ListNode, rhs: LinkedList<T>.ListNode) -> Bool {
            return lhs == rhs
        }
    }
}

