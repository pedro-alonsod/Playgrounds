import UIKit

//MARK:- Algorithms

public class NodeUnion<T: Comparable> {
    
}

var quickFind: [Int] = [Int](repeating: 0, count: 10)

quickFind[1] = 1
quickFind[2] = 1
quickFind[3] = 8
quickFind[4] = 1
quickFind[5] = 1
quickFind[6] = 1
quickFind[7] = 1
quickFind[8] = 1
quickFind[9] = 1

public func connected(p: Int, q: Int) -> Bool {
    return quickFind[p] == quickFind[q]
}

public func union(p: Int, q: Int) {
    let pid = quickFind[p]
    let qid = quickFind[q]
    
    for i in 0..<quickFind.count {
        if quickFind[i] == pid {
            quickFind[i] = qid
        }
    }
}
            //0  1  2  3  4  5
//Forest DS [1, 1, 1, 2, 4, 6]
// too slow
public class QuickUnion {
    private var id:[Int] = []
    
    init(n: Int) {
        for i in 0..<n {
            self.id[i] = i
        }
        
    }
    
    private func root(i: Int) -> Int {
        var i = -1
        while i != id[i] {
            i = id[i]
        }
        return i
    }
    
    public func connected(p: Int, q: Int) -> Bool {
        return root(i: p) == root(i: q)
    }
    
    public func union( p: Int, q: Int) {
        var i = root(i: p)
        var j = root(i: q)
        id[i] = j
    }
}
// with path compression also one line
public class FastQuickUnion {
    private var id:[Int] = []
    private var sz: [Int] = []
    
    init(n: Int) {
        for i in 0..<n {
            self.id[i] = i
            self.sz[i] = 0
        }
        //sz = [Int](repeating: -1, count: n)
        
    }
    
    private func root(i: Int) -> Int {
        var i = 0
        while i != id[i] {
            
            id[i] = id[id[i]] //path compression
            i = id[i]
        }
        return i
    }
    
    public func connected(p: Int, q: Int) -> Bool {
        return root(i: p) == root(i: q)
    }
    
    public func union( p: Int, q: Int) {
        var i = root(i: p)
        var j = root(i: q)
        if i == j {
            return
        }
        if sz[i] < sz[j] {
            id[i] = j
            sz[j] += sz[i]
        } else {
            id[j] = i
            sz[i] += sz[j]
        }
    }
}

//Percolation Exercise
