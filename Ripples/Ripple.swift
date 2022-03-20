import Foundation
import SwiftUI

typealias RippleColor = SIMD3<Float>

struct Ripple {
  var center: CGPoint
  var start: Date
  var color: RippleColor
}

extension SIMD3 where Scalar == Float {
  var color : Color {
    Color(red:Double(x), green: Double(y), blue: Double(z))
  }
}



