import UIKit

var A = "A"
A.utf8CString

var tuple = (1,2, (1, 2, 3,(4, 5, 6)))
tuple.2.3
var arr = [tuple]

print(arr.sort(by: {
    $0.1 < $1.1
}))
var tstArr = [5, 6, 7]
tstArr.append(contentsOf: [1, 3, 2])
tstArr.sort()
//from python needs two steps
var matrix = [[Int]](repeatElement([Int](repeatElement(1, count: 10)), count: 10))
print(matrix)

func perm(str: String, current: String) {
    var strArr = Array(str.characters)
    var length = str.characters.count
    
    if length == 0 {
        print("current perm \(current)")
    } else {
        for i in 0..<length {
            let left = String(strArr[0..<i])
            let right = String(strArr[i+1..<length])
            perm(str: left + right, current: current + String(strArr[i]))
        }
    }
}
var ABC = "ABC"
perm(str: ABC, current: "")

print("***")

func factorial(n: Int) -> Int {
    print("Testing factorial of \(n)")
    
    if n == 0 || n == 1 {
        return 1
    }
    
    return n * factorial(n: n - 1)
}

factorial(n: 20)

var tuple1 = (20, "jan")
var tuple2 = (10, "jon")
var tuple3 = (30, "jan")

var arrTuples = [tuple1, tuple2, tuple3]

var dictTuples:[String:(Int, Int)] = [:]

for elem in arrTuples {
    if dictTuples[elem.1] == nil {
        dictTuples[elem.1] = (elem.0, 1)
    } else {
        dictTuples[elem.1]!.1 += 1
    }
}

print(dictTuples)

dictTuples.sorted(by: {
    $0.1.1 < $1.value.1
})

var view1 = UIView()
var view2 = UIView()
var view3 = UIView()
var view4 = UIView()

view1.addSubview(view2)
view1.addSubview(view3)
view3.addSubview(view4)
var desc = ""

// First Question I had with google implement a recursiveDescription in swift
func recursiveSetup() {
    recursiveDesc(view: view1)
    print("\(desc)")
}

func recursiveDesc(view: UIView) {
    desc += "\(view.description) \n"
    
    if view.subviews.count == 0 {
        return
    } else {
        for elem in view.subviews {
            desc += "  --- "
            recursiveDesc(view: elem)
        }
    }
}

recursiveSetup()

//Second Google Question I remeber
var data1 = (timeStamp: 1000, name: "jan")
var data2 = (timeStamp: 1001, name: "jon")
var data3 = (timeStamp: 1002, name: "jen")
var data4 = (timeStamp: 1003, name: "jon")
var data5 = (timeStamp: 1004, name: "jan")

let arrData = [data1, data2, data3, data4, data5]
var dictData: [String:(Int, Int)] = [:]

for elem in arrData {
    if dictData[elem.name] == nil {
        dictData[elem.name] = (elem.timeStamp, 1)
    } else {
        dictData[elem.name]!.1 += 1
        dictData[elem.name]!.0 = elem.timeStamp
    }
}

// here i have the unique names an the count how many times they appear
//now sorte them high to low

let arrSorted = dictData.sorted(by: {
    $0.1.1 > $1.1.1
})

//next print top results

for elem in 0...1 {
    print(arrSorted[elem].key)
}
print(arrSorted)

// Third google question this time was onSite
//[2, 5, 8, 6, 15, 7, 19, 21]
//find the next biggest value e.g. 2 = 8, 8 = 8, 15 = 21

var gArr = [2, 5, 8, 6, 15, 7, 19, 21]

func nextHighest(arr: [Int]) {
    var stack: [Int] = []
    var prev: Int = arr[arr.count-1]
    var current: Int
    stack.append(prev)
    
    for i in stride(from: arr.count-2, to: -1, by: -1) {
        print(arr[i])
        current = arr[i]
        if current > prev {
            stack.append(current)
        } else {
            prev = current
        }
    }
    print(stack)
    
    for elem in arr {
        if elem == stack.last! {
            print("current num: \(elem) next high: \(stack.last!)")
            stack.removeLast()
        } else {
            print("current num: \(elem) next high: \(stack.last!)")
        }
    }
}

nextHighest(arr: gArr)

//Something like that was the one i got stuck more remember Stack2PointersHashDictSortBreathFirstWithQReversePointersBST[]Array[String.characters]!! keep it in your heart those are the methods you should think about
//Next problem is