//
//  Sort.swift
//  DataStructure
//
//  Created by gshopper on 2020/12/11.
//  Copyright © 2020 Hutter. All rights reserved.
//

import Foundation
protocol Sortable {
    static func sort(_ arr: inout[Int])
}

extension Sortable {
    static func generateData() -> [Int] {
        return generateData(Int.random(in: 8...10))
    }
    static func generateData(_ count: Int) -> [Int] {
        var data = [Int]()
        for _ in 0..<count {
            data.append(Int.random(in: 1..<100))
        }
        return data
    }
    static func test() -> Void {
        var data = generateData()
        print("before sort: \(data)")
        sort(&data)
        print("after sort: \(data)")
    }
    
}

// MARK: - 冒泡排序
class BubbleSort: Sortable {
    static func sort(_ arr: inout [Int]) {
        for i in 0..<arr.count {
            for j in 0..<arr.count - 1 - i {
                if arr[j] > arr[j + 1] {
                    let temp = arr[j]
                    arr[j] = arr[j + 1];
                    arr[j + 1] = temp;
                }
            }
        }
    }
}

// MARK: - 暴力排序
class BruteForceSort: Sortable {
    static func sort(_ arr: inout[Int]) -> Void {
        for i in 0..<arr.count {
            for j in i+1..<arr.count {
                if arr[i] > arr[j] {
                    let temp = arr[j]
                    arr[j] = arr[i]
                    arr[i] = temp
                }
            }
        }
    }
}

// MARK: - 选择排序
class SelectionSort: Sortable {
    static func sort(_ arr: inout[Int]) -> Void {
        for i in 0..<arr.count {
            var minIdx = i
            for j in i+1..<arr.count {           // 1. i+1
                if arr[j] < arr[minIdx] {        // 2. 不能用arr[i]，要找出一轮当中的最小值
                    minIdx = j
                }
            }
            if i != minIdx {                     // 3. 比较完一轮再交换一次
                let tmp = arr[i]
                arr[i] = arr[minIdx]
                arr[minIdx] = tmp
            }
        }
    }
}

// MARK: - 插入排序
class InsertionSort2: Sortable {
    static func sort(_ arr: inout[Int]) -> Void {
        guard arr.count > 1 else {
            return
        }
        for i in 1..<arr.count {
            var j = i
            let tmp = arr[i]
            while j > 0 && tmp < arr[j - 1] {       // 不使用arr[j] 因为参照值tmp是不需要变的
                arr[j] = arr[j - 1]                 // 将不满足的元素往后挪
                j -= 1
            }
            arr[j] = tmp                            // 找到tmp的位置并插入
        }
    }
}

class InsertionSort: Sortable {
    static func sort(_ arr: inout [Int]) {
        guard arr.count > 2 else { return }
        for i in 1..<arr.count {
            var j = i
            let temp = arr[i]
            while j > 0 && arr[j - 1] > temp {
                arr[j] = arr[j - 1]
                j -= 1
            }
            arr[j] = temp
        }
    }
}

class QuickSort: Sortable {
    static func sort(_ arr: inout [Int]) {
        quickSort(&arr, 0, arr.count - 1)
    }
    static func partition(_ arr: inout [Int], _ left: Int, _ right: Int) -> Int {
        var l = left
        var r = right
        let pivot = arr[left]
        while l < r {
            while l < r && arr[r] >= pivot {
                r -= 1
            }
            arr[l] = arr[r]
            while l < r && arr[l] <= pivot {
                l += 1
            }
            arr[r] = arr[l]
        }
        arr[l] = pivot
        return l
    }
    static func quickSort(_ arr: inout [Int], _ left: Int, _ right: Int) {
        guard left < right else { return }
        let pivot = partition(&arr, left, right)
        quickSort(&arr, left, pivot - 1)
        quickSort(&arr, pivot + 1, right)
    }
}

// MARK: - 快速排序
class QuickSort2: Sortable {
    static func sort(_ arr: inout[Int]) -> Void {
        guard arr.count > 1 else { return }
        quickSort(&arr, 0, arr.count - 1)
    }
    static func quickSort(_ arr: inout[Int], _ left: Int, _ right: Int) -> Void {
        guard left < right else {
            return
        }
        let pivot = partition(&arr, left, right)
        quickSort(&arr, left, pivot - 1)
        quickSort(&arr, pivot + 1, right)
    }
    /// 排序并给出中轴索引
    static func partition(_ arr: inout[Int], _ left: Int, _ right: Int) -> Int {
        var l = left
        var r = right
        let pivot = arr[left]
        while l < r {
            while l < r && arr[r] >= pivot {
                r -= 1
            }
            arr[l] = arr[r]
            while l < r && arr[l] <= pivot {
                l += 1
            }
            arr[r] = arr[l]
        }
        arr[l] = pivot
        return l
    }
}

