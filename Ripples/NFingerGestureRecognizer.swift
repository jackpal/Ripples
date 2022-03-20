import Foundation
import UIKit

/// Adapted from https://stackoverflow.com/questions/61566929/swiftui-multitouch-gesture-multiple-gestures
class NFingerGestureRecognizer: UIGestureRecognizer {
  
  var tappedCallback: (UITouch, CGPoint?) -> Void
  
  init(target: Any?, tappedCallback: @escaping (UITouch, CGPoint?) -> ()) {
    self.tappedCallback = tappedCallback
    super.init(target: target, action: nil)
  }
  
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent) {
    for touch in touches {
      tappedCallback(touch, touch.location(in: touch.view))
    }
  }
  
  override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent) {
    for touch in touches {
      tappedCallback(touch, touch.location(in: touch.view))
    }
  }
  
  override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent) {
    for touch in touches {
      tappedCallback(touch, nil)
    }
  }
  
  override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent) {
    for touch in touches {
      tappedCallback(touch, nil)
    }
  }
  
}
