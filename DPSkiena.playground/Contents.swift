import UIKit


func binomialCoef(n: Int, m: Int) -> Int {
   
    var bc = Array(repeating: Array(repeatElement(1, count: m+1)), count: n+1)
    
    for i in 1...n {
        for j in 1..<i {
            bc[i][j] = bc[i-1][j-1] + bc[i-1][j]
        }
    }
    print(bc)
    return bc[n][m]
}
binomialCoef(n: 5, m: 4)

//edit distance DP
struct Cell {
    var cost: Int
    var parent: Int
}
extension Cell: CustomStringConvertible {
    var description: String {
        var desc = "\(self.pos) \(self.parent)"
        return desc
    }
}
let MATCH = 0
let INSERT = 1
let DELETE = 2
var opt: [Int] = [MATCH, INSERT, DELETE]

var m: [[Cell]] = Array(repeating: Array(repeatElement(Cell(cost: 0, parent: 0), count: 20)), count: 20)
print(m)

func stringCompare(s: String, t: String) {
    
    
    for i in 1..<s.count {
        for j in 1..<t.count {
//            opt[MATCH] =
        }
    }
    
}
