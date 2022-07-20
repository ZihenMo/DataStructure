//
//  TestSet.swift
//  DataStructuresAndAlgorithmUnitTest
//
//  Created by 墨子痕 on 2022/7/19.
//  Copyright © 2022 Hutter. All rights reserved.
//

import XCTest


class TestSet: XCTestCase {
    
    var set = Set<Person>()
    
    override func setUp() {
        let obj1 = Person(name: "小一", andAge: 18)
        let obj2 = Person(name: "小二", andAge: 16)
        let obj3 = Person(name: "小三", andAge: 19)

        set.insert(obj1)
        set.insert(obj2)
        set.insert(obj3)
    }
    
    func testAllSubsets() {
        let subsets = set.allSubSet()
        subsets.forEach { x in
            print(x)
        }
    }
    
    func testDFSAllSubsets() {
        let subsets = set.dfs_allSubSet()
        subsets.forEach { x in
            print(x)
        }
    }
}
