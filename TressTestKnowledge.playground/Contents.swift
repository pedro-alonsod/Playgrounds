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

