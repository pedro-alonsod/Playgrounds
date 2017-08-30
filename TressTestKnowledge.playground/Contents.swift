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
}

var bstTest = BSTTree<Int>()

bstTest.insert(data: 10)
bstTest.insert(data: 20)
bstTest.insert(data: 5)
bstTest.inOrder()
print("*****")
bstTest.levelOrder()
