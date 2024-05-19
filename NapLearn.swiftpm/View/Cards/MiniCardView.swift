import SwiftUI

struct MiniCard: View {
    
    let monument: Monument
    
    var body: some View {
        FrontCardView(monument: monument)
            .minicard()
    }
}

