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
graphDijks["start"] = [:] // Initialize first hash
graphDijks["start"]!["a"] = 6 //if is nil we need the ? or ! to multigraphs
graphDijks["start"]!["b"] = 2
graphDijks
print(graphDijks, graphDijks["start"]!) // cant print keys dunno why

// MARK: Greedy

//var testMatrix = Array<Int>(repeatElement(Array<Int>(repeating: 2, count: 20), count: 20))
var statesNeeded: Set<String> =  ["mt", "wa", "or", "id", "nv", "ut", "ca", "az"]
var stations: [String:Set<String>] = [:]
stations["kone"] = ["id", "nv", "ut"]
stations["ktwo"] = ["wa", "id", "mt"]
stations["kthree"] = ["or", "nv", "wa"]
stations["kfour"] = ["nv", "ut"]
stations["kfive"] = ["ca", "az"]

var finalStations: Set<String> = []
var bestStation: Set<String>? = []
var statesCovered: Set<String> = []
for (var station, var statesCovered) in stations {
    var covered: Set<String> = statesNeeded.union(statesCovered)
    if covered.count > statesCovered.count {
        bestStation!.insert(station)
        statesCovered = covered
    }
}
//finalStations.insert(bestStation!)
bestStation!

//DP
//func LCS(S: String, T: String, n: Int, m: Int) -> Int {
//    var arrS = Array(S)
//    var arrT = Array(T)
//    if m == 0 || n == 0 {
//        return 0
//    }
//    if n == arrrST.count && arrST.cont == m {
//        return arrST[n-1][m-1]
//    }
//    if S[n] == T[m] {
//        result = 1 + LCS(S: S, T: T, n: n-1, m: m-1)
//    } else {
//        result = max(LCS(S: S, T: T, n: n-1, m: m), LCS(S: S, T: T, n: n, m: m-1))
//    }
//    arrST[n][m] = result
//    return result
//}

func addR(n: Int, m: Int) -> Int {
    if m == 0 {
        return n
    } else {
        return addR(n: n, m: m-1)
    }
}

addR(n: 3, m: 4)
//Gayle Strings
func isUnique(str: String) -> Bool {
    var arr = Array(str)
    var uniqueCount: [Character:Int] = [:]
    
    for ch in str {
        if uniqueCount[ch] == nil {
            uniqueCount[ch] = 1
        } else {
            uniqueCount[ch]! += 1
        }
    }
    
    return uniqueCount.filter { $0.value > 1 }.count == 0
    
}

isUnique(str: "aaassssddd")
isUnique(str: "abs")

func checkPermutations(str1: String, str2: String) -> Bool {
 
    guard str1.count == str2.count else { return false }
    let srtStr1 = str1.sorted()
    let srtStr2 = str2.sorted()
    
    return srtStr1 == srtStr2
}

checkPermutations(str1: "adb", str2: "bda")
checkPermutations(str1: "ace", str2: "acr")
checkPermutations(str1: "Asd", str2: "Asdd")

func URLfy(str: String) -> String {
    return str.trimmingCharacters(in: CharacterSet(charactersIn: " ")).replacingOccurrences(of: " ", with: "%20")
}

URLfy(str: " Mr. John smith      ")

//Gayle LinkedLists
class NodeG<T:Hashable> {
    var data: T
    var next: NodeG<T>?
    
    init(data: T) {
        self.data = data
        self.next = nil
    }
}

class LinkedListG<T: Hashable> {
    var head: NodeG<T>?
    
    func insert(data: T) {
        let newNode = NodeG<T>(data: data)
        
        if head == nil {
            head = newNode
        } else {
            newNode.next = head
            head = newNode
        }
    }
    
    func removeDups() {
        var uniques: [T:NodeG<T>] = [:]
        
        var current = head
        while current != nil {
            if uniques[current!.data] == nil {
                uniques[current!.data] = current!
            } else {
                current = nil
            }
            current = current?.next
        }
        
        print(uniques)
        
        var temp = uniques.first!.value
        uniques.dropFirst()
        
        while !uniques.isEmpty {
            temp.next = uniques.first!.value
            temp = temp.next!
            uniques.dropFirst()
            print(uniques)
        }
        
    }
}

extension NodeG: CustomStringConvertible {
    var description: String {
        let desc = "\(self.data)"
        return desc
    }
}

extension LinkedListG: CustomStringConvertible {
    var description: String {
        var desc = "["
        
        var current = self.head
        
        while current != nil {
            desc += "\(current!.description) -> "
            current = current?.next
        }
        
        desc += "nil]"
        
        return desc
    }
}

var llist = LinkedListG<Int>()
llist.insert(data: 1)
llist.insert(data: 2)
llist.insert(data: 2)
llist.insert(data: 3)
llist.insert(data: 4)
llist.insert(data: 2)
print(llist)

llist.removeDups()
print(llist)


