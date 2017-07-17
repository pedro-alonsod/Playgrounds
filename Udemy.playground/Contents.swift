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
tastBub.remove(at: 2)
tastBub.challenge59(n: tastBub)
tastBub.challenge54()
tastBub.challenge56()

func mostCommonName(arr: [String]) -> (name: String, count: Int) {
    var names: [String: Int] = [:]
    
    for elem in arr {
        if names[elem] == nil {
            names[elem] = 1
        } else {
            names[elem]! += 1
        }
    }
    
    var res = names.sorted(by: { $0 < $1 })
    
    return (res[0].key, res[0].value)
}

let names = ["bob", "carly", "jane", "guy", "pit", "pit", "carly", "guy", "bob", "bob", ]
mostCommonName(arr: names)

func reverseEveryOtherWord(srt: String) -> String {
    var arrStr = srt.components(separatedBy: " ")
    
    for i in stride(from: 0, to: arrStr.count, by: 2) {
        arrStr[i] = String(arrStr[i].characters.reversed())
    }
    
    return arrStr.joined(separator: " ")
}
 let strEvery = "lets start today by reversing every other word"
print(reverseEveryOtherWord(srt: strEvery))
var set: Set<Character> = []
set.insert("c").inserted
set.insert("c")

func unique(str: String) -> Bool {
    var unique: Set<Character> = []
    for char in str.characters {
        let res = unique.insert(char)
        if res.inserted == false {
            return false
        }
    }
    
    return true
}

unique(str: "No duplicates")
unique(str: "abcdefghijklmnopqrstuvwxyz")
unique(str: "AaBbCc")

func isPalindrome(str: String) -> Bool {
    return Array(str.uppercased().characters) == Array(str.uppercased().characters.reversed())
}

isPalindrome(str: "rotator")
isPalindrome(str: "Rats live on no evil star")

func sameChars(st1: String, str2: String) -> Bool {
    return Array(st1.characters).sorted() == Array(str2.characters).sorted()
}

sameChars(st1: "abca", str2: "abca")
sameChars(st1: " a1 b2 ", str2: "b 1 a 2")
sameChars(st1: "abc", str2: "abca")

"sssss".range(of: "ss") != nil

extension String {
    func fuzzyContains(str2: String) -> Bool {
        return self.uppercased().range(of: str2.uppercased()) != nil
    }
}
"Hello, world".fuzzyContains(str2: "Hello")
"Hello, world".fuzzyContains(str2: "WORLD")
"Hello, world".fuzzyContains(str2: "Bye")

func countChar(str: String, char: Character) -> Int {
    return Array(str.characters).filter { $0 == char }.count
}

countChar(str: "The rain in Spain", char: "a")
countChar(str: "Mississippi", char: "i")
countChar(str: "Hacking with swift", char: "i")


func removeDups(str: String) -> String {
    var hash: [Character:Int] = [:]
    var res = ""
    
    for char in str.characters {
        if hash[char] == nil {
            hash[char] = 1
            res += String(char)
        }
    }
    return res
}

removeDups(str: "wombat")
removeDups(str: "hello")
removeDups(str: "Mississippi")

func condense(str: String) -> String {
    return str.replacingOccurrences(of: " +", with: " ", options: .regularExpression, range: nil)
}

condense(str: "     a")
condense(str: "a     c")
condense(str: "a     b    c   ")

func rotate(str1: String, str2: String) -> Bool {
    guard str1.characters.count == str2.characters.count else { return false }
    var full = str1 + str2
    return full.contains(str2)
}

func pangrams(str: String) -> Bool {
    let abc = Set(str.lowercased().characters)
    let letter = abc.filter { $0 >= "a" && $0 <= "z" }
    return letter.count == 26
}

func vAndC(str: String) -> (v: Int, c: Int) {
    let vowels = "aeiou"
    var res = (v: 0, c: 0)
    
    for c in str.lowercased().characters {
        if c >= "a" && c <= "z" {
            if vowels.contains(String(c)) {
                res.v += 1
            } else {
                res.c += 1
            }
        }
    }
    return res
}

vAndC(str: "Swift coding Challenges")
vAndC(str: "Mississippi..")

func threeLet(str1: String, str2: String) -> Bool {
    guard str1.characters.count == str2.characters.count else { return false }
    var str2Arr = Array(str2.characters)
    var count = 0
    
    for (idx, c) in str1.characters.enumerated() {
        
        if c != str2Arr[idx] {
            count += 1
        }
        if count > 3 {
            return false
        }
    }
    
    return count < 4
}

threeLet(str1: "Clamp", str2: "Cramp")
threeLet(str1: "Clamp", str2: "Crams")
threeLet(str1: "Clamp", str2: "Grans")
threeLet(str1: "clamp", str2: "maple")

"I am Robert".components(separatedBy: " ").reversed().joined(separator: " ")

func findLargestPrefix(str: String) -> String {
    var arr = str.components(separatedBy: " ")
    let first = arr.first!
    var bestPrefix = ""
    var current = ""
    var prex = true
    
    for c in first.characters {
        current += String(c)
        for elem in arr {
            if !elem.hasPrefix(current) {
                prex = false
            }
        }
        if prex {
            bestPrefix = current
            prex = true
        }
    }
    
    return bestPrefix
}

findLargestPrefix(str: "swim swam sweff sweater")
findLargestPrefix(str: "swift switch swill swim")
findLargestPrefix(str: "flap flip flop")

func encoding(str: String) -> String {
    var arr = Array(str.characters)
    var res = ""
    var first = arr.removeFirst()
    var c = 1
    
    for i in 0..<arr.count {
        if first == arr[i] {
            c += 1
        } else {
            res += "\(first)\(c)"
            first = arr[i]
            c = 1
        }
    }
    res += "\(first)\(c)"
    
    return res
}

encoding(str: "aabbcc")

func permutation(str: String, c: String) {
    let lenght = str.characters.count
    let strArr = Array(str.characters)
    
    if lenght == 0 {
        print(c)
    } else {
        for i in 0..<lenght {
            let left = String(strArr[0..<i])
            let right = String(strArr[i+1..<lenght])
            permutation(str: left + right, c: c + String(strArr[i]))
        }
    }
}

permutation(str: "wombat", c: "")

func reverseWords(str: String) -> String {
    var arr = str.components(separatedBy: " ")
    
    for i in 0..<arr.count {
        arr[i] = String(arr[i].characters.reversed())
    }
    
    return String(arr.joined(separator: " "))
}

func reverseWords2(str: String) -> String {
    var arr = str.components(separatedBy: " ")
    var res = arr.map { String($0.characters.reversed()) }
    
    return String(res.joined(separator: " "))
}

reverseWords2(str: "Swift Coding challenges")
reverseWords2(str: "the quick brown fox")

func fizzBuzz() {
    for i in 1...100 {
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

fizzBuzz()

func random(min: Int, max: Int) -> Int {
    
    return Int(arc4random_uniform(UInt32(max - min + 1))) + min
}

random(min: 2, max: 5)
random(min: 2, max: 5)
random(min: 2, max: 5)
random(min: 2, max: 5)
random(min: 2, max: 5)

func myPow(n: Int, k: Int) -> Int {
    var res = n
    for i in 2...k {
        res *= n
    }
    return res
}

myPow(n: 4, k: 3)
myPow(n: 2, k: 8)

func swapTuples(a: inout Int, b: inout Int) -> (a: Int, b: Int) {
    (b, a) = (a,b)
    return (a,b)
}
var a = 4
var b = 3
swapTuples(a: &a, b: &b)

var tst = "0001"
tst.insert("1", at: tst.startIndex)

func isPrime(n: Int) -> Bool {
    guard n >= 2 else { return false }
    guard n != 2 else { return true  }
    
    let max = Int(ceil(sqrt(Double(n))))
    
    for i in 2...Int.max {
        if n % i == 0 {
            return false
        }
    }
    return true
}

isPrime(n: 16777126)

func bOnes(n: Int) -> (low: Int?, high: Int?) {
    var str = String(n, radix: 2)
    var nOnes = str.characters.filter { $0 == "1" }.count
    var nH: Int?
    var nL:Int?
    for i in n+1...Int.max {
        let cb = String(i, radix:2)
        let co = cb.characters.filter { $0 == "1" }.count
        if nOnes == co {
            nH = i
            break
        }
    }
    
    for i in stride(from: n-1, to: -1, by: -1) {
        let cb = String(i, radix: 2)
        let co = cb.characters.filter { $0 == "1" }.count
        
        if nOnes == co {
            nL = i
            break
        }
    }
    return (nL, nH)
}

bOnes(n: 12)

func binaryReverse(n: UInt) -> String {
    var num = String(n, radix: 2)
    
    while num.characters.count < 8 {
        num.insert("0", at: num.startIndex)
    }
    
    return "\(UInt(String(num.characters.reversed()))!)"
}

binaryReverse(n: 10)

func intAsString(str: String) -> Bool {
    for c in str.characters {
        if Int(String(c)) == nil {
            return false
        }
    }
    return true
}

intAsString(str: "01010101")
intAsString(str: "10.1")
intAsString(str: "9223727218192202093734")

func sumNumStr(str: String) -> Int {
    var letter = ""
    var res = 0
    var arr = Array(str.characters)
    
    for c in arr {
        if Int(String(c)) != nil {
            letter += "\(c)"
        } else {
            res += Int(letter) ?? 0
            letter = ""
        }
    }
    
    res += Int(letter) ?? 0
    
    return res
}

let a1b2c3 = "a10b20c30"
sumNumStr(str: a1b2c3)

func sqroot(n: Int) -> Int {
    var min = 0
    var max = n/2
    var res = 0
    
    while min < max {
        var app = (max + min)/2
        if app * app == n {
            return app
        } else if app * app > n {
            max = app
        } else {
            min = app + 1
        }
        res = app
    }
    return res
}
sqroot(n: 9)
sqroot(n: 16777216)
sqroot(n: 15)
sqroot(n: 16)

func minus(n: Int, k: Int) -> Int {
    return (n + (-k))
}

minus(n: 9, k: 4)
minus(n: 10, k: 20)

func calcDroneMinEnergy(route: [[Int]]) -> Int {
    
    var lastNumber = route[0][2]
    var out = 0
    
    for i in 1..<route.count {
        if lastNumber < route[i][2] {
            
            out -= route[i][2]
            lastNumber = route[i][2]
            print("less \(route[i][2])")
        } else if lastNumber > route[i][2] {
            print("greater \(route[i][2])")
            out += route[i][2]
            lastNumber = route[i][2]
        }
    }
    
    return abs(out)
}
//
//// only need the z coordinate
let route = [ [0,   2, 10],
          [3,   5,  0],
          [9,  20,  6],
          [10, 12, 15],
          [10, 10,  8] ]

print(route[0][2])
calcDroneMinEnergy(route: route)
//out: 5
//
//10 - 5 energy
//0 - +15
//6 - (10 - 6) = 9
//15 - 4 - 9 = 0 // so ok      (here you need 5)
//8 = 7 down + -5 = 7
//
//
//output : 5

extension Array {
    func countDigits(c: String) -> Int {
        var count = 0
        for elem in self {
            var str = String(describing: elem)
            count += str.characters.filter { $0 == Character(c) }.count
        }
        return count
    }
}
[55, 15, 5, 515].countDigits(c: "5")
[55555].countDigits(c: "1")
[55555].countDigits(c: "5")

extension Collection where Iterator.Element: Comparable {
    func nSmallest(c: Int) -> [Iterator.Element] {
        let sorted = self.sorted()
        
        return Array(sorted.prefix(c))
    }
}

extension Collection where Iterator.Element == String {
    func sLenght() -> [Iterator.Element] {
        return self.sorted { $0 > $1 }
    }
}

["a", "ab", "ac"].sLenght()
["paul", "taylor", "adele"].sLenght()

func countKDiff(numbers: [Int], k: Int) -> Int {
    var count = 0
    var j = 0
    for var i in 0..<numbers.count {
        print("\(numbers[i]) \(numbers[j]) == \(numbers[i] - numbers[j]) = \(k) | \(i) \(j)")
        if numbers[i] - numbers[j] == k {
            count += 1
            i += 1
            j += 1
        } else if numbers[i] - numbers[j] < k {
            j += 1
            i -= 1
        } else if numbers[i] - numbers[j] > k  {
            i += 1
        } else {
            i += 1
        }
    }
    
    return count
}

var diffT = [1,1,2,2,3,3]
countKDiff(numbers: diffT, k: 1)

//private static int countAtKDiff(int[] array, int arraySize, int k) {
//    
//    int count = 0; // initialize the counter
//    
//    for (int i = 0, j = 1; i < arraySize && j < arraySize;) {
//        if (array[j] - array[i] == k) { // found a pair
//            count++;
//            i++;
//            j++;
//        } else if (array[j] - array[i] < k) { // difference is less than wanted so increment right pointer
//            j++;
//        } else { // difference is more than wanted so increment the left pointer
//            i++;
//        }
//    }
//    
//    return count;
//}
func missingNum(arr: [Int]) -> [Int] {
        let s: Set<Int> = Set(arr)
        let t = Set<Int>(1...100)
        
        return Array(t.subtracting(s))
}
var h = "hello".data(using: .utf8)!.base64EncodedData()
var d = Data(base64Encoded: h)
var dd = String(bytes: d!, encoding: .utf8)
var sty: String? = nil

var testPP = [1, 5, 3, 4, 2]
func twoPointers(arr: [Int], k: Int) {
    var srtd = arr.sorted()
    var i = 0
    var j = 1
    
    print(srtd)
    while i < srtd.count && j < srtd.count {
        var diff = srtd[j] - srtd[i]
        print("\(srtd[j]) - \(srtd[i]) = \(srtd[j] - srtd[i])")
        print("j: \(j) i: \(i)")
        if diff == k {
            print("\(srtd[j] - srtd[i]) = \(srtd[j] - srtd[i])")
            j = i + 1
            i += 1
            print("one")
        } else if diff < k {
            j += 1
            print(j)
        } else if diff > k {
            i += 1
            print(i)
        }
    }
}

twoPointers(arr: testPP, k: 2)
//func aesEncrypt(key: String, iv: String) throws -> String {
//    let data = self.data(using: .utf8)!
//    let encrypted = try! AES(key: key, iv: iv, blockMode: .CBC, padding: PKCS7()).encrypt([UInt8](data))
//    let encryptedData = Data(encrypted)
//    return encryptedData.base64EncodedString()
//}
//
//func aesDecrypt(key: String, iv: String) throws -> String {
//    let data = Data(base64Encoded: self)!
//    let decrypted = try! AES(key: key, iv: iv, blockMode: .CBC, padding: PKCS7()).decrypt([UInt8](data))
//    let decryptedData = Data(decrypted)
//    return String(bytes: decryptedData.bytes, encoding: .utf8) ?? "Could not decrypt"
//}
