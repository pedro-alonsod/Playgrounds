import UIKit

func binanrySearch(a: [Int], item: Int) -> Int? {
    var low = 0
    var high = a.count - 1
    
    while low <= high {
        var mid = (low + high) / 2
        var guess = a[mid]
        if guess == item {
            return mid
        } else if guess > item {
            high = mid - 1
        } else {
            low = mid + 1
        }
    }
    return nil
}

var a = [ 1, 2, 3, 4, 5, 6, 40, 50, 40, 560, 50, 7, 8, 9, 10]
binanrySearch(a: a, item: 9)
binanrySearch(a: a, item: -1)

func findSmallest(a: [Int]) -> Int {
    var smallest = a[0]
    var smallestIdx = 0
    for i in 0..<a.count {
        if a[i] < smallest {
            smallest = a[i]
            smallestIdx = i
        }
    }
    return smallestIdx
}

func selectionSort(a: inout [Int]) -> [Int] {
    var newA: [Int] = []
    for i in 0..<a.count {
        newA.append(a.removeFirst())
    }
    return newA
}

selectionSort(a: &a)