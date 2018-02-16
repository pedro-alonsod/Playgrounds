import UIKit
import QuartzCore
 print("hee")
public class BenchTimer {
    public static func measure(closure: () -> Void) -> CFTimeInterval {
        let run = 10
        var exceTime: [Double] = Array(repeating: 0, count: 10)
        
        for i in 0..<run {
            let startTime = CACurrentMediaTime()
            closure()
            let endTime = CACurrentMediaTime()
            let medTime = endTime - startTime
            exceTime[i] = medTime
        }
        
        return (exceTime.reduce(0, +) / Double(run))
    }
}

//func sum(n: UInt) -> UInt {
//    var result = 0
//    
//    for i in 1...n {
//        result += Int(i)
//    }
//    
//    return UInt(result)
//}
//
//let step = 100
//var execTime: Double
//for i in 1...10 {
//    execTime = BenchTimer.measure {
//        _ = sum(n:  UInt(i) * UInt(step))
//    }
//    print("Avg time in execution\(i * step) execTime \(execTime)")
//}
//
//func sumOptimized(n: UInt) -> UInt {
//    return n * (n + 1) / 2
//}
//
////let step = 100
//var execTimeOptimized: Double
//for i in 1...10 {
//    execTimeOptimized = BenchTimer.measure {
//        _ = sum(n:  UInt(i) * UInt(step))
//    }
//    print("Avg time in execution\(i * step) execTime \(execTimeOptimized)")
//}

func equilibrium(arr: [Int]) -> (Int, Int)? {
    var i = arr.count - 2
    var j = arr.count - 1
    var leftSum = 0
    var rightsum = arr[j]
    print(i, j)
    
    for k in 0...i {
        leftSum += arr[k]
    }


    print(leftSum, rightsum, i, j, "not while")
//    leftSum -= arr[i]
//    rightsum += arr[j-1]
    while i > -1 {
        if leftSum == rightsum {
            print(leftSum, rightsum, "found it \(i) \(j)")
            return (i, j)
        }
        leftSum -= arr[i]
        i -= 1
        j -= 1
        rightsum += arr[j]
        
        print(leftSum, rightsum, "not found it \(i) \(j)")
    }
    
    return leftSum == rightsum ? (i, j):nil
}

var arr = [1, 2, 0, 0, 1, 1, 1]
equilibrium(arr: arr)
