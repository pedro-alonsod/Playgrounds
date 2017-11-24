import UIKit

func reverse(str: String) -> String  {


    let out  = String(str.first!)
    
    if str.count == 1 {   //Base case
        return String(str.first!)
    }
    
    return reverse(str: String(str.dropFirst())) + out
}

reverse(str: "hello")
String("hello1".reversed())

func reverse2(str: String)->String {
    var rev = ""
    
    for char in str {
        rev =  String(char) + rev
    }
    
    return rev
}

reverse2(str: "hello")

func rev3(str: String) -> String {
    return str.characters.reduce("") {
        String($1) + String($0)
    }
}

rev3(str: "hello")

print("hell".reduce("") { String($1) + String($0) })

func palindrome(str: String) -> Bool {
    let arr = Array(str)
    
    if arr.count <= 1 {
        return true
    }
    
    if arr.last! == arr.first!  {
        return palindrome(str: String(arr.dropFirst().dropLast()))
    } else {
        return false
    }
}

palindrome(str: "abba")
palindrome(str: "abcdefg")

func palindrome2(str: String) -> Bool {
    var arr = Array(str)
    var count = arr.count-1
    
    if count <= 1 {
        return true
    }
    
    for i in  0..<count {
        if i > count/2 {
            break
        }
        if arr[i] == arr[count-i] {
            continue
        } else {
            return false
        }
    }
    return true
}

palindrome2(str: "abba")
palindrome2(str: "abcdefg")
palindrome2(str: "121")

func palindrome3(str: String) -> Bool {
    var arr = Array(str)
    if arr.count <= 1 {
        return true
    }
    while arr.count > 1 {
        if arr.first! != arr.last! {
            return false
        } else {
            arr = Array(arr.dropLast())
            arr = Array(arr.dropFirst())
        }
    }
    return true
}

palindrome3(str: "abba")
palindrome3(str: "111")
palindrome3(str: "1")
palindrome3(str: "1121")
palindrome3(str: "1234")

func reverseInt(n: Int) -> Int {
    var str = String(n)
    return (str.first! == "-" ) ? -Int(reverse(str: String(str.dropFirst())))!:Int(reverse(str: str))!
}
reverseInt(n: -51)
reverseInt(n: 987)
reverseInt(n: 23)
reverseInt(n: -500)

reverseInt(n: -90)
Int("-90")

Int(-90)

func maxChar(str: String) -> String {
    var dict: [Character:Int] = [:]
    
    for c in str {
        if dict[c] == nil {
            dict[c] = 1
        } else {
            dict[c]! += 1
        }
    }
//    print(dict)
    return String(dict.sorted(by: { $0.1 > $1.1 }).first!.key)
}
maxChar(str: "aaaaaaabbbbbbbbccccccc")
maxChar(str: "apple     1122332111111")

func fizzBuzz(n: Int) {
    for i in 1...n {
//     print(i)
        if i % 3 == 0 && i % 5 == 0 {
            print("FizzBuzz")
        } else if i % 3 == 0 {
            print("Fizz")
        } else if i % 5 == 0 {
            print("Buzz")
        } else {
            print(i)
        }
        
    }
}

fizzBuzz(n: 15)
fizzBuzz(n: 100)

func chunk(arr: [Int], n: Int) -> [[Int]] {
    var out: [[Int]] = []
    guard n <= arr.count else { return [] }
    var i = 0
    var c: [Int] = []
    for elem in arr {
        if i == n {
            i = 0
            out.append(c)
            c = []
        }
        c.append(elem)
        i += 1
        
    }
    out.append(c)
    //Remember for leavesthe last things out
    return out
}
chunk(arr: [1,2,3,4], n: 2)
chunk(arr: [1,2,3,4,5], n: 2)
chunk(arr: [1,2,3,4,5,6,7,8,9,9,9,0,1,1,2,3], n: 3)
chunk(arr: [2,3], n: 2)

func anagrams(str1: String, str2: String) -> Bool {
    //remember to delete white and simbols lowerCsae
    //then
    return str1.lowercased().sorted() == str2.lowercased().sorted()
}

anagrams(str1: "railsafety", str2: "fairytales")
anagrams(str1: "hithere", str2: "byethere")
anagrams(str1: "railSafety", str2: "FairyTales")
