import UIKit

func challenge2(s: String) -> Bool {
    var c = Array(s.uppercased().characters)
    //print(c.count)
    while c.count >= 1 {
        //print("\(c.first!) \(c.last!)")
        if c.first! != c.last! {
            return false
        } else {
            c = Array(c.dropLast().dropFirst())
        }
        
    }
    
    return true
}

var str: String = "retot"
challenge2(s: str)

func challenge3(s: String, p: String) -> Bool {
    return s.characters.sorted() == p.characters.sorted()
}
var s = "abca"
var p = "cbahha"
challenge3(s: s, p: p)
p.range(of: s, options: .caseInsensitive, range: p.startIndex..<p.endIndex , locale: nil)

var nor = "abcde"
var rot = "eabcdff"
func challenge8(s: String, r: String) -> Bool {
    var check = s + s
    return check.contains(r)
}

challenge8(s: nor, r: rot)

func challenge10(s: String) -> (String, String) {
    var vowels = "AEIOU"
    var countV = 0
    var countC = 0
    
    for c in s.uppercased().characters {
        if vowels.contains(String(c)) {
            countV += 1
        } else {
            countC += 1
        }
    }
    
    return ("\(countV) vowels", "\(countC) consonants")
}

var test10 = "Mississippi".commonPrefix(with: "sip ", options: .caseInsensitive)
challenge10(s: test10)