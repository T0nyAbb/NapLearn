import SwiftUI

struct BackCardView: View {
    
    let monument: Monument
    
    var body: some View {
        VStack {
            Spacer()
            Text(monument.name)
                .foregroundColor(.black)
                .font(.largeTitle)
                .fontWeight(.black)
            Spacer()
            Text("Credits: \(monument.credits)")
                .foregroundColor(.black)
                .fontWeight(.semibold)
                .font(.callout)
                .padding(.bottom, 20)
        }
        .card()
    }
}


#Preview {
    BackCardView(monument: Constants.monuments[0])
}


