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
//            print("item")
            for i in 0..<PQ.count {
                //print("\(item.0) <= \(PQ[i].0)")
                if item.0 <= PQ[i].0 {
                    PQ.insert(item, at: i)
                    break
                } else {
                    PQ.append(item)
                    break
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

testQueue.pop()
testQueue.pop()
print(testQueue)
testQueue.push(num: 3, ob: 4.7)
print(testQueue)
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

//function sudokuSolve(board):
//# Input: board - a sudoku board as described in the question
//# Output: true if the board is solvable
//
//if (isComplete(board)):
//return true # base case for the recursion
//
//# get a pair: the row and column of the first empty square in board
//currentSquareIndex = getFirstEmptySquare(board)
//
//# If the board is full but not completed, it"s invalid
//if (currentSquareIndex == null):
//return False
//
//row = currentSquareIndex[0]
//col = currentSquareIndex[1]
//candidatesForCurrentSquare = getPossibleCandidates(board, row, col)
//
//for candidate in candidatesForCurrentSquare
//# Assume the current candidate is a good match, and keep solving
//board[row][col] = candidate
//if (sudokuSolve(board)):
//return true
//
//# The candidate didn"t prove to be good, let"s reset it. Since 0
//# isn’t a legal value in the board, we can use it to represent
//# an empty square on the board
//board[row][col] = 0
//
//return False
//Where the auxiliary functions are as follows:
//
//function isComplete(board):
//# Input: board - a sudoku board represented as a 9X9 2D array
//# Output: True if the board is complete and legal
//
//nextEmptySquare = getFirstEmptySquare(board)
//if (nextEmptySquare != null):
//return False
//
//for index from 0 to 8:
//for num from 1 to 9:
//isNumberMissing = !rowContains(board, index, num) or
//!colContains(board, index, num) or
//!subBoardContains(board, index, num)
//
//if (isNumberMissing):
//return False
//
//# all numbers appear exactly once in each row, column and sub-board
//return True
//
//function getPossibleCandidates(board, row, col):
//# Input:
//#  board - a sudoku board represented as a 9X9 2D array
//#  row - a row on the board
//#  col - a column on the board
//# Output:
//#  a subset of the numbers {1,2,...,9}, which may fill the index in the board
//#  without violating any of the rules described above
//
//# Build a set containing the numbers 1-9
//LEGAL_NUMBERS = new Set([1,2,3,4,5,6,7,8,9])
//
//numbersUsedInRow = new Set()
//numbersUsedInColumn = new Set();
//
//for i from 0 to 8:
//# Build a set from the row’th row in the board
//numbersUsedInRow.add(board[row][i])
//# Build a set from the col’th column in the board
//numbersUsedInColumn.add(board[i][col])
//
//subBoardTopLeftRow = row - (row % 3)
//subBoardTopLeftColumn = col - (col % 3)
//numbersUsedInSubBoard = new Set()
//
//for i from 0 to 2:
//for j from 0 to 2:
//numUsedInSubBoard = board[subBoardTopLeftRow+i][subBoardTopLeftColumn+j]
//numbersUsedInSubBoard.add(numUsedInSubBoard)
//
//disqualified = new Set()
//disqualified.union(numbersUsedInSubBoard, numbersUsedInRow, numbersUsedInColumn)
//validNumbersForCurrentSquare = LEGAL_NUMBERS.difference(disqualified)
//return validNumbersForCurrentSquare
//
//function getFirstEmptySquare(board):
//# Input: board - a sudoku board represented as a 9X9 2D array
//# Output: An empty square in the board
//
//for i from 0 to 8:
//for j from 0 to 8:
//if (board[i][j] == 0): # i.e. the square is empty
//# return a a pair of indices (represented as an array of 2)
//return [i,j]
//
//return null
//
//
//function rowContains(board, row, num):
//# Input:
//#   board - a sudoku board represented as a 9X9 2D array
//#  row - the index of a row in the board
//#  num - the number we want to test for
//# Output: True in num is in the index-th row of board
//
//for col in 0 to 8:
//if (board[row][col] == num):
//return True
//
//return False
//
//function colContains(board, col, num):
//# Input:
//#  board - a sudoku board represented as a 9X9 2D array
//#  col - the index of a column in the board
//#  num - the number we want to test for
//# Output: True in num is in the index-th column of board
//
//for row in 0 to 8:
//if (board[row][col] == num):
//return True
//
//return False
//
//
//function subBoardContains(board, subBoardIndex, num):
//# Input:
//#  board - a sudoku board represented as a 9X9 2D array
//#  subBoardIndex - the index [0-8] of a 3×3 sub-board in the board
//#    The code assumes that the sub-boards are numbered from
//#    left to right, top to bottom. Examples:
//#    - sub-board at index 0 ranges from (0,0) to (2,2)
//#     - sub-board at index 5 ranges from (3,6) to (5,8)
//#  num - the number we want to test for
//
//# Output: True in num is in the index-th column of sub-board
//
//# the row of the top left position in the index-th square of the sub-board
//topLeftPositionRow = subBoardIndex - (subBoardIndex % 3)
//
//# the column of the top left position in the index-th square of the sub-board
//topLeftPositionCol = 3 * (subBoardIndex % 3)
//
//for i in 0 to 2:
//for j in 0 to 2:
//if (board[topLeftPositionRow + i][topLeftPositionCol + j] == num):
//return True
//
//return False

var testSet: Set<Int> = Set<Int>()
print(testSet.insert(0))

func numOfPathsToDest(i: Int, j: Int, memo: inout [[Int]]) -> Int {
    
    if i < 0 || j < 0 {
        return 0
    }
        
    else if i < j {
        memo[i][j] = 0
    }
        
    else if memo[i][j] != -1 {
        return memo[i][j]
    }
        
    else if i == 0 && j == 0 {
        memo[i][j] = 1
    }
    else {
        memo[i][j] = numOfPathsToDest(i: i - 1, j: j, memo: &memo)
            + numOfPathsToDest(i: i, j: j - 1, memo: &memo)
    }
    
    return memo[i][j]
}
