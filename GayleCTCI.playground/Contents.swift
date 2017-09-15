import UIKit

//Gayle LinkedLists
class NodeG<T:Hashable> {
    var data: T
    var next: NodeG<T>?
    
    init(data: T) {
        self.data = data
        self.next = nil
    }
}

class LinkedListG<T: Comparable & Hashable> {
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
        var uniques: [T:NodeG<T>?] = [:]
        var curr = head
        var prev: NodeG<T>? = nil
        
        while curr != nil {
            if uniques[curr!.data] == nil {
                uniques[curr!.data] = curr
                prev = curr
            } else {
                prev?.next = curr?.next
            }
            curr = curr?.next
        }
    }
    
    func kToLastNode(k: Int) -> NodeG<T>? {
        
        var p1 = head
        var p2 = head
        
        for i in 0..<k {
            if p1 == nil {
                return nil //k too big
            }
            p1 = p1?.next
        }
        
        while p1 != nil {
            p1 = p1?.next
            p2 = p2?.next
        }
        return p2
    }
    
    func kToLastRecursive(k: Int) {
        kToLastHelper(node: head, k: k)
    }
    
    func kToLastHelper(node: NodeG<T>?, k: Int) -> Int {
        if node == nil {
            return 0
        }
        var index = kToLastHelper(node: node?.next, k: k) + 1
        print(index)
        if index == k {
            print("The k node is \(node!.data)")
        }
        
        return 0
    }
    
    func deleteMiddleNode() {
        var p1 = head
        var p2 = head
        
        
    }
    
    func deleteNode(c: NodeG<T>?) -> Bool{
        if c == nil || c?.next == nil {
            return false
        }
        var new = c?.next
        c!.data = new!.data
        c?.next = new?.next
        return true
        
    }
    
    func partition(k: T) -> LinkedListG<T>? {
        var smaller: LinkedListG<T> = LinkedListG<T>()
        var bigger: LinkedListG<T> = LinkedListG<T>()
        var curr = head
        
        while curr != nil {
            if curr!.data <= k {
                smaller.insert(data: curr!.data)
            } else {
                bigger.insert(data: curr!.data)
            }
            curr = curr?.next
        }
        
        smaller.getLast().next = bigger.head
        
        return smaller
    }
    
    func getLast() -> NodeG<T> {
        var curr = head
        
        while curr?.next != nil {
            curr = curr?.next
        }
        
        return curr!
    }
    
    func sumLists(to: LinkedListG<T>?) -> Int {
        
        return 0
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
llist.partition(k: 1)
llist.removeDups()
llist.kToLastNode(k: 3)
print(llist)


llist.deleteNode(c: llist.head?.next)
print(llist)


