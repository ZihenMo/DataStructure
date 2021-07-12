//
//  Test.swift
//  DataStructure
//
//  Created by gshopper on 2020/8/28.
//  Copyright © 2020 Hutter. All rights reserved.
//

import XCTest

class Test: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testStack() throws {
        let stack = Stack<Person>()
        let person1 = Person(name: "小一", andAge: 18)
        let person2 = Person(name: "小二", andAge: 20)
        let person3 = Person(name: "小三", andAge: 22)
        stack.push(person1)
        stack.push(person2)
        stack.push(person3)

        XCTAssertEqual(person3, stack.pop())
        XCTAssertEqual(person2, stack.peek())
        XCTAssertEqual(person2, stack.pop())
        XCTAssertEqual(person1, stack.pop())
        XCTAssert(stack.empty())
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
