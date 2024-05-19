import SwiftUI

struct CardFan: View {
    
    var monuments: [Monument]
    
    var body: some View {
        ZStack {
            HStack {
                MiniCard(monument: monuments[0])
                    .offset(x: UIScreen.main.bounds.width * 0.2, y: 20)
                    .rotationEffect(Angle(degrees: -10.0), anchor: .bottom)
                MiniCard(monument: monuments[1])
                MiniCard(monument: monuments[2])
                    .offset(x: -UIScreen.main.bounds.width * 0.2, y: 20)
                    .rotationEffect(Angle(degrees: 10.0), anchor: .bottom)
                
            }
            .frame(width: UIScreen.main.bounds.width * 0.8)
            ZStack {
                Text(Constants.appTitle)
                    .foregroundStyle(
                        .white.gradient.shadow(
                            .inner(color: .black.opacity(0.9), radius: 1)
                        )
                    )
                    .fontWeight(.heavy)
                    .font(.system(size: 50))
            }
        }
    }
}




