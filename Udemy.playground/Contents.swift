import UIKit

func challenge14(str: String, current: String) {
    let lenght = str.characters.count
    let strArr = Array(str.characters)
    
    if lenght == 0 {
        print(current)
        print("*****")
    } else {
        print(current)
        
        for i in 0..<lenght {
            let left = String(strArr[0..<i])
            let right = String(strArr[i+1..<lenght])
            challenge14(str: left + right, current: current + String(strArr[i]))
        }
    }
}

let wmb = "wombat"
//challenge14(str: wmb, current: "")
func challenge15(str: String) -> String {
    var strArr = str.components(separatedBy: " ")
    var copy = strArr
    var out = ""
    
    copy.map {
        out += String($0.characters.reversed()) + " "
    }
    return out
}

challenge15(str: "Swift coding challenges")

func challenge16(n: Int) {
    for i in 1...n {
        if i % 3 == 0 && i % 5 == 0 {
            print("FizzBuzz")
        } else if i % 3 == 0 {
            print("Fizz")
        } else if i % 5 == 0 {
            print("Buzz")
        } else {
            print(i)
        }
    }
}

challenge16(n: 100)

func challenge17(min: Int, max: Int) -> Int {
    
    return Int(arc4random_uniform(UInt32(max - min + 1))) + min
}

challenge17(min: 5, max: 8)

func challenge18(n: Int, p: Int) -> Int {
    
    var result = 1
    
    for i in 1...p {
        result *= n
    }
    
    return result
}

challenge18(n: 2, p: 8)

func challenge19(a: Int, b: Int) -> (a: Int, b: Int) {
    var out: (Int, Int) = (b, a)
    return out
}

challenge19(a: 2, b: 3)

func challenge20(n: Int) -> Bool {
    guard n >= 2 else { return false }
    guard n != 2 else { return true }
    
    let max = Int(ceil(sqrt(Double(n))))
    
    for i in 2...max {
        if n % i == 0 {
            return false
        }
    }
    return true
}

func challenge21(n: Int) -> (next: Int?, low: Int?) {
    var target = String(n, radix: 2)
    var targetOnes = target.characters.filter { $0 == "1" }.count
    var next: Int? = nil
    var low: Int? = nil
    
    for i in n+1...Int.max {
        var current = String(i, radix: 2)
        var cOnes = current.characters.filter { $0 == "1" }.count
        
        if cOnes == targetOnes {
            next = i
            break
        }
    }
    
    for i in stride(from: n-1, to: -1, by: -1) {
        var current = String(i, radix: 2)
        var cOnes = current.characters.filter { $0 == "1" }.count
        
        if cOnes == targetOnes {
            low = i
            break
        }
    }
    return (next: next, low: low)
}

challenge21(n: 12)

func challenge22(n: Int) -> Int {
    var num = String(n, radix: 2)
    var toPad = Array(num.characters)
    
    while toPad.count < 8 {
        toPad.insert("0", at: 0)
    }
    
    return Int(String(toPad.reversed()), radix: 2)!
}

challenge22(n: 32)

func challenge23(n: String) -> Bool {
    return Int(n) != nil ? true:false
    //check unsigned int
}

challenge23(n: "10.1")

func challenge24(s: String) -> Int {
    var strArr = Array(s.characters)
    var num = ""
    var result = 0
    
    for elem in strArr {
        
        if Int(String(elem)) != nil {
            num += String(elem)
        } else {
            result += Int(num) ?? 0
            num = ""
        }
    }
    
    result += Int(num) ?? 0
    
    return result
}

let c24 = "a3bbb8c"
challenge24(s: c24)

func challenge25(n: Int) -> Int {
    
    var min = 0
    var max = n/2
    var res = 0
    
    while min < max {
        var app = (max - min)/2
        print(app)
        if app * app == n {
            return app
        } else if app * app > n {
            max = app
        } else {
            min = app
        }
        res = app
    }
    return res
}

challenge25(n: 16777216)
sqrt(16777216)

func challenge26(n: Int, p: Int) -> Int {
    
    return p + (~n+1)
    
    //bit manipulation
}

challenge26(n: 5, p: 9)

extension Collection where Iterator.Element == Int {
    
    func challenge37(count: Character) -> Int {
        var total = 0
        
        for e in self {
            let str = String(e)
            
            for c in str.characters {
                if c == count {
                    total += 1
                }
            }
        }
        return total
    }
}

let arrInt = [3, 4, 5, 55, 5555, 6]
arrInt.challenge37(count: "5")

extension Collection where Iterator.Element: Comparable {
    func nSmallest(n: Int) -> [Iterator.Element] {
        let sorted = self.sorted()
        
        return Array(sorted.prefix(n))
    }
}

arrInt.nSmallest(n: 3)

extension Collection where Iterator.Element == String {
    func challenge39() -> [Iterator.Element] {
        
        let sorted = self.sorted { $0 > $1 }
        
        return sorted
    }
}
var arrStr = ["a", "ab", "abc"]
arrStr.challenge39()

func challenge40(i: [Int]) -> [Int] {
    let correctA = Array(1...100)
    let iSet = Set<Int>(i)
    var mis: [Int] = []
    
    for n in correctA {
        
        if !iSet.contains(n) {
            mis.append(n)
        }
    }
    
    return mis
}

extension Collection where Iterator.Element == Int {
    func challenge41() -> Double? {
        guard self.count != 0 else { return nil }
        var sorted = self.sorted()
        
        var mid = sorted.count / 2
        
        if sorted.count % 2 == 0 {
            return Double(sorted[mid] + sorted[mid - 1]) / 2
        } else {
            return Double(sorted[mid])
        }
    }
}

extension Collection where Iterator.Element: Equatable {
    func chalenge42(indexOf search: Iterator.Element) -> Int? {
        for (idx, item) in self.enumerated() {
            if item == search {
                return idx
            }
        }
        return nil
    }
}

class Node<T> {
    var data: T
    var next: Node<T>?
    
    init(data: T) {
        self.data = data
    }
}
class LinkedList<T> {
    var head: Node<T>?
    
    func add(data: T) {
        let newNode = Node<T>(data: data)
        if self.head == nil {
            self.head = newNode
        } else {
            newNode.next = head
            head = newNode
        }
    }
    
    func printLL() {
        var current = head
        var out = ""
        while current != nil {
            out += "\(current!.data) "
            current = current?.next
        }
        print(out)
    }
    
    func printNodes() {
        var current = head
        
        while current != nil {
            print(current!.data, separator: " ", terminator: " ")
            current = current?.next
        }
    }
}

var linked = LinkedList<String>()

for letter in "abcdefghijklmnopqrstuvwxyz".characters {
    linked.add(data: String(letter))
}
linked.printLL()

var second = LinkedList<Character>()
var prev: Node<Character>? = nil

for letter in "abcdefghijklmnopqrstuvwxyz".characters {
    let node = Node<Character>(data: letter)
    if let pred = prev {
        pred.next = node
    } else {
        second.head = node
    }
    prev = node
}
second.printNodes()

extension LinkedList {
    func midPoint() -> Node<T>? {
        var current = head
        var fast = head
        
        guard head != nil else { return nil }
        
        while fast != nil || fast?.next != nil {
            current = current?.next
            fast = fast?.next?.next
        }
        
        return current
    }
}

linked.midPoint()!.data
second.midPoint()!.data