import UIKit


class NodeS<T> {
    var data: T
    var next: NodeS<T>?
    
    init(data: T) {
        self.data = data
    }
}

class StackN<T> {
    var top: NodeS<T>?
    
    func push(data: T) {
        let item: NodeS<T> = NodeS<T>(data: data)
        
        if top == nil {
            top = item
        } else {
            var current = top
            item.next = current
            top = item
        }
    }
    
    func pop() -> NodeS<T>? {
        if top == nil {
            return nil
        } else {
            var node = top
            top = top?.next
            node?.next = nil
            
            return node
        }
    }
}

extension StackN: CustomStringConvertible {
    var description: String {
        var desc = "["
        
        var current = top
        
        while current != nil {
            desc += "\(current!.data) "
            current = current?.next
        }
        
        desc += "\n]"
        
        return desc
    }
}

extension NodeS: CustomStringConvertible {
    var description: String {
        var desc = "\(self.data) "
        return desc
    }
}

var s: StackN<Int> = StackN<Int>()
print(s)
s.push(data: 1)
s.push(data: 2)
s.push(data: 3)
s.push(data: 4)

print(s)

s.pop()
print(s)
s.pop()
print(s)
s.pop()
print(s)

class StackA<T> {
    public var stack: [NodeS<T>] = []
    
    func push(data: T) {
        let item = NodeS<T>(data: data)
        self.stack.append(item)
    }
    
    func pop() -> NodeS<T>? {
        if self.stack.count == 0 {
            return nil
        } else {
            var node = self.stack.removeLast()
            
            return node
        }
    }
    
}

print("Stack with array **************")
var sa = StackA<Int>()
sa.push(data: 1)
sa.push(data: 2)
sa.push(data: 3)
print(sa.stack)

sa.pop()
sa.pop()
sa.push(data: 4)
sa.pop()
print(sa.stack)


class PriorityQueue<T> {
    var PQ: [(Int, T)] = []
    
    private func qSort(pq: [(Int, T)]) -> [(Int, T)] {
        if pq.count == 0 {
            return []
        }
        
        var pivot = pq[Int(arc4random_uniform(UInt32(PQ.count - 1)))]
        var lower = pq.filter { $0.0 < pivot.0 }
        var slower = pq.filter { $0.0 > pivot.0 }
        return qSort(pq: lower) + Array([pivot]) + qSort(pq: slower)
    }
    
    func push(num: Int, ob: T) {
        let item = (num, ob)
        //print(item)
        if PQ.count <= 0 {
            PQ.append(item)
        } else {
            print("item")
            for i in 0..<PQ.count {
                print("\(item.0) <= \(PQ[i].0)")
                if item.0 <= PQ[i].0 {
                    PQ.insert(item, at: i)
                } else {
                    PQ.append(item)
                }
            }
        }
        //        self.PQ.append(item)
//        fixPQ()
//      var temp = qSort(pq: PQ)
    //    self.PQ = qSort(pq: PQ)
    }
    
    private func fixPQ() {
        for i in 0..<PQ.count {
            for j in i..<PQ.count {
//                print("\(PQ[i]) < \(PQ[j])")
                if PQ[i].0 >  PQ[j].0 {
                    //print("less")
                    swap(&PQ[i], &PQ[j])
                }
            }
        }
    }
    
    func pop() -> (Int, T) {
        
        return PQ.removeFirst()
    }
}


extension PriorityQueue: CustomStringConvertible {
    var description: String {
        var desc = "\(self.PQ)"
        return desc
    }
}

var testQueue: PriorityQueue<Double> = PriorityQueue<Double>()

testQueue.push(num: 3, ob: 90.0)
testQueue.push(num: 2, ob: 2.8)
testQueue.push(num: 5, ob: 3.8)
testQueue.push(num: 6, ob: 80)
testQueue.push(num: 7, ob: 60.0)
testQueue.push(num: 2, ob: 50.0)

print(testQueue)

//testQueue.pop()
//testQueue.pop()
//print(testQueue)
//testQueue.push(num: 3, ob: 4.7)
//print(testQueue)
//func getCheapestCost(rootNode: Node) -> Int {
//    let current = rootNode
//    if current.children == nil {
//        return current.data
//    }
//    
//    var lowestCost = 100001
//    
//    for child in current.children! {
//        if child != nil {
//            let cost = getCheapestCost(rootNode: child!)
//            lowestCost = min(cost, lowestCost)
//        }
//    }
//    
//    return lowestCost + current.data
//}
"ooaooaoaoaa slsosos. aiis.".components(separatedBy: CharacterSet(charactersIn: " ."))
