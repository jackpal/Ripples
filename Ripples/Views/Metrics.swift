import SwiftUI

struct Metrics: View {
  @ObservedObject
  var model:Model
  @State private var metricsOpacity: Double = 0.0
  
  var body: some View {
    VStack {
      HStack {
        Text("Ripples: \(model.count)")
          .font(.system(.largeTitle, design: .rounded).monospacedDigit())
          .foregroundColor(.accentColor)
          .padding(.leading)
        Spacer()
      }
      Spacer()
    }
    .opacity(metricsOpacity)
    .onChange(of: model.isEmpty) { isEmpty in
      withAnimation {
        metricsOpacity = isEmpty ? 0.0 : 1.0
      }
    }
  }
}
