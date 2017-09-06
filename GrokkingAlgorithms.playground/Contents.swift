import UIKit

func binarySearch(arr: [Int], target: Int) -> Int? {

    var low = 0
    var high = arr.count - 1
    
    while low <= high { //less or equal
        var mid = (low + high) / 2
        
        if arr[mid] == target {
            print("found target \(arr[mid])")
            return arr[mid]
        }
        
        if target > arr[mid] {
            low = mid + 1
        } else {
            high = mid - 1
        }
    }
    print("not found")
    return nil
}

var bsearch = [ 1, 2, 3, 4, 5, 6, 7, 8, 9]
binarySearch(arr: bsearch, target: 6)
binarySearch(arr: bsearch, target: 10)

func findSmallest(arr: [Int]) -> Int {
    var smallest = arr[0] // Stores the smallest value
    var smallestIdx = 0 // Stores the index of the smallest value
    
    for i in 1..<arr.count {
        if arr[i] < smallest {
            smallest = arr[i]
            smallestIdx = i
        }
    }
    return smallestIdx
}

func selectionSort(arr: [Int]) -> [Int] { // Sorts an array
    var newArr: [Int] = []
    var copy = arr
    for  i in 0..<arr.count {
        var smallest = findSmallest(arr: copy) // Finds the smallest element in the array,
        newArr.append(copy.remove(at: smallest)) //  and adds it to the new array
    }
    return newArr
}
print(selectionSort(arr: [5, 3, 2, 6, 10]))
