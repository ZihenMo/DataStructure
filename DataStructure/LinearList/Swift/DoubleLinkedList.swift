//
// Created by 墨子痕 on 2020/8/17.
// Copyright (c) 2020 Hutter. All rights reserved.
//

import Foundation


class DoubleLinkedList<T>: List {
    var count: UInt = 0
    var empty: Bool {
        return count == 0;
    }

    private var head: ListNode?
    private var foot: ListNode?


    func add(_ obj: T) {
        insert(obj, at: count)
    }


    /// 插入元素
    /// - Parameters:
    ///   - obj: 元素
    ///   - index: 索引
    /// 要点：头部、尾部、空链表插入
    func insert(_ obj: T, at index: UInt) {
        guard indexEnableForAdd(index) else {
            return
        }
        let node = ListNode(data: obj)

        if index == count { // 尾部插入
            foot?.next = node
            node.prev = foot
            foot = node
            if count == 0 {
                head = node
            }
        }
        else {
            var next = move(index)
            var prev = next?.prev

            if index == 0 {
                head = node
            }

            node.next = next
            node.prev = prev

            prev?.next = node
            next?.prev = node
        }
        count += 1
    }


    /// 删除元素
    /// - Parameter index: 索引
    /// - Returns: 所删元素数据
    func remove2(at index: UInt) -> T? {
        let node = move(index)
        let prev = node?.prev
        let next = node?.next

        if index == 0 {
            head = next
        }
        else {
            prev?.next = next
        }
        if next == nil {  // index == count - 1
            foot = prev
        }
        else {
            next?.prev = prev
        }
        count -= 1
        return node?.data
    }
    /// 简写
    func remove(at index: UInt) -> T? {
        let node = move(index)
        index == 0 ? (head = node) : (node?.prev?.next = node?.next)
        index == count - 1 ? (foot = node?.prev) : (node?.next?.prev = node?.prev)
        count -= 1
        return node?.data
    }

    func removeAll() {
        head = nil
        foot = nil
        count = 0
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
            return Unmanaged.passUnretained(lhs).toOpaque() == Unmanaged.passUnretained(rhs).toOpaque()
        }
    }
}
