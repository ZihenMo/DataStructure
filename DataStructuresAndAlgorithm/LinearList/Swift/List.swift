//
// Created by 墨子痕 on 2020/8/17.
// Copyright (c) 2020 Hutter. All rights reserved.
//

import Foundation

protocol List {

    var count: UInt { get }

    func indexEnable(_ index: UInt) -> Bool

    func indexEnableForAdd(_ index: UInt) -> Bool
}

extension List {
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
}
