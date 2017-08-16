import UIKit

protocol Shape {
    var origin: CGPoint { get }
    var size: CGSize { get }
    var color: UIColor { get }
    var fillColor: UIColor { get }
    var strokeWidth: CGFont { get }
    
    func draw(on area: CGContext)
    func area() -> CGFloat
}

protocol Drawable {
    func draw(on context: CGContext)
}

protocol Geometry {
    var size: CGSize { get }
    func area() -> CGFloat
}

extension Geometry {
    func area() -> CGFloat {
        return size.width * size.height
    }
}

//Overriding operators
extension CGPoint {
    
    static func +(lhs: CGPoint, rhs: CGPoint) -> CGPoint {
        return CGPoint(x: lhs.x + rhs.x, y: lhs.y + rhs.y)
    }
    
    static prefix func -(input: CGPoint) -> CGPoint {
        return CGPoint(x: -input.x, y: -input.y)
    }
    
    static func -(lhs: CGPoint, rhs: CGPoint) -> CGPoint {
        return lhs + (-rhs)
    }
    
    static func *(lhs: CGPoint, rhs: CGAffineTransform) -> CGPoint {
        return lhs.applying(rhs)
    }
}

extension CGAffineTransform {
    static func *(lhs: CGAffineTransform, rhs: CGAffineTransform) -> CGAffineTransform {
        return lhs.concatenating(rhs)
    }
}

func *(points: [CGPoint], transform: CGAffineTransform) -> [CGPoint] {
    return points.map { $0 * transform }
}
//New operators
infix operator !!: NilCoalescingPrecedence

func !!<Wrapped>(optional: Wrapped?, fatal: @autoclosure () -> Never) -> Wrapped {
    guard let unwrapped = optional else { fatal() }
    
    return unwrapped
}

precedencegroup ExponentiationPrecedence {
    higherThan: MultiplicationPrecedence
    associativity: none // () needed
}

infix operator **: ExponentiationPrecedence

func **(base: Double, exponent: Double) -> Double {
    return pow(base, exponent)
}

infix operator +/-: ExponentiationPrecedence

func +/-(center: Double, spread: Double) -> ClosedRange<Double> {
    var lower = center - spread
    var upper = center + spread
    return lower...upper
}
// use Stride
for i in stride(from: (3.0 +/- 1.0).lowerBound, through: (3.0 +/- 1.0).upperBound, by: 0.1) {
    print("\(i)")
}

dump((3.0 +/- 1.0))
