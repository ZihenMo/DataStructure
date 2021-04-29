//
//  TestKthLargestNumber.swift
//  DataStructure
//
//  Created by gshopper on 2021/3/24.
//  Copyright © 2021 Hutter. All rights reserved.
//

import XCTest

class TestKthLargestNumber: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        //输入: [3,2,1,5,6,4] 和 k = 2
        //输出: 5
        //示例2:
        //
        //输入: [3,2,3,1,2,4,5,5,6] 和 k = 4
        //输出: 4
        var nums1   = [3,2,1,5,6,4]
        var k1      = 2
        var output1 = 5
        let r1      = KthLargestNumber().findKthLargest(&nums1, k1)
        XCTAssert(r1 == output1, "-1-\(r1) != \(output1)")
        var nums2   = [3,2,3,1,2,4,5,5,6]
        var k2      = 4
        var output2 = 4
        let r2      = KthLargestNumber().findKthLargest(&nums2, k2)
        XCTAssert(r2 == output2, "-2-\(r2) != \(output2)")
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
