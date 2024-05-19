import SwiftUI

struct FrontCardView: View {
    
    let monument: Monument
    
    var body: some View {
        ZStack {
            Image(monument.photo)
                .resizable()    
                .scaledToFill()
                .frame(maxWidth: Constants.cardWidth, maxHeight: Constants.cardHeight)
        } .card()
    }
}
