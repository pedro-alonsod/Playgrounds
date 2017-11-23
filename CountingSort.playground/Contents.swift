import UIKit

let A: [Int] = [0, 1, 2, 3, 4, 0, 1, 2]
let Z: [Int:Character] = [0:"a", 2:"d", 5:"d", 4:"z"]
Z.keys.max()!

//Z
func countingSort(A: [Int]) -> [Int] {
    var c = [Int](repeating: 0, count: A.max()!+1)
    var B = [Int](repeating: 0, count: A.count)
    
    for i in 0..<A.count {
        c[A[i]] += 1
    }
//    print(c)
    for i in 1..<c.count {
        c[i] = c[i-1] + c[i]
    }
//    print(c)
    for i in stride(from: A.count-1, to: -1, by: -1) {
        B[c[A[i]]-1] = A[i]
        c[A[i]] -= 1
    }
    
    return B
}

countingSort(A: A)

var str = "Grant"
var ch = "abc".utf8CString
str = "my str"

var myNum: Double = 7.4843848438437347438388888

myNum

var myAny: Any = 0

print(myAny)

var myBool: Bool = false

var myArr: [Int] = [0, 2, 3, 5, 7, 8]

myArr.append(8)

myArr += [4]

var strArr: [String] = ["ls]", "ls"]

strArr.append("pasta")
strArr += ["wine"]

strArr.count
strArr[2]

var letter: Set<Character> = []
letter.insert("A")

var favs: Set<String> = ["pizza", "cake", "ls"]

favs.capacity
favs.first!

var nameOfInts: [Int:String] = [:]
nameOfInts[2] = "Two"
nameOfInts[9] = "Nine"

nameOfInts[2]

var nameOfNames: [Int:[String]] = [:]
nameOfNames[2] = ["two", "dvah", "deux"]
nameOfNames[2]?[1]

var miNum = 33

if miNum == 33 {
    print("value is \(miNum)")
} else if miNum > 33 {
    print("Not yet")
} else {
    print("nope")
}

switch miNum {
case 33:
    print(miNum)
case 0..<33:
    print("not Yet")
default:
    print("old")
}

for var i in 0..<10  {
    print(i)
    i = i / 2 + 1
}

var number = [1, 2, 3, 4, 5, 6, 7]

for var n in number {
    print(n)
    n += 3
    print(n)
    print(number)
}

var count: Int = 0

while count < 10 {
    print("not yet")
    count += 1
}
var repeatCount = 0

repeat {
    print("not yet")
    repeatCount += 1
} while repeatCount < 10

func checkCount(message: String, endCount: Int) -> String {
    var count: Int = 0
    repeat {
        print(message)
        count += 1
    } while count < endCount
//    print("done......")
    return "completed"
}

var result = checkCount(message: "done send", endCount: 2)
checkCount(message: "done send", endCount: 9)
result

var myStrings: String?
print(myStrings ?? " ")

if let myStrValue = myStrings {
    print(myStrValue)
}

class FastCar {
    var topSpeed = 155
    
    init(topSpeed: Int) {
        self.topSpeed = topSpeed
    }
    
    func getMiddleSpeed() -> Int {
        return self.topSpeed / 2
    }
}

var buggati: FastCar = FastCar(topSpeed: 160)
buggati.getMiddleSpeed()
var ferrari: FastCar = FastCar(topSpeed: 130)
ferrari.getMiddleSpeed()

class Vehicle {
    let numOfWheels = 4
}

class FamilyCar: Vehicle {
    let numOfDoors = 5
}

var myCar = FamilyCar()
myCar.numOfDoors
myCar.numOfWheels

//book pascal

var aP: [Int] = [2, 4, 6, 3, 4, 7, 9]
var sum = 0
for i in 0..<aP.count {
    sum += aP[i]
}

var k = 0
var max = aP[0]
for i in 1..<aP.count {
    if max < aP[i] {
        k = i
        max = aP[i]
    }
}


//TYPE T = RECORD s1: T1; s2: T2; ... sn: Tn END
// var tup: (Int, String, Double)?
// objects
var tup: (Int, [Int]) = (2,[3, 4, 5, 6])

class UnArrCon {
    var a: [Int]
    var nElem: Int = 0
    
    init(size: Int) {
        self.a = Array(repeating: 0, count: size)
        self.nElem = 0
    }
    
    func insert(elem: Int) {
        self.a[nElem] = elem
        self.nElem += 1
    }
    
    func delete(num: Int) -> Bool {
        let findE = self.find(num: num)
        if findE == -1 {
            return false
        } else {
                self.a[findE] = 0
                for i in findE..<nElem-1 {
                    self.a[i] = self.a[i+1]
                }
//                self.a[nElem-1] = 0
                self.nElem -= 1
                return true
        }
    }
    
    func find(num: Int) -> Int {
        var found = -1
        for i in 0..<nElem {
            if self.a[i] == num {
                found = i
                break
            }
        }
        return found
    }
}

var arrT: UnArrCon = UnArrCon(size: 11)
arrT.insert(elem: 2)
arrT.insert(elem: 3)
arrT.insert(elem: 4)
arrT.insert(elem: 10)
arrT.insert(elem: 1)
arrT.insert(elem: 2)
arrT.insert(elem: 3)
arrT.insert(elem: 4)
arrT.insert(elem: 30)
//print(arrT.a)
arrT.insert(elem: 4)
arrT.insert(elem: 40)
print(arrT.a)
arrT.nElem
arrT.delete(num: 40)
print(arrT.a)
arrT.delete(num: 2)
print(arrT.a)
arrT.delete(num: 40)
arrT.a
arrT.find(num: 10)
arrT.find(num: 20)
print(arrT.a)

func catalan(n: Int) -> Int {
    if n == 0 {
//        print("in n = 1")
        return 1
    }
    var count = 0
    for i in 1...n {
        print(("i - 1 \(i-1) n-1 \(n-1)"))
        count += catalan(n: i - 1) * catalan(n: n - i)
    }
    print(count)
    return count
}

catalan(n: 2)

