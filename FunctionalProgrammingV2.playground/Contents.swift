import UIKit

precedencegroup AssociativityLeft {
    associativity: left
}

infix operator |>: AssociativityLeft

func |><T, V>(f: @escaping (T)->V, g: @escaping (V)->V) -> (T) -> V {
    return {
        x in g(f(x))
    }
}

//Closures
//{ (parameters) -> ReturnType in // body of closure }

let closureName: (Int)->Int = { _ in 10 }
closureName(4)
var closure: (Int) -> (Int)?
typealias closureType = (Int, Int) -> Int
func aFunc(closure: (Int) -> Int) -> Int {
    //statements
    return closure(5)
}

let result = aFunc(closure: {
    number in
    //statements
    return number  * 3
})

print(result)

var anArray = [1, 2, 5, 3, 6, 4]
anArray.sort(by: {
    (param1: Int, param2: Int) -> Bool in
    return param1 < param2
})

anArray.sort(by: {
    (p1, p2) -> Bool in
    return p1 < p2
})

anArray.sort(by: {
    (p1, p2) in
    return p1 < p2
})

anArray.sort {
    (p1, p2) in
    return p1 < p2
}

anArray.sort { $0 > $1 }

func senRequest(completion: @escaping (_ response: String?, _ error: Error?) -> Void) {
    if true { //success
        //time consuming op
        completion("Response", nil)
    }
}

senRequest {
    (response: String?, error: Error?) in
    if let result = response {
        print(result)
    } else  if let serverError = error {
        //Error
    }
}

func explicityReturnClosure(firstName: String) -> (String) -> String {
    return {
        (lastName: String) -> String in
        return "\(firstName) \(lastName)"
    }
}

let fnIncludingFirstName = explicityReturnClosure(firstName: "John")
let extractedFullName = fnIncludingFirstName("Doe")

func poweOfTwo(n: Int) -> Int {
    return n == 0 ? 1:2 * poweOfTwo(n: n-1)
}
poweOfTwo(n: 3)
//2* n-1=2||2*4=8
//--2* n-1=2||2*2=4
//----2*n-1=1||2*1=2
//--------n-1=0=1

func repeatedString(str: String, n: Int) -> String {
    return n == 0 ? "": str + repeatedString(str: str, n: n-1)
}

repeatedString(str: "Hello", n: 4)

func tailFactorial(n: Int, currentFactorial: Int = 1) -> Int {
    return n == 0 ? currentFactorial : tailFactorial(n: n-1, currentFactorial: currentFactorial * n)
}

tailFactorial(n: 3)

