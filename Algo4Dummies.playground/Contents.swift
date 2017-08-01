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
var ABC = "ABC"
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
    if node?.right != nil {
        traverse(node: node!.right)
    }
    print(node!.data)
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
binarySearchIter(arr: bSearch, n: 22)

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
