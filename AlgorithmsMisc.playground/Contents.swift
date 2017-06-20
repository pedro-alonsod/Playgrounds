import UIKit
import PlaygroundSupport


var str: String = "lslsls lslsls lslsl".replacingOccurrences(of: " ", with: "%20")
var idxs = str.characters.indices

func pperm(str: String) -> Bool {
    var table: [Character:Int] = [:]
    
    for elem in str.characters {
        if table[elem] == nil {
            table[elem] = 1
        } else {
            table[elem]! += 1
        }
    }
    var out = false
    var odd = 0
    for elem in table {
        //print(elem)
        if elem.value % 2 == 0 || elem.key == " " {
            out = true
        } else {
            print(elem)
            odd += 1
        }
    }
    print(odd % 2 > 1)
    return odd % 2 > 1
}

pperm(str: "taco cato")

func isUnique(str: String) -> Bool {
    var unique: [Character:Int] = [:]
    var out: Bool = true
    
    for e in str.characters {
        if unique[e] == nil {
            unique[e] = 1
        } else {
            unique[e]! += 1
            out = false
        }
    }
    print(unique)
    return out
}

isUnique(str: "TAco Cat")

func perm(str1: String, str2: String) -> Bool {
    var fullStr = str1 + str1
    print(fullStr.contains(str2))
    print(fullStr)
    return fullStr.contains(str2)
}

perm(str1: "abd", str2: "dba")

func strComp(_ str: String) -> String {
    var out = ""
    
    var char: Character = str.characters.first!
    var copy: String = String(str.characters.dropFirst())
    print(copy)
    var countChars = 1
    
    for e in copy.characters {
        
        if char == e {
            countChars += 1
            print(e)
            print(char)
            print(countChars)
        } else {
            out += "\(char)\(countChars)"
            char = e
            print(out)
            countChars = 1
        }
    }
    
    out += "\(char)\(countChars)"
    
    return out.characters.count < str.characters.count ? out:str
}

strComp("aaaaadddddbbbfffaaa")

func rotateMat90(mat: inout [[Int]]) {
    let size = mat.count
    let layerCount = size / 2
    // Move tru layers
    for layer in 0..<layerCount {
        var first = layer
        var last = size - first - 1
        
        // Move within a single layer
        for elem in first...last {
            var offset = elem - first
            
            //elem increases column (accross right)
            var top = mat[first][elem]
            // elem increases row (move down)
            var right = mat[elem][last]
            // last - offset decrements column (accorss left)
            var bottom = mat[last][last - offset]
            // last - offset decrements row (move up)
            var leftSide = mat[last - offset][first]
            
            
            // Place them
            mat[first][elem] = leftSide
            mat[elem][last] = top
            mat[last][last - offset] = right
            mat[last - offset][first] = bottom
        }
    }
    
}

extension Array where Element: Sequence {
    func printMat() {
        for row in self {
            print(row)
        }
    }
}

var matrix: [[Int]] = [[1, 2, 3, 4],
                        [5, 6, 7, 8],
                        [9, 10, 0, 12],
                        [13, 14, 15, 16]]

//print(matrix)
matrix.printMat()
rotateMat90(mat: &matrix)
//print(matrix)
print("Rotated")
matrix.printMat()


func zeroMat(mat: inout [[Int]]) {
    var arrayOf0: [(Int, Int)] = []
    for row in 0..<mat.count {
        for col in 0..<mat[0].count {
            if mat[row][col] == 0 {
                arrayOf0.append((row, col))
            }
        }
    }
    
    for elem in arrayOf0 {
        var row = elem.0
        var column = elem.1
        for i in 0..<mat.count {
            mat[i][column] = 0
        }
        for j in 0..<mat[0].count {
            mat[row][j] = 0
        }
    }
}

zeroMat(mat: &matrix)
matrix.printMat()

func stringRotation(str1: String, str2: String) -> Bool {
    var full = str1 + str1
    
    return full.contains(str2)
}

var strRot = "waterbottle"
var pal = String(Array(strRot.characters).dropFirst().dropLast())
//pal.dropLast()
//String(pal)
stringRotation(str1: strRot, str2: "erbottlewat")

func palindrome(str: String) -> Bool {
    if str.characters.count <= 1 {
        return true
    }
    if str.characters.first! != str.characters.last! {
        return false
    }
    var strRes = String(Array(str.characters).dropLast().dropFirst())
    return palindrome(str: strRes)
}

palindrome(str: "racecar")

func mergeSort(num: [Int]) -> [Int] {
    if num.count == 1 {
        return num
    }
    var middleIdx = num.count / 2
    var left = Array(num[0..<middleIdx])
    var right = Array(num[middleIdx..<num.count])
    
    return merge(mergeSort(num: left), mergeSort(num: right))
}

func merge(_ left: [Int], _ right: [Int]) -> [Int] {
    var leftIdx = 0
    var rightIdx = 0
    var list = [Int]()
    
    while leftIdx < left.count && rightIdx < right.count {
        if left[leftIdx] < right[rightIdx] {
            list.append(left[leftIdx])
            leftIdx += 1
        } else if left[leftIdx] > right[rightIdx] {
            list.append(right[rightIdx])
            rightIdx += 1
        } else {
            list.append(left[leftIdx])
            leftIdx += 1
            list.append(right[rightIdx])
            rightIdx += 1
        }
    }
    
    while leftIdx < left.count {
        list.append(left[leftIdx])
        leftIdx += 1
    }
    while rightIdx < right.count {
        list.append(right[rightIdx])
        rightIdx += 1
    }
    
    return list
}

var MS = [ 3, 4, 5, 8, 1, 3, 2, 6, 8, 10, 6, 4]
mergeSort(num: MS)

var knapSackGreedy: [(String, Int)] = [("s", 10), ("a", 20), ("l", 30), ("r", 20), ("k", 10)]

func greedyKnapScack(items: [(String, Int)], maxWeight: Int) -> [(String, Int)] {
    var bagWeight = 0
    var bagItems: [(String, Int)] = []
    
    for item in items.sorted(by: { $0.1 > $1.1 }) {
        print(item)
        print("maxw: \(maxWeight) bw: \(bagWeight)")
        if maxWeight <= bagWeight + item.1 {
//            bagWeight = bagWeight + item.1
//            bagItems.append(item)
        } else {
            bagWeight = bagWeight + item.1
            bagItems.append(item)
            
        }
    }
    return bagItems
}

greedyKnapScack(items: knapSackGreedy, maxWeight: 100)

func trade(stock: [Int]) -> Int {
    if stock.count == 1 {
        return 0
    }
    var mid = stock.count / 2
    var former = Array(stock[0..<mid])
    var latter = Array(stock[mid..<stock.count])
    var case3 = latter.max()! - former.min()!
    return max(trade(stock: former), trade(stock: latter), case3)
//    return 0
}

var stock = [1,3, 4,8, 19, 20, 3, 3, 45]
trade(stock: stock)

var M: [Int:Int] = [1:1, 2:2]
func dfib(n: Int) -> Int {
    if M[n] == nil {
        M[n] = dfib(n: n - 1) + dfib(n: n - 2)
    }
    
    return M[n]!
}

dfib(n: 4)


func findFirst(str: String) -> Character? {
    var count: [Character:Int] = [:]
    
    for elem in str.characters {
        if count[elem] == nil {
            count[elem] = 1
        } else {
            count[elem]! += 1
        }
    }
    
    for elem in str.characters {
        if count[elem]! == 1 {
            return elem
        }
    }
    
    return nil
}

var tot = "total"
findFirst(str: tot)
var teeter = "teeter"
findFirst(str: teeter)

func removeChars(str: String, rem: String) -> String {
    var out = ""
    for elem in str.characters {
        if !rem.contains(String(elem)) {
            out.append(elem)
        } else {
            
        }
    }
    return out
}

var battle = "Battle of the vowels: Hawaii vs Grozny"
var rem = "aeiou"
removeChars(str: battle, rem: rem)

func reverse1(str: String) -> String {
    var out: [String] = str.components(separatedBy: " ")
    
    return String(describing: Array(out.reversed()))
}
var s1 = "Do or do not, there is no try."
reverse1(str: s1)

func reverse2(str: String) -> String {
    var out: [String] = str.components(separatedBy: " ")
    var s = ""
    
    for elem in stride(from: out.count - 1 , to: 0, by: -1) {
        s += out[elem] + " "
    }
    
    return s
}

reverse2(str: s1)

var a = [1, 2, 3, 34, 35, 36, 35, 35, 49, 15, 20, 50, 4, 5, 6, 7, 8, 9]
func binarySearchWrapper(a: [Int], t: Int) -> (Bool,Int) {
    var tuple: (Bool, Int) = (false, -1)
    tuple = binarySearch(a: a, t: t, tup: &tuple)
    return tuple
}

private func binarySearch(a:[Int], t: Int, tup: inout (Bool, Int)) -> (Bool, Int) {
    
    var mid = a.count / 2
    print(a.count)
    if a[mid] == t {
        tup = (true, a[mid])
    } else if a[mid] < t && a.count > 1 {
        binarySearch(a: Array(a[mid..<a.count]), t: t, tup: &tup)
    } else if a[mid] > t && a.count > 1 {
        binarySearch(a: Array(a[0..<mid]), t: t, tup: &tup)
    } else {
        tup = (false, -15)
    }
    
    return tup
}

binarySearchWrapper(a: a, t: 30)
var s: Set<Int> = [1, 2, 3]
var b: Set<Int> = [6, 2, 9]
s.union(b)
s.intersection(b)


func mergeSortDSA(a: [Int]) -> [Int] {
    if a.count == 1 {
        return a
    }
    var left = Array(a[0..<a.count/2])
    var right = Array(a[a.count/2..<a.count])
    return merge2(left: mergeSortDSA(a: left), right: mergeSortDSA(a: right))
}

func merge2(left: [Int], right: [Int]) -> [Int] {
    var leftIdx = 0
    var rightIdx = 0
    var out = [Int]()
    
    while leftIdx < left.count && rightIdx < right.count {
        
        if left[leftIdx] < right[rightIdx] {
            out.append(left[leftIdx])
            leftIdx += 1
        } else if left[leftIdx] > right[rightIdx] {
            out.append(right[rightIdx])
            rightIdx += 1
        } else {
            out.append(left[leftIdx])
            leftIdx += 1
            out.append(right[rightIdx])
            rightIdx += 1
        }
    }
    
    while leftIdx < left.count {
        out.append(left[leftIdx])
        leftIdx += 1
    }
    
    while rightIdx < right.count {
        out.append(right[rightIdx])
        rightIdx += 1
    }
    
    return out
}

//mergeSortDSA(a: b) // error set are unordered can be this
mergeSortDSA(a: a)

func isPrime(n: Int) -> Bool {
    
    for i in 2...n {
        for j in 1...Int(sqrt(Double(n))) {
            if (i * j) == n {
                return false
            }
        }
    }
    return true
}
isPrime(n: 11)

func toBinary(n: inout Int) -> [Int] {
    var out: [Int] = []
    while n > 0 {
        out.append(n%2)
        n /= 2
    }
    
    return out.reversed()
}
var bin = String(100, radix: 2)
var n = 100
toBinary(n: &n)


//not working
func GCD(n: Int, m: Int) -> Int {
    if n == 0 {
        return m
    }
    return GCD(n: n, m: m % n)
}

//GCD(n: 40, m: 4)
//----//
func qSort(a: [Int]) -> [Int] {
    
    if a.count == 0 {
        return []
    }
    
    var pivot = a[Int(arc4random_uniform(UInt32(a.count-1)))]
    var lesser = a.filter { $0 < pivot }
    var greater = a.filter { $0 > pivot }
    
    return qSort(a: lesser) + Array([pivot]) + qSort(a: greater)
}

var qsortTest = [66,77,88,99,855,45,66,67,7,7,7,7,7,3,2,2,1,2,3,4,5,66,7,8,89,9,9,90,0,77,66,7]
var resQ = qSort(a: qsortTest)

func triangle(n: Int) -> Int {
    if n == 1 {
        return 1
    }
    return n + triangle(n: n-1)
}
triangle(n: 8)

func factorial(n: Int) -> Int {
    if n < 2 {
        return 1
    }
    return n * factorial(n: n-1)
}

factorial(n: 4)

func towersOfHanoi(topN: Int, source: String, inter: String, destination: String) -> () {
    if topN == 1 {
        print("first")
    } else {
        towersOfHanoi(topN: topN-1, source: source, inter: destination, destination: inter)
        
        print("second recursive")
        
        towersOfHanoi(topN: topN-1, source: inter, inter: source, destination: destination)
    }
}

towersOfHanoi(topN: 4, source: "A", inter: "B", destination: "C")
//void word::anagram(int newSize)
//{
//    if(newSize == 1)
//    return;
//    for(int j=0; j<newSize; j++)
//    {
//        anagram(newSize-1);
//        if(newSize==2)
//        displayWord();
//        rotate(newSize);
//    }
//    //if too small,
//    //go no further
//    //for each position,
//    //anagram remaining
//    //if innermost,
//    //   display it
//    //rotate word
//}
//rotate left all chars from position to end
//void word::rotate(int newSize)
//{
//    int j;
//    int position = size - newSize;
//    char temp = workStr[position];
//    for(j=position+1; j<size; j++)
//    workStr[j-1] = workStr[j];
//    //save first letter
//    //shift others left
//    workStr[j-1] = temp;                 //put first on right

func arrayOfArrayProducts(arr: [Int]) -> [Int] {
    
    var res: [Int] = []
    var left: [Int] = [Int](repeating: 1, count: arr.count)
    var right: [Int] = [Int](repeating: 1, count: arr.count)
    
    for i in 1..<arr.count {
        left[i] = left[i-1] * arr[i-1]
    }
    
    for j in stride(from: arr.count - 2, to: -1, by: -1) {
        right[j] = right[j+1] * arr[j+1]
    }
    
    for k in 0..<arr.count {
        res.append(left[k] * right[k])
    }
    
    return res
}

let test1 = [2, 7, 3, 4]
//res = [7*3*4, 2*3*4, 2*7*4, 2*7*3]

var sumOf4 = [2, 7, 4, 0, 9, 5, 1, 3]

func sumO4Four(arr: [Int], s: Int) -> [Int] {
    var out: [Int] = []
    var outDict: [Int:Int] = [:]
    
    for i in 0..<arr.count {
        for j in i..<arr.count {
            for k in j..<arr.count {
                outDict[arr[i]] = s - (arr[i] + arr[j] + arr[k])
                if outDict[arr[i]] == 0 /*|| (arr[i] == s - (arr[i] + arr[j] + arr[k]))*/  {
                    out.append(arr[i])
                    out.append(arr[j])
                    out.append(arr[k])
                    out.append(outDict[arr[i]]!)
                    print(outDict)
                    return out
                }
            }
        }
        
    
    }
    
    print(outDict)
    
    //O(N`3) time
    //space O(N)
    return out
}

//print(arrayOfArrayProducts(arr: test1))
sumO4Four(arr: sumOf4, s: 20)

sumOf4.sort()

//function findArrayQuadruplet(arr, s):
//n = arr.length
//
//# if there are fewer than 4 items in arr, by
//# definition no quadruplet exists whose sum is s
//if (n < 4):
//return null
//
//# sort arr in an ascending order
//arr.sort()
//
//for i from 0 to n - 4:
//for j from i + 1 to n - 3:
//# r stores the complementing sum
//r = s - (arr[i] + arr[j])
//
//# check for sum r in subarray arr[j+1…n-1]
//low = j + 1, high = n - 1;
//
//while (low < high):
//if (arr[low] + arr[high] < r):
//low++
//
//else if (arr[low] + arr[high] > r):
//high--
//
//# quadruplet with given sum found
//else:
//return [arr[i], arr[j], arr[low], arr[high]]
//
//return []

var maze: [[Character]] = [["#", "#", "#", "#", "#", "#", ],
                            ["#", " ", "#", " ", "#", "#", ],
                            ["#", " ", "#", " ", "#", "#", ],
                            ["#", " ", " ", " ", "#", "#", ],
                            ["#", " ", " ", " ", " ", "#", ],
                            ["#", " ", "#", " ", " ", "#", ],
                            ["#", " ", "#", "#", "F", "#", ]]

func readMaze(maze: [[Character]], startX: Int, startY: Int) {
    
    
    
}

func findPath(startX: Int, stratY: Int) -> Bool {
    
    return false
}

func digits(_ number: Int) -> [Int] {
    
    if number / 10 == 0 {
        return Array([number])
    }
    
    return digits(number / 10) + Array([number % 10])
}

digits(54321)

func power(_ x: Int, _ n: Int) -> Int {
    if n == 0 {
        return 1
    }
    
    if n == 1 {
        return x
    }
    return x * power(x, n-1)
}
power(3, 3)


func gcd(_ a: Int, _ b: Int) -> Int {
    if b == 0 {
        return a
    } else {
        if a > b {
            return gcd(a-b, b)
        } else {
            return gcd(a, b-a)
        }
    }
}
gcd(2, 10)
gcd(9, 6)
gcd(30, 75)

func binarySeacrh(_ arr: [Int], key: Int) -> Int {
    var mid = arr.count / 2
    
    if arr[mid] == key {
        return arr[mid]
    } else if key < arr[mid] {
        return binarySeacrh(Array(arr[0..<mid]), key: key)
    } else if key > arr[mid] {
        return binarySeacrh(Array(arr[mid..<arr.count]), key: key)
    } else {
        
        return -1
    }
}

binarySeacrh([1, 2, 4, 5 ,7, 9], key: 2)

func hanoi(_ N: Int, from firstPeg: String = "A", to secondPeg: String = "B", using thirdPeg: String = "C") {
    // your code here
    if N == 1 {
        print("move from A to B")
        return
    }
    
    hanoi(N-1, from: firstPeg, to: secondPeg, using: thirdPeg)
    
    print("Moving from \(firstPeg) start to  \(secondPeg) with \(thirdPeg) extra")
    
    hanoi(N-1, from: thirdPeg, to: secondPeg, using: firstPeg)
    
    print("moving from \(thirdPeg) extra to \(secondPeg) destination using \(firstPeg)")
    
}

hanoi(3)

func change(coins: [Int], amounts: [Int], highest: Int, sum: Int, goal: Int) {
    
    if sum == goal {
        display(coins: coins, amounts: amounts)
        print("here")
        return
    }
    
    if sum > goal {
        return
    }
    
    for value in amounts {
        
        if value >= highest {
            var copy = Array(coins)
            copy.append(value)
//            print("goal\(goal)")
            change(coins: copy, amounts: amounts, highest: highest, sum: sum + value, goal: goal)
        }
    }
}

func display(coins: [Int], amounts: [Int]) {
    for amount in amounts {
        
        var count = 0
        
        for coin in coins {
            if coin == amount {
                count += 1
            }
        }
        print("\(amount): \(count)")
    }
    print("")
    
    return
}

var coins: [Int] = []
var amounts: [Int] = [1, 5, 10, 25, 50]
// Start adding coins.
change(coins: coins,
       amounts: amounts,
       highest: 0,
       sum: 0,
       goal: 51)
