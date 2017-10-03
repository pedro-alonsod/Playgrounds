import UIKit

print("testing the setup")

func sayHello(firstName: Int) -> Void {
    print(firstName)

}

sayHello(firstName: 2 + 5)
// 2 + 5 expresion => 7
//call sayHello(firstName: 7)

func sayHello2(f: (String) -> String) -> Void {
    print(f)
    var test = "Wow functions all around"
     print(f(test))
}

func test(f: String) -> String {
    return f
}

test(f: "pedro")

sayHello2(f: test)

var test: String = "pedro" // value
var secont = 1 // value

func storeAsValue(name: String) -> Void {
    
}

storeAsValue(name: "pedro")

var wow = storeAsValue

wow("pedro")

func sumOfSquares(x: Int, y: Int) -> Int {
    return (x * x) + (y * y)
}

sumOfSquares(x: 2, y: 2)
sumOfSquares(x: 21, y: 2)

func sumOfTriples(x: Int, y: Int) -> Int {
    return (x * x * x) + (y * y * y)
}

sumOfTriples(x: 1, y: 1)
sumOfTriples(x: 2, y: 1)

func square(x: Int) -> Int {
    return x * x
}

func triple(x: Int) -> Int {
    return square(x: x) * x
}

func genericOfSumOfNumbers(x: Int, y: Int, baseFn: (Int) -> Int) -> Int {
    return baseFn(x) + baseFn(y)
}

genericOfSumOfNumbers(x: 21, y: 2, baseFn: square)
genericOfSumOfNumbers(x: 2, y: 1, baseFn: triple)

// x = 21
// y = 2
// baseFn = square
// baseFn(x) + baseFn(y) => square(x) + square(y) => 441 + 4
// functions should do one task f(x) -> y

func getContentents(text: String) -> String {
    var a = text.components(separatedBy: ".")
    var temp = ""
    for (idx, elem) in a.enumerated() {
        temp = "\(temp) \(elem) \n"
    }
    return temp
}
 getContentents(text: "p.e.d.r.o")

func lines(input: String) -> [String] {
    return input.components(separatedBy: CharacterSet.newlines)
}

lines(input: "p \n e ")

func nonFunctionalWay(input: String) -> Int {
    var splittedByNs = getContentents(text: input)
    var convertedIntoarray = lines(input: splittedByNs)
    return convertedIntoarray.count
}

nonFunctionalWay(input: "p.e.d.r.o.")

//getContests: String -> String
//lines: String -> [String]
//count: [String] -> Int

// getContests: String -> String | lines: String -> [String] | count: [String] -> Int
// Funtional Way: String -> Int
var functionalWay = { (data: String) in lines(input: getContentents(text: data)).count }
functionalWay("p.e.d.r.o.")

//f : X -> Y
//g: Y -> Z
// g(f(X)) => Z
infix operator <<<: MultiplicationPrecedence // declaration of new operators

func <<< <A, B, C>(g: @escaping (B) -> C, f: @escaping (A) -> B) -> (A) -> C { // value functions need @scaping and () for arguments g: takes B->C f: A->B
    return { x in g(f(x)) }
}

var funcktionalWay2 = (lines <<< getContentents)
//             String->[String] <<<   String->String
funcktionalWay2("p.e.d.r.o.").count // String->Int

func tablesOfTwo(x: Int) -> Int {
    return x * 2
}
tablesOfTwo(x: 3)
tablesOfTwo(x: 20)

func tablesOfThree(x: Int) -> Int {
    return x * 3
}

tablesOfThree(x: 3)

// 2 * x
// 3 * x
// 15 * x

func genericTables(x: Int) -> (Int) -> Int {
//    func innerFunc(y : Int) -> Int {
//        return x * y
//    }
    return { y in x * y }
}

var tablesOfTwoF = genericTables(x: 2)
var tablesOfThreeF = genericTables(x: 3)
tablesOfTwoF(2)
tablesOfThreeF(3)
//tablesOfTwoF = innerFunc(y : Int) -> Int {
//  return 2 * y
//  }
// inner functions remember the scope where they are defined

//MARK: Currying
func genericTablesCurrying(x: Int) -> (_:Int) -> Int {
    return { (y: Int) -> Int in
        return y * x
    }
}
var tablesOfTwoCurrying = genericTablesCurrying(x: 2)
tablesOfTwoCurrying(3)

//return 3 -> Int in
// return 3 * 2 from closure
// func a(x, y, z)
//aCurrying(z)
//aCurrying x,y remembered
 genericTablesCurrying(x: 2)(3)

func add(x: Int) -> (Int) -> Int {
    return {(y: Int) -> Int in
        return x + y }
}

func divMod(x: Int) -> (Int) -> Int {
    return { (y: Int) -> Int in
        return y % x }
}

// f: Y->Z
// g: Z->X
// 1.- Take an input say x = 6
// 2.- add 2 to x store it in y: 2 + 6
// 3.- now do y % 2: y  % 2 = 0
var addOfTwo = add(x:2) // addofTwo: Int->Int
var divModOfTwo = divMod(x: 2) // divModOfTwo: Int->Int

var ourRequirement = divModOfTwo <<< addOfTwo

ourRequirement(6)

func mapCustom<ElementInput, ElementResult>(elements: [ElementInput], transform: (ElementInput)-> ElementResult) -> [ElementResult] {
    var result: [ElementResult] = []
    
    for elem in elements {
        result.append(transform(elem))
    }
    return result
}

let number = [10, 20, 30, 40]
let result = mapCustom(elements: number, transform: { $0 + 2 })
print(result)

let flatMap = [[2, 3, 4], [5, 6, 7]]
print(flatMap.flatMap { $0 })
let fmapTest = flatMap.flatMap {
    $0.map { $0 + 2 }
}
print(fmapTest)

func custpmFilter<Element>(elements: [Element], predicate: ((Element) -> Bool)) -> [Element] {
    var result: [Element] = []
    for elem in elements {
        if predicate(elem) == true {
            result.append(elem)
        }
    }
    
    return result
}

let filteredNums = custpmFilter(elements: number, predicate: { $0 > 20 })
print(filteredNums)

func customReduce<Element,Value>(elements: [Element], initial: Value, combine: ((Value, Element) -> Value)) -> Value {
    var result = initial
    for elem in elements {
        result = combine(result, elem)
    }
    return result
}

customReduce(elements: number, initial: 0) {
    $0 + $1
}
//MARK: Semigorup
protocol Semigroup {
    func operation(_ element: Self) -> Self
}

extension Int: Semigroup {
    func operation(_ element: Int) -> Int {
        return self + element
    }
}

let testFunc: Int = 5
testFunc.operation(3)

infix operator <>: AdditionPrecedence

func <><S: Semigroup>(x: S, y: S) -> S {
    return x.operation(y)
}

5 <> 3

extension Array: Semigroup {
    func operation(_ element: Array<Element>) -> Array<Element> {
        return self + element
    }
}

print(([1, 2, 3, 4] <> [5, 6, 7]))

extension String: Semigroup {
    func operation(_ element: String) -> String {
        return "\(self)\(element)"
    }
}

"semi".operation("group")

func sconcat<S: Semigroup>(initial: S, elements: [S]) -> S {
    return elements.reduce(initial, <>)
}
sconcat(initial: "", elements: ["A", "B", "C"])

// MARK: Monoid
protocol Monoid: Semigroup {
    static func identiry() -> Self
}

extension Int: Monoid {
    static func identiry() -> Int {
        return 0
    }
}
extension String: Monoid {
    static func identiry() -> String {
        return ""
    }
}
extension Array: Monoid {
    static func identiry() -> Array<Element> {
        return []
    }
}

5 <> Int.identiry()
"A" <> String.identiry()

func mconcat<M: Monoid>(_ elements: [M]) -> M {
    return elements.reduce(M.identiry(), <>)
}

print(mconcat([1, 2, 3]))
print(mconcat(["A", "B", "C"]))

// MARK: Trees
enum Tree<Element: Comparable> {
    case leaft(Element)
    indirect case node(left: Tree, right: Tree)

    static func contains(_ key: Element, tree: Tree<Element>) -> Bool {
        switch tree {
        case .leaft(let element):
            return key == element
        case node(let lhs, let rhs):
            return contains(key, tree:lhs) || contains(key, tree:rhs)
        }
    }
    

}

let functionalTree = Tree.node(left: Tree.leaft("First"), right: Tree.node(left: Tree.leaft("Second"), right: Tree.leaft("Third")))
print(functionalTree)

let secondFT = Tree.node(left: Tree.leaft("Fourth"), right: Tree.leaft("Fifth"))
let thirdFT = Tree.node(left: Tree.node(left: Tree.leaft("Fourth"), right: Tree.leaft("Fifth")), right: functionalTree)
print(thirdFT)
 print(Tree.contains("Third", tree: thirdFT))

//MARK: BST
enum BST<Elemnt: Comparable> {
    case leaf
    indirect case node(left: BST, element: Elemnt, right: BST)
    
    var size: Int {
        switch self {
        case .leaf:
            return 0
        case .node(let left, _, let right):
            return 1 + left.size + right.size
        }
    }
    
    var elements: [Elemnt] {
        switch self {
        case .leaf:
            return []
        case .node(let left, let elem, let righ):
            return left.elements + [elem] + righ.elements
        }
    }
    
    var isEmpty: Bool {
    switch self {
    case .leaf:
        return true
    case .node(_, _, _):
        return false
        }
    }
    
    static func empty() -> BST {
        return .leaf
    }
    
    static func contains(item: Elemnt, tree: BST<Elemnt>) -> Bool {
        switch tree {
        case .leaf:
            return false
        case .node(let left, let element, let right):
            if item < element {
                return contains(item: item, tree: left)
            } else if item > element {
                return contains(item: item, tree: right)
            } else {
                return true
            }
        }
    }
}

let functionalBST = BST.node(left: BST.node(left: BST.leaf, element: 1, right: BST.leaf), element: 5, right: BST.node(left: BST.leaf, element: 9, right: BST.leaf))
let found = BST.contains(item: 9, tree: functionalBST)
let notF = BST.contains(item: 10, tree: functionalBST)
print(functionalBST.size)
print(functionalBST.elements)

let emptyBST = BST<Int>.empty()
print(emptyBST.isEmpty)

infix operator <|: MultiplicationPrecedence
func <|<T>(lhs: T, rhs: LinkedList<T>) -> LinkedList<T> {
    return .node(data: lhs, next: rhs)
}

//LinkedLists
enum LinkedList<Element: Equatable> {
    case end
    indirect case node(data: Element, next: LinkedList<Element>)
    
    
    var size: Int {
        switch self {
        case .end:
            return 0
        case .node(_, let next):
            return 1 + next.size
        }
    }
    
    var elements: [Element] {
        switch self {
        case .end:
            return []
        case .node(let data, let next):
            return [data] + next.elements
        }
    }
    
    var isEmpty: Bool {
        switch self {
        case .end:
            return true
        case .node(_, _):
            return false
        }
    }
    
    // empty
    static func empty() -> LinkedList<Element> {
        return .end
    }
    
    //insert
    func cons(_ element: Element) -> LinkedList<Element> {
        return .node(data: element, next: self)
    }
    
    static func contais(key: Element, list: LinkedList<Element>) -> Bool {
        switch list {
        case .end:
            return false
        case .node(let data, let next):
            if key == data {
                return true
            } else {
                return contais(key: key, list: next)
            }
        }
    }
    
    func map<T>(_ transform: (Element) -> T) -> LinkedList<T> {
        switch self {
            case .end:
                return .end
            case .node(let data, let next):
                return transform(data) <| next.map(transform)
            }
        }
    
    func filter(_ predicate: ((Element) -> Bool)) -> LinkedList<Element> {
        switch self {
        case .end:
            return .end
        case .node(let data, let next):
            return predicate(data) ? data <| next.filter(predicate) :
                next.filter(predicate)
        }
    }
    
    func reduce<Value>(_ initial: Value, combine: (Value, Element) -> Value) -> Value {
            switch self {
            case .end:
                return initial
            case .node(let data, let next):
                return next.reduce(combine(initial, data), combine: combine)
        }
    }
    
    //Satck
    func pop() -> (element: Element, linkedList: LinkedList)? {
        switch self {
        case .node(let data, let next):
            return (data, next)
        case .end:
            return nil
        }
    }
}


let functionalLL = LinkedList<Int>.end.cons(1).cons(2).cons(3)

print(functionalLL)


//let functionalLLWithCons = LinkedList<Int>.end <| 3 <| 2 <| 1 <| .end
let fLLInsert = LinkedList<Int>.end.cons(2).cons(4).cons(5)

let secondLL = functionalLL.cons(6)
let thirdLL = functionalLL.cons(8)
let fourth = LinkedList<Int>.node(data: 45, next: secondLL)

print(fourth)

print(LinkedList.contais(key: 1, list: functionalLL))

print(fourth.size)
print(fourth.elements)

let emptyLL = LinkedList<Int>.end
print(emptyLL.isEmpty)

let mappedLL = functionalLL.map { $0 * 2 }
print(mappedLL)

let filteredFunctionalLL = fourth.filter { $0 % 2 == 1}
print(filteredFunctionalLL, "tst")

let reduceFourth = functionalLL.reduce(0, combine: +)
if let (element, lL) = fourth.pop() {
    print(element)
    let newList = lL.pop()
    print(newList)
}

enum LazyList<Element: Equatable> {
    case end
    case node(data: Element, next: ()-> LazyList<Element>)
    
    var size: Int {
        switch self {
        case .end:
            return 0
        case .node(_, let next):
            return 1 + next().size
        }
    }
    var elements: [Element] {
        switch self {
        case .end:
            return []
        case .node(let data, let next):
            return [data] + next().elements
        }
    }
    
    var isEmpty: Bool {
        switch self {
        case .end:
            return true
        case .node(_, _):
            return false
        }
    }
    
    // empty
    static func empty() -> LazyList<Element> {
        return .end
    }
    
    //insert
    func cons(_ element: Element) -> LazyList<Element> {
        return .node(data: element, next: { self })
    }
    
    func removeLast() -> (element: Element, linkedList: LazyList)? {
        switch self {
            case .node(let data, let next):
                return (data, next())
            case .end:
                return nil
            }
        }

    static func contais(key: Element, list: LazyList<Element>) -> Bool {
        switch list {
        case .end:
            return false
        case .node(let data, let next):
            if key == data {
                return true
            } else {
                return contais(key: key, list: next())
            }
        }
    }

}

infix operator <||: AdditionPrecedence
func <|| <T>(lhs: T, rhs: @autoclosure @escaping () -> LazyList<T>) -> LazyList<T>{
    return .node(data: lhs, next: rhs)
    
}

let lazyList = LazyList<Int>.end.cons(3).cons(2).cons(1)
print("*****")
print(lazyList, "lazy")
