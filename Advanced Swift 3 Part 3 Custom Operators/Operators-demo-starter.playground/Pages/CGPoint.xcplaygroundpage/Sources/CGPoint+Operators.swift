import Foundation
import CoreGraphics

// Vector operations on points makes a lot of because the
// semantics are well understood.

public extension CGPoint {
  static func +(lhs: CGPoint, rhs: CGPoint) -> CGPoint {
    return CGPoint(x: lhs.x+rhs.x, y: lhs.y+rhs.y)
  }

  static func *(lhs: CGPoint, rhs: CGFloat) -> CGPoint {
    return CGPoint(x: lhs.x*rhs, y: lhs.y*rhs)
  }

  static func *(lhs: CGFloat, rhs: CGPoint) -> CGPoint {
    return rhs*lhs
  }

  static func /(lhs: CGPoint, rhs: CGFloat) -> CGPoint {
    return lhs * (1/rhs)
  }

  static prefix func -(input: CGPoint) -> CGPoint {
    return CGPoint(x: -input.x, y: -input.y)
  }

  static func -(lhs: CGPoint, rhs: CGPoint) -> CGPoint {
    return lhs+(-rhs)
  }

  static func +=(lhs: inout CGPoint, rhs: CGPoint) {
    lhs = lhs + rhs
  }

  static func -=(lhs: inout CGPoint, rhs: CGPoint) {
    lhs = lhs - rhs
  }

  static func *=(lhs: inout CGPoint, rhs: CGFloat) {
    lhs = lhs * rhs
  }

  static func /=(lhs: inout CGPoint, rhs: CGFloat) {
    lhs = lhs / rhs
  }

  var lengthSquared: CGFloat {
    return x*x+y*y
  }

  var length: CGFloat {
    return lengthSquared.squareRoot()
  }
}
