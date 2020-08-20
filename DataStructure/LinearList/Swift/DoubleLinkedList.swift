//
// Created by 墨子痕 on 2020/8/17.
// Copyright (c) 2020 Hutter. All rights reserved.
//

import Foundation


class DoubleLinkedList<T>: List {
    var count: UInt = 0

    private var head: ListNode?
    private var foot: ListNode?

    func add(_ obj: T) {
        insert(obj, at: count)
    }

    func insert(_ obj: T, at index: UInt) {
        guard indexEnableForAdd(index) else {
            return
        }
        let node = ListNode(data: obj)
        var prev: ListNode?

        if index == 0 {
            head = node
        } else if index == count {
            prev = foot
            foot = node
        } else {
            prev = move(index)
        }
        node.next = prev?.next
        node.prev = prev

        prev?.next?.prev = node
        prev?.next = node

        count += 1
    }

    func remove(at index: UInt) -> T? {
        guard indexEnable(index) else {
            return nil
        }
        let node = move(index)
        if index == 0 {
            head = head?.next
            head?.prev = nil
        }
        else if index == count {
            foot = node?.prev
        }
        node?.prev?.next = node?.next
        node?.next?.prev = node?.prev
        node?.next = nil
        node?.prev = nil
        count -= 1
        return node?.data
    }

    func replace(obj: T, at index: UInt) -> T? {
        guard let node = move(index) else { return nil }
        let old = node.data
        node.data = obj
        return old
    }

    func object(at index: UInt) -> T? {
        return move(index)?.data
    }

    subscript(_ index: UInt) -> T? {
        get {
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
}

// MARK: - Utility
extension DoubleLinkedList: CustomStringConvertible {
    var description: String {
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
        guard indexEnable(index) else {
            return nil
        }
        var node = head
        if index / 2 > count >> 1 {
            for _ in count - 1...index { // (index..<count).reversed()
                node = node?.prev
            }
        } else {
            for _ in 0..<index {
                node = node?.next
            }
        }
        return node
    }

}

// MARK: - ListNode
extension DoubleLinkedList {
    public class ListNode: Hashable {

        var data: T?
        var prev: ListNode?
        var next: ListNode?

        init(data: T?) {
            self.data = data
        }

        public func hash(into hasher: inout Hasher) {
            hasher.combine(ObjectIdentifier(self))
        }

        public static func ==(lhs: DoubleLinkedList<T>.ListNode, rhs: DoubleLinkedList<T>.ListNode) -> Bool {
            return lhs == rhs
        }
    }
}
