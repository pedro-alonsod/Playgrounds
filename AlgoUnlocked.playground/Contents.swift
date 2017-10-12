import UIKit

func mergeSort(A: [Int]) -> [Int] {
    if A.count <= 1 {
        return A
    }
    var mid = A.count/2
    var leftPile = mergeSort(A: Array(A[0..<mid]))
    var rightPile = mergeSort(A: Array(A[mid..<A.count]))
    
    return merge(left: leftPile, right: rightPile)
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

var msA = [ 3, 4, 6, 7, 4, 3, 2, 1, 9, 10]
mergeSort(A: msA)

func qSort(A: [Int]) -> [Int] {
    if A.count <= 1 {
        return A
    }
    let pivot = A[A.count/2]
    let less = A.filter { $0 < pivot }
    let greater = A.filter { $0 > pivot }
    var eq = A.filter { $0 == pivot }
    
    return qSort(A: less) + eq + qSort(A: greater)
}

qSort(A: msA)
