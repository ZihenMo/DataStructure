//
// Created by gshopper on 2020/8/28.
// Copyright (c) 2020 Hutter. All rights reserved.
//

import Foundation

class Stack <T> {
    let list = DoubleLinkedList<T>()

    func push(_ obj: T) {
        list.add(obj)
    }

    func pop() -> T? {
        list.remove(at: list.count - 1)
    }

    func peek() -> T? {
        return list[list.count - 1]
    }

    func empty() -> Bool{
        return list.empty;
    }
}
