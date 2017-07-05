import UIKit

func challenge2(s: String) -> Bool {
    var c = Array(s.uppercased().characters)
    //print(c.count)
    while c.count >= 1 {
        //print("\(c.first!) \(c.last!)")
        if c.first! != c.last! {
            return false
        } else {
            c = Array(c.dropLast().dropFirst())
        }
        
    }
    
    return true
}

var str: String = "retot"
challenge2(s: str)

func challenge3(s: String, p: String) -> Bool {
    return s.characters.sorted() == p.characters.sorted()
}
var s = "abca"
var p = "cbahha"
challenge3(s: s, p: p)
p.range(of: s, options: .caseInsensitive, range: p.startIndex..<p.endIndex , locale: nil)

var nor = "abcde"
var rot = "eabcdff"
func challenge8(s: String, r: String) -> Bool {
    var check = s + s
    return check.contains(r)
}

challenge8(s: nor, r: rot)

func challenge10(s: String) -> (String, String) {
    var vowels = "AEIOU"
    var countV = 0
    var countC = 0
    
    for c in s.uppercased().characters {
        if vowels.contains(String(c)) {
            countV += 1
        } else {
            countC += 1
        }
    }
    
    return ("\(countV) vowels", "\(countC) consonants")
}

var test10 = "Mississippi".commonPrefix(with: "sip ", options: .caseInsensitive)
challenge10(s: test10)
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
    
    func reverse() {
        var current = head
        var next = current?.next
        var prev: Node<T>? = nil
        
        while current != nil {
            next = current?.next
            current?.next = prev
            prev = current
            current = next
        }
        head = prev
    }
}

var linked = LinkedList<String>()

for letter in "abcdefghijklmnopqrstuvwxyz".characters {
    linked.add(data: String(letter))
}
linked.printLL()
linked.reverse()
print("*****")
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
print("Second")
second.printNodes()
second.reverse()
print("rev")
second.printLL()
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

//func traverse(_ body: Node<T> -> Void) {
//    left?.traverse(body)
//    body(self)
//    right?.traverse(body)
//}


//extends all collections
extension Collection {
    func challenge46<T>(_ tranform: (Iterator.Element) throws -> T) rethrows -> [T] {
        var returnValue = [T]()
        
        for item in self {
            returnValue.append(try tranform(item))
        }
        return returnValue
    }
}

var testMap = [1,2,3].challenge46 { String($0) }

extension Collection where Iterator.Element: Comparable {
    func challenge47a() -> Iterator.Element {
        var lowest: Iterator.Element?
        for item in self {
            if let unwrappedLowest = lowest {
                if item < unwrappedLowest {
                    lowest = item
                }
            } else {
                    lowest = item
                }
            }
        
        return lowest!
    }
    
    func challenge47b() -> Iterator.Element? {
        guard var lowest = self.first else {
            return nil
        }
        
        for item in self {
            if item < lowest {
                lowest = item
            }
        }
        return lowest
    }
}

var testMin = [1, 2, 3, 4].challenge47a()

class dequeue<T> {
    var dq: [T] = []
    var count: Int {
        return dq.count
    }
    
    func pushFront(data: T) {
        dq.insert(data, at: 0)
    }
    
    func pushBack(data: T) {
        dq.append(data)
    }
    
    func popFront() -> T? {
        if dq.isEmpty {
            return nil
        } else {
            return dq.removeFirst()
        }
        
    }
    
    func popBack() -> T? {
        return dq.removeLast()
    }
}

func challenge49(numbers: Int...) -> Int {
    let countedSet = NSCountedSet(array: numbers)
    var sum = 0
    
    for case let item as Int in countedSet {
        if countedSet.count(for: item) % 2 == 0 {
            sum += item
        }
    }
    return sum
}

//
//func getShortestUniqueSubstring(arr: [Character], str: String) -> String {
//    
//    var hash: [Character:Int] = [:]
//    var tail = 0
//    var unique = 0
//    var result = ""
//    
//    for elem in arr {
//        hash[elem] = 0
//    }
//    
//    
//    let strArray = Array(str.characters)
//    
//    for head in 0..<strArray.count {
//        
//        let headChar = str[head]
//        
//        if hash[headChar] == nil {
//            continue
//        }
//        
//        if hash[headChar] == 0 {
//            unique += 1 //+1 2 3
//        }
//        
//        hash[headChar] += 1 //x:+1 y:2 z:1
//        
//        while unique == arr.count {
//            var tmpLength = head - tail + 1 //3 -0 + 1 =4
//            
//            var tmpStr = str.substring(with: (tail...head));
//            if tmpLength == arr.count {
//                return tmpStr
//            }
//            
//            if result == "" || tmpStr.characters.count < result.characters.count {
//                result = tmpStr //xyyz
//            }
//            
//            let tailChar = str[tail] //x
//            
//            if hash[tailChar]! != nil {
//                hash[tailChar] -= 1 //x:0
//                
//                if hash[tailChar] == 0 {
//                    unique -= 1 //2
//                }
//                
//                tail += 1 //1
//            }
//            
//        }
//    }
//    
//    return result
//    
//}
//
//getShortestUniqueSubstring(arr: ["x","y","z"], str: "xyyzyzyx")
////arr = ['x','y','z'], 
////str = "xyyzyzayx"
//
////output = "zayx"
//
////go tru the string checking the character if i find the one
////in the string marked as seen and mover to the next
//
////uniqueCounter
//
////"x y y z y z y x"
////wayne bishop 
protocol Numeric {
    init()
    static func +(lhs: Self, rhs: Self) -> Self
}
extension Int: Numeric {}
extension Float: Numeric {}
extension Double: Numeric {}

func challenge52<T: Numeric>(a: [T]) -> T {
    return a.reduce(T(), +)
}

class BNode<T> {
    var data: T
    var left: BNode<T>?
    var right: BNode<T>?
    
    init(data: T) {
        self.data = data
    }
}

class BTree<T: Comparable> {
    var root: BNode<T>?
    
    init(array: [T]) {
        
    }
//        for item in array {
//            var placed = false
//            
//            if let rootNode = root {
//                
//                var tracker = rootNode
//                
//                while placed == false {
//                    
//                    if item <= tracker.data {
//                        if tracker.left == nil {
//                            
//                            tracker.left = BNode(data: item)
//                            
//                            placed = true
//                        }
//                        tracker = tracker.left!
//                    } else {
//                        if tracker.right == nil {
//                            tracker.right = BNode(data: item)
//                            placed = true
//                        }
//                        tracker = tracker.right!
//                    }
//                } else {
//                    root = BNode(data: item)
//                }
//            }
//        }
//    }
}

extension Array where Element: Comparable {
    mutating func challenge54() -> [Element] {
        for i in 0..<self.count {
            for j in i..<self.count {
                if self[i] > self[j] {
                    swap(&self[i], &self[j])
                }
            }
        }
        
        return self
    }
    
    mutating func challenge56() {
        // Insertion Sort
        for index in 1..<self.count {
            var cv = self[index]
            var position = index
            
            while position > 0 && self[position - 1] > cv {
                self[position] = self[position - 1]
                position -= 1
            }
        self[position] = cv
        }
    }
    
    mutating func challenge59(n: [Element]) -> [Element] {
        if n.count == 1 {
            return n
        }
        if n.count == 0 {
            return []
        }
        let pivot = n[0]
        var less = n.filter { $0 < pivot }
        var more = n.filter { $0 > pivot }
        return challenge59(n: less) + Array([pivot]) + challenge59(n: more)
    }
}

var tastBub = [6, 8, 3, 2, 9, 1, 67, 10, 0]
tastBub.challenge59(n: tastBub)
tastBub.challenge54()
tastBub.challenge56()



