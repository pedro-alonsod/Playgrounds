import UIKit

class Node<T: Equatable> {
    var data: T
    var next: Node<T>?
    
    init(data: T) {
        self.data = data
        self.next = nil
    }
}

class LinkedList<T: Equatable>  {
    var head: Node<T>?
    
    func insert(data: T) {
        var newNode: Node<T> = Node<T>(data: data)
        if self.head == nil {
            head = newNode
        } else {
            var current = head
            newNode.next = head
            head = newNode
        }
    }
    
    func append(data: T) {
        var newNode = Node<T>(data: data)
        if head == nil {
            head = newNode
        } else {
            var curr = head
            while curr?.next != nil {
                curr = curr?.next
            }
            curr?.next = newNode
        }
    }
    
    func delete(data: T) -> Bool {
        var curr = head
        var prev: Node<T>?
        
        if curr!.data == data {
            head = curr?.next
            curr?.next = nil
            return true
        } else {
            while curr != nil {
                if curr!.data == data {
                    break
                }
                prev = curr
                curr = curr?.next
                
            }
            
            if curr?.next == nil {
                prev?.next = nil
                curr = nil
                return true
            } else {
                prev?.next = curr?.next
                curr?.next = nil
                return true
            }
            
        }
        
        return false
    }
    
    func insert(at index: Int, data: T) {
        var count = 1
        var prev: Node<T>?
        var curr = head
        var newNode = Node<T>(data: data)
        guard curr != nil else { return }
        while curr != nil && count < index {
            prev = curr
            curr = curr?.next
            count += 1
        }
        
        guard curr != nil else {
            print("when trying to reach \(index) does not exist")
            return
        }
        prev?.next = newNode
        newNode.next = curr
    }
    
    func pritnLL() -> String {
        var pl = ""
        var curr = head
        while curr != nil {
            pl += "\(curr!.data)->"
            curr = curr?.next
        }
        pl += "nil"
        
        return pl
    }
    
    func reverse() {
        var next = head
        var current = head
        var prev: Node<T>?
        
        while current != nil {
            next = current?.next
            current?.next = prev
            prev = current
            current = next
        }
        
        head = prev
    }
}

var llTest = LinkedList<Int>()
llTest.insert(data: 2)
llTest.insert(data: 3)
llTest.insert(data: 4)
llTest.append(data: 5)
llTest.pritnLL()

llTest.insert(at: 2, data: 10)
llTest.pritnLL()

llTest.reverse()
llTest.pritnLL()


llTest.delete(data: 5)
llTest.pritnLL()
llTest.delete(data: 4)
llTest.pritnLL()
llTest.delete(data: 2)
llTest.pritnLL()

llTest.insert(at: 10, data: 3)
llTest.pritnLL()

