import UIKit

class Node<T> {
    var data: T
    var next: Node<T>?
    
    init(data: T) {
        self.data = data
    }
}

class LinkedList<T> {
    var head: Node<T>?
    var tail: Node<T>?
    
    func insert(data: T) {
        let new = Node<T>(data: data)
        if head == nil {
            self.head = new
            self.tail = new
        } else {
            new.next = head
            head = new
        }
    }
    
    func append(data: T) {
        let new = Node<T>(data: data)
        if head == nil {
            self.head = new
            self.tail = new
        } else {
            self.tail?.next = new
            self.tail = new
        }
    }
    
    func reverse() {
        guard self.head != nil else { return }
        
        var next = self.head
        var curr = self.head
        var prev: Node<T>?
        
        while curr != nil {
            next = curr?.next
            curr?.next = prev
            prev = curr
            curr = next
        }
        self.head = prev
        curr = self.head
        
        while curr?.next != nil {
            curr = curr?.next
        }
        tail = curr
    }
    
    func remove(at: Int) -> Node<T>? {
        if head == nil {
            return nil
        }
        var curr = head
        var prev: Node<T>?
        if at == 0 {
            prev = curr
            curr = curr?.next
            head = curr
            prev?.next = nil
            return prev
        }
        
        var listIdx = 0
        while curr != nil {
            if listIdx == at {
                prev!.next = curr?.next
                curr?.next = nil
                return curr
            }
            prev = curr
            curr = curr?.next
            listIdx += 1
        }
        return nil
    }
    
    func printLL() {
        var cur = self.head
        var desc = "["
        while cur != nil {
            desc += "\(cur!.data)-> "
            cur = cur?.next
        }
        desc += "nil]"
        
        print(desc)
    }
}

var linked = LinkedList<Int>()
linked.insert(data: 1)
linked.append(data: 2)
linked.append(data: 3)
linked.printLL()
linked.insert(data: 0)
linked.printLL()
linked.reverse()
linked.printLL()
print(linked.tail!.data)
linked.remove(at: 0)?.data
linked.printLL()
linked.remove(at: 2)?.data
linked.printLL()
linked.tail?.data
