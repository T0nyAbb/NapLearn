import SwiftUI

final class ContentViewModel: ObservableObject {
    @Published var splashScreenState = SplashScreenState.on
    @AppStorage("view") var showOn = false
    
    init() {
        let splashAnimation = LiyAnimation(.spring, duration: 1) {
            self.splashScreenState = .off
        }
        
        splashAnimation.playAfter(duration: 1.5)
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.2) {
            self.showOn = true
        }
    }
}

enum SplashScreenState {
    case on, off
}

