import UIKit

var str: String = "lslsls lslsls lslsl".replacingOccurrences(of: " ", with: "%20")
str.characters.indices

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

pperm(str: "taco cat")

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


