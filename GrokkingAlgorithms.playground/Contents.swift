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
    for  i in 0..<copy.count {
        var smallest = findSmallest(arr: copy) // Finds the smallest element in the array,
        newArr.append(copy.remove(at: smallest)) //  and adds it to the new array
    }
    return newArr
}
print(selectionSort(arr: [5, 3, 2, 6, 10]))

func countDown(i: Int) {
    print(i)
    if i <= 0 {
        return
    } else {
        countDown(i: i - 1)
    }
}

countDown(i: 4)

func fact(x: Int) -> Int {
    if x <= 1 { return 1 }
    else {
        return x * fact(x: x - 1)
    }
}

fact(x: 5)

func sumRecursive(arr: [Int]) -> Int {
    if arr.count == 0 {
        return 0
    } else if arr.count == 1 {
        return arr[0]
    } else {
        return arr[0] + sumRecursive(arr: Array(arr.dropFirst()))
    }
}

sumRecursive(arr: [2, 4, 6])

func listCount(arr: [Int]) -> Int {
    if arr.count == 0 {
        return 0
    } else {
        return 1 + listCount(arr: Array(arr.dropLast()))
    }
    
}

listCount(arr: [2,3,4,5,6])

func maxRecursive(arr: [Int]) -> Int {
    if arr.count == 0 {
        return -1
    } else if arr.count == 1 {
        return arr[0]
    } else {
        return max(arr.last!, maxRecursive(arr: Array(arr.dropLast())))
    }
}

maxRecursive(arr: [2,2, 3, 4, 5])

//
//func binarySearchR(arr: [Int], target: Int) -> Int {
//    if arr.count <= 0 {
//        return -1
//    } else {
//        var mid = arr.count / 2
//        print(arr[mid], target)
//        if target < arr[mid] {
//            binarySearchR(arr: Array(arr[0..<mid]), target: target)
//        } else if target > arr[mid] {
//            binarySearchR(arr: Array(arr[mid..<arr.count]), target: target)
//        } else {
//            print("found: \(arr[mid])")
//             mid = arr[mid]
//        }
//        return mid
//    }
//}
//

//binarySearchR(arr: bsearch, target: 10)

var a = [1, 2, 3, 34, 35, 36, 35, 35, 49, 15, 20, 50, 4, 5, 6, 7, 8, 9]
func binarySearchWrapper(a: [Int], t: Int) -> (Bool,Int) {
    var tuple: (Bool, Int) = (false, -1)
    tuple = binarySearch(a: a, t: t, tup: &tuple)
    return tuple
}

private func binarySearch(a:[Int], t: Int, tup: inout (Bool, Int)) -> (Bool, Int) {
    
    var mid = a.count / 2
    print(a.count)
    if a[mid] == t {
        tup = (true, mid)
    } else if a[mid] < t && a.count > 1 {
        binarySearch(a: Array(a[mid..<a.count]), t: t, tup: &tup)
    } else if a[mid] > t && a.count > 1 {
        binarySearch(a: Array(a[0..<mid]), t: t, tup: &tup)
    } else {
        tup = (false, -15)
    }
    
    return tup
}

binarySearchWrapper(a: bsearch, t: 10)


func qsort(arr: [Int]) -> [Int] {
    if arr.count <= 2 { //Base case: arrays with 0 or 1 element are already "sorted."
        return arr
    } else {
        let pivot = arr[0] // Recursive case
        let less = arr.filter { $0 < pivot } // sub-array elements smaller than the pivot
        let bigger = arr.filter { $0 > pivot }  // sub-array elements bigger than the pivot
        let equal = arr.filter { $0 == pivot }  // sub-array elements equal than the pivot we need them so we dont eliminate duplicates
        
        return qsort(arr: less) + equal + qsort(arr: bigger)
    }
}

qsort(arr: a)

// GRAPHS

var graph: [String:[String]] = [:]
graph["you"] = ["alice", "bob", "claire"]
graph["bob"] = ["anuj", "peggy"]
graph["alice"] = ["peggy"]
graph["claire"] = ["thom", "jonny"]
graph["anuj"] = []
graph["peggy"] = []
graph["thom"] = []
graph["jonny"] = []

var q: [String] = []
q += graph["you"]!  //remember ! to get the value of dict "+=" != append()
while !q.isEmpty { //BFS start queue
    var person = q.removeFirst()
    print(q)
    if person.contains("thom") { // check if person is finish
        print("found a mango seller", person)
        break  //terminate need to check if already checked to avoid a non stoping recursion
    } else {
        q += graph[person]! // add neighbors of person
    }
}
if q.isEmpty {
    print("out not found")
} else {
    
}

var graphDijks: [String:[String: Int]] = [:]
graphDijks["start"] = [:] // INitialize first hash
graphDijks["start"]!["a"] = 6 //if is nil we need the ? or ! to multigraphs
graphDijks["start"]!["b"] = 2
graphDijks
print(graphDijks, graphDijks["start"]!) // cant print keys dunno why

// MARK: Greedy

