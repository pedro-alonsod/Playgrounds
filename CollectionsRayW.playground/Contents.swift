import UIKit

struct FizzBuzz: RandomAccessCollection, BidirectionalCollection, Collection {
    var startIndex: Int {
        return 1
    }
    var endIndex: Int {
        return 101
    }
    func index(before i: Int) -> Int {
        return i - 1
    }
    func index(after i: Int) -> Int {
        return i + 1
    }
    subscript(position: Int ) -> String {
        print("pos", position)
        guard indices.contains(position) else { print("Out of bounds"); return "-1" }
        
        switch (position % 3 == 0, position % 5 == 0) {
        case (false, false):
            return String(describing: position)
        case (true, false):
            return "Fizz"
        case (false, true):
            return "Buzz"
        case (true, true):
            return "FizzBuzz"
        }
    }
}
for value in  FizzBuzz().reversed().prefix(4) {
    print(value)
}
//let fb = FizzBuzz().enumerated().filter { $0.element == "Buzz" }.map({ $0.offset + 1 })
//fb


//Ranges
extension Int {
    public var randomUniform: Int {
        return Int(arc4random_uniform(UInt32(self)))
    }
}
10.randomUniform
10.randomUniform
10.randomUniform

extension CountableRange where Bound == Int {
    var random: Int {
        return count.randomUniform + numericCast(lowerBound)
    }
}

let range = 0..<256
range.random

extension CountableClosedRange where Bound == Int {
    var random: Int {
        return count.randomUniform + numericCast(lowerBound)
    }
}

let closedRange = 0...250
closedRange.random

protocol BoundedRange {
    associatedtype Bound
    var lowerBound: Bound { get }
    var upperBound: Bound { get }
}

extension CountableRange: BoundedRange {}
extension CountableClosedRange: BoundedRange {}

extension BoundedRange where Bound == Int {
    var raandomProtocol: Int {
        return lowerBound + (upperBound - lowerBound).randomUniform
    }
}

range.raandomProtocol
closedRange.raandomProtocol
range.raandomProtocol
closedRange.raandomProtocol
range.raandomProtocol
closedRange.raandomProtocol
range.raandomProtocol
closedRange.raandomProtocol
range.raandomProtocol
closedRange.raandomProtocol
