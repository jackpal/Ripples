import SwiftUI

fileprivate let rWhite = RippleColor(1.0,1.0,1.0)

fileprivate let kColors = [
  RippleColor(0.4627, 0.8392, 1.0),
  RippleColor(0.8392, 0.4627, 1.0),
  RippleColor(0.4627, 1.0, 0.8392),
  RippleColor(1.0, 0.4627, 0.8392),
  RippleColor(1.0, 0.8392, 0.4627),
  RippleColor(0.8392, 1.0, 0.4627)
]

struct Pond: View {
  let lifetime: TimeInterval = 14
  @ObservedObject
  var model: Model
  @State
  private var touches = [UITouch:RippleColor]()
  let date: Date
  var body: some View {
    ZStack {
      Canvas { context, size in
        for ripple in model.ripples {
          let radius = (date.timeIntervalSince(ripple.start)) * 40.0
          let diameter = radius * 2
          let x0 = ripple.center.x - radius
          let y0 = ripple.center.y - radius
          let rect = CGRect(origin: CGPoint(x: x0, y: y0), size: CGSize(width: diameter, height: diameter))
          let circle = Path(ellipseIn: rect)
          let fade: Float = Float(max(0, min(1.0, date.timeIntervalSince(ripple.start) / lifetime)))
          let color = ((1.0 - fade) * ripple.color + rWhite * fade).color.opacity(0.5)
          context.stroke(circle, with: .color(color), lineWidth: 2)
        }
      }
      NFingerTapView { touch, location in
        if let location = location {
          var color: RippleColor? = touches[touch]
          if color == nil {
            color = kColors[touches.count % kColors.count]
            touches[touch] = color
          }
          model.append(ripple:Ripple(center:location, start:Date(), color:color!))
        } else {
          touches.removeValue(forKey:touch)
        }
      }
    }
    .onChange(of: date) { date in
      let deadline = date - lifetime
      model.trim(start:deadline)
    }
  }
  
}
