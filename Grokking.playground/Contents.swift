import UIKit

class Queue {
    var queue: [[String]] = []
    
    func enqueue(name: [String]) {
        self.queue.append(name)
    }
    
    func dequeu() -> [String] {
        return self.queue.removeFirst()
    }
}

func binanrySearch(a: [Int], item: Int) -> Int? {
    var low = 0
    var high = a.count - 1
    
    while low <= high {
        var mid = (low + high) / 2
        var guess = a[mid]
        if guess == item {
            return mid
        } else if guess > item {
            high = mid - 1
        } else {
            low = mid + 1
        }
    }
    return nil
}

var a = [ 1, 2, 3, 4, 5, 6, 40, 50, 40, 560, 50, 7, 8, 9, 10]
binanrySearch(a: a, item: 9)
binanrySearch(a: a, item: -1)

func findSmallest(a: [Int]) -> Int {
    var smallest = a[0]
    var smallestIdx = 0
    for i in 0..<a.count {
        if a[i] < smallest {
            smallest = a[i]
            smallestIdx = i
        }
    }
    return smallestIdx
}

func selectionSort(a: inout [Int]) -> [Int] {
    var newA: [Int] = []
    for i in 0..<a.count {
        newA.append(a.removeFirst())
    }
    return newA
}

var nA = selectionSort(a: &a)

func sum(a: inout [Int]) -> Int {
    
    if a.count == 0 {
        return 0
    }
    
    if a.count == 1 {
        return a[0]
    }
    
    return a.removeFirst() + sum(a: &a)
}

sum(a: &nA)

func countRecursive(a: inout [Int]) -> Int {
    if a.count == 1 {
        return a.count
    }
    a.removeFirst()
    return 1 + countRecursive(a: &a)
}

var nB = [1, 2, 3, 4, 5]

countRecursive(a: &nB)

func quickSort(a: inout [Int]) -> [Int] {
    if a.count < 2 {
        return a
    } else {
        let pivot = a[0]
        var lesser = a.filter { $0 < pivot }
        var greater = a.filter { $0 > pivot }
        
        return quickSort(a: &lesser) + Array([pivot]) + quickSort(a: &greater)
    }
}

var qS = [4, 6, 8, 10, 66, 40, 3, 1, 2]

quickSort(a: &qS)

//hash tables
var hashT: [String:Int] = ["1":2,"2":1]
var graph: [String: [String]] = [:]
graph["you"] = ["alice", "bob", "claire"]
graph["bob"] = ["anuj", "peggy"]
graph["alice"] = ["peggy"]
graph["claire"] = ["thom", "jonny"]
graph["anuj"] = []
graph["peggy"] = []
graph["thom"] = []
graph["jonny"] = []

//BFS queue
var q: Queue = Queue()
q.enqueue(name: graph["you"]!)

//while !q.queue.isEmpty {
//    var person = q.dequeu()
//    if person.contains("peggy") {
//        print(person)
//        break
//    } else {
//        q.enqueue(name: [person.removeFirst()])
//    }
//}

//def search(name):
//search_queue = deque() search_queue += graph[name] searched = []
//while search_queue:
//person = search_queue.popleft() if not person in searched:
//    if person_is_seller(person):
//print person + “ is a mango seller!” return True
//This array is how you keep track of which people you’ve searched before.
//Only search this person if you
//Marks this person as searched
//else:
//search_queue += graph[person] searched.append(person)
//return False


