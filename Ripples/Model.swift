import Combine
import Foundation

class Model : ObservableObject {
  @Published var ripples = [Ripple]()
  
  // Maxiumn number of ripples.
  var maximumNumberOfRipples: Int?
  
  init(maximumNumberOfRipples: Int? = nil) {
    self.maximumNumberOfRipples = maximumNumberOfRipples
  }
  
  var count: Int { ripples.count }
  
  var isEmpty: Bool { ripples.isEmpty }
  
  func append(ripple: Ripple) {
    ripples.append(ripple)
    if let maximumNumberOfRipples = maximumNumberOfRipples, ripples.count > maximumNumberOfRipples {
      ripples.removeFirst()
    }
  }
  
  func trim(start: Date) {
    if let first = ripples.first, first.start < start {
      ripples = Array(ripples.drop { $0.start < start })
    }
  }
}
