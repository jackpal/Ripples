import Foundation
import SwiftUI

struct NFingerTapView: UIViewRepresentable {

    var tappedCallback: (UITouch, CGPoint?) -> Void

    func makeUIView(context: UIViewRepresentableContext<NFingerTapView>) -> NFingerTapView.UIViewType {
        let v = UIView(frame: .zero)
        let gesture = NFingerGestureRecognizer(target: context.coordinator, tappedCallback: tappedCallback)
        v.addGestureRecognizer(gesture)
        return v
    }
    
    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<NFingerTapView>) {
        // empty
    }

}
