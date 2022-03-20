import SwiftUI

struct ContentView: View {

  @StateObject private var model = Model(maximumNumberOfRipples: 1000)
  @State private var metricsOpacity: Double = 0.0

  var body: some View {
    TimelineView(.animation(minimumInterval: 1.0 / 120, paused: model.isEmpty)) { timeline in
      ZStack {
        Pond(model: model, date:timeline.date)
          .ignoresSafeArea()
        metrics
          .opacity(metricsOpacity)
          .onChange(of: model.isEmpty) { isEmpty in
            withAnimation {
              metricsOpacity = isEmpty ? 0.0 : 1.0
            }
          }
      }
    }
    .background(.white)
  }
  
  @ViewBuilder
  var metrics : some View {
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
  }
  
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
