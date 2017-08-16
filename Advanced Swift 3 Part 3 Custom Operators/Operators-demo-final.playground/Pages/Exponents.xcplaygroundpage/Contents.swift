// Copyright (c) 2017 Razeware LLC
// See Copyright Notice page for details about the license.

import Foundation

/////////////////////////////////////////////////////////////////////
// Creating a custom precedence group.
precedencegroup ExponentiationPrecedence  {
  higherThan: MultiplicationPrecedence
  associativity: none  // none make the client use parenthesis
}

// You can define a custom operator for exponentiation.
infix operator **: ExponentiationPrecedence

// Note that even though base and exponent are named arguments
// you don't need to use them when calling
func **(base: Double, exponent: Double) -> Double {
    return pow(base, exponent)
}
