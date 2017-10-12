import UIKit

let A: [Int] = [0, 1, 2, 3, 4, 0, 1, 2]
let Z: [Int:Character] = [0:"a", 2:"d", 5:"d", 4:"z"]
Z.keys.max()!

//Z
func countingSort(A: [Int]) -> [Int] {
    var c = [Int](repeating: 0, count: A.max()!+1)
    var B = [Int](repeating: 0, count: A.count)
    
    for i in 0..<A.count {
        c[A[i]] += 1
    }
//    print(c)
    for i in 1..<c.count {
        c[i] = c[i-1] + c[i]
    }
//    print(c)
    for i in stride(from: A.count-1, to: -1, by: -1) {
        B[c[A[i]]-1] = A[i]
        c[A[i]] -= 1
    }
    
    return B
}

countingSort(A: A)
