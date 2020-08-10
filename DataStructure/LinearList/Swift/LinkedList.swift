//
//  LinkedList.swift
//  DataStructure
//
//  Created by gshopper on 2020/8/10.
//  Copyright © 2020 Hutter. All rights reserved.
//

import Foundation

public class LinkedList<T> {
    
    private(set) var count: UInt = 0
    private var head:ListNode?

    
    public func add (_ obj:T) {
        insert(obj, at: count)
    }
    
    public func insert (_ obj:T, at index:UInt) {
        guard indexEnableForAdd(index) else { return }
        if index == 0 {
            head = ListNode(data: obj)
        }
        else {
            let preNode = move(index)
            let node = ListNode(data: obj)
            node.next = preNode?.next
            preNode?.next = node
        }
        count += 1
    }
    
    public subscript (_ index: UInt) -> T? {
        guard indexEnable(index) else { return nil }
        return move(index)?.data
    }
    
    public func object(at index: UInt) -> T? {
        return self[index]
    }
    
    public func replace(obj: T, at index: UInt) {
        guard indexEnable(index) else { return }
        let preNode = index == 0 ? head : move(index)
        let newNode = ListNode(data: obj)
        newNode.next = preNode?.next
        preNode?.next = newNode
    }
    
    public func remove(at index: UInt) {
        guard indexEnable(index) else { return }
        let preNode = index == 0 ? head : move(index)
        preNode?.next = preNode?.next?.next
    }
    
    
}

// MARK: - 工具方法
extension LinkedList {
    func move (_ index: UInt) -> ListNode? {
        var node = head
        for _ in 0..<index {
            node = node?.next
        }
        return node
    }
    func indexEnable (_ index: UInt) -> Bool {
        let condition = index >= 0 && index < count
        assert(condition, "index:\(index) beyond the bounds [0,\(count))")
        return condition
    }
    
    func indexEnableForAdd (_ index:UInt) -> Bool {
        let condition = index >= 0 && index <= count
        assert(condition, "index:\(index) beyond the bounds [0,\(count)]")
        return condition
    }
}

// MARK: - 特殊实现
extension LinkedList {
    /*
     * 删除指定节点
     * 实现：拷贝下一节点的数据，并删除下一节点
     */
    public func remove(_ node: ListNode) {
        if node.next != nil {
            node.data = node.next!.data
        }
        node.next = node.next?.next
    }
    
}

// MARK: - ListNode
extension LinkedList {
    
    public class ListNode {
        var data: T
        var next: ListNode?
        init(data:T) {
            self.data = data
        }
    }
}
