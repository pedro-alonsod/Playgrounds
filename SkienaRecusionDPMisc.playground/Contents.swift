import UIKit

func fibR(n: Int) -> Int {
    if n == 0 {
        return 0
    }
    if n == 1 {
        return 1
    }
    
    return fibR(n: n-1) + fibR(n: n-2)
}

fibR(n: 20)

func fibSet(n: Int) -> Int {
    var f: [Int] = Array<Int>(repeating: -1, count: n + 1)
    f[0] = 0
    f[1] = 1
    
    func fibC(n: Int) -> Int {
        if f[n] == -1 {
            f[n] = fibC(n: n-1) + fibC(n: n-2)
        }
        return f[n]
    }
    
    return fibC(n: n)
}

fibSet(n: 20)

func fibDP(n: Int) -> Int {
    var i  = 2
    var f = Array<Int>(repeating: -1, count: n+1)
    f[0] = 0
    f[1] = 1
    for i in 2...n {
        f[i] = f[i-1] + f[i-2]
    }
    return f[n]
}

fibDP(n: 20)

func fibLast(n: Int) -> Int {
    var i: Int
    var back2 = 0
    var back1 = 1
    var next: Int
    if n == 0 {
        return 0
    }
    
    for i in 2..<n {
        next = back2 + back1
        back2 = back1
        back1 = next
    }
    return back1 + back2
}

fibLast(n: 20)

func binomial(n: Int, m: Int) -> Int {
    var i: Int
    var j: Int
    var bc: [[Int]] = []
    for i in 0..<n {
        bc[i][0] = 1
    }
    for j in 1..<m {
        bc[j][j] = 1
    }
    for i in 1..<n {
        j = i
        while j < i {
            bc[i][j] = bc[i-1][j-1] + bc[i-1][j]
            j += 1
        }
    }
    return bc[n][m]
}

//binomial(n: 4, m: 2)

func editDist(a: [Character], b:[Character], m: Int, n: Int) -> Int {
    if m == 0 {
        return n
    }
    if n == 0 {
        return m
    }
    if a[m-1] == b[n-1] {
        return editDist(a: a, b: b, m: m-1, n: n-1)
    }
    return 1 + min(editDist(a: a, b: b, m: m, n: n-1), editDist(a: a, b: b, m: m-1, n: n), editDist(a: a, b: b, m: m-1, n: n-1))
}

var a: [Character] = ["a", "b", "c"]
var b: [Character] = ["a", "d"]

editDist(a: a, b: b, m: a.count, n: b.count)

func iSort(a: inout [Int], n: Int) {
    for i in 1..<n {
        var j = i
        while j > 0 && a[j] < a[j-1] {
            swap(&a[j], &a[j-1])
            j -= 1
        }
    }
}

var iSA = [5, 4, 3, 7, 8]
iSort(a: &iSA, n: iSA.count)
