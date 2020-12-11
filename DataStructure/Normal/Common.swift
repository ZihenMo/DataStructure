//
//  GCD.swift
//  DataStructure
//
//  Created by gshopper on 2020/12/11.
//  Copyright © 2020 Hutter. All rights reserved.
//


/// 最大公约数
/*
 假如需要求 1997 和 615 两个正整数的最大公约数,用欧几里得算法，是这样进行的：
 1997 / 615 = 3 (余 152)
 615 / 152 = 4(余7)
 152 / 7 = 21(余5)
 7 / 5 = 1 (余2)
 5 / 2 = 2 (余1)
 2 / 1 = 2 (余0)
 至此，最大公约数为1
 以除数和余数反复做除法运算，当余数为 0 时，取当前算式除数为最大公约数
 */

class GCD {
    
    func gcd(_ a: Int, _ b: Int) -> Int {
        var x = a
        var y = b
        while y > 0 {
            let tmp = x % y
            x  = y
            y = tmp
        }
        return x
    }
    
    /// 暴力法
    func gcd2(_ a: Int, _ b: Int) -> Int {
        var x = min(a, b)
        while a % x != 0 || b % x != 0 {
            x -= 1
            if x == 1 {
                break
            }
        }
        return x
    }
}

/// 有序数组合并
class MergeOrderList {
    func merge(_ arr: [Int], _ another: [Int]) -> [Int] {
        var result = [Int]()
        var i = 0
        var j = 0
        while i < arr.count && j < another.count {
            if arr[i] < another[j] {
                result.append(arr[i])
                i += 1
            }
            else {
                result.append(another[j])
                j += 1
            }
        }
        if i < arr.count {              // 判断是否有余下的元素
            result.append(contentsOf: arr[i..<arr.count])
        }
        if j < arr.count {
            result.append(contentsOf: another[j..<another.count])
        }
        return result
    }
}
