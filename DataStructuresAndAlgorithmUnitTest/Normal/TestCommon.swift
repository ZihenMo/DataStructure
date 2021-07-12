//
//  TestCommon.swift
//  DataStructureUnitTest
//
//  Created by gshopper on 2020/12/11.
//  Copyright © 2020 Hutter. All rights reserved.
//

import XCTest

class TestCommon: XCTestCase {

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
    
    func testMergeOrderList() {
        var arr = Generator.randomArray()
        var another = Generator.randomArray()
        QuickSort.sort(&arr)
        QuickSort.sort(&another)
        print("arr:\(arr)")
        print("another:\(another)")
        let result = MergeOrderList().merge(arr, another)
        print("result: \(result)")
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
