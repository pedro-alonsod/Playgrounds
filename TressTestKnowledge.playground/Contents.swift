import UIKit

class Node<T: Comparable> {
    var data: T
    var left: Node<T>?
    var right: Node<T>?
    
    init(data: T) {
        self.data = data
    }
}

class TreeBST<T: Comparable> {
    
    var root: Node<T>?
    var out = ""
    var count = 0
    
    func insert(data: T) {
        
        let newNode = Node<T>(data: data)
        print(newNode.data)
        count += 1
        if self.root == nil {
            self.root = newNode
        } else {
            self.inserHelper(node: newNode, root: root)
        }
    }
    
    func inserHelper(node: Node<T>?, root: Node<T>?) {
        
        if root!.data > node!.data {
            if root?.left != nil {
                self.inserHelper(node: node, root: root?.left)
            } else {
                root?.left = node
            }
        } else {
            if root?.right != nil {
                self.inserHelper(node: node, root: root?.right)
            } else {
                root?.right = node
            }
        }
    }
    
    func printTree(node: Node<T>?) -> String {
        out += "["
        
        
        if node == nil {
            out += "]"
            return out
        }
        out += "-\(node!.data)-"
        
        self.printTree(node: node?.left)
        self.printTree(node: node?.right)
        return out
    }
}

var testTree = TreeBST<Int>()
testTree.insert(data: 10)
testTree.printTree(node: testTree.root)
testTree.insert(data: 20)
testTree.printTree(node: testTree.root)
testTree.insert(data: 5)

print(testTree.printTree(node: testTree.root))
testTree.count

//Second attempt done in notebook
class NodeBST<T: Comparable> {
    var data: T
    var left: NodeBST<T>?
    var right: NodeBST<T>?
    
    init(data: T) {
        self.data = data
    }
}

class BSTTree<T: Comparable> {
    var root: NodeBST<T>?
    
    func preOrder() {
        guard root != nil else { return }
        preOrderHelper(node: root)
    }
    func preOrderHelper(node: NodeBST<T>?) {
        if let node = node {
            print("\(node.data)")
            preOrderHelper(node: node.left)
            preOrderHelper(node: node.right)
        }
    }
    
    func inOrder() {
        guard root != nil else { return }
        inOrderHelper(node: root)
    }
    func inOrderHelper(node: NodeBST<T>?) {
        if let node = node {
            inOrderHelper(node: node.left)
            print(node.data)
            inOrderHelper(node: node.right)
        }
    }
    
    func postOrder() {
        guard root != nil else { return }
        postOrderHelper(node: root)
    }
    func postOrderHelper(node: NodeBST<T>?) {
        if let node = node {
            postOrderHelper(node: node.left)
            postOrderHelper(node: node.right)
            print("\(node.data)")
        }
    }
    
    func levelOrder() {
        guard root != nil else { return }
        levelOrderHelper(node: root)
    }
    func levelOrderHelper(node: NodeBST<T>?) {
        var q: [NodeBST<T>] = []
        var tmp: NodeBST<T>?
        guard root != nil else { return }
        q.append(root!)
        while !q.isEmpty {
            tmp = q.removeFirst()
            print("\(tmp!.data)")
            if tmp?.left != nil {
                q.append(tmp!.left!)
            }
            if tmp?.right != nil {
                q.append(tmp!.right!)
            }
        }
    }
    
    func insert(data: T) {
        if root == nil {
            root = NodeBST<T>(data: data)
            root?.left = nil
            root?.right = nil
        } else {
            insertHelper(data: data, node: root)
        }
    }
    func insertHelper(data: T, node: NodeBST<T>?) {
        if data > node!.data {
            if let right = node?.right {
                insertHelper(data: data, node: right)
            } else {
                node!.right = NodeBST<T>(data: data)
                node!.right?.right = nil
                node!.left?.left = nil
            }
        } else {
            if let left = node?.left {
                insertHelper(data: data, node: left)
            } else {
                node!.left = NodeBST<T>(data: data)
                node!.left?.right = nil
                node!.left?.left = nil
            }
        }
    }
    
    func sizeOfTree() -> Int {
        var size = 0
        size = sizeHelper(node: root)
        return size
    }
    func sizeHelper(node: NodeBST<T>?) -> Int {
        if node == nil {
            return 0
        } else {
            return sizeHelper(node: node?.left) + 1 + sizeHelper(node: node?.right)
        }
    }
    func heightOfTree() -> Int {
        var h = 0
        if root == nil {
            return 0
        } else {
            h = heightHelper(node: root)
        }
        return h
    }
    func heightHelper(node: NodeBST<T>?) -> Int {
        if node == nil {
            return 0
        }
        let leftH = heightHelper(node: node?.left)
        let rightH = heightHelper(node: node?.right)
        
        if leftH > rightH {
            return leftH + 1
        } else {
            return rightH + 1
        }
    }
}

var bstTest = BSTTree<Int>()

bstTest.insert(data: 10)
bstTest.insert(data: 20)
bstTest.insert(data: 5)
bstTest.inOrder()
print("*****")
bstTest.levelOrder()
bstTest.sizeOfTree()
bstTest.heightOfTree()

//sum of nested lists
//func sumList(list: List<T>?) -> Int {
//    var res = 0
//    if list == nil || list!.count == 0 {
//        return res
//    }
//    res += helper(list: list, depth: 1)
//    return res
//}
//func helper(list:[[Int]], depth: Int) -> Int {
//    var res = 0
//    for elem in list {
//        if elem.isInteger() {
//            res += elem.getInt() * depth
//        } else {
//            res += helper(list: elem.getList(), depth: depth + 1)
//        }
//        return res
//    }
//}

// RECURSION
func bunnyEars(n: Int) -> Int {
    if n == 0 {
        return 0
    }
    if n == 1 {
        return 2
    }
    if n % 2 == 1 {
        return 2 + bunnyEars(n: n - 1)
    }
    return 3 + bunnyEars(n: n - 1)
}

bunnyEars(n: 2)
bunnyEars(n: 7)

func triangle(n: Int) -> Int {
    if n == 0 {
        return 0
    }
    if n == 1 {
        return 1
    }
    if n == 2 {
        return 3
    }
    return n + triangle(n: n - 1)
}

triangle(n: 2)
triangle(n: 7)

func sumDigits(n: Int) -> Int {
    if n < 10 {
      return n
    }
    return ((n % 10) + sumDigits(n: n / 10))
}

sumDigits(n: 126)
sumDigits(n: 49)
sumDigits(n: 12)

func count7s(n: Int) -> Int {
    if n != 7 && n < 10 {
        return 0
    } else if n == 7 {
        return 1
    } else if n%10 == 7 {
        return count7s(n: n/10) + 1
    } else {
        return count7s(n: n/10)
    }
}

count7s(n: 717)
count7s(n: 7)
count7s(n: 123)

func count8s(n : Int) -> Int {
    if n == 0 {
        return 0
    }
    if n%10 == 8 {
        if ((n/10) % 10 == 8) {
            return 2 + count8s(n: n/10)
        }
        return 1 + count8s(n: n/10)
    }
    return count8s(n: n/10)
}

count8s(n: 8)
count8s(n: 818)
count8s(n: 8818)

func powerN(y: Int, n: Int) -> Int {
    if n == 0 {
        return 1
    }
    if n == 1 {
        return y
    }
    
    return y * powerN(y: y, n: n-1)
}
powerN(y: 3, n: 1)
powerN(y: 3, n: 2)
powerN(y: 3, n: 3)

func countXs(str: String) -> Int {
    var copy = Array(str.characters)
    if copy.count == 0{
        return 0
    }
    if copy.last! == "x" {
        return 1 + countXs(str: String(copy.dropLast()))
    }
    return  countXs(str: String(copy.dropLast()) )
}

countXs(str: "xxhixx")
countXs(str: "xhixhix")
countXs(str: "hi")
func countHis(str: String) -> Int {
    var copy = Array(str)
    if copy.count == 0 {
        return 0
    }
    if copy.last! == "i" && copy[copy.count - 2] == "h" {
        return 1 + countHis(str: String(copy.dropLast()))
    }
    return countHis(str: String(copy.dropLast()))
}

countHis(str: "xhixhix")
countHis(str: "xxhixx")
countHis(str: "hi")

func converToY(str: String) -> String {
    var copy = Array(str)

    if copy.count == 0 {
        return ""
    }
    
    var last = copy.last!
    print(last)
    if last == "x" {
        return converToY(str: String(copy.dropLast())) + "y"
    } else {
        return converToY(str: String(copy.dropLast())) + String(describing: last)
    }
    
    return String(copy.dropLast())
}

converToY(str: "codex")
converToY(str: "xixs")
converToY(str: "xxxxsssssssxxxLlll")

func noX(str: String) -> String {
    var copy = Array(str)
    
    if copy.count == 0 {
        return String(copy)
    }
    var last = copy.last!
    if last == "x" {
        return noX(str: String(copy.dropLast()))
    } else {
        return noX(str: String(copy.dropLast())) + String(describing: last)
    }
}

noX(str: "xaxb")
noX(str: "abc")
noX(str: "xx")

func arr6(arr: [Int], idx: Int) -> Bool {
    if arr.count == 0 {
        return true
    }
    if arr[idx] == 6  {
        return false
    } else {
        return arr6(arr: Array(arr.dropFirst()), idx: idx)
    }
}

arr6(arr: [1, 6, 4], idx: 0)
arr6(arr: [1, 4], idx: 0)
arr6(arr: [6], idx: 0)

func arr11(arr: [Int], idx: Int) -> Int {
    if idx == arr.count {
        return 0
    }
    if arr[idx] == 11 {
        return 1 + arr11(arr: arr, idx: idx+1)
    } else {
        return arr11(arr: arr, idx: idx+1)
    }
}

arr11(arr: [1, 2, 11], idx: 0)
arr11(arr: [11, 11], idx: 0)
arr11(arr: [1, 2, 3, 4], idx: 0)

func arr220(arr: [Int], idx: Int) -> Bool {
    if idx == arr.count - 1  {
        return false
    }
    if arr[idx] * 10 == arr[idx + 1] {
        return true
    }
    return arr220(arr: arr, idx: idx+1)
}

arr220(arr: [1, 2, 20], idx: 0)
arr220(arr: [3, 30], idx: 0)
arr220(arr: [1, 2, 3, 4], idx: 0)

func allStar(str: String) -> String {
    let star = "*"
    let copy = Array(str)
    
    if copy.count == 0 {
        return String(copy)
    }
    
    return allStar(str: String(copy.dropLast())) + String(copy.last!) + star
}
allStar(str: "hello")
allStar(str: "abc")
allStar(str: "ab")

func pairStar(str: String) -> String {
    let star = "*"
    let copy = Array(str)
    
    if copy.count < 2 {
        return String(copy)
    }
    print(copy[0], copy[1])
    if copy[0] == copy[1] {
        print(copy[0], copy[1], "here")
        return String(copy.last!) + star + pairStar(str: String(copy.dropLast()))
    }
    return pairStar(str: String(copy.dropLast())) + String(copy.last!)
}
pairStar(str: "hello")
pairStar(str: "xxyy")
pairStar(str: "aaaa")

func changePi(str: String) -> String {
    let pi = "3.14"
    
    return pi
}

func binomialCoef(n: Int, m: Int) -> Int {
    var i = 0
    var j = 0
    var bc: [[Int]] = [Int](repeatElement([Int](repeatElement(-1, count: m)), count: n))
    print(bc)
    return 0
}
binomialCoef(n: 3, m: 2)
//s--no
//    x--yes
//        i--no
//            x--yes


