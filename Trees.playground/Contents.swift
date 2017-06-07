import UIKit

public class StackArray<T> {
    public var stack: [T?] = [T?]()
    
    public func push(data: T) {
        self.stack.append(data)
    }
    
    public func pop() -> T? {
        return self.stack.removeLast()
    }
}

public class QueueArray<T> {
    public var queue: [T?] = [T?]()
    
    public func push(data: T) {
        self.queue.append(data)
    }
    
    public func pop() -> T? {
        return self.queue.removeFirst()
    }
}

public class Bag<T> {
    
}

public class TreeNode<T: Comparable> {
    public var data: T
    public var left: TreeNode?
    public var right: TreeNode?
    
    public init(data: T) {
        self.data = data
        self.left = nil
        self.right = nil
    }
}

public class TreeClass<T: Comparable> {
    var root: TreeNode<T>?
    
    public init() {
        self.root = nil
    }
    
    public func insert(data: T) {
        if self.root == nil {
            self.root = TreeNode<T>(data: data)
            self.root!.left = nil
            self.root!.right = nil
            
        } else {
            insert(data: data, node: root)
        }
    }
    
    private func insert(data: T, node: TreeNode<T>?) {
        
        if data < node!.data {
            if let left = node?.left {
                insert(data: data, node: left)
            } else {
                node?.left = TreeNode<T>(data: data)
                node?.left?.left = nil
                node?.left?.right = nil
            }
        } else if data > node!.data {
            if let right = node?.right {
             insert(data: data, node: right)
            } else {
                node?.right = TreeNode<T>(data: data)
                node?.right?.left = nil
                node?.right?.right = nil
            }
        }
    }
    
    public func search(data: T) -> TreeNode<T>? {
    
        return search(data: data, node: self.root)
    }
    
    private func search(data: T, node: TreeNode<T>?) -> TreeNode<T>? {
    
        if node != nil {
            if node!.data == data {
                return node
            } else if data < node!.data {
                return search(data: data, node: node?.left)
            } else {
                return search(data: data, node: node?.right)
            }
            
        }
        
        return nil
        
    }
    
    public func inOrder(node: TreeNode<T>?) {
        if node != nil {
            inOrder(node: node?.left)
            print(node!.data)
            inOrder(node: node?.right)
        }
    }
    
    public func preOrder(node: TreeNode<T>?) {
        if node != nil {
            print(node!.data)
            preOrder(node: node?.left)
            preOrder(node: node?.right)
        }
    }
    
    public func postOrder(node: TreeNode<T>?) {
        if node != nil {
            postOrder(node: node?.left)
            postOrder(node: node?.right)
            print(node!.data)
        }
    }
    
    public func inOrderNoRecursionStack() {
//        1) Create an empty stack S.
//        2) Initialize current node as root
//        3) Push the current node to S and set current = current->left until current is NULL
//        4) If current is NULL and stack is not empty then
//        a) Pop the top item from stack.
//        b) Print the popped item, set current = popped_item->right
//        c) Go to step 3.
//        5) If current is NULL and stack is empty then we are done.
        var inorderStack: StackArray<TreeNode<T>> = StackArray<TreeNode<T>>()
        var current = root
        var done = false
        
        while !done {
            if current != nil {
                inorderStack.push(data: current!)
                current = current?.left
            } else {
                if !inorderStack.stack.isEmpty {
                    current = inorderStack.pop()
                    
                    print(current!.data)
                    current = current?.right
                } else {
                    done = true
                }
            }
        }
    }
    
    public func levelOrderTraversal() {
//        var temp: BtreeNode?
//        var q: QueueArray<BtreeNode> = QueueArray<BtreeNode>()
//        var currentRoot: BtreeNode? = root
//        
//        if currentRoot == nil {
//            return
//        }
//        q.enqueue(currentRoot!)
//        
//        while !q.isEmpty() {
//            temp = q.dequeue()
//            print(temp!.data!)
//            if temp?.left != nil {
//                q.enqueue(temp!.left!)
//            }
//            if temp?.right != nil {
//                q.enqueue(temp!.right!)
//            }
//        }

        var temp: TreeNode<T>?
        var q: QueueArray<TreeNode<T>> = QueueArray<TreeNode<T>>()
        var current = root
        
        if current == nil {
            return
        }
        
        q.push(data: current!)
        
        while !q.queue.isEmpty {
            temp = q.pop()
            print(temp!.data)
            
            if temp?.left != nil {
                q.push(data: temp!.left!)
            }
            if temp?.right != nil {
                q.push(data: temp!.right!)
            }
        }
    }
    
    public func preOrderNoRecursion() {
//        var stack: Stack<BtreeNode>? = Stack<BtreeNode>()
//        var rootInner: BtreeNode<T>? = root
//        while true {
//            while rootInner != nil {
//                print(rootInner!.data! as Any)
//                stack!.push(rootInner!)
//                rootInner = rootInner?.left
//            }
//            
//            if stack!.isEmpty() {
//                break
//            }
//            
//            rootInner = stack!.pop()
//            rootInner = rootInner?.right
//            
//        }

        var s: StackArray<TreeNode<T>> = StackArray<TreeNode<T>>()
        var current = root
        
        while true {
            while current != nil {
                print(current!.data)
                s.push(data: current!)
                current = current?.left
            }
            
            if s.stack.isEmpty {
                break
            }
            
            current = s.pop()
            current = current?.right
        }
    }
    
    public func postOrder() {
//        var stack: Stack<BtreeNode>? = Stack<BtreeNode>()
//        var previous: BtreeNode?
//        var funcRoot: BtreeNode? = root
//        repeat {
//            while funcRoot != nil {
//                stack?.push(funcRoot!)
//                funcRoot = funcRoot?.left
//            }
//            while funcRoot == nil && !stack!.isEmpty() {
//                funcRoot = stack!.top
//                if funcRoot?.right == nil || funcRoot?.right?.data == previous?.data {
//                    print(funcRoot!.data!)
//                    stack?.pop()
//                    previous = funcRoot
//                    funcRoot = nil
//                } else {
//                    funcRoot = funcRoot?.right
//                }
//            }
//        } while !stack!.isEmpty()
        
        var s: StackArray<TreeNode<T>> = StackArray<TreeNode<T>>()
        var previous: TreeNode<T>?
        var current = root
        
        repeat {
            while current != nil {
                s.push(data: current!)
                current = current?.left
            }
            
            while current == nil && !s.stack.isEmpty {
                current = s.pop()
                if current?.right == nil || current?.right?.data == previous?.data {
                    print(current!.data)
                    s.pop()
                    previous = current
                    current = nil
                } else {
                    current = current?.right
                }
            }
        } while !s.stack.isEmpty
        
    }
    
    public func findMax(node: TreeNode<T>?) -> Int {
        var rootVal: Int = 0, max = -100000, leftMax: Int, rightMax: Int, node: TreeNode<T>? = node
        if node != nil {
            rootVal = node!.data as! Int
            
            leftMax = self.findMax(node: node?.left)
            rightMax = self.findMax(node: node?.right)
            
            if leftMax > rightMax {
                max = leftMax
            } else {
                max = rightMax
            }
            if rootVal > max {
                max = rootVal
            }
        }
        return max
    }
    
    public func findMaxNoRecusion() -> Int {
        var max: Int = -1000
        var q: QueueArray<TreeNode<T>> = QueueArray<TreeNode<T>>()
        var temp: TreeNode<T>?
        if root != nil {
            q.push(data: root!)
        }
        
        while !q.queue.isEmpty {
            temp = q.pop()
            if temp!.data as! Int > max {
                max = temp!.data as! Int
            }
            
            if temp?.left != nil {
                q.push(data: temp!.left!)
            }
            if temp?.right != nil {
                q.push(data: temp!.right!)
            }
        }
        
        return max
    }
    
    public func searchNoRecursion(data: T) -> TreeNode<T>? {
        var q: QueueArray<TreeNode<T>> = QueueArray<TreeNode<T>>()
        var current = self.root
        if current != nil {
            q.push(data: current!)
        }
        
        while !q.queue.isEmpty {
            current = q.pop()
            if current!.data == data {
                print("Found")
                return current
            }
            if current?.left != nil {
                q.push(data: current!.left!)
            }
            if current?.right != nil {
                q.push(data: current!.right!)
            }
        }
        print("Not found")
        return nil
    }
    
    public func insertElement(data: T) {
        let node: TreeNode<T> = TreeNode<T>(data: data)
        var q: QueueArray<TreeNode<T>> = QueueArray<TreeNode<T>>()
        var current = root
        
        if current != nil {
            q.push(data: current!)
        }
        while !q.queue.isEmpty {
            current = q.pop()
            if current?.left != nil {
                q.push(data: current!.left!)
            } else if current?.right != nil {
                q.push(data: current!.right!)
            } else {
                if data as! Int > current!.data as! Int {
                        current?.right = node
                } else {
                     current?.left = node
                }
            }
        }
        
    }
    
    public func reverseOrder() {
        var s: StackArray<TreeNode<T>> = StackArray<TreeNode<T>>()
        var q: QueueArray<TreeNode<T>> = QueueArray<TreeNode<T>>()
        var current = root
        if current != nil {
            q.push(data: current!)
        } else {
            return
        }
        
        while !q.queue.isEmpty {
            current = q.pop()
                        if current?.left != nil {
                q.push(data: current!.left!)
            }
            if current?.right != nil {
                q.push(data: current!.right!)
            }
            s.push(data: current!)
        }
        
        while !s.stack.isEmpty {
            print(s.pop()!.data)
        }
    }
    
    public func deleteTree(node: TreeNode<T>?) {
        var node = node
        if node == nil {
            return
        }
        
        deleteTree(node: node?.left)
        deleteTree(node: node?.right)
        
        node = nil
    }
    
}

extension TreeNode: CustomStringConvertible {

    public var description: String {
        var desc = ""
        if let left = left {
            desc += "(\(left.description))L<--"
        }
        desc += "(\(self.data))"
        if let right = right {
            desc += "-->R(\(right.description))"
        }
        
        return desc
    }
}

extension TreeClass: CustomStringConvertible {
    
    public var description: String {
        if root != nil {
            return self.root!.description
        } else {
            return "-"
        }
        
    }
}

var treeClass = TreeClass<Int>()
treeClass.insert(data: 3)
treeClass.insert(data: 2)
treeClass.insert(data: 1)
treeClass.insert(data: 5)
treeClass.insert(data: 4)
print(treeClass)
print("***In***")
treeClass.inOrder(node: treeClass.root)
print("****Pre***")
treeClass.preOrder(node: treeClass.root)
//treeClass.inOrder(node: treeClass.root)
print("***Post***")
treeClass.postOrder(node: treeClass.root)
print("***In Iterative***")
//call
treeClass.inOrderNoRecursionStack()
print("***Pre Iterative***")
//call
treeClass.preOrderNoRecursion()
print("***Post***")
//call
treeClass.preOrderNoRecursion()

var testStack = StackArray<TreeNode<Int>>()
let node5 = TreeNode<Int>(data: 5)
let node2 = TreeNode<Int>(data: 2)
let node4 = TreeNode<Int>(data: 4)

//****stack****
testStack.push(data: node5)
testStack.push(data: node2)
testStack.push(data: node4)
testStack.pop()
testStack.pop()
testStack.pop()

//***Queue***
var testQueue: QueueArray<TreeNode<Int>> = QueueArray<TreeNode<Int>>()
testQueue.push(data: node5)
testQueue.push(data: node2)
testQueue.push(data: node4)

testQueue.pop()
testQueue.pop()
testQueue.pop()

print("****LevelOrderTraversal****")
treeClass.levelOrderTraversal()

print("***find Max BTree***")
print(treeClass.findMax(node: treeClass.root))

print("***find Max BTree No recusion quete level order***")
print(treeClass.findMaxNoRecusion())
print("***search No recusion queue level order***")
treeClass.searchNoRecursion(data: 10)
print("***insert level order***")
treeClass.insertElement(data: 9)
print(treeClass)
print("***reverse Order***")
treeClass.reverseOrder()
print("***Delet tree***")
treeClass.deleteTree(node: treeClass.root)
print(treeClass)

var arr = [1, 2, 4, 5, 6, 7, 888]
//arr[1..<3] = [100, 100, 100]
//arr[1..<3] = [3]
var ar = arr.enumerated().map({(offset: Int, element: Int) -> Int in

    //print(offset)
    if offset > 1 && offset < 5 {
        print(offset)
        return element * 2
    } else {
        return element * 1
    }
})
print(ar)
ar.reserveCapacity(ar.count)
ar.enumerated().forEach({ offset,element in
    
    if offset > 1 && offset < 5 {
        print(offset)
         element * 2
    } else {
        element * 1
    }
})

class TreeNodeBST<T: Comparable> {
    var data: T
    var left: TreeNodeBST<T>?
    var right: TreeNodeBST<T>?
    var parent: TreeNodeBST<T>?
    
    init(data: T) {
        self.data = data
    }
}

class BSTTree<T: Comparable> {
    var root: TreeNodeBST<T>?
    
    func inserNode(data: T) {
        let node = TreeNodeBST<T>(data: data)
        var current = root
        
        if root == nil {
            root = node
            root?.left = nil
            root?.right = nil
        } else {
            insert(node: root, data: data)
        }
    }
    private func insert(node: TreeNodeBST<T>?, data: T) {
        
        if data < node!.data {
            if node?.left != nil {
                insert(node: node?.left, data: data)
            } else {
                var new = TreeNodeBST<T>(data: data)
                new.left = nil
                new.right = nil
                new.parent = node
                node?.left = new
            }
        } else if data > node!.data {
            if node?.right != nil {
                insert(node: node?.right, data: data)
            } else {
                let new = TreeNodeBST<T>(data: data)
                new.left = nil
                new.right = nil
                new.parent = node
                node?.right = new
            }
        }
    }
}

extension TreeNodeBST: CustomStringConvertible {
    var description: String {
        let desc = "((\(String(describing: left)))<--\(data)-->\(String(describing: right)){P:\(String(describing: parent))}"
        return desc
    }
}

extension BSTTree: CustomStringConvertible {
    var description: String {
        return (root?.description)!
    }
}

var bstreetest: BSTTree<Int> = BSTTree<Int>()
bstreetest.inserNode(data: 5)
bstreetest.inserNode(data: 3)
bstreetest.inserNode(data: 6)
print(bstreetest)