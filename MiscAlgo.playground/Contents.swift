import UIKit

class LinkedNode<T> {
    var data: T
    var next: LinkedNode<T>?
    
    init(data: T) {
        self.data = data
        self.next = nil
    }
}

class SingleLinkedList<T> {
    var head: LinkedNode<T>? = nil
    var tail: LinkedNode<T>? = nil
    
    func addNode(data: T) {
        let new = LinkedNode<T>(data: data)
        
        if self.head == nil {
            self.head = new
            self.tail = new
        } else {
            new.next = self.head
            self.head = new
        }
    }
    
    func append(data: T) {
        let new = LinkedNode<T>(data: data)
        if self.tail == nil {
            self.head = new
            self.tail = new
        } else {
            self.tail?.next = new
            self.tail = new
        }
    }
}

extension LinkedNode: CustomStringConvertible {
    var description: String {
        var desc = "["
        if self.next != nil {
            desc += "\(self.data) \(self.next!.data)"
        } else {
            desc += "\(self.data)"
        }
        desc += "]"
        return desc
    }
}

var LL: SingleLinkedList<Int> = SingleLinkedList<Int>()
LL.addNode(data: 1)
LL.addNode(data: 2)
LL.addNode(data: 3)
print(LL.head)
