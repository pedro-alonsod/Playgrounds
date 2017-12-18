import UIKit
func factorial(n: Int) -> Int {
    if n < 2 {
        return 1
    } else {
        return n * factorial(n: n-1)
    }
    
}
print(factorial(n: 4))
//
print(Int(arc4random_uniform(4)), "randomssssss")
print(Int(arc4random_uniform(4)), "randomssssss")
print(Int(arc4random_uniform(4)), "randomssssss")
print(Int(arc4random_uniform(4)), "randomssssss")

//
func fib(n: Int) -> Int {
    if n == 0 {
        return 0
    } else if n == 1 {
        return 1
    } else {
        return fib(n: n-1) + fib(n: n-2)
    }
}
print(fib(n: 20))
//
//
func ackerman(n: Int, m: Int) -> Int {
    if m == 0 {
        return n + 1
    } else if m > 0 && n == 0 {
        return ackerman(n: 1, m: m - 1)
    } else {
        return ackerman(n: ackerman(n: n - 1, m: m), m: m - 1)
    }
}
print(ackerman(n: 2, m: 1))

func palindrome(str: String) -> Bool {
    var l = str.count
    let arr = Array(str)
    
    if l == 0 {
        return true
    }
    if l == 1 {
        return true
    }
    if arr[0] == arr[l - 1] {
        return palindrome(str: String(arr.dropFirst().dropLast()))
    } else {
        return false
    }
}
print(palindrome(str: "EEEEEEEEEEEEE"))
print(palindrome(str: "allen"))
print(palindrome(str: "bob"))
print(palindrome(str: "otto"))
print(palindrome(str: "rediver"))
//def targetSum(array, target):
//# valuesToCheck = dict()
//#
//# for elem in array:
//#     if elem not in valuesToCheck:
//#         valuesToCheck[elem] = target - elem
//#
//# for elem in array:
//#     if valuesToCheck[elem] ==
//#NOT LIKE THIS TargetSum not two sums dumbo!!!!
//if len(array) < 2:
//return False
func targetSumWrapper(A: [Int], target: Int) -> Bool {
    if A.count < 2 {
        return false
    }
    
    return targetSumRec(A: A, T: target, i: 0, sum: 0)
}

func targetSumRec(A: [Int], T: Int, i: Int, sum: Int) -> Bool {
    if i == A.count {
        if sum == T {
            return true
        } else {
            return false
        }
    } else {
        return targetSumRec(A: A, T: T, i: i+1, sum: sum) || targetSumRec(A: A, T: T, i: i+1, sum: sum + A[i])
    }
}

print(targetSumWrapper(A: [1, 2, 3, 4, 5], target: 6))
//#nums [1,2,3,4], t=0
//#you need a wrapper vars [Int], T: Int, i: Int, sum: Int for func [Int], T.-. and is a combination problem use DP FAST
//# if i == nums.count {
//    # return sum == T ? true : false
//    # }
//# return targetSum([Int], T: Int, i: i+1, sum + nums[i])
//return targetSm(array, target, 0, 0)
//
//def targetSm(array, T, i, sum):
//if i == len(array):
//print sum, "sum base"
//if sum == T:
//print "s",True
//return True
//else:
//print  "s", False
//return False
//else:
//print sum, i, array[i], "sum recursive"
//return targetSm(array, T, i+1, sum + array[i]) or targetSm(array, T, i+1, sum)
//targetSum([1, 2, 3, 4, 5], 6)

class MySet<T: Hashable> {
    var myDict: [T:Int] = [:]
    var myArr: [T] = []
    var myIdx = 0
    
    func insert(value: T) {
        if myDict[value] == nil {
            myDict[value] = self.myIdx
            self.myArr.append(value)
            self.myIdx += 1
        }
    }
    
    func remove(value: T) {
        if myDict[value] != nil {
            if value == myArr[self.myArr.count - 1] {
                self.myDict[value] = nil
                self.myArr.removeLast()
                self.myIdx -= 1
            } else {
                var i = self.myDict[value]
                self.myDict[value] = nil
                var last = self.myArr.removeLast()
                self.myArr[i!] = last
                self.myDict[last] = i!
                self.myIdx -= 1
            }
        }
    }
    
    func GetRandom() -> T {
        var r = Int(arc4random_uniform(UInt32(self.myArr.count)))
        return self.myArr[r]
    }
    
    func printMySet() {
        print(self.myDict)
        print(self.myArr)
        print(self.myIdx)
    }
}

var m = MySet<Int>()
m.insert(value: 1)
m.insert(value: 3)
m.insert(value: 6)
m.insert(value: 8)
m.GetRandom()
m.GetRandom()
m.GetRandom()
m.GetRandom()
m.GetRandom()
m.GetRandom()
m.GetRandom()
m.GetRandom()
m.GetRandom()
m.GetRandom()
m.GetRandom()
m.GetRandom()
m.GetRandom()
m.GetRandom()
m.GetRandom()
m.printMySet()
m.insert(value: 8)
m.printMySet()
m.remove(value: 6)
m.printMySet()
m.remove(value: 3)
m.printMySet()
m.remove(value: 8)
m.printMySet()
m.GetRandom()
func fibRec(n: Int) -> Int {
    if n < 2 {
        return 1
    } else {
        return fibRec(n: n-1) + fibRec(n: n-2)
    }
}
//print findFibonacciRec(3)
print(fibRec(n: 3))

func sumRec(n: Int) -> Int {
    if n == 1 {
        return 1
    } else {
        return n + sumRec(n: n - 1)
    }
}
//print sumRec(10)
print(sumRec(n: 10))

func nonTail(n: Int) {
    if n < 3 {
        nonTail(n: n + 1)
    }
    print(n)
    return
}
//print nonTail(1)
print(nonTail(n: 1))

print(["p", "i", "g"][0])
["p", "i", "g"][1..<3]

func pigLatin(str: String, c: Int) -> String {
    if startsWithAVowel(word: str) {
        return str + "ay"
    }
    let arr = Array(str)
    return pigLatin(str: String(arr[1..<arr.count]) + String(arr[0]), c: c+1)
}

func startsWithAVowel(word: String) -> Bool {
    var c = Array(word)[0]
    return c == "a" || c == "e" || c == "i" || c == "o" || c == "u"
}
print(pigLatin(str: "pun", c: 1))
print(pigLatin(str: "scythe", c: 1))

func reverseList(A: [Int]) -> [Int] {
    if A.count <= 1 {
        return A
    } else {
        return reverseList(A: Array(A.dropFirst())) + [A[0]]
    }
}
//print reverseList([1, 2, 3])
print(reverseList(A: [1, 2, 3]))

func reverseArray(A: [Int]) -> [Int] {
    if A.count <= 1 {
        return A
    } else {
        return reverseArray(A: Array(A.dropFirst())) + [A[0]]
    }
}
//reverse_list([1, 2, 3])
print(reverseArray(A: [1, 2, 3]))

func palindrome(word: String) -> Bool {
    var arr = Array(word)
    if arr.count <= 1 {
        return true
    } else if arr[0] != arr[arr.count-1] {
        return false
    } else {
        return palindrome(word: String(arr.dropFirst().dropLast()))
    }
}
//print palindromeXtra("abba")
//print palindromeXtra("level")
print(palindrome(word: "abba"))
print(palindrome(word: "level"))
print(palindrome(word: "abc"))

func numOfDiv(n: Int) -> Int {
    if n < 10 {
        return 1
    } else {
        return 1 + numOfDiv(n: n/10)
    }
}
//print numOfDiv(15105)
print(numOfDiv(n: 15105))

func findMax(A: [Int]) -> Int {
    if A.count <= 1 {
        return A[0]
    } else {
        return max(A[0], findMax(A: Array(A.dropFirst())))
    }
}
//print findMax([1, 4, 6, 3, 5])
print(findMax(A: [1, 4, 6, 3, 5]))

func editDistRecurvive(x: String, y: String) -> Int {
    if x.count == 0 {
        return y.count
    }
    if y.count == 0 {
        return x.count
    }
    2
    var delt = (x.last! != y.last) ? 1:0
    let diag = editDistRecurvive(x: String(x.dropLast()), y: String(y.dropLast())) + delt
    let vert = editDistRecurvive(x: String(x.dropLast()), y: y) + 1
    let horz = editDistRecurvive(x: x, y: String(y.dropLast())) + 1
    return min(diag, vert, horz)
}
//print edDistRecursive("abba","ab_b")
print(editDistRecurvive(x: "abba", y: "ab_b"))
func editDistRecRev(x: String, y: String) -> Int {
    if x.count == 0 {
        return 0
    }
    if y.count == 0 {
        return 0
    }
    /*Here mistake check */
    var delt = (x.first! != y.first!) ? 1:0
    let diag = editDistRecRev(x: String(x.dropFirst()), y: String(y.dropFirst())) + delt
    let vert = editDistRecRev(x: String(x.dropFirst()), y: y) + 1
    let horz = editDistRecRev(x: x, y: String(y.dropFirst())) + 1
    return min(diag, vert, horz)
}
//print edDistRecursiveRev("abba", "ab_b"), "revedit"
print(editDistRecRev(x: "abba", y: "ab_b"), "revedit")

func isPrime(n: Int, i: Int) -> Bool {
    if i == n {
        return true
    } else if n % i == 0 {
        return false
    } else {
        return isPrime(n: n, i: i+1)
    }
}
//print isPrime(14, 2)
print(isPrime(n: 11, i: 2), "true?")
print(isPrime(n: 19, i: 2), "??")

func fromZeroToN(n: Int) -> () {
    if n == 0 {
        return
    } else {
        print(n)
        return fromZeroToN(n: n-1)
    }
}
//fromZeroToN(10)
fromZeroToN(n: 10)

func reverseString(word: String, sum: inout Int) -> String {
    sum = sum + 3
    print(sum, "sum")
    if word.count == 1 {
        return word
    } else {
        return String(word.last!) + reverseString(word: String(word.dropLast()), sum: &sum)
    }
}
var s = 2
print(reverseString(word: "recursion", sum:  &s))

//DP either take it or not
var v = [ 3, 1, 4, 1, 5, 9, 2, 6 ]
func solve(k: Int) -> Int {
    if k == 1 {
        return v[0]
    }
    if k == 2 {
        return max(v[0], v[1])
    }
    return max(solve(k: k-1), v[k-1] + solve(k: k-2))
}

print(solve(k: 7))

pow(3,2)

func randomArray(A: inout [Int]) {
    for i in stride(from: A.count-1, to: -1, by: -1) {
        var space = Int(arc4random_uniform(UInt32(A.count)))
        let tmp = A[space]
        A.swapAt(i, space)
    }
}

print(v)
print(randomArray(A: &v), v)

func logestStream(str: String) -> (Character, Int) {
    var dict: [Character: Int] = [:]
    
    for elem in str {
        if dict[elem] == nil {
            dict[elem] = 1
        } else {
            dict[elem]! += 1
        }
    }
    let outDict = dict.sorted(by: { $0.1 > $1.1 })
    let outTuple = outDict.first!
    print(outDict)
    return outTuple
}

logestStream(str: "aaaaabbbbbbcccccccdddddddddddd")

//List = [1, 2, [1, 2], 1, [1, 2, [1, 2]]], [1, [4, [6]]]
//func sumListLevel(l: List) -> Int {
//    if l.subLists == 0 {
//        var out = 0
//        for e in l {
//            out += (l.getInt() * 1)
//        }
//        return out
//    } else {
//        return sumListLeveHelper(l: l, level: 1)
//    }
//}
//
//func sumSubListLevelHelper(l: List, level: Int) -> Int {
//    var out = 0
//    for elem in l {
//        if let n = l.getInt() {
//            out += (n * level)
//        } else {
//            out += sumSubListLevelHelper(l: elem.getList(), level: level + 1)
//        }
//    }
//    return out
//}



