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

func maxRecursive(a: inout [Int]) -> Int {
    if a.count <= 2 {
        return max(a[0], a[1])
    }
    return max(a.removeFirst(), maxRecursive(a: &a))
}
var aM: [Int] = [3, 4, 5, 6, 7, 8, 10, 11, 58, 39, 459, 382, 483, 2929, 8383]

maxRecursive(a: &aM)

countRecursive(a: &nB)

func quickSort(a: inout [Int]) -> [Int] {
    if a.count < 2 {
        return a
    } else {
        let pivot = a[a.count/2]
        var lesser = a.filter { $0 < pivot }
        var greater = a.filter { $0 > pivot }
        print(pivot)
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

//var graph2: [[String]:Int] // cant no hashable
//var garph3: Set<(String, String, Int)> = [] // cant not hashable
var bugsDict = [String : [String : [String : Int]]] () //this is doable
bugsDict["ladybug"]?["spotted"]?["red"] // Prints 1 // remember otionals need to unwrapped them


//BFS queue
var q: Queue = Queue()
q.enqueue(name: graph["you"]!)

//need a funtion to enqueue them one by one not now but i need it
print(q.queue)
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



//Find the lowest-cost node node =  nd_lowest_cost_node(costs)         that you haven’t processed yet.
//while node is not None: If you’ve processed all the nodes, this while loop is done. cost = costs[node]
//neighbors = graph[node]
//for n in neighbors.keys():         Go through all the neighbors of this node.
//new_cost = cost + neighbors[n] If it’s cheaper to get to this neighbor if costs[n] > new_cost:         by going through this node ...
//costs[n] = new_cost               update the cost for this node.
//parents[n] = node                 htis node becomes new parent of its neighbor
//processed.append(node)         Mark the node as processed.
//node =  nd_lowest_cost_node(costs) Find the next node to process, and loop.

func LL(L: String, N: String) -> Bool {
    var dic: [Character:Int] = [:]
    
    for elem in N.characters {
        if elem == " " {
            continue
        }
        if dic[elem] == nil {
            dic[elem] = 1
            print(dic)
        } else {
            dic[elem]! += 1
        }
    }
    print(dic)
    for letter in L.characters {
        if letter == " " {
            continue
        }
        print(letter)
        if dic[letter] == nil {
            print(dic.filter { $0.1 > 0 })
            return false
        } else {
            dic[letter]! -= 1
        }
    }
    print(dic.filter { $0.1 > 0 })
    return ((dic.filter { $0.1 == 0 }).count <= 0) ? false:true
}

var N = "ppd  "
var L = "pp  "
LL(L: L, N: N)
