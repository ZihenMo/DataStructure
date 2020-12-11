//
//  Generator.swift
//  DataStructure
//
//  Created by gshopper on 2020/12/11.
//  Copyright © 2020 Hutter. All rights reserved.
//

import Foundation

class Generator {
    class func randomArray(num: Int) -> [Int] {
        var result = [Int]()
        for _ in 0..<num {
            result.append(Int.random(in: 1..<100))
        }
        return result
    }
    class func randomArray() -> [Int] {
        return randomArray(num: Int.random(in: 8..<10))
    }
}
