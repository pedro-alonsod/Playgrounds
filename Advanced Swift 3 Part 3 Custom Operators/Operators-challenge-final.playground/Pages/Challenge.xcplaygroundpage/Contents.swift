// Copyright (c) 2017 Razeware LLC
// See Copyright Notice page for details about the license.


infix operator +/-: RangeFormationPrecedence

func +/-<T: FloatingPoint>(lhs: T, rhs: T) -> Range<T> {
  let positive = abs(rhs)
  return Range(uncheckedBounds: (lower: lhs-positive, upper: lhs+positive))
}

let aboutThree = 3.0 +/- 0.5
aboutThree.contains(2.7)
