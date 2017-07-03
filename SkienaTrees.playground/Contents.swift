import UIKit

class TreeNode {
    var data: Int
    var parent: TreeNode?
    var left: TreeNode?
    var right: TreeNode?
    
    init(data: Int) {
        self.data = data
    }
}

class BST {
    var root: TreeNode?
    
    func search(c: TreeNode?, t: Int) -> TreeNode? {
        if c == nil {
            return nil
        }
        if c!.data == t {
            return c
        }
        
        if t < c!.data {
            return search(c: c?.left, t: t)
        } else {
            return search(c: c?.right, t: t)
        }
    }
    
    func min(c: TreeNode?) -> TreeNode? {
        var minim: TreeNode?
        
        if c == nil {
            return nil
        }
        
        minim = c
        
        while minim?.left != nil {
            minim = minim?.left
        }
        
        return minim
    }
    
    func inOrder(c: TreeNode?) {
        if c != nil {
            inOrder(c: c?.left)
            print(c!.data)
            inOrder(c: c?.right)
        }
    }
    
    func insert(c: TreeNode?, t: Int, p: TreeNode?) {
        let new = TreeNode(data: t)
        var current = c
        if c == nil {
            new.left = nil
            new.right = nil
            new.parent = p
            current = new
        }
        
        if t < c!.data {
            insert(c: c?.left, t: t, p: c)
        } else {
            insert(c: c?.right, t: t, p: c)
        }
    }
    
    public func insert(data: Int) {
        if self.root == nil {
            self.root = TreeNode(data: data)
            self.root!.left = nil
            self.root!.right = nil
            self.root!.parent = nil
            
        } else {
            insert(data: data, node: root, p: root)
        }
    }
    
    private func insert(data: Int, node: TreeNode?, p: TreeNode?) {
        
        if data < node!.data {
            if let left = node?.left {
                insert(data: data, node: left, p: left)
            } else {
                node?.left = TreeNode(data: data)
                node?.left?.left = nil
                node?.left?.right = nil
                node?.left?.parent = node
            }
        } else if data > node!.data {
            if let right = node?.right {
                insert(data: data, node: right, p: right)
            } else {
                node?.right = TreeNode(data: data)
                node?.right?.left = nil
                node?.right?.right = nil
                node?.right?.parent = node
            }
        }
    }

}
extension TreeNode: CustomStringConvertible {
    var description: String {
        var desc = "\(self.data)"
        return desc
    }
}

extension BST: CustomStringConvertible {
    var description: String {
        var desc = "["
        
        if root == nil {
            desc += "]"
        } else {
            if let left = root?.left {
                desc += "(\(left.description)L) "
            }
            desc += " \(root!.description) "
            if let right = root?.right {
                desc += "(R\(right.description))"
            }
        }
        desc += "]"
         return desc
    }
}

print("Skiena Trees")
var skTree = BST()
skTree.insert(data: 6)
skTree.insert(data: 10)
skTree.insert(data: 5)