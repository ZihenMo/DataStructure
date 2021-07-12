//
//  TestDoubleLinkedList.swift
//  DataStructure
//
//  Created by 墨子痕 on 2020/8/17.
//  Copyright © 2020 Hutter. All rights reserved.
//

import XCTest

class TestDoubleLinkedList: XCTestCase {

    var list =  DoubleLinkedList<Person>()

    override func setUp() {
        let obj1 = Person(name: "小一", andAge: 18)
        let obj2 = Person(name: "小二", andAge: 16)
        let obj3 = Person(name: "小三", andAge: 19)

        list.add(obj1)
        list.add(obj2)
        list.add(obj3)
    }

    func testAccessor() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.

        let obj1 = Person(name: "小一", andAge: 18)
        let obj2 = Person(name: "小二", andAge: 16)
        let obj3 = Person(name: "小三", andAge: 19)

        list.add(obj1)
        list.add(obj2)
        list.add(obj3)

        XCTAssertEqual(obj1, list[0])
        XCTAssertEqual(obj2, list[1])
        XCTAssertEqual(obj3, list[2])

        print(list)
    }

    func testCRUD() {
        let obj1 = Person(name: "小一", andAge: 18)
        let obj2 = Person(name: "小二", andAge: 16)
        let obj3 = Person(name: "小三", andAge: 19)

        let old = list.replace(obj: obj2, at: 0)
        let new = list[0]

        XCTAssertEqual(obj1, old);
        XCTAssertEqual(obj2, new);

        print(list)
//      [小二、小二、小三]

        list.remove(at: 2)
        list.remove(at: 1)
        XCTAssertEqual(1, list.count)

        print(list)
//        [小二]

        list.insert(obj1, at: 1)
        list.insert(obj1, at: 0)
        list[0] = obj3;

        XCTAssertEqual(obj3, list[0])
        XCTAssertEqual(obj2, list[1])
        XCTAssertEqual(obj1, list[2])

        print(list)
//      [小三、小二、小一]
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
