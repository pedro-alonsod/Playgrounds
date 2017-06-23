import UIKit

class Node {
    var data: Int
    var next: Node?
    
    init(data: Int) {
        self.data = data
    }
}
class LinkedL {
    var head: Node?
    
    func search(c: Node?, t: Int) -> Node? {
        if c == nil {
            return nil
        }
        if c!.data == t {
            return c
        } else {
            return search(c: c?.next, t: t)
        }
    }
    
    func inserHead(data: Int) {
        let new = Node(data: data)
        
        if head == nil {
            head = new
        } else {
            new.next = head
            head = new
        }
    }
    
    func predecessor(c: Node?, t: Int) -> Node? {
        if c == nil || c?.next == nil {
            print("No predecessor")
            return nil
        }
        
        if c?.next!.data == t {
            return c
        } else {
            return predecessor(c:c?.next, t: t)
        }
    }
    
    func delete(t: Int) {
        var d: Node?
        var pred: Node?
        
        d = search(c: head, t: t)
        if d != nil {
            pred = predecessor(c: head, t: t)
            
            if pred == nil {
                head = d?.next
            } else {
                pred?.next = d?.next
            }
        }
    }
}

extension Node: CustomStringConvertible {
    var description: String {
        var desc = "[\(self.data)]"
        return desc
    }
}

extension LinkedL: CustomStringConvertible {
    var description: String {
        var desc = "("
        var current = head
        
        while current != nil {
            desc += "\(current!.description) ->"
            current = current?.next
        }
        
        desc += "nil)"
        
        return desc
    }
}
print("LL Skiena")
var testLL: LinkedL = LinkedL()
testLL.inserHead(data: 1)
testLL.inserHead(data: 3)
testLL.inserHead(data: 4)

testLL.search(c: testLL.head, t: 3)?.description
testLL.search(c: testLL.head, t: 50)

testLL.delete(t: 3)
testLL.delete(t: 4)

