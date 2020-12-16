//
//  TestSort.swift
//  DataStructureUnitTest
//
//  Created by gshopper on 2020/12/11.
//  Copyright © 2020 Hutter. All rights reserved.
//

import XCTest

class TestSort: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testBubbleSort () throws {
        testSort(sort: BubbleSort.sort(_:))
    }
    
    func testSelectionSort() throws {
        testSort(sort: SelectionSort.sort(_:))
    }
    func testSort(sort: (inout[Int]) -> Void) {
        for _ in 0..<200 {
            var arr = SelectionSort.generateData(Int.random(in: 9...10))
            var vice = [Int](arr)
            sort(&arr)
            vice = vice.sorted()
            print(arr)
            XCTAssert(arr == vice, "结果错误")
        }
    }
    
    func testInsertionSort() throws {
        testSort(sort: InsertionSort.sort(_:))
    }
    func testQuickSort() throws {
        testSort(sort: QuickSort.sort(_:))
    }

    func testExample() throws {
        try testBubbleSort()
        try testSelectionSort()
        try testInsertionSort()
        try testQuickSort()
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
