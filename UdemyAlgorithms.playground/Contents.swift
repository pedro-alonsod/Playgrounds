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
            result.swapAt(index, lowestIndex)
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
            result.swapAt(backIndex - 1, backIndex)
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
                result.swapAt(i, j)
            }
        }
    }
    return result
}

let arr = [0, 2, 9, 8, 4]
bubbleSort(input: arr)


//Sorting advanced
func mergeSort(input: [Int]) -> [Int] {
    guard input.count > 1 else { return input }
    let splitIdx = input.count / 2
    let left = mergeSort(input: Array(input[0..<splitIdx]))
    let right = mergeSort(input: Array(input[splitIdx..<input.count]))
    
    return merge(left: left, right: right)
}

func merge(left: [Int], right: [Int]) -> [Int] {
    var leftIdx = 0
    var rightIdx = 0
    
    var result: [Int] = []
    
    while leftIdx < left.count && rightIdx < right.count {
        if left[leftIdx] < right[rightIdx] {
            result.append(left[leftIdx])
            leftIdx += 1
        } else if left[leftIdx] > right[rightIdx] {
            result.append(right[rightIdx])
            rightIdx += 1
        } else {
            result.append(left[leftIdx])
            leftIdx += 1
            result.append(right[rightIdx])
            rightIdx += 1
        }
    }
    
    while leftIdx < left.count {
        result.append(left[leftIdx])
        leftIdx += 1
    }
    
    while rightIdx < right.count {
        result.append(right[rightIdx])
        rightIdx += 1
    }
    
    return result
}

let mergeSortArray = [3,4,5,6,5,4,3,2,1,2,4,6,8,9]

mergeSort(input: mergeSortArray)

func quickSort(input: [Int]) -> [Int] {
    guard input.count > 1 else { return input }
    let pivotIdx = input.count / 2
    let pivot = input[pivotIdx]
    
    let less = input.filter { $0 < pivot }
    let equal = input.filter { $0 == pivot }
    let greater = input.filter { $0 > pivot }
    
    return quickSort(input: less) + equal + quickSort(input: greater)
}

quickSort(input: mergeSortArray)
