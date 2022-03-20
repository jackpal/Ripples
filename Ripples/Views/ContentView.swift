import SwiftUI

struct ContentView: View {

  @StateObject private var model = Model(maximumNumberOfRipples: 1000)

  var body: some View {
    TimelineView(.animation(minimumInterval: 1.0 / 120, paused: model.isEmpty)) { timeline in
      ZStack {
        Pond(model: model, date:timeline.date)
          .ignoresSafeArea()
        #if DEBUG
        Metrics(model: model)
        #endif
      }
    }
    .background(.white)
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
