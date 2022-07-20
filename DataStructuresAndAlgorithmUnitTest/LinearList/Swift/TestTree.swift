//
//  TestTree.swift
//  DataStructuresAndAlgorithm
//
//  Created by 墨子痕 on 2022/7/20.
//  Copyright © 2022 Hutter. All rights reserved.
//

import Foundation
import XCTest

class TestTree: XCTestCase {
    
    var tree: TreeNode?
    
    override func setUp() {
        super.setUp()
        
//        tree = TreeNode.makeTree(from: [1,2,3,nil,5])
        tree = TreeNode.makeTree(from: [1])
        
    }
    
    func testTreePaths() {
        let result = BTreePathSolution().binaryTreePaths(tree)
        print(result)
        XCTAssertEqual(result, ["1->2->5","1->3"])
    }
 
    
}
