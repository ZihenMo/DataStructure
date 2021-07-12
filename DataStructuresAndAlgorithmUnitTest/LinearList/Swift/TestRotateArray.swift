//
//  TestRotateArray.swift
//  DataStructure
//
//  Created by gshopper on 2021/3/23.
//  Copyright © 2021 Hutter. All rights reserved.
//

import XCTest

class TestRotateArray: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func generateOrderArray() -> (Int, [Int]) {
        var arr = Generator.randomArray().sorted()
        let index = Int.random(in: (0..<arr.count))
        let min = arr[0]
        if index != 0 {
            arr = [Int].init(arr[index..<arr.count] + arr[0..<index])
        }
        return (min, arr)
    }

    func testRotateArray() throws {
        let (result, arr) = generateOrderArray()
        NSLog("before: \(arr)")
        let min = RotateArray.findMinValue(arr: arr)
        NSLog("min: \(min)")
        XCTAssert(min == result)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
