import UIKit


class NodeS<T> {
    var data: T
    var next: NodeS<T>?
    
    init(data: T) {
        self.data = data
    }
}

class StackN<T> {
    var top: NodeS<T>?
    
    func push(data: T) {
        let item: NodeS<T> = NodeS<T>(data: data)
        
        if top == nil {
            top = item
        } else {
            var current = top
            item.next = current
            top = item
        }
    }
    
    func pop() -> NodeS<T>? {
        if top == nil {
            return nil
        } else {
            var node = top
            top = top?.next
            node?.next = nil
            
            return node
        }
    }
}

extension StackN: CustomStringConvertible {
    var description: String {
        var desc = "["
        
        var current = top
        
        while current != nil {
            desc += "\(current!.data) "
            current = current?.next
        }
        
        desc += "\n]"
        
        return desc
    }
}

extension NodeS: CustomStringConvertible {
    var description: String {
        var desc = "\(self.data) "
        return desc
    }
}

var s: StackN<Int> = StackN<Int>()
print(s)
s.push(data: 1)
s.push(data: 2)
s.push(data: 3)
s.push(data: 4)

print(s)

s.pop()
print(s)
s.pop()
print(s)
s.pop()
print(s)

class StackA<T> {
    public var stack: [NodeS<T>] = []
    
    func push(data: T) {
        let item = NodeS<T>(data: data)
        self.stack.append(item)
    }
    
    func pop() -> NodeS<T>? {
        if self.stack.count == 0 {
            return nil
        } else {
            var node = self.stack.removeLast()
            
            return node
        }
    }
    
}

print("Stack with array **************")
var sa = StackA<Int>()
sa.push(data: 1)
sa.push(data: 2)
sa.push(data: 3)
print(sa.stack)

sa.pop()
sa.pop()
sa.push(data: 4)
sa.pop()
print(sa.stack)