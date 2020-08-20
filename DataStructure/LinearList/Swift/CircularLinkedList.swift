//
// Created by gshopper on 2020/8/19.
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
            node.next = head
            head = node
        } else {
            let preNode = move(index - 1)
            node.next = preNode?.next
            preNode?.next = node
        }
        if (index == count) {
            node.next = head
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
            head = count == 1 ? nil : head?.next
        } else {
            let preNode = move(index - 1)
            preNode?.next = index == count - 1 ? head : preNode?.next?.next
        }
        count -= 1
    }


}

// MARK: - 工具方法
extension CircularLinkedList : CustomStringConvertible {
    func move(_ index: UInt) -> ListNode? {
        var node = head
        for _ in 0..<index {
            node = node?.next
        }
        return node
    }

    func indexEnable(_ index: UInt) -> Bool {
        let condition = index >= 0 && index < count
        assert(condition, "index:\(index) beyond the bounds [0,\(count))")
        return condition
    }

    func indexEnableForAdd(_ index: UInt) -> Bool {
        let condition = index >= 0 && index <= count
        assert(condition, "index:\(index) beyond the bounds [0,\(count)]")
        return condition
    }

    public var description: String {
        var desc = "<\(NSStringFromClass(Self.self)) \n"
        var preNode = head
        for _ in 0..<count {
            desc += "\(String(describing: preNode?.data))\n"
            preNode = preNode?.next
        }
        desc += ">"
        return desc
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
            return lhs == rhs
        }

        deinit {
            print("\(self) deinit")
        }
    }
}

