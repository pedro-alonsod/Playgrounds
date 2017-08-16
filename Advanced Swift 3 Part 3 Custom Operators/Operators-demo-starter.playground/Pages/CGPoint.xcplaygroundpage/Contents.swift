// Copyright (c) 2017 Razeware LLC
// See Copyright Notice page for details about the license.

import UIKit



/*
// Visualization test code


import PlaygroundSupport


extension UIBezierPath {
  convenience init(from points: [CGPoint]) {
    self.init()
    guard let first = points.first else {
      return
    }
    move(to: first)
    for point in points.dropFirst() {
      addLine(to: point)
    }
    close()
  }
}

// Using the point class.
let points: [CGPoint] = [
  CGPoint(x: -1, y: -1),
  CGPoint(x:  1, y: -1),
  CGPoint(x:  1, y:  1),
  CGPoint(x:  0, y:  2),
  CGPoint(x: -1, y:  1)]

let modelToScale = CGAffineTransform(scaleX: 30, y: 30)
let scaleToRotated = CGAffineTransform(rotationAngle: .pi/8)
let rotatedToTranslated = CGAffineTransform(translationX: 100, y: 100)

let scaledRotatedAndTranslated = points * modelToScale * scaleToRotated * rotatedToTranslated

let path = UIBezierPath(from: scaledRotatedAndTranslated)

let layer = CAShapeLayer()
layer.path = path.cgPath
layer.strokeColor = UIColor.cyan.cgColor

let view = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
view.layer.addSublayer(layer)
PlaygroundPage.current.liveView = view
*/
