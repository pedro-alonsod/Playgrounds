import UIKit

import QuartzCore

public class BenchTimer {
    public static func measureBlockk(closure: () -> Void) -> CFTimeInterval {
        let runCount = 10
        var executionTimes = Array<Double>(repeating: 0.0, count: runCount)
        for i in 0..<runCount {
            let startTime = CACurrentMediaTime()
            closure()
            let endTime = CACurrentMediaTime()
            let execTime = endTime - startTime
            executionTimes[i] = execTime
        }
        return (executionTimes.reduce(0, +)) / Double(runCount)
    }
}

func selectionSort(input: [Int]) -> [Int] {
    guard input.count > 1 else { return input }
    
    var result = input
    
    for index in 0..<(result.count - 1) {
        var lowestIndex = index
        
        for forward in index+1..<result.count {
            if result[forward] < result[lowestIndex] {
                lowestIndex = forward
            }
        }
        
        if index != lowestIndex {
            swap(&result[index], &result[lowestIndex])
        }
    }
    return result
}

func insertionSort(input: [Int]) -> [Int] {
    var result = input
    let count = result.count
    
    for sortedIndex in 0..<count {
        var backIndex = sortedIndex
        while backIndex > 0 && result[backIndex] < result[backIndex - 1] {
            swap(&result[backIndex - 1], &result[backIndex])
            backIndex -= 1
        }
    }
    return result
}

func bubbleSort(input: [Int]) -> [Int] {
    var result = input
    
    for i in 0..<result.count {
        for j in i+1..<result.count {
            if result[i] > result[j] {
                swap(&result[i], &result[j])
            }
        }
    }
    return result
}

let arr = [0, 2, 9, 8, 4]
bubbleSort(input: arr)