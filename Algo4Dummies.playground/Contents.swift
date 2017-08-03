import UIKit

var A = "A"
A.utf8CString

var tuple = (1,2, (1, 2, 3,(4, 5, 6)))
tuple.2.3
var arr = [tuple]

print(arr.sort(by: {
    $0.1 < $1.1
}))
var tstArr = [5, 6, 7]
tstArr.append(contentsOf: [1, 3, 2])
tstArr.sort()
//from python needs two steps
var matrix = [[Int]](repeatElement([Int](repeatElement(1, count: 10)), count: 10))
print(matrix)

func perm(str: String, current: String) {
    var strArr = Array(str.characters)
    var length = str.characters.count
    
    if length == 0 {
        print("current perm \(current)")
    } else {
        for i in 0..<length {
            let left = String(strArr[0..<i])
            let right = String(strArr[i+1..<length])
            perm(str: left + right, current: current + String(strArr[i]))
        }
    }
}
var ABC = "123"
perm(str: ABC, current: "")

print("***")

func factorial(n: Int) -> Int {
    print("Testing factorial of \(n)")
    
    if n == 0 || n == 1 {
        return 1
    }
    
    return n * factorial(n: n - 1)
}

factorial(n: 20)

var tuple1 = (20, "jan")
var tuple2 = (10, "jon")
var tuple3 = (30, "jan")

var arrTuples = [tuple1, tuple2, tuple3]

var dictTuples:[String:(Int, Int)] = [:]

for elem in arrTuples {
    if dictTuples[elem.1] == nil {
        dictTuples[elem.1] = (elem.0, 1)
    } else {
        dictTuples[elem.1]!.1 += 1
    }
}

print(dictTuples)

dictTuples.sorted(by: {
    $0.1.1 < $1.value.1
})

var view1 = UIView()
var view2 = UIView()
var view3 = UIView()
var view4 = UIView()

view1.addSubview(view2)
view1.addSubview(view3)
view3.addSubview(view4)
var desc = ""

// First Question I had with google implement a recursiveDescription in swift
func recursiveSetup() {
    recursiveDesc(view: view1)
    print("\(desc)")
}

func recursiveDesc(view: UIView) {
    desc += "\(view.description) \n"
    
    if view.subviews.count == 0 {
        return
    } else {
        for elem in view.subviews {
            desc += "  --- "
            recursiveDesc(view: elem)
        }
    }
}

recursiveSetup()

//Second Google Question I remeber
var data1 = (timeStamp: 1000, name: "jan")
var data2 = (timeStamp: 1001, name: "jon")
var data3 = (timeStamp: 1002, name: "jen")
var data4 = (timeStamp: 1003, name: "jon")
var data5 = (timeStamp: 1004, name: "jan")

let arrData = [data1, data2, data3, data4, data5]
var dictData: [String:(Int, Int)] = [:]

for elem in arrData {
    if dictData[elem.name] == nil {
        dictData[elem.name] = (elem.timeStamp, 1)
    } else {
        dictData[elem.name]!.1 += 1
        dictData[elem.name]!.0 = elem.timeStamp
    }
}

// here i have the unique names an the count how many times they appear
//now sorte them high to low

let arrSorted = dictData.sorted(by: {
    $0.1.1 > $1.1.1
})

//next print top results

for elem in 0...1 {
    print(arrSorted[elem].key)
}
print(arrSorted)

// Third google question this time was onSite
//[2, 5, 8, 6, 15, 7, 19, 21]
//find the next biggest value e.g. 2 = 8, 8 = 8, 15 = 21

var gArr = [2, 5, 8, 6, 15, 7, 19, 21]

func nextHighest(arr: [Int]) {
    var stack: [Int] = []
    var prev: Int = arr[arr.count-1]
    var current: Int
    stack.append(prev)
    
    for i in stride(from: arr.count-2, to: -1, by: -1) {
        print(arr[i])
        current = arr[i]
        if current > prev {
            stack.append(current)
        } else {
            prev = current
        }
    }
    print(stack)
    
    for elem in arr {
        if elem == stack.last! {
            print("current num: \(elem) next high: \(stack.last!)")
            stack.removeLast()
        } else {
            print("current num: \(elem) next high: \(stack.last!)")
        }
    }
}

nextHighest(arr: gArr)

//Something like that was the one i got stuck more remember Stack2PointersHashDictSortBreathFirstWithQReversePointersBST[]Array[String.characters]!! keep it in your heart those are the methods you should think about
//Next problem is

//While I try to remember the problems lets try to implement ds

class Stack<T> {
    var s: [T] = []
    
    func push(data: T) {
        s.append(data)
    }
    func pop() -> T? {
        if s.count < 1 {
            return nil
        } else {
            return s.removeLast()
        }
    }
}

var stack = Stack<Int>()
stack.push(data: 2)
stack.push(data: 3)
stack.push(data: 5)
print(stack.s)
stack.pop()
stack.pop()
stack.pop()
stack.pop()
stack.pop()

class Queue<T> {
    var q: [T] = []
    
    func push(data: T) {
        q.append(data)
    }
    func pop() -> T? {
        if q.count < 1 {
            return nil
        } else {
            return q.removeFirst()
        }
    }
}

var Q = Queue<Int>()

Q.push(data: 1)
Q.push(data: 2)
Q.push(data: 3)
print(Q.q)

Q.pop()
Q.pop()
Q.pop()
Q.pop()

class BSTNode<T> {
    var data: T
    var left: BSTNode?
    var right: BSTNode?
    
    init(data: T) {
        self.data = data
    }
    
    func printNode() -> String {
        return "\(self.data)"
    }
}

var tree = BSTNode<String>(data: "Root")
var branchA = BSTNode<String>(data: "BranchA")
var branchB = BSTNode<String>(data: "BranchB")
tree.left = branchA
tree.right = branchB
var leafC = BSTNode<String>(data: "Leaf C")
var leafD = BSTNode<String>(data: "Leaf D")
var leafE = BSTNode<String>(data: "Leaf E")
var leafF = BSTNode<String>(data: "Leaf F")
branchA.left = leafC
branchA.right = leafD
branchB.left = leafE
branchB.right = leafF

func traverse(node: BSTNode<String>?) {
    if node?.left != nil {
        traverse(node: node!.left)
    }
    print(node!.data)
    if node?.right != nil {
        traverse(node: node!.right)
    }
//    print(node!.data)
}

traverse(node: tree)

var graph = ["A":["B", "F"],
             "B":["A", "C"],
             "C":["B", "D"],
             "D":["C", "E"],
             "E":["D", "F"],
             "F":["E", "A"]]

func findPath(grap: [String:[String]], start: String, end: String, path: inout [String]) -> [String]{
    path += [start]
    
    if start == end {
        print("ending \(path)")
        return path
    }
    
    for node in grap[start]! {
        print("Checking node \(node)")
        
        if !path.contains(node) {
            print("path so far \(path)")
            
            var newPath = findPath(grap: grap, start: node, end: end, path: &path)
            
            if newPath.count != 0 {
                return newPath
            }
        }
    }
    
    return []
}
var path: [String] = []
findPath(grap: graph, start: "B", end: "E", path: &path)

//Binary search iterative
func binarySearchIter(arr: [Int], n: Int) -> Bool {
    var sorted = arr.sorted()
    var low = 0
    var high = sorted.count
    print(sorted)
    while low != high {
        
        print(low, high)
        var mid = (low + high)/2
        
        print(sorted[mid],mid,low, high)
        if sorted[mid] == n {
            print("found \(sorted[mid])")
            return true
        }
        if n > sorted[mid] {
            low = mid + 1
        } else {
            high = mid 
        }
    }
    
    return false
}

var bSearch = [2, 3, 56, 67, 67, 56, 40, 68, 99, 4, 40, 20, 50, 30, 50, 10]
binarySearchIter(arr: bSearch, n: 4)

func binarySearch(arr: [Int], n: Int) -> Bool {
    var sorted = arr.sorted()
    
    var mid = arr.count-1
    print(sorted[mid], mid)
    print(sorted)
    if sorted.count <= 1 {
        return false
    }
    if sorted[mid] == n {
        print("gotcha")
        return true
    } else if n < sorted[mid] {
        return binarySearch(arr: Array(sorted[0..<mid]), n: n)
    } else if n > sorted[mid] {
        return binarySearch(arr: Array(sorted[mid..<sorted.count]), n: n)
    }
    return false
    
}

binarySearch(arr: bSearch, n: 4)
var sArray = [2,5,6,7,8,9,3,4,2,6,4,4]
//Selection sort
func sSort(arr: [Int]) -> [Int] {
    var copy = arr
    
    for scanIndex in 0..<copy.count {
        
        var minIndex = scanIndex
        
        for compIndex in scanIndex+1..<copy.count {
            
            if copy[compIndex] < copy[minIndex] {
                
                minIndex = compIndex
            }
            
            if minIndex != scanIndex {
                swap(&copy[minIndex], &copy[scanIndex])
            }
        }
    }
    return copy
}

print(sSort(arr: bSearch))
print(bSearch)

//InsertionSort
func iSort(arr: [Int]) -> [Int] {
    var copy = arr
    
    for index in 1..<copy.count {
        var tmp = copy[index]
        var minIndex = index
        
        while minIndex > 0 && tmp < copy[minIndex - 1] {
            copy[minIndex] = copy[minIndex - 1]
            minIndex -= 1
        }
        
        copy[minIndex] = tmp
        print(copy)
    }
    
    return copy
}

iSort(arr: sArray)

// MergeSort
func mergeSort(arr: [Int]) -> [Int] {
    if arr.count < 2 {
        return arr
    }
    
    let mid = arr.count/2
    let left = mergeSort(arr: Array(arr[0..<mid]))
    let right = mergeSort(arr: Array(arr[mid..<arr.count]))
    
    return merge(left: left, right: right)
}

func merge(left: [Int], right: [Int]) -> [Int] {
    if left.count < 1 {
        return left
    }
    if right.count < 1 {
        return right
    }
    
    var result: [Int] = []
    var leftIdx = 0
    var rightIdx = 0
    let total = left.count + right.count
    
    while result.count < total {
        if left[leftIdx] < right[rightIdx] {
            result.append(left[leftIdx])
            leftIdx += 1
        } else {
            result.append(right[rightIdx])
            rightIdx += 1
        }
        print(leftIdx, rightIdx, total)
        if leftIdx == left.count || rightIdx == right.count {
            
            result += (left.count == leftIdx) ? right:left
        }
    }
    return result
}

mergeSort(arr: sArray)
sArray

// QuickSort
func qSort(arr: [Int]) -> [Int] {
    if arr.count == 0 {
        return []
    }
    if arr.count == 1 {
        return arr
    }
    if arr.count == 2 {
        return arr
    }
    let pivot = arr[0]
    print("pivot: \(pivot)")
    var less = arr.filter({ $0 < pivot })
    var more = arr.filter({ $0 > pivot })
    print(less, more, pivot)
    
    return qSort(arr: less) + [Int]([pivot]) + qSort(arr: more)
}

qSort(arr: sArray)
sArray


var hashTable = [Int?](repeating: nil, count: 15)
func hashFunc(value: Int, tblSize: Int) -> Int {
    return value % tblSize
}
for v in [2, 3, 4, 6, 5] {
    hashTable[hashFunc(value: v, tblSize: hashTable.count)] = v
}

print(hashTable)
print(hashTable[hashFunc(value: 6, tblSize: hashTable.count)])

//To graphs
class Vertex {
    var data: String
    var edges: [Edge]
    
    init(data: String) {
        self.data = data
        self.edges = []
    }
    
    init() {
        self.data = "E"
        self.edges = []
    }
}

class Edge {
    var weight: Int
    var neighbor: Vertex
    
    init(weight: Int, neighbor: Vertex) {
        self.weight = weight
        self.neighbor = neighbor
    }
    
    init() {
        self.weight = 0
        self.neighbor = Vertex()
    }
}

public class SwiftGraph {
    
    private var canvas: Array<Vertex>
    public var isDirected: Bool
    
    init() {
        canvas = Array<Vertex>()
        isDirected = true
    }
    
    //create a new vertex
    func addVertex(key: String) -> Vertex {
        
        //set the key
        var childVertex: Vertex = Vertex()
        childVertex.data = key
        
        
        //add the vertex to the graph canvas
        canvas.append(childVertex)
        
        return childVertex
    }
    
}

var message = "find you will pain only go you recordings security the into if"

message.components(separatedBy: " ").reversed().joined(separator: " ")

var idx = Int(arc4random_uniform(UInt32(bSearch.count - 0))) + 0
bSearch[idx]
print(bSearch)

func maxPalindrome(arr: [Int]) -> Int {
    var maxLeght = 0
    var oddPresent = false
    var dictCounts: [Int:Int] = [:]
    
    for elem in arr {
        
        if dictCounts[elem] == nil {
            dictCounts[elem] = 1
        } else {
            dictCounts[elem]! += 1
        }
    }
    
    for row in dictCounts {
        if row.value % 2 == 0 {
            maxLeght += 2
        } else {
            oddPresent = true
        }
    }
    
    if oddPresent == true {
        maxLeght += 1
    }
    
    return maxLeght
}

maxPalindrome(arr: [1,2,4,1])

var negArr = Array(-10 ... -1)
var zeroTwo = Array(0 ... 2)
var fourTen = Array(4 ... 10)

var merge = Array(-5 ... 1)

func mergeIntervals(arr1: [Int], arr2: [Int], arr3: [Int], newArr: [Int]) -> [Int] {
    
    var result: [Int] = []
    
    for i in arr1 {
        if result.contains(i) {
            
        } else {
            result.append(i)
        }
    }
    
    for i in arr2 {
        if result.contains(i) {
            
        } else {
            result.append(i)
        }
    }
    for i in arr3 {
        if result.contains(i) {
            
        } else {
            result.append(i)
        }
    }
    for i in newArr {
        if result.contains(i) {
            
        } else {
            result.append(i)
        }
    }
    
    return result
}

mergeIntervals(arr1: negArr, arr2: zeroTwo, arr3: fourTen, newArr: merge)

// fibonacciesque ******

//**** Prent of btree in arrays (i-1)/2 if 0 based else i + (root - 1)] /
var btree = [20, 10, 30, 5, 45, 1, 50]

btree.index(of: 10)

func parent(of: Int, inArr: [Int]) -> Int? {
    
    if of > 0 {
        var parentIdx = (inArr.index(of: of)! - 1)/2  //(i-1)/2
    
        return inArr[parentIdx]
    } else {
        return nil
    }
    
    //Apple problem -sort them no need,- and do a for loop searching for the parent [String]
}

parent(of: 1, inArr: btree)

//func countCombinations(n: Int) -> Int {
//    if n == 1 {
//        return 1
//    }
//    if n == 2 {
//        return 2
//    }
//    if n == 3 {
//        return 3
//    }
//    var s3 = 1
//    var s2 = 2
//    var s1 = 3
//    var s = 0
//    
//    for i in 3...n {
//        s = s1 + s2 + s3
//        s3 = s2
//        s2 = s1
//        s1 = s
//    }
//    
//    return s
//}
//I think wrong

//def count_comb(n):
//if n < 0:
//return 0
//
//if n == 0:
//return 1
//
//return count_comb(n-1) + count_comb(n-2) + count_comb(n-3)
func countComb(n: Int) -> Int {
    if n < 1 {
        return 1
    }
    if n == 1 {
        return 1
    }
    if n == 2 {
        return 2
    }
    if n == 3 {
        return 4
    }
    return countComb(n: n-1) + countComb(n: n-2) + countComb(n: n-3)
}
countComb(n: 10)
//countCombinations(n: 10)

func mirrorTree(node: BSTNode<Int>?) {
    if node == nil {
        return
    } else {
        mirrorTree(node: node?.left)
        mirrorTree(node: node?.right)
        
        var tmp = node?.left
        node?.left = node?.right
        node?.right = tmp
        
    }
}

func editDistance(str1: String, str2: String, m: Int, n: Int) -> Int {
    var str1Arr = Array(str1.characters)
    var str2Arr = Array(str2.characters)
    
    if m == 0 {
        return n
    }
    if n == 0 {
        return m
    }
    if str1Arr[m-1] == str2Arr[n-1] {
        return editDistance(str1: str1, str2: str2, m: m-1, n: n-1)
    }
    
    return 1 + min(editDistance(str1: str1, str2: str2, m: m-1, n: n),
                  editDistance(str1: str1, str2: str2, m: m, n: n-1),
                  editDistance(str1: str1, str2: str2, m: m-1, n: n-1))
}

//Shuffle
bSearch
for i in 0..<bSearch.count {
    var j = Int(arc4random_uniform(UInt32(bSearch.count - 0))) + 0
    if i == j {
        continue
    }
    swap(&bSearch[i], &bSearch[j])
}
bSearch
// if all differents is ok if repeated no weird with one 2 times repeates is ok hmm nope still uniques
qSort(arr: bSearch)

//recursiveLinearSearch
func recursiveLinearSearch(arr: [Int], k: Int) -> [Int] {
    if arr.count == 0 {
        print("Not found")
        return []
    }
    if arr.first! == k {
        print("Found")
        return arr
    }
    
    print("Lookin at \(arr.first!)")
    
    return recursiveLinearSearch(arr: Array(arr.dropFirst()), k: k)
}

recursiveLinearSearch(arr: bSearch, k: 100)
