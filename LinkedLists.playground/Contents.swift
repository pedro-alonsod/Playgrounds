import UIKit

public class Node<T> {
    var data: T
    var next: Node<T>?
    
    public init(data: T) {
        self.data = data
    }
}

public class LinkedList<T> {
    var head: Node<T>?
    
    public func appendToTail(data: T) {
        let node: Node<T> = Node<T>(data: data)
        
        if head == nil {
            head = node
        } else {
            var current = head
            
            while current?.next != nil {
                current = current?.next
            }
            current?.next = node
        }
    }
}

extension Node: CustomStringConvertible {
    public var description: String {
        var desc = "\(data)"
        
        return desc
    }
}

extension LinkedList: CustomStringConvertible {
    public var description: String {
        var desc = "["
        var current = self.head
        
        while current != nil {
            desc += "\(current!.description)-->"
            current = current?.next
        }
        desc += "nil]"
        
        return desc
    }
}

var dict: [Int:Node<Int>] = [5:Node<Int>(data: 1),4:Node<Int>(data: 2),3:Node<Int>(data: 3)]

print(dict)
print(dict.values.first!)

var lLTest = LinkedList<Int>()
lLTest.appendToTail(data: 1)
lLTest.appendToTail(data: 2)
lLTest.appendToTail(data: 3)
lLTest.appendToTail(data: 5)
print(lLTest)
lLTest.appendToTail(data: 3)
lLTest.appendToTail(data: 1)
print(lLTest)

for (key, value) in dict {
    print(" \(key) \(value)")
}

func removeDups(linkedList: LinkedList<Int>) {
    var dupsSearch: [Int:Node<Int>] = [:]
    var current = linkedList.head
    var previous: Node<Int>? = nil
    
    while current != nil {
        if dupsSearch[current!.data] == nil {
            dupsSearch[current!.data] = current
            previous = current
        } else {
            previous?.next = current?.next
        }
        current = current?.next

        print(dupsSearch)
    }
    print(linkedList)
}

removeDups(linkedList: lLTest)
print(lLTest)

func returnKth(k: Int, linkedList: LinkedList<Int>) -> Node<Int> {
    var current = linkedList.head
    var i = 1
    
    for _ in i..<k {
        current = current?.next
    }
    
    return current!
}

returnKth(k: 4, linkedList: lLTest)

func deleteMiddle(linkedList: LinkedList<Int>) {
    var current = linkedList.head
    var fast = linkedList.head
    var prev: Node<Int>? = nil
    
    while fast != nil  {
        prev = current
        
        current = current?.next
        print(current?.data)
        fast = fast?.next?.next
        
    }
    prev?.next = current?.next
    current?.next = nil
    print(prev)
    print(linkedList)
}

deleteMiddle(linkedList: lLTest)
lLTest.appendToTail(data: 2)
lLTest.appendToTail(data: 1)
lLTest.appendToTail(data: 6)
lLTest.appendToTail(data: 4)
lLTest.appendToTail(data: 7)
lLTest.appendToTail(data: 8)
lLTest.appendToTail(data: 5)
print(lLTest)
func partition(pivot: Int, linkedList: LinkedList<Int>) -> LinkedList<Int>{
    var current = linkedList.head
    var lessLL = LinkedList<Int>()
    var moreLL = LinkedList<Int>()
    
    while current != nil {
        if current!.data < pivot {
            lessLL.appendToTail(data: current!.data)
        } else {
            moreLL.appendToTail(data: current!.data)
        }
        current = current?.next
    }
    print("less: \(lessLL)")
    print("moreLL: \(moreLL)")
    current = lessLL.head
    while current?.next != nil {
        current = current?.next
    }
    
    current?.next = moreLL.head
    return lessLL
}

print(partition(pivot: 5, linkedList: lLTest))

func sumLists(lL1: LinkedList<Int>, lL2: LinkedList<Int>) -> LinkedList<Int> {
    
    var num1: String = ""
    var num2: String = ""
    var forward1 = ""
    var forward2 = ""
    var current1 = lL1.head
    var current2 = lL2.head
    var sumList: LinkedList<Int> = LinkedList<Int>()
    
    while current1 != nil {
        num1.append("\(current1!.data)")
        forward1 = "\(current1!.data)" + forward1
        current1 = current1?.next
    }
    
    while current2 != nil {
        num2.append("\(current2!.data)")
        forward2 = "\(current2!.data)" + forward2
        current2 = current2?.next
    }
    var res: Int = Int(num1)! + Int(num2)!
    Int(String(forward1.characters.reversed()))! + Int(String(forward2.characters.reversed()))!
    
    while res != 0 {
        sumList.appendToTail(data: res % 10)
        res /= 10
    }
    return sumList
}
var lL1 = LinkedList<Int>()
var lL2 = LinkedList<Int>()

lL1.appendToTail(data: 6)
lL1.appendToTail(data: 1)
lL1.appendToTail(data: 7)

lL2.appendToTail(data: 2)
lL2.appendToTail(data: 9)
lL2.appendToTail(data: 5)

sumLists(lL1: lL1, lL2: lL2)
var arr: [Int] = [1, 2, 3]
arr.removeLast()

func palindrome(lLPalindrome: LinkedList<String>) -> Bool {
    var stack: [String] = []
    var current = lLPalindrome.head
    while current != nil {
        stack.append(current!.data); current = current?.next
    }
    current = lLPalindrome.head
    while current != nil {
        if stack.removeLast() == current!.data {
            
        } else {
            return false
        }
        current = current?.next
    }
    
    return true
}

var listPalindrome: LinkedList<String> = LinkedList<String>()
listPalindrome.appendToTail(data: "a")
listPalindrome.appendToTail(data: "b")
listPalindrome.appendToTail(data: "c")
listPalindrome.appendToTail(data: "b")
listPalindrome.appendToTail(data: "a")

var listNoPalidrome: LinkedList<String> = LinkedList<String>()
listNoPalidrome.appendToTail(data: "a")
listNoPalidrome.appendToTail(data: "b")
listNoPalidrome.appendToTail(data: "c")
palindrome(lLPalindrome: listPalindrome)
palindrome(lLPalindrome: listNoPalidrome)

class NodeL<T: Comparable> {
    var data: T
    var next: NodeL<T>?
    
    init(data: T) {
        self.data = data
    }
}

class LinkedList3rd<T: Comparable> {
    var head: NodeL<T>?
    var tail: NodeL<T>?
    var count: Int {
        var c = 0
        if head == nil {
            return c
        } else {
            var current = head
            while current != nil {
                c += 1
                current = current?.next
            }
            return c
        }
    }
    
    func insert(data: T) {
        let item: NodeL<T> = NodeL<T>(data: data)
        
        if head == nil {
            head = item
            tail = item
        } else {
            var current = head
            item.next = head
            head = item
            while current?.next != nil {
                current = current?.next
            }
            
            tail = current
        }
    }
    
    func delete(data: T?) -> Bool {
        guard head != nil else { return false }
        
        var current = head
        var prev: NodeL<T>?
        if data == nil {
            head = current?.next
            current?.next = nil
            return true
        } else {
            while current != nil {
                if current?.next == nil {
                    prev?.next = nil
                    tail = prev
                    return true
                }
                if current?.data == data! {
                    prev?.next = current?.next
                    current?.next = nil
                    return true
                }
                
                prev = current
                current = current?.next
            }
            
            return false
        }
        
    }
    
    func inserAfter(node: T?, data: T) -> Bool {
    
        let nodeA: NodeL<T> = NodeL<T>(data: data)
        var current = head
        var prev: NodeL<T>?
        
        if node == nil {
            nodeA.next = head
            head = nodeA
            return true
        } else {
            while current != nil {
                if current?.next == nil && current!.data == node! {
                    current?.next = nodeA
                    tail = nodeA
                    return true
                }
                if current!.data == node! {
                    nodeA.next = current?.next
                    current?.next = nodeA
                    return true
                }
                prev = current
                current = current?.next
            }
        }
        
        return false
    }
    
    func mthToLast(m: Int) -> NodeL<T>? {
        var idx = count - 1
        guard head != nil else { return nil }
        guard m < count else { return nil }
        var current = head
        while current != nil {
            if idx == m {
                return current
            }
            idx -= 1
            current = current?.next
        }
        
        return nil
    }
    
    func cycles() -> Bool {
        guard head != nil else { return false }
        var slow = head
        var fast = head?.next
        
        while slow != nil {
            if slow === fast {
                return true
            }
            
            if fast == nil || fast?.next == nil {
                return false
            }
            print(fast!.data)
            print(slow!.data)
            fast = fast?.next?.next
            slow = slow?.next
        }
        
        return false
    }
}

extension NodeL: CustomStringConvertible {
    var description: String {
        var desc = "\(self.data) "
        return desc
    }
}

extension LinkedList3rd: CustomStringConvertible {
    var description: String {
        var desc: String = "[ "
        var current = head
        while current != nil {
            desc += "\(current!.data) "
            current = current?.next
        }
        desc += "] [\(String(describing: self.tail?.data))]--> nil"
        return desc
    }
}

var ll3rd: LinkedList3rd<Int> = LinkedList3rd<Int>()

ll3rd.insert(data: 1)
ll3rd.insert(data: 2)
ll3rd.insert(data: 3)
ll3rd.insert(data: 1)
ll3rd.insert(data: 2)
ll3rd.insert(data: 3)
ll3rd.insert(data: 1)
ll3rd.insert(data: 2)
ll3rd.insert(data: 3)
ll3rd.insert(data: 1)
ll3rd.insert(data: 2)
ll3rd.insert(data: 3)
ll3rd.insert(data: 1)
ll3rd.insert(data: 2)
ll3rd.insert(data: 3)

print(ll3rd)

ll3rd.inserAfter(node: 2, data: 4)
print(ll3rd)
ll3rd.inserAfter(node: nil, data: 5)
print(ll3rd)
ll3rd.inserAfter(node: 1, data: 6)


ll3rd.delete(data: 2)
print(ll3rd)
ll3rd.delete(data: nil)
print(ll3rd)
ll3rd.count

var check = ll3rd.mthToLast(m: 2)
while check != nil {
    print(check!)
    check = check?.next
}

print("cycles")
ll3rd.cycles()
print("DSA Book")
class NodeLL<T: Comparable> {
    var value: T
    var next: NodeLL<T>?
    
    init(value: T) {
        self.value = value
    }
}

class LList<T: Comparable> {
    var head: NodeLL<T>?
    var tail: NodeLL<T>?
    
    func add(value: T) {
        let node = NodeLL<T>(value: value)
        if head == nil {
            head = node
            tail = node
        } else {
            tail?.next = node
            tail = node
        }
    }
    
    func contains(value: T) -> Bool {
        var node = head
        
        while node != nil && node!.value != value {
            node = node?.next
        }
        if node == nil {
            return false
        }
        return true
    }
}

extension NodeLL:CustomStringConvertible {
    var description: String {
        var desc = "[ \(value)"
        return desc
    }
}

extension LList: CustomStringConvertible {
    var description: String {
        var desc = "[ "
        var cur = head
        while cur != nil {
//            print("\(cur!.value)-> "
            desc += "\(cur!.value)-> "
            cur = cur?.next
        }
        desc += "nil]"
        return desc
        
    }
}

var bookDSA: LList<Int> = LList<Int>()
bookDSA.add(value: 1)
bookDSA.add(value: 2)
bookDSA.add(value: 3)
print(bookDSA)

bookDSA.contains(value: 3)

