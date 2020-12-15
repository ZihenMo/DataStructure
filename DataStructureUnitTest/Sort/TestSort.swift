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
        for _ in 0..<200 {
            var arr = BubbleSort.generateData(10)
            var viceArr = [Int](arr)
            BubbleSort.sort(&arr)
            viceArr = viceArr.sorted()
            print(arr)
            XCTAssert(arr == viceArr, "结果错误")
        }
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
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
 
//        XCTAssert(QuickSort.sort(&arr) == viceArr.sort(), "不相等")
//          XCTAssert(SelectionSort.sort(&arr) == viceArr.sort(), "不相等")
//        BruteForceSort().test()
//        InsertionSort().test()
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
