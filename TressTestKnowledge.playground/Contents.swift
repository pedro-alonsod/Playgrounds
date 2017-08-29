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
    
    func insert(data: T) {
        
        let newNode = Node<T>(data: data)
        print(newNode.data)
        
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
    
    func printTree(root: Node<T>?) -> String {
        out += "["
        
        if root == nil {
            out += "]"
            return out
        }
        
        self.printTree(root: root?.left)
        self.printTree(root: root?.right)
        out += "-\(root!.data)-"
        return out
    }
}

var testTree = TreeBST<Int>()
testTree.insert(data: 10)
testTree.printTree(root: testTree.root)
testTree.insert(data: 20)
testTree.printTree(root: testTree.root)
testTree.insert(data: 30)
testTree.insert(data: 5)
testTree.insert(data: 1)
print(testTree.printTree(root: testTree.root))

