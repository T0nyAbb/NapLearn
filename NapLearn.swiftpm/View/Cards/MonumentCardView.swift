import SwiftUI

struct MonumentCardView: View {
    
    let monument: Monument
    
    @State var flipped = false
    @State var rotation: CGFloat = 0
    
    var body: some View {
        ZStack {
            FrontCardView(monument: monument)
                .rotation3DEffect(.degrees(rotation), axis: (x: 0, y: 1, z: 0))
                .opacity(flipped ? 0 : 1)
            BackCardView(monument: monument)
                .rotation3DEffect(.degrees(rotation + 180), axis: (x: 0, y: 1, z: 0))
                .opacity(flipped ? 1 : 0)
        }
        .onTapGesture {
            flip()
        }
        .padding()
    }
    
    func flip() {
        
        let secondTurn = LiyAnimation(duration: 0.2, next: nil) {
            rotation += 90
        }
        
        let flipViews = LiyAnimation(duration: 0.01, next: secondTurn) {
            flipped.toggle()
        }
        
        let firstTurn = LiyAnimation(duration: 0.2, next: flipViews) {
            rotation += 90
        }
        
        firstTurn.play()
    }
}

