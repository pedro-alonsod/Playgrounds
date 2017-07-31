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

//Second Google Question


