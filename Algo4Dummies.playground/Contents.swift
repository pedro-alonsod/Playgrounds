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