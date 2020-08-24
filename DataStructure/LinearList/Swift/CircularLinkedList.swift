//
// Created by 墨子痕 on 2020/8/22.
// Copyright (c) 2020 Hutter. All rights reserved.
//

import Foundation

class CircularLinkedList<T> {

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
            // 注意move语句需要未插入结点前使用，否则索引的元素不正确
            let foot = count == 0 ? node  : move(count - 1)
            node.next = head
            head = node
            foot?.next = head       // 修改最后一个结点的next，维持循环
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
            if count == 1 {
                head = nil
            }
            else {
                let foot = move(count - 1)
                head = head?.next
                foot?.next = head
            }
        } else {
            let preNode = move(index - 1)
            preNode?.next = preNode?.next?.next
        }
        count -= 1
    }

}

extension  CircularLinkedList: CustomStringConvertible {
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
    // 用于测试循环链表
    func hasCycle(_ head: ListNode?) -> Bool {
        var cur = head == nil ? self.head : head
        var set = Set<ListNode>()
        while cur != nil {
            if set.contains(cur!) { return true }
            set.insert(cur!)
            cur = cur?.next
        }
        return false
    }


    func hasCycle2(_ head:ListNode?) -> Bool {
        var cur = head == nil ? self.head : head
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
extension CircularLinkedList {

    public class ListNode:Hashable {

        var data: T?
        var next: ListNode?

        init(data: T?) {
            self.data = data
        }

        public func hash(into hasher: inout Hasher) {
            hasher.combine(ObjectIdentifier(self))
        }
        public static func ==(lhs: CircularLinkedList<T>.ListNode, rhs: CircularLinkedList<T>.ListNode) -> Bool {
            return Unmanaged.passUnretained(lhs).toOpaque() == Unmanaged.passUnretained(rhs).toOpaque()
        }
    }
}
